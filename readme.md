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
