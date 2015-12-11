FROM ubuntu:15.04

#Update OS & Install Common Codebase
RUN apt-get update && apt-get install -y \
    software-properties-common \
    git-core \
    curl \
    nodejs \
    npm

#Add Symlink to node
RUN ln -s /usr/bin/nodejs /usr/bin/node

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

#Clean up
RUN apt-get clean

#Open Ports
EXPOSE 3000 80 8080

#Copy ssh keys
COPY config/config /root/.ssh/
COPY config/id_rsa /root/.ssh/
COPY config/id_rsa.pub /root/.ssh/

#Change permissions
RUN chmod 0644 /root/.ssh/id_rsa.pub
RUN chmod 0600 /root/.ssh/id_rsa
RUN chmod 0600 /root/.ssh/config
RUN chown root:root /root/.ssh/config

#Copy checkout script to root directory
COPY config/checkout.sh /root/
RUN chmod +x /root/checkout.sh

ENTRYPOINT ["/root/checkout.sh"]
