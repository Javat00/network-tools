$profiles = ((netsh.exe wlan show profiles) -match '\s{2,}:\s') -replace '.*:\s' , '' 
$enc = [Console]::OutputEncoding = [Text.Encoding]::Utf8

Foreach ($profile in $profiles){
    netsh wlan show profile "$profile" key=clear | Select-String "Nombre de SSID", "Contenido de la clave"
    "`n" 
}
