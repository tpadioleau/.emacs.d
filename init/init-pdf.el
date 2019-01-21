;; init-pdf.el --- Initialize pdf configuration.

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

;; Initialize pdf configuration.

;;; Code:

(use-package pdf-tools
  :ensure t
  :mode ("\\.[pP][dD][fF]\\'" . pdf-view-mode)
  :hook (pdf-view-mode . (lambda ()
                           (display-line-numbers-mode -1)
                           (projectile-mode -1)))
  :config (pdf-tools-install))

(provide 'init-pdf)
;;; init-pdf.el ends here