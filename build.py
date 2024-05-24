import os
import shutil

# List of directories and files to include
items_to_copy = ["DarkZagreus", "Game", "Libraries", "Packages", "Scripts", "config.lua", "modfile.txt"]

# Function to clear the dist folder
def clear_dist_folder():
    dist_folder = "dist"
    if os.path.exists(dist_folder):
        shutil.rmtree(dist_folder)
        print("Existing dist folder cleared.")

# Create dist folder if not exists
if not os.path.exists("dist"):
    os.makedirs("dist")
else:
    clear_dist_folder()

# Copy each item to the dist folder
for item in items_to_copy:
    source = item
    destination = os.path.join("dist", item)
    
    if os.path.isdir(source):
        shutil.copytree(source, destination)
    else:
        shutil.copy(source, destination)

print("Files and folders copied successfully to dist folder.")