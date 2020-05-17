;; init-yasnippet.el --- Initialize yasnippet configuration.

;; Copyright (C) 2019 Thomas Padioleau
;; Copyright (C) 2019 Vincent Zhang

;; Author: Vincent Zhang <seagle0128@gmail.com>
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

;; Initialize yasnippet configuration.

;;; Code:

(use-package yasnippet
  :ensure t
  :hook
  ((prog-mode-hook TeX-mode-hook) . yas-minor-mode))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet
  :custom
  (yas-snippet-dirs `(,(expand-file-name "snippets/" user-emacs-directory)))
  :config
  (yas-reload-all))

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
