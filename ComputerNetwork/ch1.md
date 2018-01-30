# Ch1
## short form & defination
### packet
When one end system has data to send to another end system, the sending end system segments the data and adds header bytes to each segment.
### packet switch
routers and link-layer switches
### ISPs
Internet Service Providers 
### protocol
A protocol defines the format and the order of messages exchanged between
two or more communicating entities, as well as the actions taken on the trans-
mission and/or receipt of a message or other event.
### DSL
digital subscriber line
### FTTH
fiber to the home 
### OLT
optical line terminator  
### HFC
Hybrid Fiber－Coaxial 混合光纤同轴电缆网
### twisted-pair cropper wire
least expensive and most commonly used guided media
## UTP
Unshielded twisted pair
## Physical media
### guided media
fiber-optic cable, a twisted-pair copper wire, or a coaxial cable
### unguided media
wireless LAN or a digital satellite channel
## type of delay
### Processing Delay
The time required to examine the packet’s header and determine where to direct the packet is part of the processing delay
(level of $\mu s$)
### queuing delay
### Transmission Delay
packet L bits
transmission rate of the link R bits/sec
The transmission delay is $$D = \frac{L}{R}$$. This is the amount of time required to **push** (that is, transmit) all of the packet’s bits into the link
a function of packet **length** and **transmission rate**.
*Noting to do with distance*.
### Propagation Delay
at the speed equal to or less than light.
### name of packet
(in Internet protocol stack)
- application layer : message
- transport layer : segment
- network layer : datagram
- link layer : frame
### socket
A process sends messages into, and receives messages from, the network through a software **interface** called a socket.
an **API** between the application and the network
## traffic intensity
let $a$ denote the average rate at which packets arrive at the queue (packets/sec)
$$I = \frac{aL}{R}$$
$I$ is **traffic intensity**
## transport layer
transport protocols
- TCP
- UDP
## addressing in application layer
- IP address : identify the host
- port number : identify the process(more specifically, the socket)