# OSCP Notes and Scripts

Welcome to my OSCP (Offensive Security Certified Professional) notes and scripts repository. This repository is designed to document my journey through the OSCP course, providing a collection of notes, scripts, and resources that I find useful along the way.

## Table of Contents

- [Introduction](#introduction)
- [Directory Structure](#directory-structure)
- [Setup and Usage](#setup-and-usage)
- [Scripts](#scripts)
- [Notes](#notes)
- [Resources](#resources)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This repository serves as a personal knowledge base and toolkit as I work towards achieving the OSCP certification. It includes detailed notes on various topics, custom scripts to aid in penetration testing, and references to useful resources.

## Directory Structure

├── README.md
├── scripts
│ ├── enum
│ ├── exploits
│ ├── privesc
│ └── misc
├── notes
│ ├── web
│ ├── network
│ ├── buffer_overflow
│ ├── linux
│ └── windows
└── resources
├── books
├── cheat_sheets
└── tools


### Folders

- `scripts`: Contains custom scripts categorized by their purpose, such as enumeration, exploitation, privilege escalation, and miscellaneous tools.
- `notes`: Detailed notes on various topics covered in the OSCP course, organized by category.
- `resources`: References to books, cheat sheets, and tools that are useful for OSCP preparation.

## Setup and Usage

1. **Clone the Repository**

    ```bash
    git clone https://github.com/yourusername/oscp-notes-and-scripts.git
    cd oscp-notes-and-scripts
    ```

2. **Navigate to Relevant Directory**

    ```bash
    cd scripts/enum
    # or
    cd notes/web
    ```

3. **Run Scripts**

    Ensure you have the necessary permissions and dependencies installed to run the scripts. For example:

    ```bash
    chmod +x enum.sh
    ./enum.sh
    ```

## Scripts

### Enumeration

Scripts to automate the enumeration process.

- **enum.sh**: A script to perform various network and system enumeration tasks.
- **web_enum.sh**: A script specifically for web application enumeration.

### Exploits

Scripts to automate exploitation techniques.

- **exploit_skeleton.py**: A template for creating new exploits.
- **buffer_overflow.py**: A script for exploiting buffer overflow vulnerabilities.

### Privilege Escalation

Scripts to assist in privilege escalation.

- **linux_privesc.sh**: A script for automating privilege escalation checks on Linux systems.
- **windows_privesc.bat**: A batch script for privilege escalation checks on Windows systems.

### Miscellaneous

Various other useful scripts.

- **port_knocker.py**: A script for port knocking.
- **reverse_shell_generator.py**: A script to generate reverse shell payloads.

## Notes

### Web Application Security

- **SQL Injection**
- **Cross-Site Scripting (XSS)**
- **File Inclusion Vulnerabilities**
- **Command Injection**

### Network Security

- **Network Scanning**
- **Service Enumeration**
- **Firewall and IDS/IPS Evasion**

### Buffer Overflow

- **Introduction to Buffer Overflows**
- **Writing Exploits**
- **Protection Mechanisms**

### Linux

- **Linux Enumeration**
- **Privilege Escalation Techniques**
- **Common Vulnerabilities**

### Windows

- **Windows Enumeration**
- **Privilege Escalation Techniques**
- **Common Vulnerabilities**

## Resources

### Books

- **The Web Application Hacker's Handbook**
- **Metasploit: The Penetration Tester's Guide**
- **Hacking: The Art of Exploitation**

### Cheat Sheets

- **Nmap Cheat Sheet**
- **Burp Suite Cheat Sheet**
- **Linux Privilege Escalation**

### Tools

- **nmap**
- **gobuster**
- **john the ripper**

## Contributing

Feel free to contribute to this repository by submitting pull requests or opening issues. Contributions can include new scripts, improvements to existing scripts, detailed notes, or useful resources.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
