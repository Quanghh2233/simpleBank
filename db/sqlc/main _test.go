package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

const (
	dbDriver = "postgres"
	dbSource = "postgresql://root:2203@localhost:5432/simpleBank?sslmode=disable"
)

var testQueries *Queries
var testdb *sql.DB

func TestMain(m *testing.M) {
	var err error

	testdb, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}

	testQueries = New(testdb)

	os.Exit(m.Run())
}
