
function select-recurringChar{
<#
.DESCRIPTION
    Create a powershell function or cmdlet that takes an arbitrarily long string parameter $foo (e.g. 'abcdedcba')
    and returns the first recurring character in that Input string.  In 'abcdedcba', 'd' would be the first
    recurring character, so the cmdlet/function should return 'd' for that sample input.
.NOTES
    Treats all characters equally, i.e. spaces will be considered.
  #>
    [CmdletBinding()]
    param ([Parameter(Mandatory=$true)][string]$inputString)
    [char[]]$foundList=@()
    foreach($x in [char[]]$inputString){
        foreach($y in $foundList){
            if($x -eq $y){
                return $y
            }
        }
        $foundList += $x
    }
    return 0
}

# Test function

Write-Host ""
Write-Host "Search for first recurring character, return for example string" -ForegroundColor Cyan
[string]$sampleString = Read-Host -Prompt "Enter a string"
if(-not $sampleString){$sampleString="abcdedcba"}

Write-Host "Searching for first recurring character in `"$sampleString`"" -ForegroundColor Cyan
if([char]$result = select-recurringChar $sampleString){
    Write-Host "First recurring character is `"$result`" in `"$sampleString`"" -ForegroundColor Green
} else {
    Write-Host "No recurring characters found in `"$sampleString`"" -ForegroundColor Yellow
}
