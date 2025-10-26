# 🔐 Security Audit and Certification – CybSec System

**Author:** Armela Cupi  
**Course:** MSc Cybersecurity – City, University of London  
**Module:** Security Auditing and Certification  
**Date:** 2025  

---

## 🧩 Overview
This project presents a **Common Criteria (CC) Security Target** evaluation for the **CybSec web-based application**, developed as part of the MSc Cybersecurity module on **Security Audit and Certification**.  
It defines the system architecture, identified threats, security objectives, and both **Security Functional Requirements (SFRs)** and **Security Assurance Requirements (SARs)** necessary for **EAL2 certification**.

---

## 🛠 System Evaluated
**Target of Evaluation (TOE):** CybSec Web Application  
- **Frontend:** Web interface for users and administrators  
- **Backend:** MySQL & MongoDB for structured/unstructured data  
- **Security Features:** Authentication, access control, encryption, session management  

---

## ⚠️ Threats Considered
The assessment followed the **STRIDE threat model**, identifying and mitigating:
- Spoofing & Authentication bypass  
- SQL Injection & XSS  
- Information disclosure via misconfiguration  
- DoS and Malware injection  
- Insider threats and privilege escalation  

---

## 🎯 Security Objectives
- **O.AUTH_SEC:** Multi-factor authentication & strong password policies  
- **O.DATA_ENC:** Data encryption in transit and at rest  
- **O.ACCESS_CTRL:** Strict access control and role separation  
- **O.VULN_MGMT:** Continuous vulnerability assessment  
- **O.LOG_AUDIT:** Secure logging and audit trails  
- **O.SESSION_SEC:** Session integrity and hijack prevention  

---

## 📘 Key Deliverables
- **Threat Model & Security Objectives Mapping**  
- **Functional Requirements (FIA, FDP, FMT, FAU, FTP)**  
- **Assurance Requirements (ADV, AGD, ALC, ASE, ATE, AVA)**  
- **Evaluation Assurance Level Target:** EAL2  

---

## 🧠 References
- Common Criteria v3.1, Rev 4  
- NCSC DoS Mitigation Guidelines (2025)  
- MySQL 8.0 Reference Manual  
- Mozilla Web Security Guidelines  
- Microsoft STRIDE Threat Modelling Framework  

---

📎 *This report demonstrates a structured approach to software assurance, showing proficiency in evaluating and documenting secure software systems following Common Criteria standards.*
