build:
	docker compose build

up:
	docker compose up -d

restart:
	docker compose restart

build-up: build up

down:
	docker compose down --remove-orphans

ps:
	docker compose ps

logs-golang:
	docker compose logs golang

db-schema-create:
	docker compose exec -T postgresql "/bin/bash" -c "psql --username=postgres" < backend/db_schema.sql

clear-cache:
	docker compose exec redis redis-cli flushall

build-backend-tag:
	docker build ./backend -f ./backend/deployment/Dockerfile --target prod -t anastasiiazakharchuk/devops-course-golang

push-backend-tag:
	docker push anastasiiazakharchuk/devops-course-golang
