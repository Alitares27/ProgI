;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.15|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 15

(define MAX 5)

; alorigen : Posn -> Number
; dada una coordenada devuelve la distancia
; al origen de dicha coordenada 
(define (alorigen n)
  (sqrt (+ (sqr (posn-x n))(sqr (posn-y n)))))

(alorigen (make-posn 3 4))


; cerca : Listof Posn -> Posn
; dada una lista de Posn devuelve una lista
; de coordenada que son menor a la constante MAX
(define (cerca l)
  (cond
    [(empty? l) '()]
    [(< (alorigen (first l)) MAX)
     (cons (first l)(cerca (rest l)))]
    [else (cerca (rest l))])) 

(cerca (list (make-posn 3 5)
             (make-posn 1 2)
             (make-posn 0 1)
             (make-posn 5 6)))

