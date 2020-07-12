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
Build conda environment in Docker
```
FROM continuumio/miniconda3
ADD environment.yml environment.yml
ADD env.yml env.yml
RUN conda env create -f environment.yml
RUN conda env create -f env.yml
```
Docker 
```
docker system prune -a --volumes
sudo docker login --username=08101999 --password-stdin=********
sudo docker run --mount src=/home/vutrungnghia/Desktop,target=/home/workspace,type=bind -it 406f2b43ea59
sudo docker run --mount src=/home/vutrungnghia/Desktop,target=/home/workspace,type=bind -p 8888:8888 -it fb8778043bb3

jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root

sudo docker commit container_id vutrungnghia99/benchmark_baselines:0
sudo docker push vutrungnghia99/benchmark_baselines:0
```
IP address and Location 
```
curl https://ipinfo.io/ip
curl https://ipvigilante.com/202.191.56.67
```
Remove trash icon ubuntu 19.10
```
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
```
Nvidia-trick
```
export LD_PRELOAD=/usr/lib64-nvidia/libnvidia-ml.so
```
Check type RAM
```
sudo lshw -short -C memory
```
Read yaml
```
import yaml

def read_yaml(filename: str):
    with open(filename, 'r') as stream:
        try:
            return yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)
```
Read H5
```
import h5py

def read_h5(filename: str):
    data = {}
    with h5py.File(filename, 'r') as f:
        for key in tqdm(list(f.keys())):
            data[key] = np.array(f[key])
    return data
```
Print red
```
print(f'\33[91m ....XXXX..... \33[0m')
```
Plot 3D
```
import plotly.graph_objects as go
import pandas as pd
import numpy as np
# Read data from a csv
z_data = pd.read_csv('/home/vutrungnghia/Desktop/tmp.csv')
s = np.array(z_data['Delay'])
z = s.reshape(10, 11)
sh_0, sh_1 = z.shape
x, y = np.linspace(0, 0.9, sh_0), np.linspace(0, 1, sh_1)
fig = go.Figure(data=[go.Surface(z=z, x=x, y=y)])
# fig.update_layout(title='Mt Bruno Elevation', ,
fig.update_layout(
    width=1024,
    height=1024,
    autosize=False,
    scene = dict(xaxis_title='PL',
                yaxis_title='PR',
                zaxis_title='Average delay (s)',
                xaxis = dict(
                         backgroundcolor="rgb(200, 200, 230)",
                         gridcolor="white",
                         showbackground=True,
                         zerolinecolor="white",),
                    yaxis = dict(
                        backgroundcolor="rgb(230, 200,230)",
                        gridcolor="white",
                        showbackground=True,
                        zerolinecolor="white"),
                    zaxis = dict(
                        backgroundcolor="rgb(230, 230,200)",
                        gridcolor="white",
                        showbackground=True,
                        zerolinecolor="white",)),
    margin=dict(l=65, r=50, b=65, t=90)
)
                    # width=700,
                    # margin=dict(r=20, b=10, l=10, t=10))
fig.show()
```
AverageMeter
```
class AverageMeter(object):
    def __init__(self):
        self.reset()

    def reset(self):
        self.val = 0
        self.avg = 0
        self.sum = 0
        self.count = 0

    def update(self, val, n=1):
        self.val = val
        self.sum += val * n
        self.count += n
        self.avg = self.sum / self.count
```
Run notebook with password
```
jupyter notebook --no-browser --port=9998 --ip='*' --NotebookApp.token='' --NotebookApp.password=''
```
Revert to the last commit
```
git reset --hard HEAD
```
Mount HDD

https://askubuntu.com/questions/1029040/how-to-manually-mount-a-partition
