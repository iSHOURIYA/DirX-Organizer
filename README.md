# DirX Organizer  

**DirX Organizer** is an automatic file organization tool designed for Ubuntu. It sorts files in your **Downloads** folder into categorized subdirectories, making it easier to manage your files without manual intervention.

It consists of two main scripts:  
- **`dirx.sh`**: Moves files into appropriate folders (e.g., Documents, Images, Videos, etc.).  
- **`watcher.sh`**: Monitors the Downloads folder and automatically triggers the file organization process as new files are added.

---

## Features  

- 📂 **Automatic File Organization**  
  Automatically organizes your files into well-defined categories like Documents, Images, Music, Videos, Archives, and more.

- 🔄 **Background Monitoring**  
  Runs as a background service using `systemd`, so files are organized in real-time as they are downloaded or added to your Downloads folder.

- 🔍 **Duplicate Handling**  
  Detects and renames duplicate files by appending a timestamp, preventing overwriting and keeping your files intact.

- 🛠 **Simple Installation & Uninstallation**  
  Hassle-free installation with easy-to-use scripts and a clean uninstallation process that removes all traces of the program.

- 🚀 **Lightweight & Efficient**  
  DirX Organizer is designed to run with minimal system resources, ensuring smooth performance even during heavy usage.

---

## Installation  

### 1. Clone the Repository  
Start by cloning the repository to your local machine:  
```bash
git clone https://github.com/ishouriya/DirX-Organizer.git
cd DirX-Organizer
```

### 2. Run the Installation Script  
Execute the `install.sh` script to set up DirX Organizer:  
```bash
bash dirx-organizer/install.sh
```

This script will:  
- Install required dependencies (such as `inotify-tools`).
- Copy the necessary scripts to `/usr/local/bin/` for easy global access.
- Set up a `systemd` service that will run `watcher.sh` in the background to monitor your Downloads folder.

---

## Usage  

### Manually Organize Files  
You can manually organize files by running the `dirx.sh` script anytime:  
```bash
bash dirx.sh
```

### Automatic Background Organization  
The watcher service runs in the background, continuously monitoring your Downloads folder. It will automatically sort new files as they are downloaded.

### Check the Service Status  
To verify that the watcher service is running, use the following command:  
```bash
systemctl status dirx.service
```

### Stop or Restart the Service  
- To stop the service:  
  ```bash
  sudo systemctl stop dirx.service
  ```

- To restart the service:  
  ```bash
  sudo systemctl restart dirx.service
  ```

---

## Uninstallation  

To completely remove DirX Organizer from your system, run the uninstallation script:  
```bash
bash dirx-organizer/uninstall.sh
```

This will:  
- Stop and remove the background service.
- Delete the installed scripts from `/usr/local/bin/`.
- Clean up any system configurations related to DirX Organizer.

---

## Contributing  

We welcome contributions! If you'd like to improve DirX Organizer, feel free to:  
1. Fork the repository.  
2. Make your changes or improvements.  
3. Submit a pull request with a detailed explanation of your changes.

---

---

## How to Contribute

1. Fork the repository.
2. Create a new branch for your feature or fix.
3. Make your changes and ensure everything works.
4. Submit a pull request with a clear description of your changes.

We appreciate any contributions, whether it's bug fixes, documentation improvements, or new features!

---

## License  

DirX Organizer is licensed under the **MIT License**. For more details, refer to the [LICENSE](./LICENSE) file.

---

## Author  

Created and maintained by [ishouriya](https://github.com/ishouriya).

---


