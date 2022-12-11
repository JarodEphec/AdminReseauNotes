#Dans le path des scripts : powershell ./addUsers.ps1 'C:\Scripts_et_csv_TP\csvScripts\addUsers.csv'

# import du module Active Directory pour pouvoir lancer des commandes AD 
Import-Module ActiveDirectory


$users = Import-Csv -Path $args[0] -Header "username","firstname","lastname","password"

write-host $users 
 
# Boucle qui, pour chque utilisateur défini dans le csv ....
foreach($user in $users){

# On récupère les différentes données, arrive pas à accéder
$username = $user.username
$firstname = $user.firstname
$lastname = $user.lastname
$password = $user.password

# .... à compléter si besoin




# On vérifie si il n'y a pas déjà un utilisateur existant aevc ce nom
if(Get-ADUser -Filter {samAccountName -eq $username}){
    Write-Host "Il existe déjà unutilisateur $username"
}
else{

#Attention, -Name doit être en première position

New-ADUser `
    -Name "$lastname $firstname" `    -SamAccountName $username `    -GivenName $firstname `    -SurName $lastname `    -Enabled $true `    -DisplayName "$lastname $firstname" `    -Path "OU=utilisateurs, DC=l1-3, DC=lab" `    -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) `    -PasswordNeverExpires $true `    -ChangePasswordAtLogon $false    
Write-Host "L'utilisateur $username a été créé."

}
# à rajouter ?
#-UserPrincipalName "$username@<domain>" `

}