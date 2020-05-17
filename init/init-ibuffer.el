;; init-buffer.el --- Initialize ibuffer configurations.

;; Copyright (C) 2006-2020 Vincent Zhang

;; Author: Vincent Zhang <seagle0128@gmail.com>
;; URL: https://github.com/seagle0128/.emacs.d
;; Author: Thomas Padioleau <padioleau.thomas@gmail.com>
;; URL: https://github.com/tpadioleau/.emacs.d

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;

;;; Commentary:
;;
;; IBuffer configurations.
;;

;;; Code:

(use-package ibuffer
  :ensure nil
  :bind
  ("C-x C-b" . ibuffer))

(use-package all-the-icons-ibuffer
  :ensure t
  :hook
  (ibuffer-mode-hook . all-the-icons-ibuffer-mode))

(use-package ibuffer-projectile
  :ensure t
  :init
  (defun apply-ibuffer-projectile ()
    ""
    (ibuffer-projectile-set-filter-groups)
    (unless (eq ibuffer-sorting-mode 'alphabetic)
      (ibuffer-do-sort-by-alphabetic)))
  :hook
  (ibuffer-hook . apply-ibuffer-projectile))

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
