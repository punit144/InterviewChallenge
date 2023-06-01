#!/usr/bin/python3
import requests
import json

url = 'http://169.254.169.254/metadata/instance?api-version=2021-02-01'
headers = {'Metadata': 'true'}

response = requests.get(url, headers=headers)

if response.status_code == 200:
    metadata = response.json()
    json_data = json.dumps(metadata, indent=4)
    print(json_data)
else:
    print('Failed to retrieve Azure instance metadata:', response.status_code)
