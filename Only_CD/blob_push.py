import os, uuid
import sys
from azure.storage.blob import BlobServiceClient, BlobClient, ContainerClient

connect_str = ''#Azure Blob Storage Connection String

# Create the BlobServiceClient object which will be used to create a container client
blob_service_client = BlobServiceClient.from_connection_string(connect_str)

containers = blob_service_client.list_containers()
list_container = []
for container in containers:
    list_container.append(container.name)

# Create a unique name for the container
container_name = "ml-models"
container_client = blob_service_client.get_container_client(container_name)
# Create the container
try:
    if container_name not in list_container:
        
        container_client.create_container()
        print("Created New Container")
    else:
        print("Container already exists")
        # List containers in the storage account
    
except:
    print(sys.exc_info())

try:
    local_file_name = 'rf.pkl'
    blob_client = blob_service_client.get_blob_client(container=container_name, blob=local_file_name)

    print("\nUploading to Azure Storage as blob:\n\t" + local_file_name)
    blob_client.upload_blob(local_file_name)
        # List containers in the storage account
    
except:
    print(sys.exc_info())

print("\nListing blobs...")

# List the blobs in the container
blob_list = container_client.list_blobs()
for blob in blob_list:
    print("\t" + blob.name)
