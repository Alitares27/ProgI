;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.6|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 6
(define (contiene-Marcos? l)
  (cond [(empty? l) #false]
        [(cons? l) (if (string=? (first l) "Marcos")
                       #true
                       (contiene-Marcos? (rest l)))]))


(contiene-Marcos? (cons "Marcos" (cons "C" '())))

(contiene-Marcos? (cons "A" (cons "B" (cons "C" '()))))