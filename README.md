
## Installation

This project uses **conan**.
To install conan, checkout [conan documentation](https://docs.conan.io/en/1.7/installation.html)
or install it with **pip**:
>$ pip install conan

Then you need 3 remotes:
	- conan-center (installed with conan)
	- bincrafters
	- epitech

You can install those by running the following commands:
>$ conan remote add conan-center https://api.bintray.com/conan/conan/conan-center 

>$ conan remote add epitech https://api.bintray.com/conan/epitech/public-conan

>$ conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan 

You can now compile the **Babel project**

### Linux compilation
You can launch the **install_linux.sh** script:
>$ ./install_linux.sh 

### Windows compilation
You have to execute those commands:
>$ mkdir build && cd build && conan install --build=missing -s build_type=Debug .. && cmake ..

>$ cmake --build .

### Run the project
You can start by running the server
>$ ./build/bin/babel_server

And then run the clients
>$ ./build/bin/babel_client

## TCP protocol
The project is using serialized information for communication between clients and server. The class we serialize is called **TcpQuery**. Therefore the protocol is defined by the different **QueryTypes** used, which are listed below:

### Server to Client:
 - (1) **CLIENT_LIST** => The server is sending the database content to the
   client right after the client is successfully connected    (Answer   
   to QueryType 0 **CONNECT**)
  - (3) **DENIED** => The client tries to connect to the server with an IP and a port actually used by another client (Answer to QueryType    0    **CONNECT**)
 ### Client to Server:
  - (0) **CONNECT** => The client try to connect to the server
  - (2) **DISCONNECTED** => The client notify the server that he is disconnecting so he can be removed from database

## UDP protocol
As for the TCP protocol, the communication between clients is done using serialized informations, we are serializing the **UdpQuery** class, the UDP QueryTypes are listed below:

- **START_CALL** => Requests call start.
- **CONFIRM_CALL** => Confirms a **START_CALL** request.
- **CANCEL_CALL** => Cancels a **START_CALL** request.
- **STOP_CALL** => Stops the current call.
- **SEND_AUDIO** => Indicates that an audio package is stored in the **UdpQuery** object.

### Ports usages:
Ports for simple UDP socketing (call queries):
- Choosed by the user when launching the client

Ports used by UDP socketing to send and receive sound packets:
- 4444
- 4343

**Thoose ports MUST be available for the Babel to run correctly**

## Babel resources
[Babel client UML class diagram](https://github.com/EpitechIT2020/B-CPP-500-LIL-5-1-babel-thomas.crombez/blob/master/documentation/UML.png)

[Babel UDP Representation](https://github.com/EpitechIT2020/B-CPP-500-LIL-5-1-babel-thomas.crombez/blob/master/documentation/UDP.PNG)
