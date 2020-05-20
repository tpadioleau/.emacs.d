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
  :hook
  ((prog-mode-hook TeX-mode-hook) . company-mode)
  :bind
  (:map company-mode-map ("TAB" . company-indent-or-complete-common))
  :custom
  (company-idle-delay 0.25)
  (company-minimum-prefix-length 2)
  (company-tooltip-align-annotations t))

(when (>= emacs-major-version 26)
  (use-package company-box
    :ensure t
    :if (display-graphic-p)
    :hook
    (company-mode-hook . company-box-mode)
    :custom
    (company-box-icons-alist 'company-box-icons-all-the-icons)))

(provide 'init-company)
;;; init-company.el ends here
