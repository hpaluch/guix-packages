;; Guix package fo Pickering Git Scripts (pil-git-scripts) project from GitHub

(define-module (hpaluch packages pil-git-scripts)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix licenses))
  
(define-public pil-git-scripts
(package
  (name "pil-git-scripts")
  (version "0.99.1")
  (source
   (origin
    (method git-fetch)
    (uri (git-reference
	  (url "https://github.com/hpaluch-pil/pil-git-scripts.git")
	  (commit "5f264ed4c5abd9ebfea59ed2f00cba3f0b58555e" )))
    (file-name (git-file-name name version))
    ;; hash produced with: "guix hash -rx ." in repo with above commit
    (sha256 (base32 "0k3baflv7mkf3gjsphbx8h3if5raifwnvqgdkx75zhzkk09lmia7"))
   ))
  (build-system copy-build-system)
  (arguments
   (list #:install-plan #~'(("scripts/" "bin/" #:include-regexp ("\\.sh$")))
   ))
  (home-page "https://github.com/hpaluch-pil/pil-git-scripts")
  (synopsis "My Git scripts")
  (description "Set of Git scripts I found useful 2004.")
  (license bsd-0))
)
