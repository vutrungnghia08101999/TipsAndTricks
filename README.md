General

Remove vs code
```
sudo snap remove vscode
```

Config vscode
```
{
    "workbench.colorCustomizations" : {
        "terminal.foreground" : "#00FD61",
    },
    "terminal.integrated.shell.windows": "C:\\Windows\\System32\\cmd.exe",
}
```

Uninstall mysql (server + workbench)
```
sudo apt-get remove --purge mysql*
sudo apt-get purge mysql*
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get remove dbconfig-mysql
sudo apt-get dist-upgrade

```

Python package
```
tensorflow==1.14.0
pandas
numpy
scikit-learn
xlsxwriter
xlrd
```
