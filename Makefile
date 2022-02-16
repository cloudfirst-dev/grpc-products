KUBE_NAMESPACE ?= grpc-products

clean-opa-conf:
	cd docker; rm -f opa.yaml

opa-das-conf: clean-opa-conf
	cd docker; envsubst < opa-das.yaml.tmpl > opa.yaml

run-docker: opa-das-conf
	cd docker; docker-compose up

clean-docker:
	cd docker; docker-compose rm

install-helm:
	cd helm; helm upgrade -n ${KUBE_NAMESPACE} grpc-products . --set das.tenant=$DAS_TENANT --set das.authToken=$DAS_AUTH_TOKEN --set das.systemId=$DAS_SYSTEM_ID

uninstall-helm:
	cd helm; helm uninstall grpc-products -n ${KUBE_NAMESPACE}