(deftheme sux "A theme by sux")


;; NOTE: https://github.com/alezost/alect-themes/#emacs-2431-and-earlier
(when (version< emacs-version "24.4")
  (progn
    ;; WORKAROUND https://github.com/alezost/alect-themes/#emacs-2431-and-earlier
    (defun face-spec-recalc-new (face frame)
      "Improved version of `face-spec-recalc'."
      (while (get face 'face-alias)
        (setq face (get face 'face-alias)))
      (face-spec-reset-face face frame)
      (let ((theme-faces (get face 'theme-face)))
        (if theme-faces
            (dolist (spec (reverse theme-faces))
              (face-spec-set-2 face frame (cadr spec)))
          (face-spec-set-2 face frame (face-default-spec face))))
      (face-spec-set-2 face frame (get face 'face-override-spec)))
    (defadvice face-spec-recalc (around new-recalc (face frame) activate)
      "Use `face-spec-recalc-new' instead."
      (face-spec-recalc-new face frame))))

;; "C-u C-x =" useful for inspecting misbehaving faces.
;; "M-x list-faces-display" useful for listing everything that new major modes introduce.


(let
    ((mono-font "Droid Sans Mono")
     (no-mono-font "Droid Sans")

     ;; named colors
     (gray-1 "#828282")
     (gray-1bg "#0a0a0a")
     (gray-2 "#333333")
     (gray-2bg "#111111")
     (gray-3 "#aaaaaa")
     (gray-3bg "#141414")
     (gray-4 "#252525")
     (gray-4bg "#171717")
     (gray-5 "#2a2a2a")
     (gray-5bg "#1a1a1a")
     (gray-6 "#202020")
     (gray-6bg "#1e1e1e")

     (red-1 "#d13120")
     (red-1bg "#1D1515")
     (red-2 "#b23f1e")
     (red-2bg "#251c1e")

     (brown-1 "#9f621d")
     (brown-1bg "#2a1f1f")

     (orange-1 "#d97a35")
     (orange-1bg "#1F1710")

     (yellow-1 "#deae3e")
     (yellow-1bg "#18140C")

     (green-1 "#81af34")
     (green-1bg "#1a2321")
     (green-2 "#4e9f75")
     (green-2bg "#1a2321")

     (turquoise-1 "#11535F")
     (turquoise-2 "#07272D")
     (turquoise-1bg "#05181C")
     (turquoise-2bg "#041316")

     (blue-1 "#7e9fc9")
     (blue-1bg "#1e252f")
     (blue-2 "#417598")
     (blue-2bg "#1b333e")
     (blue-3 "#00959e")
     (blue-3bg "#132228")
     (blue-4 "#365e7a")
     (blue-4bg "#172028")

     (purple-1 "#a878b5")
     (purple-1bg "#1D1B25")

     ;; special colors
     (background "#110F13")
     (alt-background "#111013")
     (foreground "#aaaaaa")
     (hl-line "#11151a")
     (selection "#311500")

     (sux-bg-1 "#0a0a0a")
     (sux-bg "#292B2E")
     (sux-bg+1 "#221F27")
     (sux-bg+2 "#232529")
     (sux-bg+3 "#333333")

     (sux-fg-1 "#666666")
     (sux-fg "#828282")
     (sux-fg+1 "#aaaaaa")

     (sux-green "#2e8b57")
     (sux-puke "#59A632")

     (sux-blue-4 "#1e252f")
     (sux-blue-1 "#417598")
     (sux-blue "#5283CC")

     (sux-red-1 "#b23f1e")
     (sux-red "#B44D4D")

     (sux-orange+1 "#FF9819")
     (sux-orange "#d97a35")
     (sux-yellow "#deae3e")
     (sux-brown "#9f621d")
     (sux-purple "#a878b5")
     (sux-white "#f5f5f5")

     (sux-aqua-1 "#565A60")
     (sux-aqua "#00959e")
     )

(custom-theme-set-faces
 'sux

 ;; Basics
 `(default
    ((t (:foreground ,sux-fg :background ,sux-bg
                     :family ,mono-font :height 100))))

 `(link ((t (:foreground ,sux-aqua :underline t ))))
 `(highlight ((t (:foreground ,sux-blue ))))

 `(fringe ((t (:background ,sux-bg+1 ))))
 `(vertical-border ((t (:foreground ,gray-5 :background ,sux-bg ))))

 `(cursor ((t (:background ,sux-fg))))
 `(region ((t (:foreground nil :background ,sux-bg+1))))
 `(hl-line ((t (:background ,hl-line))))
 `(minibuffer-prompt ((t (:foreground ,sux-fg ))))
 `(escape-glyph ((t (:foreground ,sux-red))))

 ;; Font-lock stuff
 `(font-lock-builtin-face ((t (:foreground ,sux-blue :weight bold))))
 `(font-lock-constant-face ((t (:foreground ,sux-purple))))
 `(font-lock-comment-face ((t (:foreground ,sux-aqua-1))))
 `(font-lock-comment-delimiter-face ((t (:foreground ,sux-aqua-1))))
 `(font-lock-doc-face ((t (:foreground ,sux-aqua))))
 `(font-lock-doc-string-face ((t (:foreground ,sux-aqua))))
 `(font-lock-function-name-face ((t (:foreground ,sux-red-1 ))))
 `(font-lock-keyword-face ((t (:foreground ,sux-blue-1))))
 `(font-lock-negation-char-face ((t (:foreground ,sux-yellow))))
 `(font-lock-preprocessor-face ((t (:foreground ,sux-orange))))
 `(font-lock-string-face ((t (:foreground ,sux-green))))
 `(font-lock-type-face ((t (:foreground ,sux-red))))
 `(font-lock-variable-name-face ((t (:foreground ,sux-red))))
 `(font-lock-warning-face ((t (:foreground ,sux-red-1 ))))


 ;;  Custom elements and widgets
 `(widget-field
   ((t (:background ,turquoise-1bg :box (:line-width 2 :color "black" :style pressed-button)))))
 `(custom-button
   ((t (:foreground ,sux-fg+1 :background ,gray-6bg :family ,no-mono-font :box
                    (:line-width 2 :color "black" :style released-button)))))
 `(custom-button-mouse
   ((t (:background "gray17" :foreground ,sux-white
                    :family ,no-mono-font :box
                    (:line-width 2 :color "black" :style released-button)))))
 `(custom-button-pressed
   ((t (:background ,sux-bg :foreground ,sux-white
                    :family ,no-mono-font :box
                    (:line-width 2 :color "black" :style pressed-button)))))
 `(custom-group-tag
   ((t (:foreground ,sux-blue :family ,no-mono-font :weight bold :height 1.4))))
 `(custom-group-tag-1
   ((t (:foreground ,sux-purple :family ,no-mono-font :weight bold :height 1.4))))
 `(custom-variable-tag
   ((t (:foreground ,green-2 :family ,no-mono-font :weight bold :height 1.1))))
 `(custom-state ((t (:foreground ,sux-green))))

 ;; ECB TODO
 `(ecb-default-general-face
   ((t (:foreground ,sux-fg+1 :background ,sux-bg-1 ))))
 `(ecb-default-highlight-face
   ((t (:foreground ,sux-red :background ,red-1bg ))))
 `(ecb-method-face ((t (:foreground ,sux-red :background ,red-1bg ))))
 `(ecb-tag-header-face ((t ( :background ,blue-2bg ))))

 ;; flyspell-mode TODO
 `(flyspell-incorrect ((t (:underline ,sux-red-1 ))))
 `(flyspell-duplicate ((t (:underline ,sux-red-1 ))))

 ;; highlight-indentation-mode TODO
 `(highlight-indentation-face ((t ( :background ,sux-bg-1 ))))
 `(highlight-indentation-current-column-face ((t ( :background ,gray-4 ))))

 ;; ido
 `(ido-only-match ((t (:foreground ,green-1 ))))
 `(ido-subdir ((t (:foreground ,sux-purple))))

 ;; Linum
 `(linum ((t (:foreground ,sux-fg :background ,alt-background :height 90 ))))

 ;; magit and diff-mode
 `(diff-file-header ((t (weight: bold :background ,sux-bg+3 ))))
 `(diff-hunk-header ((t ( :background ,sux-bg ))))
 `(magit-diff-hunk-header ((t (:foreground ,sux-fg+1 :background ,sux-bg ))))
 `(magit-item-highlight ((t ( :background  ,sux-bg+2))))
 `(magit-diff-file-header ((t ( :background ,sux-bg ))))
 `(magit-section-title ((t (:foreground ,sux-fg+1 ))))
;; `(magit-section ((t (:background ,sux-bg ))))
 `(magit-diff-add ((t (:foreground ,sux-green))))
 `(magit-diff-del ((t (:foreground ,sux-aqua-1 ))))
 `(magit-diff-none ((t (:foreground ,sux-fg ))))
 `(magit-whitespace-warning-face ((t ( :background ,sux-yellow ))))

 ;; Mode Line
 `(mode-line
   ((t (:foreground ,sux-fg :background ,sux-bg+1 :box nil
                    :height 95 :family ,no-mono-font))))
 `(mode-line-inactive
   ((t (:foreground ,sux-bg+3 :background ,sux-bg+1 :box nil
                    :height 95 :family ,no-mono-font))))
 `(mode-line-highlight
   ((t (:foreground ,sux-fg+1 :background ,sux-bg+1 :box nil ))))

 ;; nxhtml mode
 `(mumamo-background-chunk-major ((t ( :background ,sux-bg ))))
 `(mumamo-background-chunk-submode1 ((t (:background ,sux-bg ))))

 ;; org-mode TODO
 `(org-date ((t (:foreground ,sux-purple :background ,purple-1bg ))))
 `(org-done ((t (:foreground ,green-1 :background ,green-1bg ))))
 `(org-hide ((t (:foreground ,sux-bg+3 :background ,sux-bg-1 ))))
 `(org-link ((t (:foreground ,sux-blue))))
 `(org-todo ((t (:foreground ,sux-red :background ,red-1bg ))))

 ;; show-paren-mode TODO
 `(show-paren-match ((t (:foreground ,sux-orange :background ,orange-1bg ))))
 `(show-paren-mismatch ((t (:foreground ,red-1bg :background ,sux-red-1 ))))

 ;; whitespace-mode
 `(whitespace-empty ((t (:background ,sux-yellow))))
 `(whitespace-hspace ((t (:foreground ,sux-bg+3 ))))
 `(whitespace-indentation ((t (:foreground ,sux-bg+3 ))))
 `(whitespace-line ((t (:background ,sux-bg+1 ))))
 `(whitespace-newline ((t (:foreground ,sux-bg+3 ))))
 `(whitespace-space ((t (:foreground ,sux-bg+3 ))))
 `(whitespace-space-after-tab ((t (:foreground ,sux-bg+3 ))))
 `(whitespace-tab ((t (:foreground ,sux-bg+3 ))))
 `(whitespace-trailing ((t (:background ,sux-yellow))))

 )

(custom-theme-set-variables
 'sux

 `(powerline-color1 ,sux-bg+2)
 `(powerline-color2 ,sux-bg+1)
 `(powerline-color3 ,sux-bg+1)

 `(powerline-arrow-shape 'rounded)
 `(Linum-format "%7i ")
 `(fringe-mode 4)

 ;; Fill Column Indicator mode
 `(fci-rule-color ,sux-bg+2)
 `(fci-rule-character-color ,sux-bg+2)

 `(ansi-color-names-vector
   ;; black, red, green, yellow, blue, magenta, cyan, white
   [,sux-bg ,sux-red ,sux-green ,sux-yellow ,sux-blue ,sux-purple ,sux-blue ,sux-fg])
 `(ansi-term-color-vector
   ;; black, red, green, yellow, blue, magenta, cyan, white
   [unspecified ,background ,sux-red ,sux-green ,sux-yellow ,sux-blue ,sux-purple ,sux-blue ,sux-fg])
 )
)
;; Rainbow delimiters

(defun sux-rainbow-delim-set-face ()
  (set-face-attribute 'rainbow-delimiters-depth-1-face nil :foreground "#30828F" )
  (set-face-attribute 'rainbow-delimiters-depth-2-face nil :foreground "#2c7580" )
  (set-face-attribute 'rainbow-delimiters-depth-3-face nil :foreground "#276872" )
  (set-face-attribute 'rainbow-delimiters-depth-4-face nil :foreground "#225B64" )
  (set-face-attribute 'rainbow-delimiters-depth-5-face nil :foreground "#1D4E55" )
  (set-face-attribute 'rainbow-delimiters-depth-6-face nil :foreground "#184147" )
  (set-face-attribute 'rainbow-delimiters-depth-7-face nil :foreground "#133439" )
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil :foreground "#eF3000" )
  )
(eval-after-load "rainbow-delimiters" '(sux-rainbow-delim-set-face))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'sux)
