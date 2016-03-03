# Windows + Visual Studio + IIS Vagrant Dev Box

Messing around with trying to get a Vagrant box set up for cross-platform non-cross-platform .NET development.

Hopefully this will be totally obsolete this year. It should be helpful for the forseeable future though.

## Setup

```
cd packer && packer build build.json
```

Wait for a few hours.

```
vagrant up && vagrant rsync-auto
```

The local folder will be automatically synced to `C:/vagrant` on the vm.

In a new terminal in the same folder, ssh into the vm

```
vagrant ssh
```

Switch to cmd, and run the build script (which sucks atm)

```
cmd
cd C:\vagrant
build.bat
```

The build stuff especially needs a lot of work. And IIS isn't set up for web projects yet, but this is all on the way.

SQL server should be good to go though.