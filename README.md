cfdisk parsec
## clash
下载`clash for windows` linux版本
解压文件`tar -xvf 文件名`
cd进入文件后`./cfw`

## time synchronization
```shell
sudo timedatectl set-ntp true
```

## fonts
```shell
#英文
yay -S ttf-liberation
#中文&韩文
yay -S wqy-microhei-kr-patched 
#字符&表情
yay -S ttf-sourcecodepro-nerd noto-fonts-emoji
```

## vimtex probleams
```shell
#目录权限  
sudo chown -R $(whoami):$(whoami) ~/.cache/vimtex 
```

# .config


## 使用[NeoVim](https://neovim.io)编写Latex.

The following sections provide installation instructions for Mac, Arch, and Debian operating systems.
In the [CheatSheet.md](https://github.com/benbrastmckie/.config/blob/master/CheatSheet.md) you can find all of the key-bindings that I have added to NeoVim for writing LaTeX documents, where the [LearningGit.md](https://github.com/benbrastmckie/.config/blob/master/LearningGit.md) provides resources for integrating Git into your workflow.
You can also find video series which: (1) demonstrates the [features](https://www.youtube.com/watch?v=_Ct2S65kpjQ&list=PLBYZ1xfnKeDRhCoaM4bTFrjCl3NKDBvqk) included in the present configuration; (2) walks through the [installation process](https://www.youtube.com/watch?v=ELdTohuzTnA&list=PLBYZ1xfnKeDQxis9D7HFFygHOFVTQ0BFn); (3) explains how to [modify the configuration](https://www.youtube.com/watch?v=oyEPY6xFhs0&list=PLBYZ1xfnKeDT0LWxQQma8Yh-IfpmQ7UHr) (OLD) for your own needs; and (4) describes how to [use Git](https://www.youtube.com/watch?v=GIJG4QtZBYI&list=PLBYZ1xfnKeDQYYXIhKKrXhWOaSphnn9ZL) to track changes and collaborate with others.


## Table of Contents

1. [Arch Linux Installation](#Arch-Linux-Installation)
2. [Remapping Keys](#Remapping-Keys)

The software covered includes NeoVim, Git, Zathura, Zotero, Alacritty, Tmux, and Fish.
I will also include information for globally remapping keys to [better](https://www.reddit.com/r/vim/comments/lsx5qv/just_mapped_my_caps_lock_to_escape_for_the_first/) suit writing LaTeX documents with NeoVim.


# Arch Linux Installation

This installation will begin with necessities and conclude with details for an optional installation of zsh, st, and Tmux to improve your terminal, as well as details for how to add an SSH key and PAT for streamlining your experience of Git.
If you find any errors in these installation instructions, please don't hesitate to let me know by submitting a PR or opening an issue.

## Dependencies

Open the terminal and run:

```
python3 --version
```

If Python3 is not installed, run:

```
sudo pacman -S python
```

Install NeoVim with:

```
sudo pacman -S neovim
```

In order to install plugins to extend the functionality of NeoVim, run the following:

```
git clone https://github.com/zheshigewenti/nvim.git ~/.config/nvim
```

Install the following if they are not already installed:

```
sudo pacman -S install git
sudo pacman -S lazygit
sudo pacman -S fzf
sudo pacman -S ripgrep
sudo pacman -S pandoc
sudo pacman -S pandoc-citeproc
sudo pacman -S node
sudo pacman -S npm
sudo pacman -S wget
sudo pacman -S xsel
sudo pip3 install neovim-remote
```

Open NeoVim by running `nvim` in the terminal and run the following command:

```
:checkhealth
```

If Python 3 reports an error, try running:

```
pip3 install --user pynvim
```

Troubleshoot any errors that persist by continuing to run `:checkhealth`, following the advice provided for each error.
All warnings can be ignored.


## [LaTeX](https://www.latex-project.org)

Check to see LaTeX is already installed with:

```
latexmk --version
```

To install LaTeX, run the following

```
sudo pacman -S texlive-most
```

After rebooting, confirm that LaTeX is installed by running:

```
latexmk --version
```


## [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

In order for NeoVim to load icons, it will be imporant to install a NerdFont.
For simplicity, I have included RobotoMono in `~/.config/fonts` which you can now move to the appropriate folder on your computer by entering the following in the terminal:

```
sudo cp -R ~/.config/fonts/RobotoMono/ /usr/share/fonts
```

If you intend to use the stock terminal, you will need to go into the terminal's settings to change the font to RobotoMono regular.
You are now ready to write LaTex in NeoVim inside the stock terminal.
If you intend to upgrade your terminal to Alacritty with Tmux and the Fish shell, then proceed as follows:


## [Zathura](https://pwmt.org/projects/zathura/)

Install the Zathura pdf-viewer by running:

```
sudo pacman -S zathura
```

Although Zathura is an ideal pdf-viewer for writing LaTeX documents, you may want to use your default pdf-viewer for opening the pdfs associated with citations via the VimTex context-menu.
For instance, I use [Okular](https://okular.kde.org) which you can install by running:

```
sudo pacman -S okular
```

If you want to use a different pdf-viewer than Okular, replace 'okular' in the following file with your desired pdf-viewer:

```
nvim ~/.config/nvim/plug-config/vimtex.vim
```

Alternatively, you could replace 'okular' with 'zathura'.


## [Configuration](https://github.com/benbrastmckie/.config)

I recommend forking my config, coppying the SSH address by clicking the `Code` button in your fork of the config. 
Alternatively, if you don't want to fork, click the `Code` button in my repo. 
Now you are ready to open the terminal back up and run the following commands making the appropriate substitution:

```
cd ~/.config
git init
git remote add origin YOUR-OR-MY-ADDRESS
git remote -v
git pull origin master
ls -a
```

Run NeoVim to install the plugins:

```
nvim
```

If the plugins do not automatically install, then run:

```
:PackerInstall
:PackerUpdate
```

After the plugins finish installing, exit and reopen NeoVim, running:

```
:checkhealth
```

Troubleshoot any errors by following the advice provided.


## [Zotero](https://www.zotero.org/)

Download and extract the [Zotero](https://www.zotero.org/download/) tarball in ~/Downloads, and move the extracted contents and set the launcher by running the following in the terminal:

```
sudo mv ~/Downloads/Zotero_linux-x86_64 /opt/zotero
cd /opt/zotero
sudo ./set_launcher_icon
sudo ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
```

Install Better-BibTex by downloading the latest release [here](https://retorque.re/zotero-better-bibtex/installation/) (click on the .xpi).
Go into `Tools -> add-ons` and click the gear in the upper right-hand corner, selecting `Install Add-on From File` and navigate to the .xpi file in ~/Downloads.
Go into `Edit -> Preferences -> BetterBibTex` and set citation key format to `[auth][year]`.
Go into `Edit -> Preferences -> Sync` entering your username and password, or else create a new account if you have not already done so.
Also check 'On item change' at the bottom left.
Now switch to the 'Automatic Export' sub-tab and check 'On Change'.
Exit `Preferences` and click the green sync arrow in the to right-hand corner (if you have not previously registered a Zotero database, no change will occur).
Install the appropriate plugin for your browser by following the link [here](https://www.zotero.org/download/)
Find a paper online, sigining in to the journal as necessary and downloading the PDF manually.
Now return to the paper on the journal's website and test the browser plugin for Zotero which should be displayed in the top right of the screen.
Create the bib and bst directories, and move the .bst bibliography style files into the appropriate folder by running the following:

```
mkdir -p ~/texmf/bibtex/bib
cp -R ~/.config/latex/bst ~/texmf/bibtex
```

Right-click the main library folder in the left-most column, and select `Export Library`.
Under the `Format` dropdown menu, select `Better BibTex`, selecting the `Keep Updated` box. 
Save the file as `Zotero.bib` to ~/texmf/bibtex/bib which you previously created.
You are now ready to cite files in your Zotero database.


## [Alacritty](https://github.com/alacritty/alacritty), [Tmux](https://github.com/tmux/tmux/wiki), and [Fish](https://fishshell.com/) (Optional)

Run the following commands in the terminal:

```
sudo pacman -S alacritty
sudo pacman -S tmux
sudo pacman -S fish
```

Move the Tmux configuration file to the appropriate location by running:

```
sudo cp ~/.config/tmux/.tmux.conf ~/.tmux.conf
```

Assuming that you installed Fish above, you will now need to locate fish on your operating system by running the following:

```
which fish
```

The command should return `/usr/bin/fish`.
If the path is different, copy the path and run the following:

```
nvim ~/.config/alacritty/alacritty.yml
```

Replace '/usr/bin/fish' with the location of fish if different, saving and exiting with `<space>q`.
Quit the terminal and open Alacritty, running the following to set a reasonable theme for Fish:

```
curl -L https://get.oh-my.fish | fish
omf install sashimi
```

To delete the welcome message, run:

```
set -U fish_greeting ""
```

In order to reset Tmux, run:

```
tmux kill-server
```

When you reopen Alacritty, Fish should be the default shell inside a Tmux window.
If you want to turn on the Vim keybindings within Fish, run the following:

```
fish_vi_key_bindings
```

You are now read use NeoVim in Alacritty, complete with Tmux and the Fish shell.


## [Git](https://git-scm.com/) (Optional)

You can begin by checking to see if you have already set the appropriate username and email with:

```
git config -l
```

If absent or incorrect, add your details making appropriate substitutions:

```
git config --global user.name "YOUR-USERNAME"
git config --global user.email "YOUR-EMAIL"
git config -l
```

Your details should now appear.

You can now begin to set up your remote repository to push and pull changes from.
If you forked my config, you can skip the following subsection.


### Cloned Config

Assuming that you did not fork my config, make an account on GitHub if you haven't already, create a new repository called 'config' or something similar (without including a Readme), and copy the SSH address which should be shown upon clicking the `Code` button.
Now run:

```
cd ~/.config
git remote -v
```

You can remove any addresses that appear with the following command, replacing 'origin' with the name of the addresses which appears on the left if different from 'origin':

```
git remote remove origin
git remote -v
```

Remove all addresses until none remain.
Having already copied the SSH address of your repo as directed above, you can add that address to your local git repo by running the following commands:

```
git remote add origin YOUR-ADDRESS
git remote -v
```

If your address appears, you are ready to push changes.


### Pushing Changes

Navigate to your config directory and open the `init.lua` file with NeoVim as follows:

```
cd ~/.config/
nvim nvim/init.lua
```

Open LazyGit with `<space>gg`.
In the top left corner you will see a bunch of files in red.
Untracked files will be marked with '??' on the left, where tracked files that have been modified will be marked by an 'M' on the left.
Tracked files that have not been changed will not appear.
You can navigate through all displayed files with `j` and `k`, where `h` and `l` switch panes (which we won't need here), and `q` exits LazyGit.

You will probably want to ignore all of the untracked files.
In general, you want to ignore all files that aren't included in the config, i.e., anything that you would also want to ignore on another computer that you might pull your config onto.
To ignore an untracked file, navigate to it using `j` and `k` and open the ignore menu by pressing `i`.
You can then either ignore the file by pressing `i` again, or exclude the file by pressing `e`.
It is best to exclude files and directories that are specific to the computer that you are using, and ignore files and directories that are not specific to your current computer.
Given that you just pulled down the config where all files included in the config are already tracked, you can safely exclude all untracked files that appear since these will be specific to the computer that you are working on.
Once you have excluded (or ignored) an untracked file, it will disappear.
You can always undo an accidental git-ignore by editing the ignore files with the following commands:

```
nvim ~/.config/.gitignore
nvim ~/.config/.git/info/exclude
```

Remove any lines that you did not want to include in the ignore list and save and quit with `<space>q`.

If there are any untracked files that you want to include in this config (e.g., a config file for some other program that you want to track), you can stage those files by navigating to them and hitting `<space>`.
Once you have excluded or ignored (or possibly staged) each of the untracked files that originally appeared, you can begin to stage the modified files either by hitting `<space>` when hovering over each file, or by hitting `a` to stage all files assuming that there are no remaining untracked files.
Once all files have been staged, you can commit changes with `c`, entering a message such as "initial commit" and hitting `Enter`.
You can now push your changes up to your repo with `P`.
This may require that you enter your GitHub password.
To avoid having to enter your password each time you want to push changes, see the instructions in the next section.


### Adding an SSH Key to GitHub

If you have not already, you can also add an SSH key by amending and running the following:

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

Hit `return` once, entering your GitHub passphrase in response to the prompt.
Next run:

```
bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

If you do not have `xclip` you can install it by running:

```
sudo pacman -S xclip
```

After the install, run the following to copy the SSH key to your system clipboard:

```
xclip -sel clip < ~/.ssh/id_rsa.pub
```

In the top right corner of your GitHub page, click `Profile -> Settings -> SSH and GPG Keys` selecting `New SSH Key`.
Name the authentication key after the devise you are using, pasting the SSH key from the clipboard into the appropriate field.
Saving the key completes the addition.

Check to make sure that the SSH key is working by pushing commits up to one of your repositories as directed above.
If your SSH key stops working after rebooting, run the following command:

```
ssh-add -K ~/.ssh/id_rsa
```

If you get an error, retry the command above with a lower-case 'k' or without the 'K' altogether.


### [Adding a Personal Access Token](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token)

Create a personal access token (PAT) by going to GitHub.com, clicking your user icon in the top right, navigate to `Setting --> Developer settings --> Personal -- Tokens` and create a new access token, setting:

- No expiration date
- Select `repo` in scope/permissions

After generating the token, you must copy the PAT, pasting it into a temporary file saved on your computer.
You can now add your PAT by pushing any changes you have made to your config up to your GitHub repo.
To do so, begin by navigating in the terminal to your .config folder and opening NeoVim with:

```
cd ~/.config
nvim CheatSheet.md
```

I would recommend keeping the `CheatSheet.md` updated with any changes you make to your configuration.
You can then push all of the changes that you have made to your config so far with LazyGit by hitting `<space>gg`. 
You will have to sort through which files you might want Git to ignore, hitting `i` when hovering over each, and once you have finished, hitting `A` to stage all files, followed by `c` to commit the staged changes, and `P` to push changes to the remote repo.
Enter your user name when prompted, followed by your PAT with `Ctrl+Shift+v` (or other depending on how paste is achieved in your terminal enviornment).
Assuming that this push works, close LazyGit with `q`, and reopen the terminal with `Ctrl+t`.

Now run the following:

```
git config --global credential.helper cache
```

Repeat the steps above after making a small change to your config to run another test, entering your username and PAT as before.
Run one final test, checking to see if your credentials are now automatically submitted, avoiding the need to enter your username and PAT each time you push or pull changes.

For more help, see these [video](https://www.youtube.com/watch?v=kHkQnuYzwoo) instructions.


<!-- ### Installing the GitHub Cli -->
<!---->
<!-- Assuming that you are using GitHub to host your repositories, it is convenient to install the GitHub Cli which allows you to make changes to your repositories directly from the terminal inside NeoVim: -->
<!---->
<!-- ``` -->
<!-- sudo pacman -S github-cli -->
<!-- ``` -->
<!---->
<!-- You will then need to follow the [instructions](https://cli.github.com/manual/) in order to authenticate GitHub Cli by running: -->
<!---->
<!-- ``` -->
<!-- gh auth login -->
<!-- ``` -->
<!---->
<!-- Set NeoVim as your default editor by running: -->
<!---->
<!-- ``` -->
<!-- gh config set editor nvim -->
<!-- ``` -->
<!---->
<!-- For further information, see the section **GitHub Cli** in the [Cheat Sheet](https://github.com/benbrastmckie/.config/blob/master/CheatSheet.md) as well as the [GitHub Cli Repo](https://github.com/cli/cli). -->



# Remapping Keys

It can be convenient to swap keys so as to improve hand posture while working. For instance, one might switch the CapsLock and Esc keys, as well as turning Ctrl into Alt, Alt into Command, and Command into Ctrl.
To include these remappings, run the following commands for Arch and Debian, respectively:

Arch:

```
sudo pacman -S xorg-xmodmap
sudo pacman -S xorg-xev
sudo pacman -S xorg-setxkbmap
```

Debian:

```
sudo apt install xorg-xmodmap
sudo apt install xorg-xev
sudo apt install xorg-setxkbmap
```

In order to test to confirm the keycodes for your keyboard, run the following:

```
xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
```

This will open a white box which, when in focus, will print the keycodes of the depressed keys.
In particular, test the `Ctrl` as well as both `Alt/Option` and `Command` keys on the left and right side of the keyboard.
In order to get the `Command` keys to register, you will need to press `Shift+Command` which will print the keycode for `Shift` followed by the keycode for `Command`.
Close the white box upon finishing, checking to see if the output matches the following:

```
37 control
64 Alt_L
133 Super_L
134 Super_R
108 Alt_R
```

If you output matches the above, you can run the following:

```
sudo cp ~/.config/.XmodmapMAC ~/.Xmodmap
```

If your output does not match the above, you will need to edit the following file accordingly by running:

```
nvim ~/.config/.Xmodmap
```

If you need to make changes to key mappings, you can test the result of editing `.Xmodmap` and running the following:

```
xmodmap ~/.config/.Xmodmap
```

Once you have .Xmodmap running the right key mappings, you will have to run the following so that .Xmodmap starts automatically:
```
sudo cp ~/.config/.Xmodmap ~/.Xmodmap
cp ~/.config/.xmodmap.desktop ~/.config/autostart/
```

You can return to defaults by running:

```
setxkbmap
```

Once you achieve the desired result, reboot and confirm that the mappings are running as desired.


