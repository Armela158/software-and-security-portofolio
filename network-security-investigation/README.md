# 🧠 CybSec Network Investigation Coursework
**Module:** INM441 Network Security – MSc Cybersecurity, City, University of London  
**Author:** Armela Cupi  
**Date:** March 2025  

---

## 🔍 Overview
This project simulates a **full-scale network security investigation**, analyzing malicious activity, exploiting vulnerabilities, and securing compromised IoT devices in a controlled cyber lab.  
It integrates **packet analysis**, **web application exploitation**, and **ransomware recovery** within a realistic penetration testing scenario.

---

## 🧰 Tools & Technologies
- **Kali Linux** – penetration testing environment  
- **Wireshark** – packet capture and analysis (`tcp.port == 22`, `ftp.request.command == "PASS"`, etc.)  
- **DVWA (Damn Vulnerable Web App)** – SQL Injection & XSS exploitation  
- **Burp Suite** – web interception and payload injection  
- **sqlmap** – SQL exploitation automation  
- **John the Ripper** – password cracking  
- **gcc** – AES256 decryption program compilation  
- **Linux terminal** – for ransomware cleanup and log inspection  

---

## 🧪 Investigation Workflow

### 1. **Network Traffic Analysis**
- Analyzed **snortattack1.log** and **snortftp.log** using Wireshark.
- Identified SSH brute-force patterns and FTP credential leaks.  
- Extracted plaintext passwords (`1234567890`) from unencrypted FTP traffic.

### 2. **Web Application Exploitation (DVWA)**
- Performed **SQL Injection** at low, medium, and high security levels.  
- Extracted usernames and **cracked hashed passwords** using John the Ripper.  
- Executed **Reflected**, **DOM-based**, and **Stored XSS** payloads to demonstrate injection vectors.

### 3. **IoT Device Ransomware Analysis**
- Accessed compromised IoT end-user system.  
- Located and neutralized ransomware startup scripts (`mystart.sh`).  
- Decrypted AES256-encrypted data to reveal infected device identity (**Smart Fridge**).  
- Confirmed full system restoration without data loss.

---

## 📈 Key Findings
- Weak credentials and plaintext protocols lead to major exposure.  
- Proper input sanitization is critical to mitigate SQL and XSS vulnerabilities.  
- IoT devices require **startup-level security and ransomware protection**.  
- Demonstrated end-to-end investigation: *Detect → Exploit → Contain → Recover.*

---

## 📄 File Contents
| File | Description |
|------|--------------|
| `CybSec Network Investigation Coursework.pdf` | Full coursework report with screenshots, technical explanation, and results. |

---

**Author:** Armela Cupi  
📎 [LinkedIn](https://linkedin.com/in/armela-cupi) | [GitHub](https://github.com/Armela158)
