# Dharmanexus Data Docker Setup

This holds the scripts to create a docker volume with the dharmanexus data. 

## Purpose

Achieve better code-data-separation.  

All the text segment data together with their metadata lives in these repositories:   
   - https://github.com/dharmamitra/dharmanexus-pali
   - https://github.com/dharmamitra/dharmanexus-chinese
   - https://github.com/dharmamitra/dharmanexus-tibetan
   - https://github.com/dharmamitra/dharmanexus-sanskrit

Match data is too big for github> it needs to be manually copied over to /matches in the PWD. 

## Setup

We use a Makefile to define the most important commands.

### Building the Environment

- `make build`: Builds the initialization Docker image.
- `make init`: Creates the Docker volume and downloads the segment repositories.

### Managing Data

- `make update`: Updates the segment repositories in the Docker volume.
- `make shell`: Opens a shell in a temporary container with the volume mounted, allowing for manual file operations.


### Cleanup

- `make clean`: Removes the Docker volume and initialization image.

## Getting Started

1. Clone this repository:

2. Build the initialization image and set up the volume:
   ```
   make build
   make init
   ```

3. If available, copy matches data from external source to matches/

4. To update the segment repositories in case data has been updated:
   ```
   make update
   ```


## Project Structure

- `/segments`: Contains the segment repositories for the four languages (Pali, Chinese, Tibetan, Sanskrit)
- `/matches`: Directory for matches data
