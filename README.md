# Active_Directory_Search_Tool
Basic search tool for "non-IT" users to find information like a support desk or HR.

Searches Active Directory for users based on name or employee ID. Searching by name does a wildcard search like so *<text>* within the "Name" attribute in Active Directory. Uses current user's context of whoever launches it, and connects to their current "logon server" or current domain controller.

Make sure to copy the PS_Modules folder to the same directory where you have this script setup if you do not have the RSAT Active Directory tools installed. This script will import the included modules in that folder.

Currently only works with PowerShell v6 on Server 2016 and Windows 10.

Does not support PowerShell v7, as the forms structure needs to be updated to work with new .NET classes.

Example of script run:

![Script Demo](script.png?raw=true "Script Demo")