(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)

(setq split-height-threshold nil)
(setq split-width-threshold 0)

(menu-bar-mode -1)
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

;; ;; Key Functions

(defun transpose-up ()
	(interactive)
	(transpose-lines 1)
	(forward-line -2))

(defun transpose-down ()
	(interactive)
	(forward-line 1)
	(transpose-lines 1)
	(forward-line -1))

;; ;; Tabbing

(electric-indent-mode -1)
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

;; ;; ;; Multiple Cursors

(define-key my-keybindings-map (kbd "M-c") 'mc/edit-beginnings-of-lines)
(define-key my-keybindings-map (kbd "M-S-<mouse-1>") 'mc/add-cursor-on-click)

;; ;; ;; Controls

(define-key my-keybindings-map (kbd "C-p") 'delete-backward-char)
(define-key my-keybindings-map (kbd "C-b") 'undo)
(define-key my-keybindings-map (kbd "C-M-b") 'undo-redo)
(define-key my-keybindings-map (kbd "C-t") 'nil)
(define-key my-keybindings-map (kbd "C-t <C-i>") 'transpose-up)
(define-key my-keybindings-map (kbd "C-t C-k") 'transpose-down)

;; ;; ;; Management

(define-key my-keybindings-map (kbd "C-r") 'tab-bar-switch-to-next-tab)
(define-key my-keybindings-map (kbd "C-e") 'tab-bar-switch-to-prev-tab)
(define-key my-keybindings-map (kbd "C-c C-t") 'tab-bar-new-tab)
(define-key my-keybindings-map (kbd "C-c C-w") 'tab-bar-close-tab)
(define-key my-keybindings-map (kbd "C-c C-0") 'delete-window)
(define-key my-keybindings-map (kbd "C-c C-1") 'delete-other-window)
(define-key my-keybindings-map (kbd "C-c C-2") 'split-window-below)
(define-key my-keybindings-map (kbd "C-c C-3") 'split-window-right)
(define-key my-keybindings-map (kbd "C-n") 'other-window)
(define-key my-keybindings-map (kbd "C-c C-f") 'toggle-frame-fullscreen)
(define-key my-keybindings-map (kbd "M-=") 'text-scale-increase)
(define-key my-keybindings-map (kbd "M--") 'text-scale-decrease)
(define-key my-keybindings-map (kbd "C-=") 'scroll-down-line)
(define-key my-keybindings-map (kbd "C--") 'scroll-up-line)
(define-key my-keybindings-map (kbd "C-c C-f") 'toggle-frame-fullscreen)
(define-key my-keybindings-map (kbd "C-f") 'swiper)

;; ;; ;; File

(define-key my-keybindings-map (kbd "C-s") 'save-buffer)
(define-key my-keybindings-map (kbd "C-x C-b") 'counsel-switch-buffer)
(define-key my-keybindings-map [remap find-file] 'counsel-find-file)
(define-key my-keybindings-map [remap execute-extended-command] 'counsel-M-x)

;; Packages

;; ;; Package Config

;; ;; ;; Auto Dim Other Buffers

(auto-dim-other-buffers-mode 1)

;; ;; ;; Rainbow Delimiters

(rainbow-delimiters-mode 1)

;; ;; ;; Highlight Indent Guide 

(highlight-indent-guides-mode 1)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; ;; ;; Ivy

(setq ivy-initial-inputs-alist ())
(setq ivy-re-builders-alist 
	'((swiper . ivy--regex-ignore-order)
	  (t . ivy--regex-fuzzy)))

;; ;; Auto Gen

(setopt package-archives
	'(("gnu" . "https://elpa.gnu.org/packages/")
	  ("nongnu" . "https://elpa.nongnu.org/nongnu")
	  ("melpa" . "https://melpa.org/packages/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	'(amx auto-dim-other-buffers counsel highlight-indent-guides magit
		  multiple-cursors rainbow-delimiters swiper-helm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
