;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.7|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 7
(define Lista-de-montos '())
(define montos (cons 5
                     (cons 25
                            (cons 50
                                  (cons 75
                                        (cons 100 Lista-de-montos))))))
(define (suma l)
  (foldr + 0 l))

(check-expect(suma montos)255)