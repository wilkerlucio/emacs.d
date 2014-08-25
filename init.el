(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(background-color "#7f7f7f")
 '(background-mode dark)
 '(cursor-color "#5c5cff")
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(doremi-down-keys (quote (j down)))
 '(doremi-up-keys (quote (k up)))
 '(evil-want-C-u-scroll t)
 '(foreground-color "#5c5cff")
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-archives (quote (("marmalade" . "http://marmalade-repo.org/packages/") ("melpa" . "http://melpa-stable.milkbox.net/packages/") ("gnu" . "http://elpa.gnu.org/packages/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; general package initialize
(package-initialize)

;; flx-ido setup
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; company auto-complete setup
(global-company-mode)

;; paredit mode
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)

;; projectile
(projectile-global-mode)

;; smex
(global-set-key (kbd "M-x") 'smex)

;; evil setup
(evil-mode 1)

(global-evil-leader-mode)

(evil-leader/set-leader ",")

(evil-leader/set-key "f" 'projectile-find-file)
(evil-leader/set-key "b" 'ido-switch-buffer)
(evil-leader/set-key "g" 'magit-status)
(evil-leader/set-key "," 'ace-jump-mode)

(evil-leader/set-key "p j" 'live-paredit-forward-slurp-sexp-neatly)
(evil-leader/set-key "p l" 'align-cljlet)
(evil-leader/set-key "p h" 'paredit-splice-sexp-killing-backward)
(evil-leader/set-key "p s" 'paredit-split-sexp)

(evil-leader/set-key-for-mode 'ruby-mode "t t" 'rspec-verify)
(evil-leader/set-key-for-mode 'ruby-mode "t r" 'rspec-verify-single)
(evil-leader/set-key-for-mode 'ruby-mode "r" 'rspec-rerun)

;;;;;;;;;;;;;;;;;;;;;;
;; regular key maps ;;
;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-normal-state-map (kbd "C-o") 'ace-jump-mode)
(define-key evil-normal-state-map (kbd ";") 'evil-ex)

(global-set-key (kbd "<C-up>") 'er/expand-region)
(global-set-key (kbd "<C-down>") 'er/contract-region)

(global-set-key (kbd "M-x") 'smex)

;; clojure
(eval-after-load 'clojure
  '(progn
     (define-key clojure-mode-map (kbd "C-c l l") 'align-cljlet)
     (define-key clojure-mode-map (kbd "C-M-z")   'align-cljlet)))

(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-m")))

;; paredit
(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-c l k") 'paredit-splice-sexp-killing-forward)
     (define-key paredit-mode-map (kbd "C-c l w") 'paredit-splice-sexp-killing-backward)
     (define-key paredit-mode-map (kbd "C-c l l") 'align-cljlet)
     (define-key paredit-mode-map (kbd "C-c l t") 'fill-paragraph)
     (define-key paredit-mode-map (kbd "C-c l j") 'live-paredit-forward-slurp-sexp-neatly)
     (define-key paredit-mode-map (kbd "C-M-e")   'paredit-backward-barf-sexp)
     (define-key paredit-mode-map (kbd "C-M-s")   'paredit-backward-slurp-sexp)
     (define-key paredit-mode-map (kbd "C-M-j")   'live-paredit-forward-slurp-sexp-neatly)
     (define-key paredit-mode-map (kbd "C-M-y")   'paredit-forward-barf-sexp)
     (define-key paredit-mode-map (kbd "C-M-z")   'align-cljlet)
     (define-key paredit-mode-map (kbd "M-S")     'paredit-split-sexp)
     (define-key paredit-mode-map (kbd "M-s")     'paredit-splice-sexp)
     (define-key paredit-mode-map (kbd "M-j")     'paredit-join-sexps)
     (define-key paredit-mode-map (kbd "M-P")     'live-paredit-previous-top-level-form)
     (define-key paredit-mode-map (kbd "M-N")     'live-paredit-next-top-level-form)
     (define-key paredit-mode-map (kbd "C-M-f")   'live-paredit-forward)
     (define-key paredit-mode-map (kbd "M-q")     'live-paredit-reindent-defun)
     (define-key paredit-mode-map (kbd "M-d")     'live-paredit-forward-kill-sexp)
     (define-key paredit-mode-map (kbd "M-k")     'live-paredit-backward-kill)
     (define-key paredit-mode-map (kbd "M-\\")    'live-paredit-delete-horizontal-space)
     (define-key paredit-mode-map (kbd "C-M-i")   'paredit-forward-down)
     (define-key paredit-mode-map (kbd "C-M-n")   'paredit-forward-up)
     (define-key paredit-mode-map (kbd "C-M-p")   'paredit-backward-down)
     (define-key paredit-mode-map (kbd "C-M-u")   'paredit-backward-up)
     (define-key paredit-mode-map (kbd "M-T")     'transpose-sexps)
     (define-key paredit-mode-map (kbd "C-M-k")   'live-paredit-copy-sexp-at-point)))

;; funky characters
(global-set-key (kbd "C-c i l") (lambda () (interactive) (insert "λ")))
(global-set-key (kbd "C-c i n") (lambda () (interactive) (insert "ℕ")))
(global-set-key (kbd "C-c i i") (lambda () (interactive) (insert "∞")))
(global-set-key (kbd "C-c i .") (lambda () (interactive) (insert "×")))
(global-set-key (kbd "C-c i 0") (lambda () (interactive) (insert "∅")))
(global-set-key (kbd "C-c i u") (lambda () (interactive) (insert "∪")))
(global-set-key (kbd "C-c i s") (lambda () (interactive) (insert "♯")))
(global-set-key (kbd "C-c i f") (lambda () (interactive) (insert "♭")))
(global-set-key (kbd "C-c i p") (lambda () (interactive) (insert "£")))

;; Show documentation/information with M-RET
(define-key lisp-mode-shared-map (kbd "M-RET") 'live-lisp-describe-thing-at-point)

(eval-after-load 'cider
  '(progn
     (define-key cider-repl-mode-map (kbd "M-RET") 'cider-doc)
     (define-key cider-mode-map (kbd "M-RET") 'cider-doc)))
