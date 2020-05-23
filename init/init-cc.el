;;; init-cc.el --- Initialize c-like configuration.

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

;; Initialize c-like configuration.

;;; Code:

(leaf cc-mode
  :ensure nil
  :mode
  (("\\.[hH]\\'" . c++-mode)
   ("\\.\\(cu\\|cuh\\)\\'" . c++-mode))
  :custom
  (c-basic-offset . 4)
  (c-default-style . "bsd")
  (c-offsets-alist . '((innamespace . 0)))
  (c-tab-always-indent . 'complete))

(leaf ccls
  :ensure t)

(leaf modern-cpp-font-lock
  :ensure t
  :hook
  (c++-mode-hook . modern-c++-font-lock-mode))

(leaf flycheck-clang-analyzer
  :ensure t
  :hook
  (flycheck-mode-hook . flycheck-clang-analyzer-setup))

(leaf flycheck-clang-tidy
  :ensure t
  :after lsp-mode
  :hook
  (flycheck-mode-hook . flycheck-clang-tidy-setup)
  :config
  (flycheck-add-next-checker 'lsp '(warning . c/c++-clang-tidy)))

;; https://www.emacswiki.org/emacs/SrSpeedbar
(leaf sr-speedbar
  :ensure t)

(provide 'init-cc)
;;; init-cc.el ends here
