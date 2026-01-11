#!/bin/bash
# ChatDev Launcher Script
# This script makes it easy to run ChatDev with your API key

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Load environment variables from .env file
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Check if API key is set
if [ -z "$OPENAI_API_KEY" ]; then
    echo "Error: OPENAI_API_KEY not found in .env file"
    exit 1
fi

# Default values
TASK="${1:-Create a simple application}"
NAME="${2:-MyApp}"

echo "=================================="
echo "ChatDev Launcher"
echo "=================================="
echo "Task: $TASK"
echo "Name: $NAME"
echo ""
echo "Starting ChatDev..."
echo "=================================="
echo ""

# Run ChatDev
./venv/bin/python run.py --task "$TASK" --name "$NAME"

echo ""
echo "=================================="
echo "ChatDev finished!"
echo "Check WareHouse/ for your app"
echo "=================================="
