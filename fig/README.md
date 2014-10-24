# Introduction #

[Fig](http://fig.sh) is very useful orchestration tool for docker in single node, while it can't be installed in boot2docker directly.

The docker image helps you to run fig in docker to serve the purpose.

It works in boot2docker 1.3+, and it is verified for Windows Platform.

    docker run -it -v /var/run/docker.sock:/docker.sock larrycai/fig fig -v

## Usage in detail  ##
    
    docker run -it -v /var/run/docker.sock:/docker.sock -v <local dir>:<path inside> larrycai/fig <fig command>
    
For example if you put below `fig.yml` under `/home/docker/codingwithme-ansible` (this is my [ansible CodingWithMe training](https://github.com/larrycai/codingwithme-ansible) case)

    ansible:
      image: dockerfile/ansible
      volumes:
       - /home/docker/codingwithme-ansible:/data
      links:
       - haproxy
       - web1
       - web2
       - database
    haproxy:
      image: larrycai/ubuntu-sshd
    web1:
      image: larrycai/ubuntu-sshd
    web2:
      image: larrycai/ubuntu-sshd
    database:
      image: larrycai/ubuntu-sshd
      
NOTE: the path for the `volume` shall be host path !
      
Then you can run       
      
    $ docker run -it -v /var/run/docker.sock:/docker.sock -v /home/docker/codingwithme-ansible:/app larrycai/fig fig run ansible
    [ root@6005eda75915:/data {master *} ]$ ls -al
    total 36K
    drwxr-xr-x  5 1000 staff  260 Oct 19 06:16 ./
    drwxr-xr-x 99 root root  4.0K Oct 19 06:24 ../
