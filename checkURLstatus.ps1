$domains = Get-Content #here your domain file path
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
foreach($domain in $domains) {
    Try{
        Invoke-WebRequest -Method Head -Uri $domain -UseBasicParsing
        echo $dominio >> #output path of 200ok domains
        }
    Catch{
        echo "$dominio : $_" >> #output path of not 200ok domains
        }
}