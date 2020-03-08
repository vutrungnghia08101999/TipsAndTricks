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
    "python.dataScience.sendSelectionToInteractiveWindow": true,
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

Synchronize folder in local machine to docker jupyter notebook
```
sudo docker run -p 8080:8888 -v /home/vutrungnghia/Desktop/root:/home/jovyan/work 7f1
```

ssh_config_example: config
```
Compression yes

Host MIT
    Hostname 202.191.56.250
    User nghiavt
    Port 22

Host Stanford
    Hostname node72
    User nghiavt
    Port 22
    ProxyJump MIT

Host PTIT
    Hostname 203.162.88.102
    User namvh
    Port 22
```
Synchronize folder from local machine to remote server or reverse.
```
rsync  -avz /home/vutrungnghia/Desktop/ PTIT:/home/namvh/Workspace/
rsync  -avz PTIT:/home/namvh/Workspace/ /home/vutrungnghia/Desktop/ 
```
Install dotnet unbuntu
```
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo add-apt-repository universe
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.2
```
Get public ip address on Linux
```
dig TXT +short o-o.myaddr.l.google.com @ns1.google.com
```
List processes with port
```
netstat -lpn
```
Auto reimport module to jupyter notebook
```
%reload_ext autoreload
```
Running a Jupyter notebook from a remote server
```
jupyter notebook --no-browser --port=9999
ssh -N -f -L localhost:9999:localhost:9999 remoteuser@remotehost
```
Log to file and console at the same time
```
logging.basicConfig(filename='logs.txt',
                    filemode='a',
                    format='%(asctime)s, %(levelname)s: %(message)s',
                    datefmt='%y-%m-%d %H:%M:%S',
                    level=logging.DEBUG)
console = logging.StreamHandler()
console.setLevel(logging.INFO)
logging.getLogger().addHandler(console)
```
Notebook to python script
```
jupyter nbconvert --to script [YOUR_NOTEBOOK].ipynb
```

Change target version (JAVA)
```
    <properties>
        <maven.compiler.source>1.6</maven.compiler.source>
        <maven.compiler.target>1.6</maven.compiler.target>
    </properties>
```
Empty docker 
```
sudo docker system prune -a --volumes
```
