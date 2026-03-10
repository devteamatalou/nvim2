# Neovim Keybinds Reference

> `<leader>` = `Space`

---

## if you get denied for the treesitter**

Remove-Item -Recurse -Force "$env:LOCALAPPDATA\Temp\nvim"
$env:CC="clang"

---

## File Explorer

| Key          | Mode   | Action                  |
| ------------ | ------ | ----------------------- |
| `<leader>ee` | Normal | Toggle file explorer    |
| `<leader>pv` | Normal | Open directory explorer |

---

## Navigation

| Key     | Mode   | Action                                  |
| ------- | ------ | --------------------------------------- |
| `<C-d>` | Normal | Scroll half page down (smooth)          |
| `<C-u>` | Normal | Scroll half page up (smooth)            |
| `<C-b>` | Normal | Scroll full page up (smooth)            |
| `<C-f>` | Normal | Scroll full page down (smooth)          |
| `<C-y>` | Normal | Scroll up slightly                      |
| `<C-e>` | Normal | Scroll down slightly                    |

---

## Search

| Key          | Mode   | Action                            |
| ------------ | ------ | --------------------------------- |
| `n`          | Normal | Next search result (centered)     |
| `N`          | Normal | Previous search result (centered) |
| `<leader>nh` | Normal | Clear search highlight            |

---

## Clipboard (System)

| Key         | Mode            | Action                             |
| ----------- | --------------- | ---------------------------------- |
| `<leader>y` | Normal / Visual | Copy selection to system clipboard |
| `<leader>Y` | Normal          | Copy line to system clipboard      |
| `<leader>p` | Normal          | Paste from system clipboard        |

---

## Insert Mode

| Key  | Mode   | Action                    |
| ---- | ------ | ------------------------- |
| `jk` | Insert | Exit insert mode (Escape) |

---

## Command Mode

| Key | Mode   | Action             |
| --- | ------ | ------------------ |
| `;` | Normal | Enter command mode |

---

## Editing

| Key     | Mode   | Action                 |
| ------- | ------ | ---------------------- |
| `<A-j>` | Normal | Move current line down |
| `<A-k>` | Normal | Move current line up   |

---

## File Management

| Key         | Mode   | Action      |
| ----------- | ------ | ----------- |
| `<leader>w` | Normal | Save file   |
| `<leader>q` | Normal | Quit Neovim |

---

## Formatting

| Key         | Mode            | Action      |
| ----------- | --------------- | ----------- |
| `<leader>f` | Normal / Visual | Format code |

---

## Telescope (Fuzzy Finder)

| Key          | Mode   | Action                  |
| ------------ | ------ | ----------------------- |
| `<leader>pf` | Normal | Find files              |
| `<C-p>`      | Normal | Find git files          |
| `<leader>ps` | Normal | Grep search in project  |
| `<leader>pp` | Normal | Browse projects         |

---

## Harpoon (Quick File Navigation)

| Key         | Mode   | Action                    |
| ----------- | ------ | ------------------------- |
| `<leader>a` | Normal | Add file to harpoon       |
| `<C-e>`     | Normal | Toggle harpoon quick menu |
| `<C-h>`     | Normal | Navigate to file 1        |
| `<C-t>`     | Normal | Navigate to file 2        |
| `<C-n>`     | Normal | Navigate to file 3        |
| `<C-s>`     | Normal | Navigate to file 4        |

---

## Bufferline (Tabs)

| Key         | Mode   | Action              |
| ----------- | ------ | ------------------- |
| `<Tab>`     | Normal | Next tab            |
| `<S-Tab>`   | Normal | Previous tab        |
| `<leader>x` | Normal | Close current tab   |

---

## LSP Navigation

| Key  | Mode   | Action                   |
| ---- | ------ | ------------------------ |
| `gd` | Normal | Go to definition         |
| `K`  | Normal | Show hover documentation |
| `gr` | Normal | Show references          |

---

## LSP Actions

| Key          | Mode   | Action        |
| ------------ | ------ | ------------- |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code actions  |

---

## Diagnostics

