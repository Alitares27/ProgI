;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.19|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 19

; alorigen : Posn -> Number
; dada una coordenada devuelve la distancia
; al origen de dicha coordenada 
(define (alorigen n)
  (sqrt (+ (sqr (posn-x n))(sqr (posn-y n)))))

; distancias : Listof Posn -> Listof Number
; dado una lista de posn devuelve una lista
; de la distancia al origen de dicho  
(define (distancias l)
  (cond
    [(empty? l) '()]
    [else (map alorigen l)]))

(distancias (list (make-posn 3 4) (make-posn 0 4) (make-posn 12 5)))
