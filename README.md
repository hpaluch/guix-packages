# My Guix packages (channel)

Here are my experimental Guix packages. Currently these are available:
- `pil-git-scripts` my scripts that I use with git (push current branch etc...) - (Copy build system)
- `clockres` - simple tool to report available clock resolutions (CMake build system)

Note: this channels is not yet signed so you have to
do following trickery to use it:

Clone this repo using:
```shell
mkdir -p ~/projects
cd  ~/projects
git clone https://github.com/hpaluch/guix-packages.git
```

Now create file `~/.config/guix/channels.scm` with contents:
```scheme
;; from: https://guix.gnu.org/cookbook/en/html_node/Channels.html
(append (list (channel
	       (name 'my-channel)
	       (url (string-append "file://" (getenv "HOME")
		     "/projects/guix-packages"))))
 %default-channels)
```

Run:
```shell
guix pull
guix install pil-git-scripts # one package in my channel
ls ~/.guix-profile/bin/*.sh # scripts from pil-git-scripts package
```

# Resources

Mainly I used: https://guix.gnu.org/cookbook/en/html_node/Channels.html
