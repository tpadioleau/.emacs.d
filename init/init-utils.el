;; init-utils.el --- Initialize utils configuration.

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

;; Initialize utils configuration.

;;; Code:

(use-package which-key
  :ensure t
  :hook
  ((prog-mode-hook text-mode-hook) . which-key-mode)
  :custom
  (which-key-popup-type 'side-window))

;; profiling package
(use-package esup
  :ensure t
  :no-require t)

(provide 'init-utils)
;;; init-utils.el ends here
