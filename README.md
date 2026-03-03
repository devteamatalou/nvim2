## prerequesite 
1- packer plugin manager


git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"


## tips

found out that when getting the permission denied for the treesitter you can run the following command to make it work in the powershell

Remove-Item -Recurse -Force "$env:LOCALAPPDATA\Temp\nvim"
$env:CC="clang"

## My keybinds from this config and global config to remember 


# LSP
 1- Signature help = ctrl + h "i"
 2- diagnostic = space + v + d "n"
 3- diagnostic = space + v + d "n"
 4- Definition = g + d "n"
 5- Go to Next= [ + d "n"
 6- Go to Previous= ] + d "n"
 7- Rename = space + v + r + r "n"

# NAV

1- Jump directly to a specifique line = line_number + G
2- repeat the last F or T searche = ;
3- repeat the last F or T searche in the opposite direction = ,


# insert

1- put cursor below the current line = o
2- put cursor above the current line = O
3- insert at the end of the word = ea


# del 

1- Delete Inside = di"
2- Delete Around = da"
3- delete inside { = di{
4- delete inside tag = dit

# change

1- change inside "" = ci"
2- change inside ( = ci(
3- change around { = ca{

# misc

Search anything in a file and "n" to go to the next occcurence and "shift + n" to go to the previous one = \

delete the following line or word after the cursor = shift + c

delete everthing that is inside of soomething including spaces = diW

select inside a tag = vit

select outside a tag = vat

# regex

1- Find and replace all (Nuclear option)
cmd: :%s/old_word/new_word/g

% -> the whole file
s -> subsitute
g -> global

2- find and replace all but with confirmation
cmd: :%s/old_word/new_word/gc
y => ys to all
n => no (skip this one and move to next)
a => all(replace all)
q => quit(stop right there)
L => Replace this one and stop


# Important summary 

i = inside 
a = around
t = till

go to this link to learn more about the keybinds https://vim.rtorr.com/
