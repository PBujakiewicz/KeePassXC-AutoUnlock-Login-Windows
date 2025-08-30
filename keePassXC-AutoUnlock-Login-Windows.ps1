try {
    # Import the CredentialManager module to access stored credentials
    Import-Module -Name CredentialManager 

    # Retrieve the stored credential for the specified target
    $cred = Get-StoredCredential -Target "KeePassXCPassword" 

    # Check if the credential was retrieved successfully
    if (-not $cred) {
        # Output an error message if the password could not be retrieved
        Write-Output "Error: Unable to retrieve the password!" 
        exit 1 # Exit the script with an error code
    }

    # Convert the secure string password to a regular string
    $pass = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($cred.Password)) 
} catch {
    # Output an error message if there was an issue during the try block
    Write-Output "Error: There was an issue retrieving the password." 
    exit 1 # Exit the script with an error code
}

# Define the path to the KeePassXC executable
$keepassPath = "C:\Program Files\KeePassXC\KeePassXC.exe"

# Define the path to the KeePass database file
$databasePath = "G:\Mój dysk\KeePass\Database.kdbx"

# Convert the database path to UTF-8 encoding to handle special characters
$databasePath = [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes($databasePath))

# Check if the database file exists at the specified path
if (-not (Test-Path $databasePath)) {
    # Output an error message if the database file is not found
    Write-Output "Error: Database file not found at $databasePath" 
    exit 1 # Exit the script with an error code
}

# Pass the password to KeePassXC via standard input and open the specified database
$OutputEncoding = [System.Text.Encoding]::UTF8
$pass | & $keepassPath --pw-stdin "$databasePath" 
