;; init-ui.el --- Initialize graphical configuration.

;; Copyright (C) 2019 Thomas Padioleau
;; Copyright (C) 2019 Vincent Zhang

;; Author: Vincent Zhang <seagle0128@gmail.com>
;; URL: https://github.com/tpadioleau/.emacs.d

;; This file is not part of GNU Emacs.

;;; License

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Initialize graphical configuration.

;;; Code:

(setq delete-by-moving-to-trash t)
(setq require-final-newline t)
(setq mouse-yank-at-point t)
(setq load-prefer-newer t)
(setq save-interprogram-paste-before-kill t)
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
(setq-default indent-tabs-mode nil)

(set-selection-coding-system 'utf-8)
(set-language-environment 'UTF-8)
(prefer-coding-system 'utf-8)
(setenv "LC_CTYPE" "UTF-8")
(load-library "iso-transl") ; to use accents

(use-package clean-aindent-mode
  :ensure t
  :hook (after-init . clean-aindent-mode)
  :config (progn (electric-indent-mode -1)
		 (setq clean-aindent-is-simple-indent t)))

(use-package flyspell
  :ensure t
  :hook ((text-mode . flyspell-mode)
         (prog-mode . flyspell-prog-mode))
  :init (setq ispell-program-name "aspell"))

(use-package flyspell-correct-helm
  :ensure t
  :after (:all flyspell helm)
  :bind ([down-mouse-3] . flyspell-correct-word-generic))

(use-package hungry-delete
  :ensure t
  :bind	(("C-c DEL" . hungry-delete-backward)
         ("C-c C-d" . hungry-delete-forward)))

(use-package mwim
  :ensure t
  :bind (("C-a" . mwim-beginning-of-code-or-line)
         ("C-e" . mwim-end-of-code-or-line)))

(global-set-key (kbd "RET") 'newline-and-indent)

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode)
  :init (setq save-place-file (concat user-emacs-directory "places")))

(use-package smartparens
  :ensure t
  :hook ((prog-mode text-mode) . smartparens-mode)
  :config (use-package smartparens-config))

(use-package undo-tree
  :ensure t
  :hook (after-init . global-undo-tree-mode))

(use-package uniquify
  :ensure nil
  :init (setq uniquify-buffer-name-style 'forward))

(use-package windmove
  :ensure nil
  :hook (after-init . windmove-default-keybindings))

(use-package zygospore
  :ensure t
  :bind ("C-x 1" . zygospore-toggle-delete-other-windows))

(provide 'init-edit)
;;; init-edit.el ends here