#Dans le path des scripts : powershell ./disableUsers.ps1 'C:\Scripts_et_csv_TP\csvScripts\disableUsers.csv'

# import du module Active Directory pour pouvoir lancer des commandes AD 
Import-Module ActiveDirectory


$users = Import-Csv -Path $args[0] -Header "username"

foreach($user in $users){

# On récupère les différentes données
$username = $user.username

# .... à compléter si besoin


# On vérifie si il y a un utilisateur existant aevc ce nom. ATTENTION : ne vérifie pas si le compte est déjà désactivé
if(Get-ADUser -Filter {samAccountName -eq $username} -SearchBase "OU=utilisateurs,DC=l1-3,DC=lab"){
    Disable-ADAccount $username


    Write-Host "Compte $username désactivé."
}
# Si l'utilisateur n'existe pas on préviens.
else{
    Write-Host "L'utilisateur $username n'existe pas."

}`

}