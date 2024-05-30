(define (hide-all-layers image)
  (for-each layer-hide (image-layers image)))

(define (layer-hide layer)
  (gimp-item-set-visible layer 0))

(define (layer-show layer)
  (gimp-item-set-visible layer 1))

(define (image-layers image)
  (vector->list (cadr (gimp-image-get-layers image))))

(define (image-laysers-length image)
  (vector-length (cadr (gimp-image-get-layers image))))

(define (seq n)
  (letrec ((seq-inc
            (lambda (x y)
              (if (= x y)
                  (list y)
                  (cons x
                        (seq-inc (+ x 1) y))))))
    (seq-inc 0 n)))

(define (format-png-filename index)
  (string-append "pdf2png-" (number->string index) ".png"))

(define (make-path dir filename)
  (string-append dir "/" filename))

(define (png-filenames dir indexes)
  (map (lambda (n) (make-path dir (format-png-filename n))) indexes))

(define (pdf2png image)
  (lambda (layer png-filename)
    (layer-show layer)
    (file-png-save-defaults RUN-NONINTERACTIVE image layer png-filename png-filename)
    (layer-hide layer)))

(define (script-fu-export-pdf2png image drawable path)
  (hide-all-layers image)
  (for-each (pdf2png image)
            (image-layers image)
            (png-filenames path (seq (image-laysers-length image)))))

(script-fu-register "script-fu-export-pdf2png"  ; 登録する関数の名前
 "Export PDF to PNG"                            ; メニュー項目のラベル
 "Exports pdf to png file"                      ; メニュー項目の説明
 ""                                             ; 作成者の名前
 ""                                             ; 著作権者の名前
 "May 31, 2024"                                 ; 作成日(改訂日)
 "RGB* GRAY*"                                   ; メニュー項目を有効にするための条件
 SF-IMAGE    "Image" 0                          ; 画像番号
 SF-DRAWABLE "Drawable" 0
 SF-DIRNAME "Path" "/tmp")

(script-fu-menu-register "script-fu-export-pdf2png" ; 対象の関数の名前
                         "<Image>/Filters/Export")  ; メニュー項目の位置
