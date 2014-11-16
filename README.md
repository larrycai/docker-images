## How to run

    docker run -t -p <port> -v /var/run/docker.sock:/docker.sock -v <figapp>:/app larrycai/fig

<port> is the port in fig applications 
<figapp> is the local absolute path for `fig.yml`

default it will run `fig up`, which you can pass the command after `larrycai/fig` or even using bash (don't forget to use `-it` then)

This is one solution for https://github.com/docker/fig/issues/26
