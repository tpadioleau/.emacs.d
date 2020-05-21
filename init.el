;;; init.el --- Emacs configuration.

;; Copyright (C) 2019 Thomas Padioleau

;; Author: Thomas Padioleau <padioleau.thomas@gmail.com>
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
;;
;; Emacs configuration.

;;; Code:

(setq gc-cons-threshold (* 16 1024 1024))

;; Installs the package "use-package" if not installed
(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf feather
    :ensure t)

  (leaf leaf-keywords
    :ensure t
    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))

(leaf benchmark-init
  :ensure t
  :require t)

(leaf gcmh
  :ensure t
  :hook
  (after-init-hook . gcmh-mode))

;; Avoids to spread configuration files.
(leaf no-littering
  :ensure t
  :require t
  :config
  (setq auto-save-file-name-transforms `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))
	custom-file (no-littering-expand-etc-file-name "custom.el")))

;; Custom packages in .emacs.d/init
(push (expand-file-name "init/" user-emacs-directory) load-path)
(require 'init-highlight)
(require 'init-ui)

;; (require 'init-helm)
(require 'init-ivy)

(require 'init-company)
(require 'init-edit)
(require 'init-flycheck)
(require 'init-lsp)
(require 'init-projectile)
(require 'init-utils)
(require 'init-yasnippet)

;; Major modes
(require 'init-cc)
(require 'init-cmake)
(require 'init-csv)
(require 'init-dired)
(require 'init-emacs-lisp)
(require 'init-ibuffer)
(require 'init-md)
(require 'init-pdf)
(require 'init-python)
(require 'init-tex)
(require 'init-web)
(require 'init-yaml)

;; Local customization is saved in etc/custom-file.el. This prevents
;; emacs from writing in this file. "noerror" allows to start emacs
;; even if the custom-file doesn't exist.
(load custom-file 'noerror)
;;; init.el ends here
