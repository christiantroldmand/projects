#### by Christian Klint, a script to find danish social security numbers on Windows based systems. Likely usecase would be network shares. Please only use this for legal and authorized purposes! ####

clear-host
#This pattern searches for danish social security numbers without "-" symbol
$pattern1 = '[0-3][0-9][0-1][1-9]\d{2}-\d{4}?[^0-9]*'
#This pattern searches for danish social security numbers WITH "-" symbol
$pattern2 = '[0-3][0-9][0-1][1-9]\d{2}[-\s]\d{4}?[^0-9]*|[0-3][0-9][0-1][1-9]\d{2}\d{4}'
#This pattern is for credit card numbers from Visa, Discover, and MasterCard    
$pattern3 = '[456][0-9]{3}[-| ][0-9]{4}[-| ][0-9]{4}[-| ][0-9]{4}'
#These variables is for searching credit card numbers from American Express & other US based info
$pattern4= '3[47][0-9]{13}","3[47][0-9]{2}[-| ][0-9]{6}[-| ][0-9]{5}'
$pattern5 = 'Privacy Act'
$pattern6 = 'ssn'
$pattern7 = 'social security number'
$pattern8 = 'credit card'
#This variable searches for mention of CPR
$pattern9 = 'cpr'
#Makes sure the scripts runs regardless of errors
$erroractionpref = "SilentlyContinue"
#Capture timestamps
$mytimestamp = get-date -format "MMM_dd_yyyy-HH_mm_ss"
#If you want excel reporting, you can use the below example
#$pii_report = "$env:USERPROFILE\desktop\report - $mytimestamp.csv"

#We are starting the search!
write-host "Searching for all files with possible sensitive data"-ForegroundColor Red

#Looking in a directory, perhaps a directory variable should be included in the future -- outfile is also not the best output parameter, perhaps excel report would be better
Get-ChildItem D:\docc -Recurse | Select-String -Pattern $pattern1, $pattern2, $pattern3, $pattern4, $pattern5, $pattern6, $pattern7, $pattern8, $pattern9 | Format-List #| Out-File D:/info.txt

#Finished! 
Write-Host "The search is now complete." -ForegroundColor Green
