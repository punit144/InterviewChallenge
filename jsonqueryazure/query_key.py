#!/usr/bin/python3
import requests
import sys

def get_specific_metadata_key(key):
    url = 'http://169.254.169.254/metadata/instance?api-version=2021-02-01'
    headers = {'Metadata': 'true'}

    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        metadata = response.json()
        if key in metadata["compute"]:
            return metadata["compute"][key]
        else:
            return f"Key '{key}' not found in Azure instance metadata."
    else:
        return f"Failed to retrieve Azure instance metadata: {response.status_code}"

# Usage
if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Please provide the key as a command-line argument.")
    else:
        key_to_fetch = sys.argv[1]
        specific_metadata = get_specific_metadata_key(key_to_fetch)
        print(specific_metadata)