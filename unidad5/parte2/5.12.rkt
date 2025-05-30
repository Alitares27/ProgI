;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.12|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 12

; farCel: Number -> Number
; dada una temperatura en Fahrenheit,
; convierte dicha temperatura a Celsius
(define (farCel f)(/ (* (- f 32) 5) 9))

; convertirFC : Listof Number -> Listof Number
; Dada una lista de temperaturas en Fahrenheit
; devuelve una lista con la temperatura equivalente
; en Celsius
(define (convertirFC l)
  (if (empty? l) empty
      (map farCel l)))

(convertirFC (list 32 68 50)) 