| Key         | Mode   | Action                |
| ----------- | ------ | --------------------- |
| `<leader>e` | Normal | Show diagnostic popup |
| `[d`        | Normal | Previous diagnostic   |
| `]d`        | Normal | Next diagnostic       |
| `<leader>d` | Normal | Show diagnostics list |

---

## Auto Completion (nvim-cmp)

| Key         | Mode   | Action                            |
| ----------- | ------ | --------------------------------- |
| `<C-p>`     | Insert | Select previous completion        |
| `<C-n>`     | Insert | Select next completion            |
| `<C-y>`     | Insert | Confirm completion                |
| `<C-Space>` | Insert | Force completion popup            |
| `<Tab>`     | Insert | Next placeholder / next item      |
| `<S-Tab>`   | Insert | Previous placeholder / prev item  |
| `<CR>`      | Insert | Confirm selected completion       |

---

## Multi-Cursor (vim-visual-multi)

| Key     | Mode   | Action                              |
| ------- | ------ | ----------------------------------- |
| `<C-n>` | Normal | Select word + add next occurrence   |
| `<Esc>` | Any    | Exit multi-cursor mode              |

---

## Comments (Comment.nvim)

| Key          | Mode   | Action                        |
| ------------ | ------ | ----------------------------- |
| `gcc`        | Normal | Toggle line comment           |
| `gbc`        | Normal | Toggle block comment          |
| `gcO`        | Normal | Add comment on line above     |
| `gco`        | Normal | Add comment on line below     |
| `gcA`        | Normal | Add comment at end of line    |
| `gc` + motion| Normal | Comment a range (e.g. `gc5j`) |
| `gb` + motion| Normal | Block comment a range         |
| `gc`         | Visual | Comment selected lines        |
| `gb`         | Visual | Block comment selected lines  |

---

## Nvim-Tree (File Explorer)

| Key | Mode          | Action                  |
| --- | ------------- | ----------------------- |
| `%` | NvimTree      | Create file/folder      |
| `A` | NvimTree      | Create file/folder      |
| `d` | NvimTree      | Delete file/folder      |
| `r` | NvimTree      | Rename file/folder      |

---

## Basic Vim Commands

### Line Navigation

| Key | Action                                  |
| --- | --------------------------------------- |
| `0` | Move to very first column               |
| `^` | Move to first non-blank character       |
| `$` | Move to end of line                     |

### Insert

| Key  | Action                          |
| ---- | ------------------------------- |
| `o`  | Insert new line below           |
| `O`  | Insert new line above           |
| `ea` | Insert at end of word           |

### Delete / Change

| Key    | Action                          |
| ------ | ------------------------------- |
| `di"`  | Delete inside quotes            |
| `da"`  | Delete around quotes            |
| `di{`  | Delete inside `{}`              |
| `dit`  | Delete inside tag               |
| `ci"`  | Change inside quotes            |
| `ci(`  | Change inside parentheses       |
| `ca{`  | Change around `{}`              |
| `diW`  | Delete word including spaces    |
| `Shift+C` | Delete everything after cursor |

### Select

| Key   | Action                   |
| ----- | ------------------------ |
| `vit` | Select inside tag        |
| `vat` | Select around tag        |

### Jump

| Key               | Action                        |
| ----------------- | ----------------------------- |
| `line_number + G` | Jump to specific line         |
| `;`               | Repeat last `f` or `t` search |
| `,`               | Repeat in opposite direction  |

### Search & Replace

| Key                         | Action                                  |
| --------------------------- | --------------------------------------- |
| `*`                         | Highlight all occurrences of word       |
| `cgn`                       | Change current highlighted occurrence  |
| `.`                         | Repeat last change on next occurrence  |
| `:%s/old/new/g`             | Replace all occurrences in file        |
| `:%s/old/new/gc`            | Replace with confirmation              |


### trouble Diagnostics window

|Key           | Mode   | Action
|--------------|--------|---------------------------
|<leader>d     | Normal | Toggle diagnostics panel
|<leader>dw    | Normal | File diagnostics only
|<leader>dc    | Normal | Close diagnostics panel
|j / k         | Normal | Navigate errors in panel
|<CR>          | Normal | Jump to error location
