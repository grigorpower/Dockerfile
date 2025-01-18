FROM golang:1.22.5

WORKDIR /app

COPY go.mod go.sum tracker.db ./

RUN go mod tidy && go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ./bin/tasks .

ENTRYPOINT [ "./bin/tasks" ]