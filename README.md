# grpc-products Project

This project is a simple GRPC products application that demonstrates how opa can be used with an envoy proxy to externalize authentication when using a gRPC service.

## Styra Prereq
This repository provides a template file to use when configuring OPA with connection to Styra DAS.  You'll need to set the following environment variables to generate the actual opa conf file that will be consumed by OPA.

| ENV Variable      | Description   |
| :---              | :---          |
| DAS_AUTH_TOKEN    | The auth token which can be retrieved using the install command and looking at the opa-conf.yaml file you download with curl  |
| DAS_SYSTEM_ID     | The system id in DAS |
| DAS_TENANT        | The tenant (ex. if your url is https://example.styra.com your tenant is example) |

## Running the application with docker and DAS


1. Run the following command to generate the opa.conf file
    ```
    make opa-das-conf
    ```
1. Run locally with docker compose
    ```
    make run-docker
    ```

## Deploying to Kubernetes

1. Run the following command to deploy, see the table above for optional environment variables to adjust deployment
    ```
    make install-helm
    ```

### Environment Options

| ENV Variable      | Description   | Default   |
| :---              | :---          | :---      |
| KUBE_NAMESPACE    | Namespace helm will deploy the resources | grpc-products  |