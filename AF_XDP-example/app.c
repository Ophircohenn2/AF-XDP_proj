
#include "xdpsock.c"
#include <arpa/inet.h>
#include <net/if.h>
#include <linux/if_link.h>
#include <linux/if_ether.h>
#include <linux/ip.h>
#include <linux/in.h>
#include <linux/icmp.h>
#include <linux/ipv6.h>
#include <linux/icmpv6.h>
#include <stdint.h>
#include <stdio.h>
#include <time.h>
#include <stdbool.h>

#define PKT_ARRAY_SIZE opt_batch_size
#define FIBONACCI_WORKLOAD 10


typedef __u64 u64;
typedef __u32 u32;
typedef __u16 u16;

bool do_polling = false;

inline int fibonacci(int n) {
    if (n <= 1)
        return n;
    else
        return fibonacci(n-1) + fibonacci(n-2);
}

inline uint16_t checksum(u16 *data, int len) {
  uint32_t sum = 0;
  int i;

  // Accumulate checksum in 16-bit words
  for (i = 0; i < len; i += 2) {
    sum += data[i];
  }

  // Handle odd-length data
  if (len & 1) {
    uint8_t last_byte = ((uint8_t *)data)[len - 1];
    sum += last_byte << 8;
  }

  // Fold 32-bit sum into 16 bits
  while (sum >> 16) {
    sum = (sum & 0xffff) + (sum >> 16);
  }

  return ~sum;
}

static inline __sum16 csum16_add(__sum16 csum, __be16 addend) {
    uint16_t res = (__u16)csum;

    res += (__u16)addend;
    return (__sum16)(res + (res < (__u16)addend));
}

static inline __sum16 csum16_sub(__sum16 csum, __be16 addend) {
    return csum16_add(csum, ~addend);
}

static inline void csum_replace2(__sum16 *sum, __be16 old, __be16 new)
{
	*sum = ~csum16_add(csum16_sub(~(*sum), old), new);
}

void print_packet_desc_array(const struct packet_desc *arr, size_t size) {
    for (size_t i = 0; i < size; ++i) {
        printf("Packet %zu:\n", i + 1);
        printf("  Address: %llx\n", arr[i].addr);
        printf("  Length: %u\n", arr[i].len);
        printf("  Option: %u\n", arr[i].option);

        // Print the packet data if available
        if (arr[i].addr) {
            for(int j=0; j< arr[i].len; j++)
                printf("%02x ", *(char*)(arr[i].addr+j));
        } else {
            printf("  Packet Data: (null)\n");
        }

        printf("\n");
    }
}

void msleep(long milliseconds) {
    struct timespec req, rem;
    int wasInterrupted;

    req.tv_sec = milliseconds / 1000;          // Seconds
    req.tv_nsec = (milliseconds % 1000) * 1000000L; // Nanoseconds

    do {
        wasInterrupted = 0;
        if (nanosleep(&req, &rem) == -1) {
            if (errno == EINTR) {
                // Sleep was interrupted by a signal, try again with the remaining time.
                req = rem;
                wasInterrupted = 1;
            } else {
                // An actual error occurred
                perror("nanosleep");
            }
        }
    } while (wasInterrupted);
}

void work(void* args) {
    int* xsk_id = (int*)args;
    struct packet_desc pkt_desc_array_rx[PKT_ARRAY_SIZE];
    struct packet_desc pkt_desc_array_tx[PKT_ARRAY_SIZE];
    int pkt_cnt;
    int i; 


    // Define the sizes of the headers
    const size_t eth_header_size = sizeof(struct ether_header); // Ethernet header size
    const size_t ip_header_size = 20; // IP header size (assuming no options)
    const size_t udp_header_size = 8; // UDP header size

    // Calculate the offset to the data segment after Ethernet, IP, and UDP headers
    const size_t data_offset = eth_header_size + ip_header_size + udp_header_size;

    
    
    while(__glibc_likely(1)) {
        pkt_cnt = fill_rx_array(*xsk_id, pkt_desc_array_rx, PKT_ARRAY_SIZE, do_polling);

        if (!pkt_cnt) {
            continue;
        }

        // Process packets
        for (i = 0; i < pkt_cnt; i++) {
            fibonacci(FIBONACCI_WORKLOAD);
            pkt_desc_array_tx[i] = swap_mac_addresses(pkt_desc_array_rx[i], data_offset);
        }

        send_tx_array(*xsk_id, pkt_desc_array_tx, pkt_cnt);
    }
}


int main(int argc, char** argv)
{    
    char* interface_name = argv[1];
    int number_of_sockets = atoi(argv[2]);
    do_polling = atoi(argv[3]) == 1 ? true : false;

    printf("interface name: %s\n", interface_name);
    printf("number_of_sockets %d\n", number_of_sockets);
    
    pthread_t threads[number_of_sockets];
    opt_num_xsks = number_of_sockets;
    signal(SIGINT, int_exit);
	signal(SIGTERM, int_exit);
	signal(SIGABRT, int_exit);
    
    xdp_general_init(number_of_sockets, interface_name, threads);

    int id[number_of_sockets];

    for(int i=0; i<number_of_sockets; i++) {
        id[i] = i;
        xdp_init_thread(number_of_sockets, interface_name, i);
        pthread_create(&threads[i], NULL, (void*)work, (void*)&id[i]);
    }

    sigset_t mask, old_mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGINT);
    sigprocmask(SIG_BLOCK, &mask, &old_mask);
    // Wait for the threads to finish
    for(int i=0; i<number_of_sockets; i++) {
        pthread_join(threads[i], NULL);
    }

    final_cleanup();
    return 0;
}

