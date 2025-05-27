;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.8|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 8

(define (pos? l)
  (cond
    [(empty? l) #true]
    [(> (first l) 0) (pos? (rest l))]
    [else #false]))

(define (suma l)
  (foldr + 0 l))

(define (checked-suma l)
  (if (pos? l)
      (suma l)
      "No todos los montos son positivos."))

(check-expect(checked-suma '(5 10 15))30) 