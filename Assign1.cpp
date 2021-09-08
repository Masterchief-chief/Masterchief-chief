#include <arpa/inet.h>
#include <netdb.h>
#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>

#ifndef NI_MAXHOST
#define NI_MAXHOST 1025
#endif

int main(void) {
	struct addrinfo* result;
	struct addrinfo  hints;

	memset(&hints, 0, sizeof(hints));
	hints.ai_protocol = 6; /* TCP See /etc/protocols */

	// resolve the domain name into a list of addresses
	auto error = getaddrinfo("google.com", NULL, &hints, &result);
	if (error != 0) {
		if (error == EAI_SYSTEM) {
			perror("getaddrinfo");
		} else {
			fprintf(stderr, "error in getaddrinfo: %s\n", gai_strerror(error));
		}
		exit(EXIT_FAILURE);
	}

	// loop over all returned results and print as human readable
	for (auto res = result; res != NULL; res = res->ai_next) {
		char address[INET6_ADDRSTRLEN + 5];
		switch (res->ai_family) {
		case AF_INET: {

			auto addr = (struct sockaddr_in*)res->ai_addr;

			if (NULL == inet_ntop(res->ai_family,
			                      &addr->sin_addr,
			                      address,
			                      sizeof(address))) {
				perror("inet_ntop");
				return EXIT_FAILURE;
			}

		} break;
		case AF_INET6: {

			
			auto addr = (struct sockaddr_in6*)res->ai_addr;

			if (NULL == inet_ntop(res->ai_family,
			                      &addr->sin6_addr,
			                      address,
			                      sizeof(address))) {
				perror("inet_ntop");
				return EXIT_FAILURE;
			}

		} break;
		default:
			
			break;
		}

		printf("%s\n", address);
	}

	freeaddrinfo(result);
	return 0;
}
