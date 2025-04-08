.DEFAULT_GOAL	:= help
-include .makerc

# --- Targets -----------------------------------------------------------------

# This allows us to accept extra arguments
%: .husky
	@:

.PHONY: .husky
# Configure git hooks for husky
.husky:
	@if ! command -v husky &> /dev/null; then \
		echo "ERROR: missing executeable 'husky', please run:"; \
		echo "\n$ make brew\n"; \
	fi
	@git config core.hooksPath .husky

## === Tasks ===

.PHONY: build
## Build binary
build:
	@mkdir -p bin
	@go build -o bin/sesamy main.go

.PHONY: install
## Install binary
install:
	@go build -o ${GOPATH}/bin/sesamy main.go

## === Utils ===

## Show help text
help:
	@awk '{ \
			if ($$0 ~ /^.PHONY: [a-zA-Z\-\_0-9]+$$/) { \
				helpCommand = substr($$0, index($$0, ":") + 2); \
				if (helpMessage) { \
					printf "\033[36m%-23s\033[0m %s\n", \
						helpCommand, helpMessage; \
					helpMessage = ""; \
				} \
			} else if ($$0 ~ /^[a-zA-Z\-\_0-9.]+:/) { \
				helpCommand = substr($$0, 0, index($$0, ":")); \
				if (helpMessage) { \
					printf "\033[36m%-23s\033[0m %s\n", \
						helpCommand, helpMessage"\n"; \
					helpMessage = ""; \
				} \
			} else if ($$0 ~ /^##/) { \
				if (helpMessage) { \
					helpMessage = helpMessage"\n                        "substr($$0, 3); \
				} else { \
					helpMessage = substr($$0, 3); \
				} \
			} else { \
				if (helpMessage) { \
					print "\n                        "helpMessage"\n" \
				} \
				helpMessage = ""; \
			} \
		}' \
		$(MAKEFILE_LIST)
