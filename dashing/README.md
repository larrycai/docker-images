# Dashing

Run [Dashing](http://dashing.io/) in a [Docker](http://docker.io/) container.

It contains the base dashing environment and packaged useful gem as well


## Run

```docker run -d -p 8080:3030 larrycai/dashing```

And point your browser to [http://localhost:8080/](http://localhost:8080/).


## Configuration

### Dashboards

To provide a custom dashboard, use container volume **/dashing**:

```docker run -v=/my/custom/dashing:/dashing -d -p 8080:3030 larrycai/dashing```

(*Don't forget to also provide the layout.erb*)

## Thanks

Referred : [frvi/dashing](https://registry.hub.docker.com/u/frvi/dashing/)
