;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.11|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 11

(define (cant l)
  (cond
    [(empty? l)0]
    [else(+ 1 (cant (rest l)))]))


(define (sumar l)
  (cond
    [(empty? l) 0]
    [else (+ (first l) (sumar (rest l)))]))


(define (promedio l)
  (cond
    [(empty? l)0]
    [else(/
          (sumar l)
         (cant l))]))


(promedio '(5 5 5 5 5))