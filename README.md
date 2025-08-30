# KeePassXC Auto Unlock on Windows Login

## Introduction

This script is designed to automatically unlock your KeePassXC database upon Windows login using the password stored in the Windows Credential Manager. By utilizing the stored credentials, you can streamline the login process and improve your workflow without compromising security.

## How to Add a Password to Credential Manager as "KeePassXCPassword"

To securely store your KeePassXC database password in Windows Credential Manager, follow these steps:

### Step 1: Open Credential Manager

1. **Open the Start Menu:**
   - Click on the Windows icon in the taskbar or press the Windows key on your keyboard.

2. **Search for Credential Manager:**
   - Type "Credential Manager" in the search bar.

3. **Launch Credential Manager:**
   - Click on "Credential Manager" from the search results to open it.

### Step 2: Add a New Windows Credential

1. **Navigate to Windows Credentials:**
   - In the Credential Manager window, click on "Windows Credentials."

2. **Add a New Credential:**
   - Click on the "Add a generic credential" link.

### Step 3: Fill in the Credential Details

1. **Internet or Network Address:**
   - In the "Internet or network address" field, enter `KeePassXCPassword`.

2. **User Name:**
   - Leave the "User name" field empty or fill it in with a descriptive name (this field can also be left blank).

3. **Password:**
   - In the "Password" field, enter the password you want to store for your KeePassXC database.

4. **Save the Credential:**
   - Click the "OK" button to save the credential.

### Step 4: Verify the Credential

1. **Check the List of Credentials:**
   - You should now see `KeePassXCPassword` listed among your Windows credentials.

2. **Confirm the Details:**
   - You can click on the entry to view or edit the details if needed.

### Notes

- Ensure that the password entered is accurate, as this will be used by the script to unlock your KeePassXC database.
- Storing your password in Windows Credential Manager helps enhance security by keeping your credentials safe and accessible only by authorized applications.

## Prerequisites

To use this script, you need to install the `CredentialManager` PowerShell module, which allows interaction with the Windows Credential Manager. Follow these steps to install the module:

1. Open PowerShell as an administrator:
   - Right-click on the PowerShell icon and select "Run as administrator".

2. Install the `CredentialManager` module by executing the following command:

   ```powershell
   Install-Module -Name CredentialManager -Scope CurrentUser
   ```

3. When prompted, confirm the installation by selecting "Yes".

## Installation

### Variables to Update Before Running the Install Script

Before executing the `install.ps1` script, you need to ensure that the following variables are correctly set in the script:

1. **$keepassPath**
   - This variable should contain the path to the KeePassXC executable. Ensure that the path is correct according to your system setup. The default is set as:
     ```powershell
     $keepassPath = "C:\Program Files\KeePassXC\KeePassXC.exe"
     ```

2. **$databasePath**
   - Update this variable with the path to your KeePass database file. The default path is set to:
     ```powershell
     $databasePath = "G:\Mój dysk\KeePass\Database.kdbx"
     ```
   - Make sure to adjust this path if your database is located elsewhere.

### Running the Install Script

To ensure that the install script runs without being blocked by PowerShell's execution policies, you can execute the following command:

```powershell
powershell -ExecutionPolicy Bypass -File ".\install.ps1"
```

### Manual Execution (When Auto-Start Fails) / Troubleshooting

In cases where the automatic startup of the KeePassXC auto-unlock script fails, you can manually trigger it using the `Run-KeePassXC-AutoUnlock.bat` file. This batch file is designed to execute the PowerShell script `keePassXC-AutoUnlock-Login-Windows.ps1` with the necessary execution policy bypass.

To use it:

1. Navigate to the directory where you have cloned this repository.
2. Double-click `Run-KeePassXC-AutoUnlock.bat`.
