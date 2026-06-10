#  Automated Bulk Transaction Processing Utility

An enterprise-grade Bash automation utility designed to process transactional sales validation advices in bulk. Instead of clicking and processing items manually inside the management portal, this utility takes a plain text list of target transaction IDs and automatically orchestrates sequential secure network requests via `curl`.

---

##  Prerequisites & Environment Setup

Before running the script, ensure you have the correct tool open, depending on the computer operating system you are using:

* **Windows:** Do NOT use the default Command Prompt (cmd) or PowerShell. Instead, use **Git Bash** (Right-click inside your project folder and select **"Git Bash Here"**).
* **Mac / Linux:** Open your default built-in **Terminal** app.

### Project Directory Structure
Make sure that your working directory contains all these configuration files layout so the orchestrator loop can execute properly:
```text
├── bulk_send_sale.sh     # The main batch manager loop script
├── send_sale.sh          # The child core worker script that sends the network advice
├── gcash_batch1.txt      # Production text file containing GCash transaction IDs
├── batch1.txt            # Production text file containing standard transaction IDs
└── test.txt              # Standard text file used for script logic testing

```

---

##  Step-by-Step Execution Guide

Follow these sequential commands inside your **Git Bash** or **Terminal** window to safely start processing records:

### Step 1: Assign Executable Rights to the Scripts

By default, newly downloaded or transferred shell scripts require processing permissions. Run this command inside your workspace folder and press **Enter**:

```bash
chmod +x send_sale.sh bulk_send_sale.sh

```

*(Note: No confirmation message means the permissions were assigned successfully).*

### Step 2: Grab your Active Session Token (`JSESSIONID`)

To authenticate the automated script without passing username credentials, extract your browser's active security token:

1. Open your browser, navigate to the transaction web portal, and log in.
2. Press **F12** on your keyboard (or Right-Click anywhere and select **Inspect**) to open the developer console tools.
3. Head to the **Application** tab (Chrome/Edge) or **Storage** tab (Firefox).
4. Expand the **Cookies** drop-down menu in the left sidebar and select the portal's URL.
5. Find the entry row labeled **`JSESSIONID`** and copy its long alphanumeric token string (e.g., `m1db2jopgcye16auikn7ji1iu`).

### Step 3: Run the Bulk Processor Execution Command

Execute the orchestrator loop by passing your active session key as the first argument, and your chosen input txt file path as the second argument:

```bash
./bulk_send_sale.sh <YOUR_JSESSIONID_HERE> <CHOSEN_TXT_FILE>

```

* **Example 1: Running GCash Records**
```bash
./bulk_send_sale.sh m1db2jopgcye16auikn7ji1iu gcash_batch1.txt

```


* **Example 2: Running Standard Batch 1 Records**
```bash
./bulk_send_sale.sh m1db2jopgcye16auikn7ji1iu batch1.txt

```


* **Example 3: Testing the Pipeline Script Integration**
```bash
./bulk_send_sale.sh m1db2jopgcye16auikn7ji1iu test.txt

```



### Step 4: Monitor Logs and Confirm Processing

1. Your terminal screen will immediately print automated timestamps confirming the ID entry currently being pushed to the platform server.
2. The runtime loop automatically uses `sed` internally to sanitize text formatting issues (like carriage returns `\r`) from your windows environment lists.
3. A distinct operational record file named `send_sale_<ID>.log` will generate in your folder for every document handled, letting you review technical response outputs at any time.

---

##  Script Architecture Overview

* **`send_sale.sh`:** Houses individual network connection parameters. It takes a transactional ID, defines specialized browser mock headers (User-Agent, Origin, Referer), and injects raw form data (`_action_sendSaleAdvicePAID=Send+Sale+Advice`) straight into the API cluster endpoint.
* **`bulk_send_sale.sh`:** Manages validation workflows. It includes failure safeguards that stop execution if variables are empty, reads text batches line-by-line using an active input redirector loop, and automatically relays the dataset tokens over to the child transaction runner.

```

