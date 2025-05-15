;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 4-2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej2
(define (dist-origen p)
  (sqrt (+ (sqr (posn-x p))(sqr (posn-y p)))))

(check-expect(dist-origen (make-posn (/ 6 2) 4))5)
(check-expect(+ (dist-origen (make-posn 12 5)) 4)17)

