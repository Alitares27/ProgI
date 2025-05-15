;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname practica4) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej1

(define p (make-posn 3 4))
(define q (make-posn -2 0.5))

(check-expect(posn-x p)3) ;3
(check-expect(- (posn-y p) (posn-y q))3.5) ; 3.5
(check-expect(posn-y (make-posn (posn-x p) (posn-x q)))-2) ;-2
































