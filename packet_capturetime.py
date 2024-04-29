from scapy.all import sniff, IP
from collections import defaultdict
import time
def packet_callback(packet):
    global start_times
    if IP in packet:
        src_ip = packet[IP].src
        dst_ip = packet[IP].dst
        if (src_ip, dst_ip) not in start_times:
            start_times[(src_ip, dst_ip)] = time.time()
        else:
            end_time = time.time()
            elapsed_time = end_time - start_times[(src_ip, dst_ip)]
                     if elapsed_time > 0.5: 
                print(f"Slow response detected: {src_ip} -> {dst_ip}, Response Time: {elapsed_time:.2f} seconds")
def analyze_packets():
    global start_times
    try:
        sniff(prn=packet_callback, timeout=10)
    except KeyboardInterrupt:
        pass
if __name__ == "__main__":
    start_times = defaultdict(float)
    analyze_packets()
