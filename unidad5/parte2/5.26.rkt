;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.26|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 26

; transformar : Listof Numbers -> Listof Numbers
; dado un numero devuelve su valor absoluto
(define (transformar l)
  (map abs l))

; sumAbs : Listof Number -> Number
; dada una lista de numeros devuelve la suma de ellos
(define (sumAbs l)
  (foldr + 0 (transformar l)))

(check-expect(sumAbs (list 3 -2 4 0 1 -5))15)

