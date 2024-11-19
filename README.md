# Chrome Policy Remover for Windows

**Version**: 1.0  
**Date**: 21 May 2022  
**Author**: Stefan vd, Chrome Product Expert  
[Product Expert Profile](https://productexperts.withgoogle.com)

This batch script is designed to remove Google Chrome policies that may be managed by Group Policy in Windows. These policies are often used by organizations to enforce specific Chrome settings, and removing them can help reset Chrome to its default state on systems where such policies are no longer required or were accidentally applied.

---

## Features

- Closes all running instances of Google Chrome
- Deletes Group Policy folders that may enforce Chrome policies
- Removes specific Google policy folders from the system
- Deletes Chrome-related policies from the Windows registry
- Forces a Group Policy update to apply changes immediately

---

## Usage

To run this script, follow these steps:

1. **Download or Copy** the script content to a `.bat` file (e.g., `ChromePolicyRemover.bat`).
2. **Run as Administrator**: Right-click on the file and select **"Run as Administrator"** to ensure it has sufficient privileges to delete policies and registry entries.

> **Note**: Running this script without administrator privileges will result in errors as it attempts to access protected system files and registry entries.

---

## Important Notes

- **Administrator Privileges Required**: This script requires administrator privileges to modify system folders and registry entries.
- **Use Caution**: Removing these folders and registry keys can impact other policies or Chrome’s behavior. Be certain that these policies are safe to remove and that this action aligns with system requirements.
- **Backup**: Before running scripts that modify Group Policy or the registry, it is highly recommended to back up the registry and any critical data in case something goes wrong.

---

## Script Breakdown

The script performs the following steps:

1. **Close Chrome**  
   Closes any running Chrome instances to prevent conflicts during policy removal.
   
2. **Delete Group Policy Folders**  
   Deletes Group Policy directories (`GroupPolicy` and `GroupPolicyUsers`) if they exist. These folders may contain policies affecting Chrome.

3. **Delete Google Policy Directories**  
   Removes specific Google policy directories under `Program Files (x86)` and `Program Files`.

4. **Force Group Policy Update**  
   Executes a `gpupdate /force` to refresh group policies on the system.

5. **Delete Registry Entries**  
   Removes Chrome-related policies from the registry under both `HKEY_LOCAL_MACHINE` and `HKEY_CURRENT_USER`.

6. **Error Handling**  
   Displays an error message if any command fails, prompting the user to ensure the script is run as an administrator.

---

## License

This script is provided "as-is" without any warranty. Use it at your own risk and be aware of the implications of modifying system-level settings.

---

## Disclaimer

This script is intended for use in environments where Chrome policies are no longer needed or were incorrectly applied. Deleting these policies may affect other Chrome settings. Ensure compliance with your organization’s IT policies and consider consulting IT support if necessary.
