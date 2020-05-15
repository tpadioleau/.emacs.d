;;; init-emacs-lisp.el --- Initialize emacs-lisp configuration.

;; Copyright (C) 2020 Thomas Padioleau

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

;; Initialize emacs-lisp configuration.

;;; Code:

(use-package flycheck-package
  :ensure t
  :hook
  (emacs-lisp-mode-hook . flycheck-package-setup))

(provide 'init-emacs-lisp)
;;; init-emacs-lisp.el ends here
