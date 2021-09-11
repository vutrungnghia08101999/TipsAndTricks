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
    "python.dataScience.sendSelectionToInteractiveWindow": true,
    "files.associations": {





    
    },
    "python.linting.flake8Args": [
        "--max-line-length=1200",
        "--ignore=E402,E305,W293",
    ],
    "python.dataScience.askForKernelRestart": false,
    "explorer.confirmDelete": false,
    "window.zoomLevel": 0,
    "workbench.sideBar.location": "left",
    "explorer.confirmDragAndDrop": false,
    "terminal.integrated.rendererType": "dom",
    "editor.suggestSelection": "first",
    "vsintellicode.modify.editor.suggestSelection": "automaticallyOverrodeDefaultValue",
    "python.jediEnabled": true,
    "java.semanticHighlighting.enabled": true,
    "files.exclude": {
        "**/.classpath": true,
        "**/.project": true,
        "**/.settings": true,
        "**/.factorypath": true
    },
    "python.languageServer": "Jedi",
    // "editor.fontSize": 16,
    "files.watcherExclude": {
        "**/dataset/train/**": true,
        "**/dataset/test/**": true,
        "**/dataset/**": true,
        "**/data/**": true
    },
    "C_Cpp.updateChannel": "Insiders",
    "editor.codeActionsOnSave": null,
    "terminal.integrated.inheritEnv": false,
    "python.linting.flake8Enabled": true,
    "python.autoComplete.extraPaths": ["/media/vutrungnghia/New Volume/Project-III-GANS"],
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
jupyter lab --no-browser --port=9999 --ip='*' --NotebookApp.token='sheeta' --NotebookApp.password=''
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
```
sudo lsblk -o NAME,FSTYPE,LABEL,SIZE,MOUNTPOINT
sudo mkdir /mnt/Ubuntu18.04
sudo mount -t auto -v /dev/nvme0n1p8 /mnt/Ubuntu18.04
```
- LINK: https://askubuntu.com/questions/1029040/how-to-manually-mount-a-partition

Hide top bar
```
sudo apt install gnome-shell-extension-autohidetopbar
```
Generate rsa key for ssh
```
ssh-keygen -t rsa -b 4096 -C "01010101010110101101010101010101000101010111001010101101010101"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```
Full dark mode ubuntu 20.04
```
sudo apt install gnome-shell-extensions
```
Run docker without sudo
```
sudo groupadd docker
sudo gpasswd -a vutrungnghia docker
# restart
```
Install Terminator
```
sudo apt-get update
sudo apt-get install terminator
# uncheck profiles\\show titlebar
```
Install ibus-unikey
```
sudo apt-get install ibus-unikey
sudo add-apt-repository ppa:ubuntu-vn/ppa
sudo apt-get update
# restart laptop
```
Count lines of code
```
git ls-files | xargs cat | wc -l
```
Heap tracker C++
```
#include <iostream>
#include <memory>

struct HeapTracker
{
	uint32_t totalAllocated = 0;
	uint32_t totalFreed = 0;

	void showUsage()
	{
		std::cout << "Total allocated: " << totalAllocated << " - ";
		std::cout << "Total freed: " << totalFreed << " - ";
		std::cout << "Current usage: " << totalAllocated - totalFreed << " (bytes)" << std::endl;
	}
};

HeapTracker heapTracker;

void* operator new(size_t size)
{
    heapTracker.totalAllocated += size;
	return malloc(size);
}

void operator delete(void* memory, size_t size)
{
	heapTracker.totalFreed += size;
	free(memory);
}

struct Object
{
	int x, y, z;
};

int main()
{
	heapTracker.showUsage();
	{
		std::unique_ptr<Object> obj = std::make_unique<Object>();
		heapTracker.showUsage();
	}
	heapTracker.showUsage();
	Object* obj = new Object;
	heapTracker.showUsage();
	std::cin.get();
}
```
QT in Ubuntu

Fix 'qt.qpa.plugin: Could not load the Qt platform plugin "xcb" in "" even though it was found.'

Fix Qt 5.12: Failed to find “GL/gl.h” in “/usr/include/libdrm”
```
sudo apt-get install --reinstall libxcb-xinerama0
sudo apt install mesa-common-dev libglu1-mesa-dev
```
QT in Ubuntu

Fix qmake compile error
```
sudo apt-get install build-essential
```
Timer C++
```
#include <iostream>
#include <chrono>
using namespace std;

class Timer{
private:
    std::chrono::time_point<std::chrono::high_resolution_clock> start, end;
    string name;
public:
    Timer(string name)
        : name(name)
    {
        start = std::chrono::high_resolution_clock::now();
    }

    ~Timer()
    {
        end = std::chrono::high_resolution_clock::now();

        auto s = std::chrono::time_point_cast<std::chrono::milliseconds>(start).time_since_epoch().count();
        auto e = std::chrono::time_point_cast<std::chrono::milliseconds>(end).time_since_epoch().count();

        auto duration = e - s;
        std::cout << name << ": " << (duration) << " ms\n";
    }
};

int main()
{
    {
        Timer timer("test");
        int a;
        for(int i = 0; i < 100000000; ++i)
            a = a * 1.0;
    }
}
```
Fast cin >> C++
```
ios_base::sync_with_stdio(false);
cin.tie(NULL);
```
Find with pattern
```
find . -name "*.jar"
```
Check folder size
```
du -sh .
du -hs .[^.]*
```

https://www.base64encode.org/

https://www.base64decode.org/

Export general logs MySQL
```bash
nano /etc/mysql/my.cnf
# Add these info
[mysqld]
general_log = on
general_log_file=/var/log/mysql/mysqld_general.log

# restart mysql
sysetmctl restart mysql
```
