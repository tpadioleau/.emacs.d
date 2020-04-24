;; init-tex.el --- Initialize latex configuration.

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

;; Initialize latex configuration.

;;; Code:

(use-package tex
  :ensure auctex
  :defer t
  :config (progn
            (setq TeX-auto-save t)
            (setq TeX-parse-self t)
            (setq TeX-view-program-selection '((output-pdf "PDF Tools")))
            (setq TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
            (setq TeX-source-correlate-mode t)
            (add-hook 'TeX-after-compilation-finished-functions 'TeX-revert-document-buffer)
            (setq reftex-plug-into-AUCTeX t)))

(use-package reftex
  :ensure t
  :hook (TeX-mode . reftex-mode)
  :config (setq reftex-cite-prompt-optional-args t))

(use-package company-auctex
  :ensure t
  :after (:all auctex company yasnippet)
  :config (progn (company-auctex-init)
                 (push '(company-auctex-environments
                         company-auctex-labels) company-backends)))

(use-package academic-phrases
  :ensure t
  :defer t)

(provide 'init-tex)
;;; init-tex ends here
