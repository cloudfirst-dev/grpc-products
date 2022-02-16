clean-opa-conf:
	cd docker; rm -f opa.yaml

opa-das-conf: clean-opa-conf
	cd docker; envsubst < opa-das.yaml.tmpl > opa.yaml

run-docker: opa-das-conf
	cd docker; docker-compose up

clean-docker:
	cd docker; docker-compose rm