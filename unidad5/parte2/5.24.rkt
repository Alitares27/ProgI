;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.24|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 24

; puntos : Listof Posn -> Number
; dada una lista de Posn devuelve su distancia la origen
(define (puntos l)
  (sqrt (+ (sqr (posn-x l))(sqr (posn-y l)))))

; alorigen : Listof Posn -> Listof of Numbers
; dada una lista de numeros devuelve una lista
; de distancias de los pintos
(define (alorigen l)
  (map puntos l))

; suma : Listof Numbers -> Listof Numbers
; dada una lista de nuemeros suma los elementos de la lista
(define (suma l )
  (foldr + 0 l))

; sumdist -> Listof Posn -> Number
; dada una lista de Posn, devuelve la suma de las
; distancias de cada punto al origen
(define (sumdist l)
  (suma(alorigen l)))

(check-expect(sumdist (list (make-posn 3 4) (make-posn 0 3)))8)