# Makefile

.PHONY: init assets generate run test

init:
	@echo "Install some important commands and tools"
	npm install
	go install github.com/a-h/templ/cmd/templ@latest
	go install github.com/vektra/mockery/v2@latest
	go mod tidy

assets:
	@echo "Build the assets"
	npx tailwindcss -i ./internal/assets/tailwind.css -o ./internal/assets/dist/styles.css

generate:
	@echo "Generate stuff and things"
	go generate ./...

run: assets generate
	@echo "Run the application"
	npx tailwindcss -i ./internal/assets/tailwind.css -o ./internal/assets/dist/styles.css --watch&
	go run ./cmd/server/...

test:
	@echo "Run the tests"
	go test ./...
