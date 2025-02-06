# DirX Organizer  

<p align="center">
  <img src="https://img.shields.io/github/stars/ishouriya/DirX-Organizer?style=for-the-badge&color=blue">
  <img src="https://img.shields.io/github/forks/ishouriya/DirX-Organizer?style=for-the-badge&color=green">
  <img src="https://img.shields.io/github/license/ishouriya/DirX-Organizer?style=for-the-badge">
</p>

<p align="center">
  🚀 <em>Your Downloads folder will never be the same again!</em> 🚀
</p>

```
  ____  _  _  __  ____     ╭───────────────────────────╮
 (  _ \( \/ )(  )(_  _)    │  Automated File Organizer │
  )   / )  (  )(   )(     ╰───────────────────────────╯
 (__\_)(_\/\_)(__) (__)    
```

**DirX Organizer** is an automatic file organization tool designed for Ubuntu. It sorts files in your **Downloads** folder into categorized subdirectories like a digital Marie Kondo 📂✨!

---

## 🌟 Features  

### 🧹 **Automatic File Organization**  
![Folder Animation](https://media.giphy.com/media/3o7TKSjRrfIPjeiVyM/giphy.gif)  
*Automagically* moves files into folders like `Documents`, `Images`, `Videos`, and more. Say goodbye to messy Downloads!

### 🔍 **Real-Time Background Monitoring**  
```bash
systemctl status dirx.service  # 🟢 Active: watching ~/Downloads 24/7
```  
Runs as a lightweight `systemd` service—no manual intervention needed!

### ♻️ **Smart Duplicate Handling**  
```text
report.pdf       →  Documents/report.pdf  
report(2024).pdf →  Documents/report_20240615_142356.pdf
```  
Renames duplicates with timestamps—*no overwrites, no tears* 😌.

### 🛠️ **One-Click Setup & Removal**  
```bash
bash install.sh   # ✅ Installs in 3 seconds flat!  
bash uninstall.sh # 🧼 Leaves zero traces behind
```  

### ⚡ **Lightweight & Efficient**  
Uses less RAM than your average cat video 🐈⬛! Perfect for low-spec machines.

---

## 🚀 Quick Start  

### 1. Clone & Install  
```bash
git clone https://github.com/ishouriya/DirX-Organizer.git
cd DirX-Organizer
sudo bash install.sh  # Requires sudo for systemd setup
```

**What the install script does:**  
- 📦 Installs `inotify-tools` (for file monitoring)  
- 📂 Copies scripts to `/usr/local/bin`  
- ⚙️ Creates a `systemd` service (`dirx.service`)  
- 🔄 Starts the watcher automatically  

### 2. Watch the Magic Happen!  
```text
~/Downloads  
├── vacation.jpg       →  ~/Downloads/Images/vacation.jpg  
├── report.pdf         →  ~/Downloads/Documents/report.pdf  
└── project.zip        →  ~/Downloads/Archives/project.zip  
```  

---

## 🕹️ Manual Control  

### Organize Now!  
```bash
dirx.sh  # 🧹 Immediate cleanup!
```  

### Service Management  
| Command                          | Effect                          |
|----------------------------------|---------------------------------|
| `systemctl start dirx.service`   | Starts the watcher              |
| `systemctl stop dirx.service`    | Pauses monitoring               |
| `journalctl -u dirx.service -f`  | Live logs (great for debugging) |  

---

## ❓ FAQ  

### Q: What file types are supported?  
**A:** All common formats!  
```text
Documents: .pdf, .docx, .txt, .pptx, .xlsx  
Images:    .jpg, .png, .gif, .svg  
Videos:    .mp4, .mkv, .mov  
Archives:  .zip, .tar, .gz  
...and more! (Edit dirx.sh to customize)  
```  

### Q: How do I exclude certain folders?  
**A:** Modify `dirx.sh` and comment out the lines for categories you don't need!  

---

## 🧨 Uninstall  

```bash
cd DirX-Organizer  
sudo bash uninstall.sh  # 🧹 Removes everything, including logs!
```  

---

## 👥 Contributing  

**We welcome PRs!**  
1. Fork the repo 🍴  
2. Create a branch: `git checkout -b feat/amazing-feature`  
3. Commit changes: `git commit -m 'Add amazing feature'`  
4. Push: `git push origin feat/amazing-feature`  
5. Open a PR 🎉  

Check out the [contributing guide](CONTRIBUTING.md) for details!

---

## 📜 License  

MIT License © 2024 [ishouriya](https://github.com/ishouriya)  
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)  
