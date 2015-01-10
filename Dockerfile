FROM ubuntu:latest 
RUN apt-get update && apt-get install -y wget ca-certificates

# Install Java7
RUN apt-get install -y software-properties-common
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
RUN apt-get update -y
RUN apt-get install -y mono-complete git-core

RUN git clone https://github.com/CoiniumServ/CoiniumServ.git
RUN cd CoiniumServ; git submodule init; git submodule update
RUN cd CoiniumServ/build/release; ./build.sh


