;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 5

(define contactos
  (cons "Eugenia"
  (cons "Lucia"
    (cons "Dante"
      (cons "Federico"
        (cons "Marcos"
          (cons "Gabina"
            (cons "Laura"
              (cons "Pamela" '())))))))))

(define (contiene? l s)
  (cond [(empty? l) #false]
        [(string=? (first l) s) #true]
        [else (contiene? (rest l) s)]))

(contiene? contactos "Eugenia")



(check-expect(member? "Laura" contactos) #t)