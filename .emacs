;;; Package -- Robert's Config
;;; Commentary:

;;; Code:

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

(setq-default auto-save-file-name-transform `((".*" "~/.emacs-backup/")))
(setq backup-directory-alist '(("." . "~/.emacs-backup")))
(setq backup-by-copying t)
(setq global-auto-revert-mode 1)
(setq create-lockfiles nil)

(global-display-line-numbers-mode 1)


;; Keyboard Settings

;; ;; Key Functions

(defun transpose-up ()
	"Transpose the line up."
	(interactive)
	(transpose-lines 1)
	(forward-line -2))

(defun transpose-down ()
	"Transpose the line down."
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

(setq-default
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
(define-key my-keybindings-map (kbd "C-c C-1") 'delete-other-windows)
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

;; ;; ;; VTerm

(define-key my-keybindings-map (kbd "C-c C-v n") 'multi-vterm)
(define-key my-keybindings-map (kbd "C-c C-v p") 'multi-vterm-project)

(defvar my-vterm-map (make-sparse-keymap))

(define-minor-mode my-vterm-mode
	"A minor mode for Robert's custom vterm."
	:global nil
	:keymap my-vterm-map)

(add-hook 'vterm-mode-hook #'my-vterm-mode)

(define-key my-vterm-map (kbd "C-p") 'vterm-send-backspace)
(define-key my-vterm-map (kbd "<C-i>") 'vterm-send-up)
(define-key my-vterm-map (kbd "C-j") 'vterm-send-left)
(define-key my-vterm-map (kbd "C-k") 'vterm-send-down)
(define-key my-vterm-map (kbd "C-l") 'vterm-send-right)
(define-key my-vterm-map (kbd "C-u") 'vterm-send-C-a)
(define-key my-vterm-map (kbd "C-o") 'vterm-send-C-e)

(defun my-vterm-copy ()
	"My custom vterm copy."
	(interactive)
	(my-vterm-mode -1)
	(vterm-copy-mode))

(defun my-vterm-copy-done ()
	"My custom vterm copy done."
	(interactive)
	(vterm-copy-mode-done nil)
	(my-vterm-mode))

(define-key my-keybindings-map (kbd "C-c C-v c") 'my-vterm-copy)
(define-key my-keybindings-map (kbd "C-c C-v w") 'my-vterm-copy-done)

;; ;; ;; Idle Highlight

(idle-highlight-global-mode 1)
(setq-default
	idle-highlight-before-point t
	idle-highlight-visible-buffers t
	idle-highlight-idle-time 0.18)


;; ;; ;; Flycheck

(global-flycheck-mode 1)

;; ;; ;; Auto Dim Other Buffers

(auto-dim-other-buffers-mode 1)

;; ;; ;; Rainbow Delimiters

(rainbow-delimiters-mode 1)

;; ;; ;; Highlight Indent Guide

(highlight-indent-guides-mode 1)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; ;; ;; Ivy

(setq-default ivy-initial-inputs-alist ())
(setq-default ivy-re-builders-alist
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
	'(amx auto-dim-other-buffers counsel flycheck highlight-indent-guides
		  idle-highlight-mode magit multi-vterm multiple-cursors
		  rainbow-delimiters swiper-helm vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(idle-highlight ((t (:background "#ffd")))))
