foreach($domain in Get-Content #here your domain file path) {
    try{
        $ip = [System.Net.Dns]::GetHostAddresses($domain);
        echo $dominio": "$ip >> #output path of domains that resolves;
    }
    catch{
        echo $dominio >> #output path of domains that does not resolve;
    }

}