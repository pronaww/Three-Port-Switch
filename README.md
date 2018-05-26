Lab exercise 2 : Three-­‐Port Switch

Design and implement a 3-­‐Port Switch with the functional description given below.

The switch has 3 ports, numbered 0, 1 and 2. Each port has the following inputs and outputs.

dini : data input

douti : data output

desti : destination port number (input)
reqi : request (input)

acki : acknowledgement (output)

![image](https://user-images.githubusercontent.com/25972864/40573462-a810b044-60df-11e8-8126-4c493cba553a.png)

The function of the switch is to connect dini of ith port to doutj of jth port when there is a request at ith port to do so. The request for connection is indicated by reqi and the destination j is specified by desti.

The switch is capable of connecting only one source to its destination at a time. It arbitrates among concurrent requests as per the priorities assigned to the ports. The priorities are as follows, pi indicating the priority of ith port.

p2 > p1 > p0

Switch conveys the result of arbitration through ack0, ack1 and ack2. Also, the port number of the port that wins arbitration is given by src output. For example, if port 1 and port 2 simultaneously request then, port 2 will win the arbitration and its port number will show up on src.

Carry out the design in two phases. First design the building blocks such as priority encoder, mux, de-­‐mux etc. Then use these building blocks to design the whole switch. It will be explained to you in the lab how a design can be encapsulated as a new component.
Use slide switches for inputs (req, dest, din). Display dout and src outputs on

LEDs. Figure below shows the pin mapping:

![image](https://user-images.githubusercontent.com/25972864/40573504-045f3212-60e0-11e8-9832-5dda6e27ff3d.png)

Port addressing is given below-­‐

![image](https://user-images.githubusercontent.com/25972864/40573497-f6de7602-60df-11e8-8b41-9122e04b4f4f.png)

Assume the port switch is always driven with valid inputs (example: port address “11” is not requested). Further, none of the ports requesting for data transfer is a valid condition.

Please follow the naming as indicated below:

![image](https://user-images.githubusercontent.com/25972864/40573430-262f07c4-60df-11e8-9342-e35e5ee65118.png)


Note that this design suffers from the following limitations. We may consider overcoming these limitations in a later exercise.

    • It allows only one connection at a time.

    • A request has to persist till it gets an acknowledgement. There is no queuing of requests.

    • A request on a higher priority port can abort an active connection made from a lower priority port.

    • Requests at lower priority port(s) can be denied acknowledgement indefinitely by extensive usage of the switch by higher priority request(s), leading to starvation.
