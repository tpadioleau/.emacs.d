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

(use-package ivy
  :ensure t
  :hook
  (after-init . ivy-mode)
  :config
  (setq enable-recursive-minibuffers t
        ivy-fixed-height-minibuffer t))

(use-package swiper
  :ensure t
  :defer t)

(use-package counsel
  :ensure t
  :hook
  (ivy-mode . counsel-mode)
  :bind
  (:map counsel-mode-map
        ("C-s" . counsel-grep-or-swiper)
        ("C-r" . counsel-grep-or-swiper-backward))
  :config
  (setq counsel-find-file-at-point t))

(use-package flyspell-correct-ivy
  :ensure t
  :after flyspell-correct)

(use-package ivy-xref
  :ensure t
  :after xref
  :init (setq xref-show-xrefs-function 'ivy-xref-show-xrefs)
  :commands helm-xref-show-xrefs)

(use-package all-the-icons-ivy
  :ensure t
  :hook
  (counsel-mode . all-the-icons-ivy-setup)
  :custom
  (all-the-icons-spacer nil))

(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)

(provide 'init-ivy)
;;; init-ivy.el ends here
