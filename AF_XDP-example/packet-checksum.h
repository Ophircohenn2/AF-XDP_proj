#ifndef PACKET_CHECKSUM_H
#define PACKET_CHECKSUM_H

#include <stdint.h>
#include <arpa/inet.h>
#include <linux/ip.h>
#include <linux/in.h>
#include <linux/icmp.h>
#include <linux/udp.h>
#include <linux/ipv6.h>
#include <linux/icmpv6.h>

#define IPV4_IHL_MULTIPLIER	4

/* Compute checksum for count bytes starting at addr,
 * using one's complement of one's complement sum */
inline uint16_t
compute_checksum(uint16_t *addr, uint32_t count)
{
    register unsigned long sum = 0;
    while (count > 1) {
        sum += * addr++;
        count -= 2;
    }
    /* if any bytes left, pad the bytes and add */
    if(count > 0) {
        sum += ((*addr)&htons(0xFF00));
    }
    /* Fold sum to 16 bits: add carrier to result */
    while (sum>>16) {
        sum = (sum & 0xffff) + (sum >> 16);
    }
    /* one's complement */
    sum = ~sum;
    return ((uint16_t)sum);
}

/* Set ip checksum of a given ip header*/
inline void
compute_ip_checksum(struct iphdr *ipv4_hdr)
{
    ipv4_hdr->check = 0;
    ipv4_hdr->check = compute_checksum((uint16_t*)ipv4_hdr,
                             sizeof(*ipv4_hdr) / IPV4_IHL_MULTIPLIER << 2);
}

inline void
compute_udp_checksum(struct iphdr *ipv4_hdr,
                     struct udphdr *udp_hdr)
{
    register unsigned long sum;
    uint16_t udp_size;
    uint16_t *ip_payload;

    ip_payload = (uint16_t*)ipv4_hdr + sizeof(*ipv4_hdr)/sizeof(uint16_t);
    udp_size = htons(udp_hdr->len);
    sum = 0;

    sum += (ipv4_hdr->saddr>>16)&0xFFFF;
    sum += (ipv4_hdr->saddr)&0xFFFF;
    sum += (ipv4_hdr->daddr>>16)&0xFFFF;
    sum += (ipv4_hdr->daddr)&0xFFFF;
    sum += htons(IPPROTO_UDP);
    sum += udp_hdr->len;

    udp_hdr->check = 0;
    while (udp_size > 1) {
        sum += * ip_payload++;
        udp_size -= 2;
    }
    /* if any bytes left, pad the bytes and add */
    if(udp_size > 0) {
        sum += ((*ip_payload)&htons(0xFF00));
    }
    /* Fold sum to 16 bits: add carrier to result */
    while (sum>>16) {
        sum = (sum & 0xffff) + (sum >> 16);
    }
    sum = ~sum;
    /* set computation result */
    udp_hdr->check = ((uint16_t)sum == 0x0000) ? 0xFFFF
                           : (uint16_t)sum;
}

#endif
