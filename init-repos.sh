#!/bin/sh
set -e

# Create the required directory structure
mkdir -p /data/segments /data/matches

# List of repositories to clone
REPOS="dharmanexus-pali dharmanexus-chinese dharmanexus-tibetan dharmanexus-sanskrit"

# Clone or update repositories
for repo in $REPOS; do
  if [ -d "/data/segments/$repo/.git" ]; then
    echo "Updating $repo"
    cd /data/segments/$repo
    git pull
  else
    echo "Cloning $repo"
    git clone https://github.com/dharmamitra/$repo.git /data/segments/$repo
  fi
done

echo "All repositories initialized/updated"
echo "Note: /data/matches is ready for manual data copying as the data is too big for github"