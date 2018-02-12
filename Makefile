build:
	docker build -t dnkfbrknme/loxstats-www .

push: build
	docker push dnkfbrknme/loxstats-www
