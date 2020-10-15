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

## Babel resources
[Babel client diagram](https://github.com/EpitechIT2020/B-CPP-500-LIL-5-1-babel-thomas.crombez/blob/master/doc/babel_UML.pdf)

## TCP protocol
The project is using serialized information for communication between clients and server. Therefore the protocol is defined by the different QueryTypes used, which are listed below:

TCP QueryTypes:
	Server to Client:
		- (1) CLIENT_LIST => The server is sending the database content to the client right after the client is successfully connected (Answer to QueryType 0 CONNECT)
		- (3) DENIED => The client tries to connect to the server with an IP and a port actually used by another client (Answer to QueryType 0 CONNECT)
	Client to Server:
		- (0) CONNECT => The client try to connect to the server
		- (2) DISCONNECTED => The client notify the server that he is disconnecting so he can be removed from database

## UDP protocol
As for the TCP protocol, the communication between clients is done using serialized informations, the UDP QueryTypes are listed below:

UDP QueryTypes:
	- (0) START_CALL => Query send by the client initiating the call to the client receiving it
	- (1) COMFIRM_CALL => Query send byt the client receiving the call (to accept it) to the client who initiated it
	- (2) STOP_CALL => Can be send from both client participating the call to notify the other that the call is about to end
	- (3) CANCEL_CALL => Send by the client calling, before the other client answer, to cancel the call
	- (4) SEND_AUDIO => Used by both clients during the call to send the audio data to eachothers