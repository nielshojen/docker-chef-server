FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget curl rsync && \
    wget --no-check-certificate --content-disposition "http://www.opscode.com/chef/download-server?p=ubuntu&pv=18.04&m=x86_64&prerelease=false&nightlies=false" && \
    dpkg -i chef-server-core*.deb && \
    rm chef-server-core*.deb && \
    apt-get remove -y wget && \
    rm -rf /var/lib/apt/lists/*

COPY run.sh configure_chef.sh /usr/local/bin/

VOLUME /var/log

EXPOSE 443

CMD ["run.sh"]
