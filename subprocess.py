import subprocess
def capture_packets(interface, output_file, packet_count):
    try:
        # Run tcpdump command to capture packets
        command = ['C:\Program Files\Wireshark\dumpcap.exe', '-i', interface, '-w', output_file, '-c', str(packet_count)]
        subprocess.run(command, check=True)
        print("Packet capture completed successfully.")
    except subprocess.CalledProcessError as e:
        print("Error occurred:", e)

# Example usage
interface = "ethernet"  # Specify the interface to capture packets from
output_file = "captured_packets.pcap"  # Specify the output file
packet_count = 100  # Specify the number of packets to capture

capture_packets(interface, output_file, packet_count)
