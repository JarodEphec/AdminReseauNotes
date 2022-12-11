#Dans le path des scripts : powershell ./unblockUser.ps1 aDoneux

# import du module Active Directory pour pouvoir lancer des commandes AD 
Import-Module ActiveDirectory

# On utilise pas de csv. On indique directement comme paramètre le compte qu'on veut débloquer.
$username = $args[0] 

# On vérifie si il y a un utilisateur existant aevc ce nom. ATTENTION : ne vérifie pas si le compte est bloqué
if(Get-ADUser -Filter {samAccountName -eq $username} -SearchBase "OU=utilisateurs,DC=l1-3,DC=lab"){
    Unlock-ADAccount $username


    Write-Host "Compte $username débloqué."
}
# Si l'utilisateur n'existe pas on préviens.
else{
    Write-Host "L'utilisateur $username n'existe pas."

}