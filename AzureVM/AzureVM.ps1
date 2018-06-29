﻿ # Загрузка и Установа модулей AzureRm для PowerShell
Install-Module -Name AzureRM

# Импорт модулей AzureRm для PowerShell
Import-Module -Name AzureRm
						
#Добавляем Аккаунт Azure
Add-AzureRmAccount

# Создаем группу ресурсов с именем Azure533 в расположении westus2
New-AzureRmResourceGroup -Name "Azure533" -Location 'westus2'

#Создаем виртуальную машину в группе ресурсов Azure533 с Именем AzureVM533 в расположении westus2,
#группа безопасности sgAzure533 с портом 3389, имя виртуальной сети westus2, подсети subnetAzure533
#статический белый Адрес AzureIp533. Операционная система устанавливаемая по умалчиванию Windows Server 2016 Datacenter

New-AzureRmVM -ResourceGroupName "Azure533" -Name "AzureVM533" -Location 'westus2' -VirtualNetworkName "Azure533" -SubnetName "subnetAzure533" -SecurityGroupName "sgAzure533" -PublicIpAddressName "AzureIp533" -OpenPorts 3389

#Просмотр ip Адреса AzureVM533
 Get-AzureRmPublicIpAddress -Name "AzureIp533" -ResourceGroupName Azure533

#Записываем ip Адрес с переменную  $AzureIp533
$AzureIp533 =  Get-AzureRmPublicIpAddress -Name "AzureIp533" -ResourceGroupName Azure533

#Подключаемся к AzureVM533
mstsc /v $AzureIp533

#Запуск Виртуальной Машины
Start-AzureRmVM -Name AzureVM533 -ResourceGroupName Azure533

#Выключение Виртуальной Машины
Stop-AzureRmVM -Name AzureVM533 -ResourceGroupName Azure533

#Удаление Виртуальной Машины
Remove-AzureRmVM -Name AzureVM533 -ResourceGroupName Azure533

#Удаляем при необходимости развертование в группу ресурсов Azure533 (Совместно с группой ресурсов Azure533)
Remove-AzureRmResourceGroup -Name "Azure533"