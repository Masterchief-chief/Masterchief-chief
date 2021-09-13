#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <netdb.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#define PORT 80
#define MAXDATASIZE 10000 // max number of bytes we can get at once

int main() 
{
char IP[ ]="93.184.216.34";   
char HTTPmsg[ ] = "GET /index.html HTTP/1.0 \r\n\r\n";
int sockfd, numbytes;
char buf[MAXDATASIZE];
struct sockaddr_in server; 
if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
perror("socket");
exit(1);
}
server.sin_family = AF_INET; // Internet Address Family (IP)
server.sin_port = htons(PORT); // short, network byte order
server.sin_addr.s_addr = inet_addr(IP);
memset(&(server.sin_zero), '\0', 8);
if (connect(sockfd, (struct sockaddr *) &server, sizeof(struct sockaddr)) == -1) {
perror("connect");
exit(1);
}
if ( send(sockfd, HTTPmsg, strlen(HTTPmsg), 0) == -1) {
perror("send error");
exit(1);
}

if ((numbytes = recv(sockfd, buf, MAXDATASIZE - 1, 0)) == -1) {
perror("recv error");
exit(1);
}
buf[numbytes] = '\0';
printf("Received: %s", buf);
close(sockfd);
return 0;
}
