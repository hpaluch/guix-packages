;; Modified procps to get back normal 'top' command

(define-module (hpaluch packages top-normal)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix licenses)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages linux))
  
(define-public procps-top-normal
  (package
    (inherit procps)
    (name "procps-top-normal")
    (arguments
     (list #:configure-flags '(list "--disable-modern-top")))
    (synopsis "Procps with good old top (no crazy colors, no crazy tree)")
  )
)

