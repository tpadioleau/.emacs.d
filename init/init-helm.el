;; init-helm.el --- Initialize helm configuration.

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

;; Initialize helm configuration.

;;; Code:

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(use-package helm
  :ensure t
  :bind
  (("M-x" . helm-M-x)
   ("M-y" . helm-show-kill-ring)
   ("C-x C-f" . helm-find-files)
   ("C-h C-b" . helm-apropos)))

(use-package helm-config
  :ensure helm
  :after helm)

(use-package flyspell-correct-helm
  :ensure t
  :after flyspell-correct)

;; Wait until xref is loaded to modify xref-show-xrefs-function and
;; defer helm-ref package loading to the use of helm-xref-show-xrefs
(use-package helm-xref
  :ensure t
  :no-require t
  :custom
  (xref-show-xrefs-function 'helm-xref-show-xrefs))

(use-package helm-descbinds
  :ensure t
  :hook
  (after-init-hook . helm-descbinds-mode))

(use-package helm-swoop
  :ensure t
  :bind
  ("C-s" . helm-swoop))

;; Wait until a mode needs company to define key-binding
(use-package helm-company
  :ensure t
  :after company
  :bind
  (:map company-mode-map ("C-<tab>" . helm-company)))

(use-package helm-lsp
  :ensure t
  :no-require t)

(provide 'init-helm)
;;; init-helm.el ends here
