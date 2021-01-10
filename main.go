package main

import (
	"log"
	"net/http"
	"os"

	"github.com/otiai10/marmoset"

	ocrserver "github.com/otiai10/ocrserver/controllers"
)

func main() {

	r := marmoset.NewRouter()

	// API
	r.GET("/status", ocrserver.Status)
	r.POST("/base64", ocrserver.Base64)
	r.POST("/file", ocrserver.FileUpload)

	port := os.Getenv("PORT")
	if port == "" {
		log.Fatalln("Required env `PORT` is not specified.")
	}
	log.Printf("listening on port %s", port)
	if err := http.ListenAndServe(":"+port, r); err != nil {
		log.Println(err)
	}
}
