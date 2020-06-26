
## Shortcuts for zsh

These also work with zsh-autocompletion 

### Moving around
    CTRL-A/HOME         : Move to the beginning of a line.
    CTRL-E/END          : Move to the end of a line.
    CTRL-B/LEFT         : Move left one character.
    CTRL-F/RIGHT        : Move right one character.
    ALT-B/CTRL-LEFT     : Move left one word.
    ALT-F/CTRL-RIGHT    : Move right one word.
    CTRL-XX             : Hold CTRL and press X twice to move the cursor to the beginning of the line,
                          and hold CTRL and press X twice again to move the cursor back.

### Editing text
    CTRL-U              : Cut all the characters.
    CTRL-K              : Cut the characters to the right of the cursor.
    CTRL-H/BACKSPACE    : Delete one character to the left.
    CTRL-D/DELETE       : Delete one character to the right.
    CTRL-W              : Cut one word to the left.
    ALT-D               : Cut one word to the right.
    CTRL-Y              : Paste the characters previously cut.
    CTRL-_/CTRL-/       : Undo the last edit.
    CTRL-XE             : Open the $EDITOR to edit the line.
    ALT-U               : Change one word to the right to uppercase.
    ALT-L               : Change one word to the right to lowercase.

### Command completion
    TAB: Attempt shell expansion on the current word. If that fails, attempt completion.
    ls *<TAB>   # ls folder1 folder2 file3
    CTRL-G              : List the expansion of the current word.

### Managing the screen
    CTRL-L              : Clear screen (just like clear).
    CTRL-S              : Stop screen output. Useful for preventing processes from spamming the stdout.
    CTRL-Q              : Resume screen output.

### Command History
    CTRL-R: Search the command history. Accept with ENTER/RETURN, abort with CTRL-G.
    CTRL-P/UP: The previous command in history.
    CTRL-N/DOWN: The next command in history.

### FZF shortcuts 
    ALT-C               : Change direcotry quickly.
    CTRL-T              : Opens up current direcotry searching through the files.

## Shortcuts for nvim
<leader>                : Shows the available options
<leader> f              : ranger

:FZF or :Files          : Open a window for searching files
:Rg                     : Ripgrep in window
:Lines                  : Search through all the buffers open
:History:               : Search through history of vim commands.

### Vim and Windows
:resize 60              : Change the height to 60 rows
:res +5/-5              : Increment or decrement by 5 rows
:vertical resize 60     : Increase the to 60 columns
:vert res +5/-5         : Increment or decrement by 5 cols
Ctrl-w + / Ctrl-w -     : Resize the height
Ctrl-w > / Ctrl-w <     : Resize the width
Ctrl-w =                : Make all windows equal dimension
Ctrl-w _                : Increase a window to its maximum height
Ctrl-w |                : increase a window to its maximum width

### DirDiff Plugin
:DirDiff <dir1> <dir2>  : Directory based diff and merge.
