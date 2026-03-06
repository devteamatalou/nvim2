# My Neovim Configuration

## Prerequisite

1. **Packer plugin manager**

```powershell
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"


2. **if you get denied for the treesitter**

Remove-Item -Recurse -Force "$env:LOCALAPPDATA\Temp\nvim"
$env:CC="clang"

## File Explorer

| Key          | Mode   | Action                  |
| ------------ | ------ | ----------------------- |
| `<leader>ee` | Normal | Toggle file explorer    |
| `<leader>pv` | Normal | Open directory explorer |

## Navigation

| Key     | Mode   | Action                                  |
| ------- | ------ | --------------------------------------- |
| `<C-d>` | Normal | Scroll half page down and center cursor |
| `<C-u>` | Normal | Scroll half page up and center cursor   |

## Search

| Key          | Mode   | Action                            |
| ------------ | ------ | --------------------------------- |
| `n`          | Normal | Next search result (centered)     |
| `N`          | Normal | Previous search result (centered) |
| `<leader>nh` | Normal | Clear search highlight            |

## ClipBoard(System)

| Key         | Mode            | Action                             |
| ----------- | --------------- | ---------------------------------- |
| `<leader>y` | Normal / Visual | Copy selection to system clipboard |
| `<leader>Y` | Normal          | Copy line to system clipboard      |
| `<leader>p` | Normal          | Paste from system clipboard        |

## Insert Mode

| Key  | Mode   | Action                    |
| ---- | ------ | ------------------------- |
| `jk` | Insert | Exit insert mode (Escape) |

## Command Mode

| Key | Mode   | Action             |
| --- | ------ | ------------------ |
| `;` | Normal | Enter command mode |

## Editing

| Key     | Mode   | Action                 |
| ------- | ------ | ---------------------- |
| `<A-j>` | Normal | Move current line down |
| `<A-k>` | Normal | Move current line up   |

## File Management

| Key         | Mode   | Action      |
| ----------- | ------ | ----------- |
| `<leader>w` | Normal | Save file   |
| `<leader>q` | Normal | Quit Neovim |

## Formatting

| Key         | Mode            | Action      |
| ----------- | --------------- | ----------- |
| `<leader>f` | Normal / Visual | Format code |

## LSP Navigation

| Key  | Mode   | Action                   |
| ---- | ------ | ------------------------ |
| `gd` | Normal | Go to definition         |
| `K`  | Normal | Show hover documentation |
| `gr` | Normal | Show references          |

## LSP Action

| Key          | Mode   | Action        |
| ------------ | ------ | ------------- |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code actions  |

## Auto Competion

| Key         | Mode   | Action                                                                         |
| ----------- | ------ | ------------------------------------------------------------------------------ |
| `<Tab>`     | Insert | Jump to next snippet placeholder / select next item in completion menu         |
| `<S-Tab>`   | Insert | Jump to previous snippet placeholder / select previous item in completion menu |
| `<CR>`      | Insert | Confirm the current selection from the completion menu                         |
| `<C-Space>` | Insert | Force the completion popup to appear immediately                               |
| Auto-popup  | Insert | Completion menu triggers automatically as you type                             |

## Diagnostics

| Key         | Mode   | Action                |
| ----------- | ------ | --------------------- |
| `<leader>e` | Normal | Show diagnostic popup |
| `[d`        | Normal | Previous diagnostic   |
| `]d`        | Normal | Next diagnostic       |
| `<leader>d` | Normal | Show diagnostics list |

## AutoComplete Navigation (nvim-cmp)

| Key     | Mode   | Action                     |
| ------- | ------ | -------------------------- |
| `<C-p>` | Insert | Select previous completion |
| `<C-n>` | Insert | Select next completion     |
| `<C-y>` | Insert | Confirm completion         |

## Snippet/Super Tap(LuaSnip)

| Key       | Mode   | Action                                   |
| --------- | ------ | ---------------------------------------- |
| `<Tab>`   | Insert | Next completion or expand snippet        |
| `<S-Tab>` | Insert | Previous completion or jump back snippet |

## Plugin Management (Packer)

| Key       | Mode   | Action           |
| --------- | ------ | ---------------- |
| `<C-S-p>` | Normal | Run `PackerSync` |





# Basic Vim cmds knowledge

| Category                      | Command                    | Action                                                                       |
| ----------------------------- | -------------------------- | ---------------------------------------------------------------------------- |
| Navigation                    | `line_number + G`          | Jump directly to a specific line                                             |
| Navigation                    | `;`                        | Repeat last `f` or `t` search                                                |
| Navigation                    | `,`                        | Repeat last `f` or `t` search in opposite direction                          |
| Insert                        | `o`                        | Insert a new line below current line                                         |
| Insert                        | `O`                        | Insert a new line above current line                                         |
| Insert                        | `ea`                       | Insert at the end of the word                                                |
| Delete                        | `di"`                      | Delete inside quotes                                                         |
| Delete                        | `da"`                      | Delete around quotes                                                         |
| Delete                        | `di{`                      | Delete inside `{}`                                                           |
| Delete                        | `dit`                      | Delete inside tag                                                            |
| Change                        | `ci"`                      | Change inside quotes                                                         |
| Change                        | `ci(`                      | Change inside parentheses                                                    |
| Change                        | `ca{`                      | Change around `{}`                                                           |
| Misc                          | `n`                        | Go to next search occurrence                                                 |
| Misc                          | `Shift + N`                | Go to previous search occurrence                                             |
| Misc                          | `Shift + C`                | Delete everything after the cursor in the line                               |
| Misc                          | `diW`                      | Delete everything inside a word including spaces                             |
| Misc                          | `vit`                      | Select inside a tag                                                          |
| Misc                          | `vat`                      | Select around a tag                                                          |
| Regex / Replace               | `:%s/old_word/new_word/g`  | Replace all occurrences in file                                              |
| Regex / Replace               | `:%s/old_word/new_word/gc` | Replace with confirmation (`y`=yes, `n`=no, `a`=all, `q`=quit, `l`=this one) |
| Select & Edit Next Occurrence | `*`                        | Highlight all occurrences of word under cursor                               |
| Select & Edit Next Occurrence | `cgn`                      | Change current highlighted occurrence                                        |
| Select & Edit Next Occurrence | `.`                        | Repeat last change on next occurrence                                        |


| Key | What it does                                          |
| --- | ----------------------------------------------------- |
| `0` | Move to the **very first column** of the line         |
| `^` | Move to the **first non-blank character** of the line |
| `$` | Move to the **end of the line**                       |
