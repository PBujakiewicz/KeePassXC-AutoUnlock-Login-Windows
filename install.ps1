# Get the path of the current script
$currentScriptPath = (Get-Location).Path # Retrieves the current working directory where the script is located

# Define the script name to add to startup
$scriptName = "keePassXC-AutoUnlock-Login-Windows.ps1" # Sets the name of the script to be launched

# Create the full path to the script by combining the current path and the script name
$fullScriptPath = Join-Path -Path $currentScriptPath -ChildPath $scriptName # Combines the current path with the script name

# Define the Startup folder path for the current user
$startupFolder = [System.IO.Path]::Combine($env:APPDATA, "Microsoft\Windows\Start Menu\Programs\Startup") # Constructs the path to the Startup folder

# Define the target path for the shortcut
$shortcutPath = [System.IO.Path]::Combine($startupFolder, "KeePassXC-AutoUnlock-Login.lnk") # Creates the path for the shortcut file

# Create the shortcut
$WScriptShell = New-Object -ComObject WScript.Shell # Creates a new instance of the WScript Shell object
$shortcut = $WScriptShell.CreateShortcut($shortcutPath) # Creates a new shortcut at the specified path

# Set the shortcut properties
$shortcut.TargetPath = "powershell" # Sets the target application for the shortcut to PowerShell
$shortcut.Arguments = "-ExecutionPolicy Bypass -File `"$fullScriptPath`"" # Sets the command line arguments to run the script with bypassed execution policy
$shortcut.WorkingDirectory = $currentScriptPath # Sets the working directory for the shortcut to the current script's directory
$shortcut.WindowStyle = 1 # Sets the window style to normal (1)
$shortcut.IconLocation = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" # Sets the icon for the shortcut to the PowerShell icon
$shortcut.Save() # Saves the shortcut

# Output a message indicating the shortcut was created successfully
Write-Output "Shortcut to keePassXC-AutoUnlock-Login-Windows.ps1 has been added to startup." # Displays a confirmation message
