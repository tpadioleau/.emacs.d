;; init-ui.el --- Initialize ui configuration.

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

;; Visual (UI) configurations.

;;; Code:

(setq inhibit-startup-screen t)
(setq frame-inhibit-implied-resize t)
(setq frame-resize-pixelwise t)

(push '(cursor-type . bar) default-frame-alist)
(push '(fullscreen . maximized) default-frame-alist)
(push '(horizontal-scroll-bars . nil) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)

(use-package simple
  :ensure nil
  :hook (after-init . column-number-mode)
  :hook (after-init . line-number-mode)
  :hook (after-init . size-indication-mode))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p)
  :defer t)

(when (>= emacs-major-version 26)
  (use-package display-line-numbers
    :ensure nil
    :hook ((prog-mode text-mode) . display-line-numbers-mode)))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config (setq doom-modeline-icon t))

(use-package doom-themes
  :ensure t
  :config (progn (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
                       doom-themes-enable-italic t) ; if nil, italics is universally disabled
                 (load-theme 'doom-vibrant t)
                 (doom-themes-visual-bell-config)))

(provide 'init-ui)
;;; init-ui.el ends here
