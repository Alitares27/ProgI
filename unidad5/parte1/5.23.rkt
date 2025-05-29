;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.23|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 23

; longcad : String -> Number
; dada una cadena devuelve su longitud
(define (longcad c)
  (string-length c))

; longitudes : Listof Strings -> Listof Numbers
; dada una lista de Strings devuelve la longitud
; de cada String

(define (longitudes l)
  (if (empty? l)empty
      (cons (longcad (first l))
            (longitudes (rest l)))))

(longitudes(list "hola" "cómo" "estás?"))