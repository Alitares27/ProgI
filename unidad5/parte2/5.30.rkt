;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.30|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 30

; cant : Listof Any -> Number
; devuelve la cantidad de elementos de la lista
(define (cant l)
  (cond
    [(empty? l) 0]
    [else (+ 1 (cant (rest l)))]))

; longitud : Listof Any -> Boolean
; devuelve #t si la lista tiene más de 4 elementos
(define (longitud l)
  (> (cant l) 4))

; long-lists : Listof (Listof Any) -> Boolean
; devuelve #t si alguna sublista tiene más de 4 elementos
(define (long-lists l)
  (cond
    [(empty? l) #f]
    [(longitud (first l)) #t]
    [else (long-lists (rest l))]))

(check-expect(long-lists (list (list 1 2 3 4 5) (list 1 2 3 4 5 6) (list 87 73 78 83 33)))#t)
(check-expect(long-lists (list '() '() (list 1 2 3)))#f)
(check-expect(long-lists (list (list 1 2 3 4 5) empty))#t)