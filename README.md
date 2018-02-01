# EGA.Data.API.v3.EUREKA

This is a standalone Spring Eureka server. It is configured to run on port 8761. The correct URL to this service must be specified in all micro services using the Eureka discovery server.

There are no dependencies.

All micro services will register themselves (using their `"spring.application.name={app.name}"`) with Eureka. URLs for REST calls between microservices can then be specified as `"http(s)://{app.name}/"`. The Spring REST template automatically contacts Eureka and resolves this to the correct URL for `{app.name}`. If multiple instances of service `{app.name}` are resistered with Eureka it will automatically perform Ribbon load balancing. This allows for easy setup, configuration, and deployment of micro services. It also allows for easy replication of services to deal with increased demands or to improve resilience. Rest calls between micro services can now be coded using eah services's name, without having to provide an accurate list of deployed URLs.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

### Installing

The repository contains pre-compiled jar files with the client. To build it on your local machine, run

```
mvn package
```

This will produce the Eureka service jar file in the /target directory.

### Experimental [under construction]

The service can be deployed directly to a Docker container, using these instructions:

`wget https://raw.github.com/elixir-europe/ega-data-api-v3-eureka/master/docker/runfromsource.sh`  
`wget https://raw.github.com/elixir-europe/ega-data-api-v3-eureka/master/docker/build.sh`  
`chmod +x runfromsource.sh`  
`chmod +x build.sh`  
`./runfromsource.sh`  

These commands perform a series of actions:  
	1. Pull a build environment from Docker Hub  
	2. Run the 'build.sh' script inside of a transient build environment container.  
	3. The source code is pulled from GitHub and built  
	4. A Deploy Docker Image is built and the compiled service is added to the image  
	5. The deploy image is started; the service is automatically started inside the container  

The Docker image can also be obtained directly from Docker Hub:  

`sudo docker run -d -p 8761:8761 alexandersenf/ega_eureka`  or by running the `./runfromimage.sh` file.

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE.md](LICENSE.md) file for details

