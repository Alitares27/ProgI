;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.22|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 22

; alcuadrado : Number -> Number
; dado un numero eleva al cuadrado
; dicho numero
(define (alcuadrado x)
  (sqr x))


; cuadrados : Listof Numbers -> Listof Number
; dad una lista de numeros devuelve otra lista
; con los cuadrados de cada numero de la lista
(define (cuadrados l)
  (if (empty? l)
      empty
      (cons (alcuadrado (first l))
            (cuadrados (rest l)))))

  (cuadrados (list 2 3 4)) 