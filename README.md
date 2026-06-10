#  Automated Bulk Transaction Processing Utility

A high-efficiency Bash automation utility designed to process transactional sales validation advices in batches. By leveraging multi-layered script execution and `curl` networking, this script automates sequential HTTP requests to process multiple system IDs simultaneously, eliminating repetitive manual lookups and administrative inputs.

---

##  Script Architecture & Workflow

The utility consists of two core functional components designed to handle processing sequentially:

1. **`send_sale.sh` (Worker Script):** Handles individual network actions. It consumes a session token (`JSESSIONID`) and a target identifier (`ID`), crafts an HTTP POST payload with browser headers, and executes the request using `curl`, logging the complete raw output block for debugging.
2. **`bulk_send_sale.sh` (Orchestrator Script):** Handles batch management. It loops through an input plain text file line-by-line, runs an in-place cleaning operation (`sed`) to strip carriage return artifacts, and calls the worker script sequentially for every active transaction ID found.

---

##  Step-by-Step Execution Guide

Follow these instructions to safely configure and execute the batch automation utility on your local system or testing environment.

### Step 1: Environment Requirements
Ensure your operating system contains a Bash compatibility environment:
* **Linux/macOS:** Ready out-of-the-box via terminal applications.
* **Windows:** Use **Git Bash**, **WSL (Windows Subsystem for Linux)**, or an equivalent terminal environment.

### Step 2: Set Script Execution Permissions
Before running the utility, you must explicitly grant execution rights to both shell scripts. Run the following command inside your terminal folder:
```bash
chmod +x send_sale.sh bulk_send_sale.sh
