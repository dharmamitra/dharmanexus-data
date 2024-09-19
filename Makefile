# Makefile for Dharmanexus Docker Setup

# Variables
VOLUME_NAME = dharmanexus-data
INIT_IMAGE = dharmanexus-data-init
DB_CONTAINER = dharmanexus-db
CURRENT_DIR = $(shell pwd)

# Phony targets
.PHONY: all build init volume update shell clean

# Default target
all: build init

# Build the initialization image
build:
	docker build -t $(INIT_IMAGE) .

# Initialize or update the volume
init: volume
	docker run --rm -v $(VOLUME_NAME):/data $(INIT_IMAGE)

# Ensure the volume exists
volume:
	docker volume create $(VOLUME_NAME)

# Update repositories in the volume
update:
	docker run --rm -v $(VOLUME_NAME):/data $(INIT_IMAGE)

# Open a shell in the volume for manual operations
shell:
	docker run -it --rm -v $(VOLUME_NAME):/data -v $(CURRENT_DIR)/matches:/data/matches alpine sh

# Clean up (remove volume and image)
clean:
	docker volume rm $(VOLUME_NAME)
	docker rmi $(INIT_IMAGE)
