postgres:
 	docker run --name post -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=2203 -d postgres

createdb:
	docker exec -it post createdb --username=root --owner=root simpleBank
dropdb:
	docker exec -it post dropdb simpleBank

migrateup:
	migrate -path db/migration -database "postgresql://root:2203@localhost:5432/simpleBank?sslmode=disable" -verbose up

sqlc:
	sqlc generate

migratedown:
	migrate -path db/migration -database "postgresql://root:2203@localhost:5432/simpleBank?sslmode=disable" -verbose down

test: 
	go test -v -cover ./...

.PHONY : postgres createdb dropdb migratedown migrateup sqlc test