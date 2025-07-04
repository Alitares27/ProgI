;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.9|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 9
(define (todos-verdaderos l)
  (cond
    [(empty? l) #true]
    [(boolean=? (first l) #t) (todos-verdaderos (rest l))]
    [else #false]))

(define (uno-verdadero l)
  (cond
    [(empty? l) #f]
    [(boolean=? (first l) #t)#t]
    [else (uno-verdadero (rest l))]))

(check-expect(todos-verdaderos '(#f #t #f))#f)
(check-expect(uno-verdadero '(#t #t #f))#t)

