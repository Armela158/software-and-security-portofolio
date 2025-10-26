# 🧾 Digital Forensics Coursework – Evidence Acquisition & Analysis
**Module:** INM445 Digital Forensics – MSc Cybersecurity, City, University of London  
**Author:** Armela Cupi  
**Date:** April 2025  

---

## 🕵️ Overview
This module focused on end-to-end **digital forensic investigation** — from disk imaging and evidence recovery to network forensics and legislative analysis.  
Each report demonstrates applied forensic soundness, tool justification, and professional reporting structure.

---

## 📂 Coursework Contents
| File | Description |
|------|--------------|
| **INM445 Digital Forensics Coursework 1.pdf** | Incident Response & Legislation — includes risk scenarios in academic contexts, forensic readiness planning, and Computer Misuse Act (1990) legal analysis. |
| **INM445 Digital Forensics Coursework 2.pdf** | Full forensic investigation — disk imaging, hash validation, evidence recovery (24+ items), obfuscation detection, and network forensics (Wireshark analysis). |

---

## ⚙️ Tools & Techniques Used
- **Tsurugi Linux** – forensic OS ensuring read-only evidence handling  
- **dd, gzip, sha256sum, md5sum** – bit-level imaging and integrity verification  
- **Autopsy / Sleuth Kit** – full disk and partition analysis  
- **Wireshark** – network capture review and packet filtering (`tcp.flags.syn`, `icmp`, etc.)  
- **Forensic logging** – chain of custody documentation and timestamp verification  

---

## 🔍 Highlights
- Created forensically sound disk image (`cwk25.dd`) using `dd` and hash validation  
- Identified and categorized **24 distinct artifacts** (emails, EXIF data, shellbags, obfuscated files)  
- Detected **malicious activity** in `.pcap` via TCP SYN scans, phpMyAdmin probes, and ICMP sweeps  
- Demonstrated **chain-of-custody, policy compliance, and anti-forensics detection**  

---

## 📚 References
- NIST SP 800-86 – *Guide to Integrating Forensic Techniques into Incident Response*  
- SleuthKit / Autopsy User Documentation  
- Wireshark Official Manual  
- UK Computer Misuse Act (1990)

---

**Author:** Armela Cupi  
📎 [LinkedIn](https://linkedin.com/in/armela-cupi) | [GitHub](https://github.com/Armela158)
