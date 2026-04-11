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

# Tips

Pull just specific channel:

- see https://forum.systemcrafters.net/t/is-there-a-way-to-pull-only-one-channel-not-the-guix-channel/1757
- steps from above URL, Copyright `wegei8`:
  ```shell
  cd
  guix describe --format=channels > channels.scm
  vim channels.scm # completely remove "(commit ...)" from `my-channel`
  guix pull --channels=./channels.scm
  ```
- WARNING! If you did force-push (e.g. amended commit) to your package you need to add `--allow-downgrades`):
  ```shell
  guix pull --channels=./channels.scm --allow-downgrades
  ```
  - see also https://issues.guix.gnu.org/41604 - fortunately my Guix works properly with
    that option

# Resources

* Mainly I used: https://guix.gnu.org/cookbook/en/html_node/Channels.html
* How to pull just single channel: https://forum.systemcrafters.net/t/is-there-a-way-to-pull-only-one-channel-not-the-guix-channel/1757
* How to avoid error `guix pull: error: aborting update of channel 'my-channel' to commit X, which is not a descendant of Y`: https://issues.guix.gnu.org/41604
