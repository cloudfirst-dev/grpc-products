# grpc-products Project

This project is a simple GRPC products application that demonstrates how opa can be used with an envoy proxy to externalize authentication when using a gRPC service.

## Running the application with docker and DAS

This repository provides a template file to use when configuring OPA with connection to Styra DAS.  You'll need to set the following environment variables to generate the actual opa conf file that will be consumed by OPA.

1. Define the following environment variables
    | ENV Variable      | Description   |
    | :---              | :---          |
    | DAS_AUTH_TOKEN    | The auth token which can be retrieved using the install command and looking at the opa-conf.yaml file you download with curl  |
    | DAS_SYSTEM_ID     | The system id in DAS |
    | DAS_TENANT        | The tenant (ex. if your url is https://example.styra.com your tenant is example)
1. Run the following command to generate the opa.conf file
    ```
    make opa-das-conf
    ```
1. Run locally with docker compose
    ```
    make run-docker
    ```

## Packaging and running the application

The application can be packaged using:
```shell script
./mvnw package
```
It produces the `quarkus-run.jar` file in the `target/quarkus-app/` directory.
Be aware that it’s not an _über-jar_ as the dependencies are copied into the `target/quarkus-app/lib/` directory.

The application is now runnable using `java -jar target/quarkus-app/quarkus-run.jar`.

If you want to build an _über-jar_, execute the following command:
```shell script
./mvnw package -Dquarkus.package.type=uber-jar
```

The application, packaged as an _über-jar_, is now runnable using `java -jar target/*-runner.jar`.

## Creating a native executable

You can create a native executable using: 
```shell script
./mvnw package -Pnative
```

Or, if you don't have GraalVM installed, you can run the native executable build in a container using: 
```shell script
./mvnw package -Pnative -Dquarkus.native.container-build=true
```

You can then execute your native executable with: `./target/grpc-products-1.0.0-SNAPSHOT-runner`

If you want to learn more about building native executables, please consult https://quarkus.io/guides/maven-tooling.

## Related Guides

- RESTEasy Reactive ([guide](https://quarkus.io/guides/resteasy-reactive)): Reactive implementation of JAX-RS with additional features. This extension is not compatible with the quarkus-resteasy extension, or any of the extensions that depend on it.

## Provided Code

### gRPC

Create your first gRPC service

[Related guide section...](https://quarkus.io/guides/grpc-getting-started)

### RESTEasy Reactive

Easily start your Reactive RESTful Web Services

[Related guide section...](https://quarkus.io/guides/getting-started-reactive#reactive-jax-rs-resources)
