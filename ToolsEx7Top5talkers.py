from scapy.all import sniff, IP
from collections import Counter
def packet_callback(packet):
                if IP in packet:
                                src_ip=packet[IP].src
                                dst_ip=packet[IP].dst
                                conversation = tuple(sorted([src_ip,dst_ip]))
                                conversations[conversation]+=1
def analyze_packet():
                sniff(prn=packet_callback,timeout=60)
                top_talkers=Counter(conversations).most_common(5)
                print("\nTop Talkers")
                for talker,count in top_talkers:
                                print(f"{talker[0]} <-> {talker[1]}: {count} packets")
if __name__=="__main__":
                conversations=Counter()
                analyze_packet()
