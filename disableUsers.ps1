#Dans le path des scripts : powershell ./disableUsers.ps1 'C:\Scripts_et_csv_TP\csvScripts\disableUsers.csv'

# import du module Active Directory pour pouvoir lancer des commandes AD 
Import-Module ActiveDirectory


$users = Import-Csv -Path $args[0] -Header "username"

foreach($user in $users){

# On r�cup�re les diff�rentes donn�es
$username = $user.username

# .... � compl�ter si besoin


# On v�rifie si il y a un utilisateur existant aevc ce nom. ATTENTION : ne v�rifie pas si le compte est d�j� d�sactiv�
if(Get-ADUser -Filter {samAccountName -eq $username} -SearchBase "OU=utilisateurs,DC=l1-3,DC=lab"){
    Disable-ADAccount $username


    Write-Host "Compte $username d�sactiv�."
}
# Si l'utilisateur n'existe pas on pr�viens.
else{
    Write-Host "L'utilisateur $username n'existe pas."

}`

}