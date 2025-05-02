(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)

(setq split-height-threshold nil)
(setq split-width-threshold 0)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode -1)

(setq auto-save-file-name-transform `((".*" "~/.emacs-backup/")))
(setq backup-directory-alist '(("." . "~/.emacs-backup")))
(setq backup-by-copying t)
(setq global-auto-revert-mode t)
(setq create-lockfiles nil)

(global-display-line-numbers-mode 1)


;; Keyboard Settings

;; ;; Tabbing

(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq backward-delete-char-untabify-method nil)
(setq x-stretch-cursor t)

(setq
	c-basic-offset tab-width
	cperl-ident-level tab-width)

(define-key input-decode-map [?\C-i] [C-i])

;; ;; Keymap

(defvar my-keybindings-map (make-sparse-keymap))

(define-minor-mode my-keybindings-mode
	"A minor mode for Robert's custom keybindings."
	:global t
	:keymap my-keybindings-map)

(my-keybindings-mode 1)
	
;; ;; ;; Movement
	
(define-key my-keybindings-map (kbd "<C-i>") 'previous-line)
(define-key my-keybindings-map (kbd "C-j") 'backward-char)
(define-key my-keybindings-map (kbd "C-k") 'next-line)
(define-key my-keybindings-map (kbd "C-l") 'forward-char)
(define-key my-keybindings-map (kbd "C-u") 'beginning-of-visual-line)
(define-key my-keybindings-map (kbd "C-o") 'end-of-visual-line)

(define-key my-keybindings-map (kbd "M-j") 'backward-word)
(define-key my-keybindings-map (kbd "M-l") 'forward-word)
(define-key my-keybindings-map (kbd "M-u") 'backward-sexp)
(define-key my-keybindings-map (kbd "M-o") 'forward-sexp)

