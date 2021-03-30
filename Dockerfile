FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget curl rsync && \
    wget --no-check-certificate --content-disposition "http://www.opscode.com/chef/download-server?p=ubuntu&pv=20.04&m=x86_64&prerelease=false&nightlies=false" && \
    dpkg -i chef-server-core*.deb && \
    rm chef-server-core*.deb && \
    apt-get remove -y wget && \
    rm -rf /var/lib/apt/lists/*

COPY run.sh configure_chef.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/run.sh && chmod +x /usr/local/bin/configure_chef.sh

VOLUME /var/log

EXPOSE 443

CMD ["/usr/local/bin/run.sh"]
