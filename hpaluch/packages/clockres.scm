;; Guix package for Clock resolution tool

(define-module (hpaluch packages clockres)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix licenses))
  
(define-public clockres
(package
  (name "clockres")
  (version "0.2.0")
  (source
   (origin
    (method git-fetch)
    (uri (git-reference
	  (url "https://github.com/hpaluch-pil/clockres.git")
	  (commit "0c98ac187c78c454e12fae2412fa52433f1b9d23" )))
    (file-name (git-file-name name version))
    ;; hash produced with: "guix hash -rx ." in repo with above commit
    (sha256 (base32 "1zy3hicv818zsi88a6l40b7qris01ywdm6n080wgx5nqxl7h55b6"))
   ))
  (build-system cmake-build-system)
  (arguments (list #:tests? #f ; There are no tests.
  ))
  (home-page "https://github.com/hpaluch-pil/clockres")
  (synopsis "Reports available clock resolutions for clock_gettime(2)")
  (description "Tool calls clock_getres(2) to print available clock resolutions for clock_gettime(2)")
  ;; license is MIT, but I'm unable to find it in official package
  (license bsd-0))
)
