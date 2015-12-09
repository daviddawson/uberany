FROM ubuntu:15.04

#Update OS
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y

#Install Common Codebase
RUN apt-get install -y software-properties-common git-core curl

#Install Java8
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | tee /etc/oracle-java-8-licence-acceptance | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer

#Install Clojure
ENV LEIN_ROOT 1
ENV HTTP_CLIENT curl -k -s -f -L -o

RUN curl --silent --location --retry 3 --insecure https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein --output /usr/bin/lein && chmod 0755 /usr/bin/lein
RUN /usr/bin/lein upgrade

#Remove old Node and replace with NodeJS
RUN apt-get purge node -y
RUN apt-get install nodejs npm -y
RUN ln -s /usr/bin/nodejs /usr/bin/node

#Clean up
RUN apt-get clean

#Copy checkout script to endpoint
COPY /config/S99-checkout.sh /etc/rc2.d/
RUN chmod +x /etc/rc2.d/S99-checkout.sh
