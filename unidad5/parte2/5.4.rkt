;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 4

(define MAX 5)

; alorigen : Posn -> Boolean
; dada una coordenada, devuelve #t si la distancia
; al origen de dicha coordenada es menor a MAX
(define (alorigen? n)
  (if (< (sqrt(+ (sqr (posn-x n))(sqr (posn-y n)))) MAX)
      #t #f))

; cerca : Listof Posn -> Listof Posn
; filtra los elementos de la lista cuya distancia sea menor a MAX

(define (cerca l)
  (cond
    [(empty? l) empty]
    [else (filter alorigen? l)]))

(cerca (list (make-posn 3 5) (make-posn 1 2) (make-posn 0 1) (make-posn 5 6)))
