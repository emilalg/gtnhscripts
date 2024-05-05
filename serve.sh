#!/bin/bash

# Set default memory constraints
MEMORY_XMX="8G"
MEMORY_XMS="8G"

# Check if memory constraints are provided as arguments
if [ "$#" -eq 2 ]; then
    MEMORY_XMX="$1"
    MEMORY_XMS="$2"
fi

cd gtnh/

# Start the Minecraft server with provided memory constraints
java -Xmx"$MEMORY_XMX" -Xms"$MEMORY_XMS" @java9args.txt -jar lwjgl3ify-forgePatches.jar nogui