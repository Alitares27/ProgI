;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.20|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 20

; lejos : Listof Posn -> Listof Posn
; dada una lista de puntos devuelve la lista de puntos
; cuya distancia sean mayor al numero dado al origen

(define (lejos l d)
  (local ((define (alorigen n)
  (>(sqrt (+ (sqr (posn-x n))(sqr (posn-y n))))d)))
    (filter alorigen l)))

(check-expect(lejos (list (make-posn 3 5) (make-posn 1 2) (make-posn 0 1) (make-posn 5 6)) 4)(list (make-posn 3 5) (make-posn 5 6)))