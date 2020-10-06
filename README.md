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

