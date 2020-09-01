# nomad-3rdparty - Set up Dependencies for Building Nomad

[Homepage](https://github.com/mrosset/nomad)

Nomad-3rdparty is a set of scripts to build and install dependencies for Nomad under Linux. This is partly due to g-golf not being included in Ubuntu apt packages. The entire Nomad project is under the GNU General Public License, version 3 or later.

## System Requirements

See the other [Readme](https://github.com/mrosset/nomad/tree/master/org) for ggeneral Nomad build instructions. Make sure when checking out this repository to use the --recursive flag to retrieve the submodules. Nomad is intended to work with Guile 2.

## Building for Guix foreign

## Building for Ubuntu

Tested only on 20.04. These instructions assume compilation is done with `configure --prefix=~/local` so all program files reside in the users home directory. This is to avoid sudo and permissions on unix. If you prefer /usr/local installation simple replace $HOME in the following with /usr. Paste the following into the shell:
```sh
_version=$(guile -c '(format #t "~a.~a" (major-version) (minor-version))')
export GUILE_LOAD_PATH="$HOME/local/share/guile/site/$_version"
export GUILE_LOAD_COMPILED_PATH="$HOME/local/lib/guile/${_version}/site-ccache/:$HOME/local/lib/g-golf/guile/${_version}/site-ccache"
export NOMAD_WEB_EXTENSION_DIR="$HOME/local/libexec/nomad"
export GI_TYPELIB_PATH="$HOME/local/lib/girepository-1.0"
export LD_LIBRARY_PATH="$HOME/local/lib:$HOME/local/libexec/nomad"
export PKG_CONFIG_PATH="$HOME/local/lib/pkgconfig"
export XDG_DATA_DIR+="$HOME/local/share"
export PATH="$HOME/local/bin:$PATH"
```
Now do
1. `./autogen.sh`
2. `./configure --prefix=~/local`
3. `make`
4. `make install`

If successful it should write the ggolf, emacsy, and shroud binaries to ~/local (ex: /home/user/local/lib/libemacsy.so.0). You can now switch to the nomad source dir and compile.
