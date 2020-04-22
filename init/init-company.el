;;; init-company.el --- Initialize company configuration.

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

;; Initialize company configuration.

;;; Code:

(use-package company
  :ensure t
  :hook ((prog-mode TeX-mode) . company-mode)
  :config (setq company-idle-delay 0.25))

(when (>= emacs-major-version 26)
  (use-package company-box
    :ensure t
    :if (display-graphic-p)
    :hook (company-mode . company-box-mode)))

(provide 'init-company)
;;; init-company.el ends here
