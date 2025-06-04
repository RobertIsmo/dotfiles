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
(setq-default tab-always-indent nil)
(setq indent-line-function 'insert-tab)
(setq backward-delete-char-untabify-method nil)
(setq x-stretch-cursor t)

(setq-default
	c-basic-offset tab-width
	cperl-ident-level tab-width)

(define-key input-decode-map [?\C-i] [C-i])

;; ;; MacOs modifier 

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)

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

;; ;; ;; Edit

(define-key my-keybindings-map (kbd "M-I") 'completion-at-point)

;; Bultin Mode Config

;; Modeline

(defun my-mode-line-modified-indicator ()
  	"Mode line modified indicator."
	(when (and (buffer-modified-p) (buffer-file-name))
	  	(propertize "🔴 ")))

(defun my-mode-line-position ()
  	"Mode line position indicator."
  	(format "%d:%d" (line-number-at-pos) (current-column)))

(defun my-mode-line-buffer-path ()
  	"Mode line buffer path."
	(when (buffer-file-name)
		(propertize (abbreviate-file-name buffer-file-name)
			'face '(:foreground "brown" :height 140))))

(setq-default mode-line-format
			  '("%e "
				(:eval (my-mode-line-modified-indicator))
				mode-name " "
				(:eval (my-mode-line-position)) " "
				(:eval (parrot-create)) " "
				"%b "
				(:eval (format-time-string "%l:%M %Ss"))
				mode-line-format-right-align
				(:eval (my-mode-line-buffer-path))))

;; Packages

;; ;; Package Config

;; ;; ;; Parrot

(parrot-mode 1)
(setq-default parrot-num-rotations nil)
(parrot-set-parrot-type 'rotating)


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

(define-key my-vterm-map (kbd "C-x") 'vterm-send-C-x)
(define-key my-vterm-map (kbd "C-s") 'vterm-send-C-s)

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

;; ;; ;; EIN

(defvar my-ein-map (make-sparse-keymap))

(define-minor-mode my-ein-mode
	"A minor mode for Robert's custom ein."
	:global nil
	:keymap my-ein-map)

(define-key my-ein-map (kbd "C-s") 'ein:notebook-save-notebook-command)
(define-key my-ein-map (kbd "C-c C-c") 'ein:worksheet-execute-cell)
(define-key my-ein-map (kbd "C-c C-p") 'ein:worksheet-clear-output)
(define-key my-ein-map (kbd "C-c M-C-p") 'ein:worksheet-clear-all-output)
(define-key my-ein-map (kbd "C-c C-m") 'ein:worksheet-insert-cell-below)
(define-key my-ein-map (kbd "C-t C-c <C-i>") 'ein:worksheet-move-cell-up)
(define-key my-ein-map (kbd "C-t C-c C-k") 'ein:worksheet-move-cell-down)
(define-key my-ein-map (kbd "C-c C-u <C-i>") 'ein:worksheet-goto-prev-input-km)
(define-key my-ein-map (kbd "C-c C-u C-k") 'ein:worksheet-goto-next-input-km)

(add-hook 'ein:notebook-mode-hook #'my-ein-mode)
(defun my-ein-notebook-mode-setup ()
  	"Used to force against the notebook keybinds"
  	(setq ein:notebook-mode-map (make-sparse-keymap))
	(setq minor-mode-map-alist
        (assq-delete-all 'ein:notebook-mode minor-mode-map-alist)))

(add-hook 'ein:notebook-mode-hook #'my-ein-notebook-mode-setup)

;; ;; ;; GPT.el

(define-key my-keybindings-map (kbd "C-c <C-i> s") 'gptel-send)
(define-key my-keybindings-map (kbd "C-c <C-i> m") 'gptel-menu)
(define-key my-keybindings-map (kbd "C-c <C-i> n") 'gptel)

(setq-default
	gptel-model 'gemma3:12b
	gptel-backend (gptel-make-ollama
		"Ollama"
		:host "localhost:11434"
		:stream t
		:models '(gemma3:1b gemma3:12b gemma3:27b)))

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

;; ;; ;; Multiple Cursors

(define-key my-keybindings-map (kbd "M-c") 'mc/edit-beginnings-of-lines)
(define-key my-keybindings-map (kbd "M-S-<mouse-1>") 'mc/add-cursor-on-click)

;; ;; ;; Ivy

(setq-default ivy-initial-inputs-alist ())
(setq-default ivy-re-builders-alist
	'((swiper . ivy--regex-ignore-order)
	  (t . ivy--regex-fuzzy)))

;; Startup

(unless (eq system-type 'darwin)
	(multi-vterm)
)


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
   '(amx auto-dim-other-buffers counsel ein flycheck gptel
		 highlight-indent-guides idle-highlight-mode magit multi-vterm
		 multiple-cursors parrot rainbow-delimiters swiper-helm
		 vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(idle-highlight ((t (:background "#ffd"))))
 '(mode-line ((t (:background "gray100" :foreground "black" :box (:line-width (8 . 6) :style released-button)))))
 '(tab-bar ((t (:inherit variable-pitch :background "gray100" :foreground "black"))))
 '(tab-bar-tab ((t (:inherit tab-bar :box (:line-width (4 . 4) :style flat-button))))))

;; 
(put 'upcase-region 'disabled nil)
