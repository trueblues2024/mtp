import socket
import datetime
'''import subprocess
command=["dumpcap -i","eth0"]
subprocess.run(command)
'''
def  log_connection(client_address):
                current_time=datetime.datetime.now().strftime("%Y-%M-%D %H %m %s")
                with open("honeypot_log","a") as logfile:
                                logfile.write(f"[current_time] connection from:client_address\n")
def start_honeypot(host,port):
                with socket.socket(socket.AF_INET,socket.SOCK_STREAM) as server_socket:
                                server_socket.bind((host,port))
                                server_socket.listen(port)
                                print(f"honeypot listening on:",host,"",port)
                                while (1):
                                                client_socket,client_address=server_socket.accept()
                                                print(f"connection from:",client_address)
                                                log_connection(client_address)
                                                client_socket.close()
if __name__=="__main__":
                HOST="172.16.20.29"
                PORT=6568
                start_honeypot(HOST,PORT)
                                                                                
