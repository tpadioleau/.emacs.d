;; init-lsp.el --- Initialize lsp configuration.

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

;; Initialize lsp configuration.

;;; Code:

(use-package company-lsp
  :ensure t
  :after (:all company lsp-mode)
  :config (push 'company-lsp company-backends))

(use-package flycheck-clang-analyzer
  :ensure t
  :after flycheck
  :hook (flycheck-mode . flycheck-clang-analyzer-setup))

(use-package flycheck-clang-tidy
  :ensure t
  :hook (flycheck-mode . flycheck-clang-tidy-setup))

(use-package lsp-mode
  :ensure t
  :hook ((c-mode c++-mode objc-mode python-mode sh-mode) . lsp-deferred))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config (setq lsp-ui-doc-enable t
                lsp-ui-doc-position 'top
                lsp-ui-doc-alignment 'window
                lsp-ui-imenu-enable t
                lsp-ui-sideline-enable nil
                lsp-ui-sideline-ignore-duplicate nil))

(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)

(use-package flymake-diagnostic-at-point
  :ensure t
  :after flymake
  :hook (flymake-mode . flymake-diagnostic-at-point-mode))

(use-package format-all
  :ensure t)

(provide 'init-lsp)
;;; init-lsp.el ends here
