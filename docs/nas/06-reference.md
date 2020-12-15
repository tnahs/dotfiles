# Reference

## TCP/IP

!!! quote

    The Internet Protocol (IP) is the address system of the Internet and has the core function of delivering packets of information from a source device to a target device. IP is the primary way in which network connections are made, and it establishes the basis of the Internet. IP does not handle packet ordering or error checking. Such functionality requires another protocol, typically TCP.

    The TCP/IP relationship is similar to sending someone a message written on a puzzle through the mail. The message is written down and the puzzle is broken into pieces. Each piece then can travel through a different postal route, some of which take longer than others. When the puzzle pieces arrive after traversing their different paths, the pieces may be out of order. The Internet Protocol makes sure the pieces arrive at their destination address. The TCP protocol can be thought of as the puzzle assembler on the other side who puts the pieces together in the right order, asks for missing pieces to be resent, and lets the sender know the puzzle has been received. TCP maintains the connection with the sender from before the first puzzle piece is sent to after the final piece is sent.

    IP is a connectionless protocol, which means that each unit of data is individually addressed and routed from the source device to the target device, and the target does not send an acknowledgement back to the source. That’s where protocols such as the Transmission Control Protocol (TCP) come in. TCP is used in conjunction with IP in order to maintain a connection between the sender and the target and to ensure packet order.

    [What is TCP/IP? - Cloudflare](https://www.cloudflare.com/learning/ddos/glossary/tcp-ip/)

## UDP

!!! quote

    The User Datagram Protocol, or UDP, is a communication protocol used across the Internet for especially time-sensitive transmissions such as video playback or DNS lookups. It speeds up communications by not formally establishing a connection before data is transferred. This allows data to be transferred very quickly, but it can also cause packets to become lost in transit — and create opportunities for exploitation in the form of DDoS attacks.

    [What is UDP? - Cloudflare](https://www.cloudflare.com/learning/ddos/glossary/user-datagram-protocol-udp/)

## Common Network Ports & Protocols

|                    Name                     | Port(s) | Protocol  |
| :-----------------------------------------: | :-----: | :-------: |
|             Secure Shell (SSH)              |   22    | TCP & UDP |
|    Simple Mail Transfer Protocol (SMTP)     |   25    |    TCP    |
|          Domian Name System (DNS)           |   53    | TCP & UDP |
| Dynamic Host Configuration Protocol (DHCP)  | 67 / 68 |    UDP    |
|     Hyper Text Transfer Protocol (HTTP)     |   80    |    TCP    |
| Hyper Text Transfer Protocol Secure (HTTPS) |   443   |    TCP    |
|         Server Message Block (SMB)          |         |    TCP    |
