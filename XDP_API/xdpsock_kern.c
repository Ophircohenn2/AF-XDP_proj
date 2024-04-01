// SPDX-License-Identifier: GPL-2.0

#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#define MAX_SOCKS 32
typedef unsigned int __uint;


//debug function that allow us to print variables to the kernel log
#define odbpf_vdebug(fmt, args...)                                                       \
	({                                                                                   \
		char ____fmt[] = fmt;                                                            \
		bpf_trace_printk(____fmt, sizeof(____fmt), ##args);                              \
	})

//ebpf map that hold pointers to the AF-XDP sockets
struct {
	__uint(type, BPF_MAP_TYPE_XSKMAP);
	__uint(max_entries, MAX_SOCKS + 1);
	__uint(key_size, sizeof(int));
	__uint(value_size, sizeof(int));
} xsks_map SEC(".maps");

static __uint index = 0;
SEC("xdp_sock")
int xdp_sock_prog(struct xdp_md *ctx)
{


    index = ctx->rx_queue_index;


    /* A set entry here means that the correspnding queue_id
     * has an active AF_XDP socket bound to it. */
   if (bpf_map_lookup_elem(&xsks_map, &index) == NULL){

       return XDP_PASS;
   }

   return bpf_redirect_map(&xsks_map, index, 0);

}

char _license[] SEC("license") = "Dual BSD/GPL";
