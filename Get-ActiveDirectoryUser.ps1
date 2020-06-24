<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    ActiveDirectorySearch
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '545,597'
$Form.text                       = "Active Directory User Search"
$Form.TopMost                    = $false

$userSearchTextBox               = New-Object system.Windows.Forms.RichTextBox
$userSearchTextBox.multiline     = $false
$userSearchTextBox.width         = 238
$userSearchTextBox.height        = 20
$userSearchTextBox.location      = New-Object System.Drawing.Point(13,46)
$userSearchTextBox.Font          = 'Microsoft Sans Serif,10'

$userSearchLabel                 = New-Object system.Windows.Forms.Label
$userSearchLabel.text            = "User to search for (can be last name, or first name):"
$userSearchLabel.AutoSize        = $true
$userSearchLabel.width           = 25
$userSearchLabel.height          = 10
$userSearchLabel.location        = New-Object System.Drawing.Point(13,19)
$userSearchLabel.Font            = 'Microsoft Sans Serif,10'

$userSearchButton                = New-Object system.Windows.Forms.Button
$userSearchButton.text           = "Search"
$userSearchButton.width          = 79
$userSearchButton.height         = 30
$userSearchButton.location       = New-Object System.Drawing.Point(14,79)
$userSearchButton.Font           = 'Microsoft Sans Serif,10'

$employeeIDLabel                 = New-Object system.Windows.Forms.Label
$employeeIDLabel.text            = "Employee ID to search for:"
$employeeIDLabel.AutoSize        = $true
$employeeIDLabel.width           = 25
$employeeIDLabel.height          = 10
$employeeIDLabel.location        = New-Object System.Drawing.Point(13,142)
$employeeIDLabel.Font            = 'Microsoft Sans Serif,10'

$employeeIDSearchTextBox         = New-Object system.Windows.Forms.RichTextBox
$employeeIDSearchTextBox.multiline  = $false
$employeeIDSearchTextBox.width   = 194
$employeeIDSearchTextBox.height  = 20
$employeeIDSearchTextBox.location  = New-Object System.Drawing.Point(14,166)
$employeeIDSearchTextBox.Font    = 'Microsoft Sans Serif,10'

$employeeIDSearchButton          = New-Object system.Windows.Forms.Button
$employeeIDSearchButton.text     = "Search"
$employeeIDSearchButton.width    = 80
$employeeIDSearchButton.height   = 30
$employeeIDSearchButton.location  = New-Object System.Drawing.Point(14,192)
$employeeIDSearchButton.Font     = 'Microsoft Sans Serif,10'

$infoReturnLabel                 = New-Object system.Windows.Forms.Label
$infoReturnLabel.AutoSize        = $true
$infoReturnLabel.width           = 25
$infoReturnLabel.height          = 10
$infoReturnLabel.location        = New-Object System.Drawing.Point(22,262)
$infoReturnLabel.Font            = 'Microsoft Sans Serif,10'

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Results"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(15,274)
$Label1.Font                     = 'Microsoft Sans Serif,10'

$resultsTextBox                  = New-Object system.Windows.Forms.RichTextBox
$resultsTextBox.multiline        = $true
$resultsTextBox.width            = 516
$resultsTextBox.height           = 276
$resultsTextBox.location         = New-Object System.Drawing.Point(12,305)
$resultsTextBox.Font             = 'Microsoft Sans Serif,10'
$resultsTextBox.ScrollBars       = "both"

$Form.controls.AddRange(@($userSearchTextBox,$userSearchLabel,$userSearchButton,$employeeIDLabel,$employeeIDSearchTextBox,$employeeIDSearchButton,$infoReturnLabel,$Label1,$resultsTextBox))




# define event handlers (to do work)
$userSearchButton.Add_Click( { userSearch } )
$employeeIDSearchButton.Add_Click( { employeeIDSearch } )

Import-Module ".\PS_Modules\Microsoft.ActiveDirectory.Management.dll"
Import-Module ".\PS_Modules\Microsoft.ActiveDirectory.Management.resources.dll"

function userSearch {

    try {
        $resultsTextBox.Clear()
        $resultsTextBox.Refresh()
        $searchText = "*" + $userSearchTextBox.Text + "*"
        $userInfo = Get-ADUser -Filter 'Name -like $searchText' -Properties * | Sort-Object -Descending -Property surname

        foreach($user in $userInfo) {
            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("User: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.Name)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Username: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.samAccountName)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Department/Title: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.Department + "/" + $user.Title)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Employee ID: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.EmployeeID)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Email address: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.mail)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Mobile Phone: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.mobile + "/" + $user.mobilePhone)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Office Phone: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.officePhone)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Manager: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.Manager)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Distinguished Name: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.distinguishedName)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Password Expired: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.PasswordExpired)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Last Bad Password Attempt: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.LastBadPasswordAttempt)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Last Logon Date: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.LastLogonDate)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Account Locked Out? ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.LockedOut)
            $resultsTextBox.AppendText("`r`n")
            $resultsTextBox.AppendText("`r`n")
            $resultsTextBox.Refresh()
        }
    }
    catch {
        $resultsTextBox.AppendText($_.Exception.Message)
        $resultsTextBox.AppendText("`r`n")
        $resultsTextBox.Refresh()
        Continue
    }
}

function employeeIDSearch {

    try {
        $resultsTextBox.Clear()
        $resultsTextBox.Refresh()
        $searchText = $employeeIDSearchTextBox.Text
        $userInfo = Get-ADUser -Filter 'employeeID -eq $searchText' -Properties * | Sort-Object -Descending -Property surname

        foreach($user in $userInfo) {
            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("User: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.Name)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Username: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.samAccountName)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Department/Title: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.Department + "/" + $user.Title)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Employee ID: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.EmployeeID)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Email address: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.mail)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Mobile Phone: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.mobile + "/" + $user.mobilePhone)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Office Phone: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.officePhone)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Manager: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.Manager)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Distinguished Name: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.distinguishedName)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Password Expired: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.PasswordExpired)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Last Bad Password Attempt: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.LastBadPasswordAttempt)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Last Logon Date: ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.LastLogonDate)
            $resultsTextBox.AppendText("`r`n")

            $resultsTextBox.SelectionColor = "DarkGreen"
            $resultsTextBox.AppendText("Account Locked Out? ")
            $resultsTextBox.SelectionColor = "Black"
            $resultsTextBox.AppendText($user.LockedOut)
            $resultsTextBox.AppendText("`r`n")
            $resultsTextBox.AppendText("`r`n")
            $resultsTextBox.Refresh()
        }
    }
    catch {
        $resultsTextBox.AppendText($_.Exception.Message)
        $resultsTextBox.AppendText("`r`n")
        $resultsTextBox.Refresh()
        Continue
    }

}


[void]$Form.ShowDialog()