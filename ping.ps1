Clear-Host 

$red = Read-Host("Ingrese Red(192.168.1.0)")
$sred = $red.Split(".")
$fred = $sred[0]+"."+$sred[1]+"."+$sred[2]+".";

do {
    $inter = read-host("Ingrese intervalo de red(a-b)")
    $a = [int]$inter.Split("-")[0]; 
    $b = [int]$inter.Split("-")[1]; 
} while ( ($a -lt 1 -or $a -gt 255) -or ($b -lt 1 -or $b -gt 255) )

#
$nom = @()
for ($i = $a; $i -le $b; $i++) 
{   
    $con = 1
    $pc = $fred + [string]$i
    Test-Connection -Count 2 -targetname $pc -ipv4 | foreach { 
        if ( $con -eq 2 -and $_.status -eq "Success") 
        {
            $nom += $pc;
        };
        write-host "`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`bConectando a $pc   " -NoNewline; 
        $con++;
    }
}

write-host "`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`b`bCONECTADOS A:                 `n-------------" 
foreach ($item in $nom) 
{
    Write-Host $item; 
}
