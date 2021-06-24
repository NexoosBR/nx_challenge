web:
	docker-compose run \
		--service-ports \
		--rm \
		--name nex-web \
		web

nexdb:
	docker-compose run \
		--rm \
		--name nex-db \
		db

psql:
	docker exec \
		-it \
		nex-db \
		psql -U nex
