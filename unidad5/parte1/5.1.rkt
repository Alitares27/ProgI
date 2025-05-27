;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 5.1-1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 1
(cons "Elif"(cons "Dave"(cons "Carl"(cons "Bea"(cons "Ali" '())))))

;Ej. 2
(cons "1" (cons "2" '()))

;es un ejemplo de lista de Contactos y por qué (cons 2 '()) no lo es.
; La lista de contactos debe estar compuesta por Strings, no por numeros.

;Ej. 3

(cons #true (cons #false '()))