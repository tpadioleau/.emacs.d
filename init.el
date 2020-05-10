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

(setq gc-cons-threshold 16777216 ; 16mb
      gc-cons-percentage 0.1)

;; This enables package
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; Installs the package "use-package" if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enables the package "use-package".
(eval-when-compile
  (require 'use-package))

(use-package benchmark-init
  :ensure t)

(use-package gcmh
  :ensure t
  :hook (after-init . gcmh-mode))

(use-package bind-key
  :ensure t)

(use-package diminish
  :ensure t)

;; Avoids to spread configuration files.
(use-package no-littering
  :ensure t
  :demand t
  :config
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))
        custom-file (no-littering-expand-etc-file-name "custom.el")))

;; Local customization is saved in etc/custom-file.el. This prevents
;; emacs from writing in this file. "noerror" allows to start emacs
;; even if the custom-file doesn't exist.
(load custom-file 'noerror)

;; Custom packages in .emacs.d/init
(push (expand-file-name "init" user-emacs-directory) load-path)
(require 'init-highlight)
(require 'init-ui)

(require 'init-company)
(require 'init-edit)
(require 'init-helm-or-ivy)
(require 'init-lsp)
(require 'init-utils)
(require 'init-yasnippet)

;; Major modes
(require 'init-cc)
(require 'init-cmake)
(require 'init-csv)
(require 'init-dired)
(require 'init-ibuffer)
(require 'init-md)
(require 'init-pdf)
(require 'init-python)
(require 'init-tex)
(require 'init-web)
;;; init.el ends here
