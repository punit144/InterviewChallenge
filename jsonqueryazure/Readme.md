There are two scripts in this repo
 - query.py : it will fetch all metadata of azure instance.
 - query_key.py : it will fetch specific key data of azure instance.

Reference: https://learn.microsoft.com/en-us/azure/virtual-machines/instance-metadata-service?tabs=linux

Usage:
- login to your azure instance.
- install python3 and git
- copy both the script query.py and query_key.py
- chmod +x query.py query_key.py
- query.py : ./query.py
- query_key.py : ./query_key.py KEYID

Metadata Example: ./query_key.py name
root@fserver:~# ./query_key.py name
fserver-vm

Metadata Example: ./query.py
{
    "compute": {
        "azEnvironment": "AzurePublicCloud",
        "customData": "",
        "evictionPolicy": "",
        "isHostCompatibilityLayerVm": "false",
        "licenseType": "",
        "location": "CentralIndia",
        "name": "fserver-vm",
        "offer": "UbuntuServer",
        "osProfile": {
            "adminUsername": "pgrewal",
            "computerName": "fserver",
            "disablePasswordAuthentication": "false"
        },
        "osType": "Linux",
        "placementGroupId": "",
        "plan": {
            "name": "",
            "product": "",
            "publisher": ""
        },
        "platformFaultDomain": "0",
        "platformUpdateDomain": "0",
        "priority": "",
        "provider": "Microsoft.Compute",
        "publicKeys": [],
        "publisher": "Canonical",
        "resourceGroupName": "punit-rg",
        "resourceId": "/subscriptions/b3f97caf-1138-4fdc-8821-19251b77312c/resourceGroups/punit-rg/providers/Microsoft.Compute/virtualMachines/fserver-vm",
        "securityProfile": {
            "secureBootEnabled": "false",
            "virtualTpmEnabled": "false"
        },
        "sku": "18.04-LTS",
        "storageProfile": {
            "dataDisks": [],
            "imageReference": {
                "id": "",
                "offer": "UbuntuServer",
                "publisher": "Canonical",
                "sku": "18.04-LTS",
                "version": "latest"
            },
            "osDisk": {
                "caching": "ReadWrite",
                "createOption": "FromImage",
                "diffDiskSettings": {
                    "option": ""
                },
                "diskSizeGB": "30",
                "encryptionSettings": {
                    "enabled": "false"
                },
                "image": {
                    "uri": ""
                },
                "managedDisk": {
                    "id": "/subscriptions/b3f97caf-1138-4fdc-8821-19251b77312c/resourceGroups/punit-rg/providers/Microsoft.Compute/disks/fapp-disk",
                    "storageAccountType": "Standard_LRS"
                },
                "name": "fapp-disk",
                "osType": "Linux",
                "vhd": {
                    "uri": ""
                },
                "writeAcceleratorEnabled": "false"
            },
            "resourceDisk": {
                "size": "14336"
            }
        },
        "subscriptionId": "b3f97caf-1138-4fdc-8821-19251b77312c",
        "tags": "",
        "tagsList": [],
        "userData": "",
        "version": "18.04.202305220",
        "vmId": "bca87d0b-535f-4b6a-8d72-062de01858ca",
        "vmScaleSetName": "",
        "vmSize": "Standard_DS2_v2",
        "zone": ""
    },
    "network": {
        "interface": [
            {
                "ipv4": {
                    "ipAddress": [
                        {
                            "privateIpAddress": "192.168.1.4",
                            "publicIpAddress": "52.140.123.211"
                        }
                    ],
                    "subnet": [
                        {
                            "address": "192.168.1.0",
                            "prefix": "24"
                        }
                    ]
                },
                "ipv6": {
                    "ipAddress": []
                },
                "macAddress": "6045BD72BB28"
            }
        ]
    }
}
