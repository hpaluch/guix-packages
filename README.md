# My Guix packages (channel)

Here are my experimental Guix packages.

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
(append (list (channel
	       (name 'my-channel)
	       (url (string-append "file://" (getenv "HOME")
		     "/projects/guix-packages"))))
 %default-channels)
```

Run:
```shell
guix pull
guix install pil-git-scripts # the only package in my channel
ls ~/.guix-profile/bin/*.sh # scripts from pil-git-scripts package
```
