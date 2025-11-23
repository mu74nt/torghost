##Created by SusmithKrishnan. 

## Modifications Notice

The `build.sh` script has been updated to ensure compatibility with recent 
Debian-based systems. Newer Debian releases restrict direct `pip install` 
operations in the system Python environment, requiring either the 
`--break-system-packages` flag or the use of a Python virtual environment 
(venv) to complete the installation properly. This update reflects those 
changes and allows the project to be installed successfully under current 
system policies.

## What is TorGhost ?
TorGhost is an anonymization script. TorGhost redirects all internet traffic through SOCKS5 tor proxy. DNS requests are also redirected via tor, thus preventing DNSLeak. The scripts also disables unsafe packets exiting the system. Some packets like ping request can compromise your identity.

## Build and install from source
`git clone https://github.com/mu74nt/torghost.git`

`cd torghost`

`chmod +x build.sh`

`./build.sh`



## Usage
Torghost v3.0 usage:

`  -s      --start        Start Torghost`

`  -r      --switch       Request new tor exit node`

`  -x      --stop         Stop Torghost`

`  -h      --help         Print this help and exit`

`  -u      --update       Checks for updates`





