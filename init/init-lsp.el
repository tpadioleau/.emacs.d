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

(use-package flycheck-clang-analyzer
  :ensure t
  :hook
  (flycheck-mode-hook . flycheck-clang-analyzer-setup))

(use-package flycheck-clang-tidy
  :ensure t
  :hook
  (flycheck-mode-hook . flycheck-clang-tidy-setup))

;; Config to make it lsp-diagnose compliant
(use-package lsp-mode
  :ensure t
  :hook
  ((c-mode-hook c++-mode-hook objc-mode-hook TeX-mode-hook python-mode-hook sh-mode-hook) . lsp-deferred)
  :config
  (setq lsp-prefer-capf t
        read-process-output-max (* 1024 1024)
        gc-cons-threshold (* gc-cons-threshold 10)
        lsp-completion-enable-additional-text-edit nil)
  (remove-hook 'company-backends 'company-clang))

(use-package lsp-ui
  :ensure t
  :hook
  (lsp-mode-hook . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'top
        lsp-ui-doc-alignment 'window
        lsp-ui-imenu-enable t
        lsp-ui-sideline-enable nil
        lsp-ui-sideline-ignore-duplicate nil))

(use-package flymake-diagnostic-at-point
  :ensure t
  :hook
  (flymake-mode-hook . flymake-diagnostic-at-point-mode))

(use-package format-all
  :ensure t
  :defer t)

(provide 'init-lsp)
;;; init-lsp.el ends here
