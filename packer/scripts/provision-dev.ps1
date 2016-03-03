(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')))>$null 2>&1

# install visual studio with remote tools for local or remote dev
choco install visualstudio2015community -y
choco install vs2015remotetools -y

# install sql server with management studio. This should possibly go in its own script
choco install mssqlserver2014express
choco install mssqlservermanagementstudio2014express

setx path "%path%;C:\Program Files (x86)\MSBuild\14.0\Bin"