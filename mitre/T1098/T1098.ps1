try {
    $x = Get-Random -Minimum 2 -Maximum 9999
    $y = Get-Random -Minimum 2 -Maximum 9999
    $z = Get-Random -Minimum 2 -Maximum 9999

    $fmm = Get-LocalGroupMember -Group Administrators |?{ $_.ObjectClass -match "User" -and $_.PrincipalSource -match "Local"} | Select Name

    foreach($member in $fmm) {
        if($member -like "*Administrator*") {
            $account = $member.Name.Split("\\")[1]
            $originalDescription = (Get-LocalUser -Name $account).Description
            Set-LocalUser -Name $account -Description "atr:$account;$originalDescription".Substring(0,48) # Keep original name in description
            Rename-LocalUser -Name $account -NewName "HaHa_$x$y$z" # Required due to length limitation
            Write-Host "Successfully Renamed $account Account on " $Env:COMPUTERNAME
        }
    }
}
catch {
    Write-Host "Fail"
}