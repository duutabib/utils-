#!/bin/bash

# Set the main directory via cli arg (default: 'main')
MAIN_DIR=${1:-main}
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Function to create directory and log creation
create_dir_structure() {
    local dir=$1
    echo "Creating directory: $dir"
    mkdir -p "$dir"
    echo "Created $dir at $TIMESTAMP" >> "$dir/creation.log"
}

# Create main directory and log
echo "Setting up project structure in: $MAIN_DIR"
mkdir -p "$MAIN_DIR"
echo "Created $MAIN_DIR at $TIMESTAMP" >> "$MAIN_DIR/creation.log"

# Create subdirectories
create_dir_structure "$MAIN_DIR/config"
create_dir_structure "$MAIN_DIR/logs"
create_dir_structure "$MAIN_DIR/results"
create_dir_structure "$MAIN_DIR/src"
create_dir_structure "$MAIN_DIR/tests"

echo "Project structure created successfully!"
echo "Directories created in: $(pwd)/$MAIN_DIR"

# Make the script executable
chmod +x "$0"
