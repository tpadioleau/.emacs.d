;; init-highlight.el --- Initialize highlight configuration.

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

;; Initialize highlight configuration.

;;; Code:

(use-package highlight-doxygen
  :ensure t
  :hook (c-mode-common . highlight-doxygen-mode))

(use-package hl-line
  :ensure nil
  :hook (after-init . global-hl-line-mode))

(use-package paren
  :ensure nil
  :hook (after-init . show-paren-mode)
  :config (progn
            (setq show-paren-when-point-in-periphery t)
            (setq show-paren-when-point-inside-paren t)
            (set-face-attribute 'show-paren-match nil :background 'unspecified)))

(use-package rainbow-mode
  :ensure t
  :hook ((emacs-lisp-mode web-mode css-mode) . rainbow-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package whitespace
  :ensure nil
  :config (setq-default show-trailing-whitespace t))

(provide 'init-highlight)
;;; init-highlight.el ends here
