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

(leaf ivy
  :ensure t
  :hook
  (after-init-hook . ivy-mode)
  :custom
  (ivy-fixed-height-minibuffer . t))

(leaf swiper
  :ensure t)

(leaf counsel
  :ensure t
  :hook
  (ivy-mode-hook . counsel-mode)
  :bind
  (:counsel-mode-map
   ("C-s" . counsel-grep-or-swiper)
   ("C-r" . counsel-grep-or-swiper-backward))
  :custom
  (counsel-find-file-at-point . t))

(leaf flyspell-correct-ivy
  :ensure t
  :after flyspell-correct)

(leaf ivy-xref
  :ensure t
  :custom
  (ref-show-xrefs-function . 'ivy-xref-show-xrefs))

(leaf all-the-icons-ivy
  :ensure t
  :hook
  (counsel-mode-hook . all-the-icons-ivy-setup)
  :config
  (progn
    (defun my-all-the-icons-ivy-icon-for-file (s)
      "Return icon for filename S.
Return the octicon for directory if S is a directory.
Otherwise fallback to calling `all-the-icons-icon-for-file'."
      (let ((s-abs (expand-file-name s (ivy-state-directory ivy-last))))
        (cond
         ((file-directory-p s-abs)
          (all-the-icons-icon-for-dir s-abs))
         (t (all-the-icons-icon-for-file s)))))

    (advice-add 'all-the-icons-ivy-icon-for-file :override
                'my-all-the-icons-ivy-icon-for-file))
  :custom
  (all-the-icons-spacer . " "))

(leaf lsp-ivy
  :ensure t)

(provide 'init-ivy)
;;; init-ivy.el ends here
