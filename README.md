## prerequesite 
1- packer plugin manager


git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"


## tips

found out that when getting the permission denied for the treesitter you can run the following command to make it work in the powershell

Remove-Item -Recurse -Force "$env:LOCALAPPDATA\Temp\nvim"
$env:CC="clang"

