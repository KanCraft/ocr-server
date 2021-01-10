# ocr-server for KanColleWidget

## Cloud Run へのデプロイ

```sh
% gcloud builds submit
```

## Heroku へのデプロイ

```sh
% heroku create
% heroku container:push web
```

## docker-composeを使ったローカル開発

```sh
% docker-compose up
# http://localhost:8080/status
```

## 素のローカル開発

```sh
% PORT=9090 go run main.go
# http://localhost:8080/status
```