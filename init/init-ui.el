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

(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))
(setq inhibit-startup-screen t)
(setq frame-resize-pixelwise t)
(toggle-frame-maximized)

(when (>= emacs-major-version 26)
  (use-package display-line-numbers
    :ensure nil
    :hook (after-init . global-display-line-numbers-mode)
    :hook (after-init . column-number-mode)))

(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-mode)
  :config (setq doom-modeline-icon nil))

(use-package doom-themes
  :ensure t
  :config (progn (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
                       doom-themes-enable-italic t) ; if nil, italics is universally disabled
                 (load-theme 'doom-vibrant t)
                 (doom-themes-visual-bell-config)))

(provide 'init-ui)
;;; init-ui.el ends here
