# How to save GNOME settings

Save your GNOME settings with this command :

```zsh
dconf dump / > dconf-settings.ini
``````

Restore your GNOME settings with this command :

```zsh
dconf load / < dconf-settings.ini
```
Used in chezmoi this should be done with a script.
