;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.25|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 25

;verificar : Number -> Boolean
; dado un numero devuelve #t si el numero es positivo
(define (verificar l)
  (> l 0))

; filtrar : Listof Numbers -> List of Numbers
; dada una lista de numeros filtra los numeros positivos
(define (filtrar l)
  (filter verificar l))

; multPos : Listof Numbers -> Number
; dada una lista de numeros devuelve el
; productos de los numeros positivos
(define (multPos l)
  (foldr * 1 (filtrar l)))

(check-expect(multPos (list 3 -2 4 0 1 -5))12)

