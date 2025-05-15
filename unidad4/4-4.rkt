;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 4-4) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej4
(define (distancia p1 p2)
  (if (and (posn? p1) (posn? p2))
      (sqrt (+ (sqr (- (posn-x p2) (posn-x p1)))
               (sqr (- (posn-y p2) (posn-y p1)))))
      "Tipos incorrectos para la función."))

(check-expect(distancia (make-posn 0 0)(make-posn 3 4))5)

