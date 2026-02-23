#!/bin/bash
container_name="dockwater_humble_runtime"
image="dockwater:humble"

if docker ps --filter "name=${container_name}" --filter "status=running" --format "{{.Names}}" | grep -q "^${container_name}$"; then
    echo "Container '${container_name}' is running. Joining..."
    docker exec -it "${container_name}" bash
else
    echo "Container '${container_name}' is not running. Starting via run.bash..."
    bash "${HOME}/RSN/dockwater/run.bash" "${image}"
fi
