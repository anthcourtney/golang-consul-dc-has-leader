package main

import (
	"fmt"
	"os"
	"strconv"
	"net/http"
)

const e string = "CONSUL_ADDR"

func HasLeader(dc string, agent string) bool {
	url := "http://" + agent + "/v1/catalog/services?dc=" + dc
	resp, err := http.Get(url)
	if (err == nil) && (resp.StatusCode == 200) {
		return true
	}
	return false
}

func main() {
	switch {
	case len(os.Args) > 1 && os.Getenv(e) != "":
		dc := os.Args[1]
		consulAddr := os.Getenv(e)
		fmt.Println(strconv.FormatBool(HasLeader(dc,consulAddr)))
	default:
		fmt.Println("false")
	}
}
