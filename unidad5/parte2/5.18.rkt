;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.18|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 18 - Definiciones locales

(define (mayores l m)
  (local (
          ; mayora? : Number -> Boolean
          ; Retorna verdadero si el número
          ; es mayor a m y mayor que 0
          (define (mayora? n)
            (and (> n 0) (> n m))))
    (filter mayora? l)))

(check-expect(mayores (list -5 0 8 5 6 2) 5)(list 8 6))