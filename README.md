# docker-compose for Shiny Server

## Usage:

To run a container with Shiny Server:

```commandline
docker-compose up
```

Then visit http://localhost:3838 in a web browser. If you have an app in 
`/srv/shiny-server/appdir`, you can run the app by visiting 
http://localhost:3838/appdir/.

### Detached mode

In real deployment scenario, you will probably want to run the container in
detached mode (`-d`):

```commandline
docker-compose up -d
```

