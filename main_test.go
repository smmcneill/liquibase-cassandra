package main

import (
	"fmt"
	"testing"

	"github.com/gocql/gocql"
)

func TestMe(t *testing.T) {
	cluster := gocql.NewCluster("127.0.0.1")
	cluster.Keyspace = "hello"
	session, err := cluster.CreateSession()
	if err != nil {
		t.Fatal(err)
	}
	defer session.Close()

	if err := session.Query(`INSERT INTO person (id, first_name, last_name, city) VALUES (?, ?, ?, ?)`,
		1, "Shannon", "McNeill", "Hoboken").Exec(); err != nil {
		t.Fatal(err)
	}

	scanner := session.Query(`SELECT first_name, last_name, city FROM person WHERE id = ?`, 1).Iter().Scanner()
	for scanner.Next() {
		var first, last, city string
		if err := scanner.Scan(&first, &last, &city); err != nil {
			t.Fatal(err)
		}
		fmt.Println("Details:", first, last, city)
	}
	// scanner.Err() closes the iterator, so scanner nor iter should be used afterwards.
	if err := scanner.Err(); err != nil {
		t.Fatal(err)
	}
}
