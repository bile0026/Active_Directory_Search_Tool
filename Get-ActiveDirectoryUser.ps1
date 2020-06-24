<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    ActiveDirectorySearch
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Active Directory User Search"
$Form.TopMost                    = $false

$userSearchTextBox               = New-Object system.Windows.Forms.TextBox
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
$userSearchButton.width          = 60
$userSearchButton.height         = 30
$userSearchButton.location       = New-Object System.Drawing.Point(15,73)
$userSearchButton.Font           = 'Microsoft Sans Serif,10'

$employeeIDLabel                 = New-Object system.Windows.Forms.Label
$employeeIDLabel.text            = "Employee ID to search for:"
$employeeIDLabel.AutoSize        = $true
$employeeIDLabel.width           = 25
$employeeIDLabel.height          = 10
$employeeIDLabel.location        = New-Object System.Drawing.Point(13,142)
$employeeIDLabel.Font            = 'Microsoft Sans Serif,10'

$employeeIDSearchTextBox         = New-Object system.Windows.Forms.TextBox
$employeeIDSearchTextBox.multiline  = $false
$employeeIDSearchTextBox.width   = 194
$employeeIDSearchTextBox.height  = 20
$employeeIDSearchTextBox.location  = New-Object System.Drawing.Point(14,166)
$employeeIDSearchTextBox.Font    = 'Microsoft Sans Serif,10'

$employeeIDSearchButton          = New-Object system.Windows.Forms.Button
$employeeIDSearchButton.text     = "Search"
$employeeIDSearchButton.width    = 60
$employeeIDSearchButton.height   = 30
$employeeIDSearchButton.location  = New-Object System.Drawing.Point(14,191)
$employeeIDSearchButton.Font     = 'Microsoft Sans Serif,10'

$infoReturnLabel                 = New-Object system.Windows.Forms.Label
$infoReturnLabel.AutoSize        = $true
$infoReturnLabel.width           = 25
$infoReturnLabel.height          = 10
$infoReturnLabel.location        = New-Object System.Drawing.Point(22,262)
$infoReturnLabel.Font            = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($userSearchTextBox,$userSearchLabel,$userSearchButton,$employeeIDLabel,$employeeIDSearchTextBox,$employeeIDSearchButton,$infoReturnLabel))


