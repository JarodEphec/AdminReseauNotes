#Dans le path des scripts : powershell ./updateUsersProperties.ps1 'C:\Scripts_et_csv_TP\csvScripts\updateUsersProperties.csv'

# import du module Active Directory pour pouvoir lancer des commandes AD 
Import-Module ActiveDirectory

#import du CSV
$users = Import-Csv -Path $args[0] -Header "username","department","city","Mobilephone"

write-host $users 
 
# Boucle qui, pour chaque utilisateur défini dans le csv ....
foreach($user in $users){

    # On récupère les différentes données, arrive pas à accéder
    $username = $user.username
    $department = $user.department
    $city = $user.city
    $Mobilephone = $user.Mobilephone

    # On recupère l'utilisateur de AD
    $ADUser= Get-ADUser -Filter {samAccountName -eq $username}

    if($ADUser){
        if ($department) {$ADUser.department=$department}
        if ($city) {$ADUser.city=$city}
        if ($Mobilephone) {$ADUser.Mobilephone=$Mobilephone}
        Write-Host "L'utilisateur $username a été mis à jour."
        Set-ADUser -Instance $ADUser
    }
    else{

        #L'utilisateur n'existe pas
        Write-warning ("L'utilisateur $username n'existe pas.")

    }

}