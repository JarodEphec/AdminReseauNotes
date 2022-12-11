#Dans le path des scripts : powershell ./unblockUser.ps1 aDoneux

# import du module Active Directory pour pouvoir lancer des commandes AD 
Import-Module ActiveDirectory

# On utilise pas de csv. On indique directement comme param�tre le compte qu'on veut d�bloquer.
$username = $args[0] 

# On v�rifie si il y a un utilisateur existant aevc ce nom. ATTENTION : ne v�rifie pas si le compte est bloqu�
if(Get-ADUser -Filter {samAccountName -eq $username} -SearchBase "OU=utilisateurs,DC=l1-3,DC=lab"){
    Unlock-ADAccount $username


    Write-Host "Compte $username d�bloqu�."
}
# Si l'utilisateur n'existe pas on pr�viens.
else{
    Write-Host "L'utilisateur $username n'existe pas."

}