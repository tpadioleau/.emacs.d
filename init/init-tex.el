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

(leaf tex
  :ensure auctex
  :custom
  (TeX-auto-save . t)
  (TeX-parse-self . t)
  (TeX-view-program-selection . '((output-pdf "PDF Tools")))
  (TeX-view-program-list . '(("PDF Tools" TeX-pdf-tools-sync-view)))
  (TeX-source-correlate-mode . t)
  :defer-config
  (add-hook 'TeX-after-compilation-finished-functions 'TeX-revert-document-buffer))

(leaf reftex
  :ensure nil
  :hook
  (TeX-mode-hook . reftex-mode)
  :custom
  (reftex-cite-prompt-optional-args . t)
  (reftex-plug-into-AUCTeX . t))

(leaf academic-phrases
  :ensure t)

(provide 'init-tex)
;;; init-tex ends here
