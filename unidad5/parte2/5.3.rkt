;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 3
; corta? : String -> Boolean
; Dada un string devuelve #t si la longitud
; de la cadena es menor a 5
(define (corta? s)
  (if (<(string-length s)5)#t #f))

; cortas : Listof Strings -> Listof Strings
; Dada 
(define (cortas l)
  (cond
    [(empty? l) empty]
    [else (filter corta? l)]))

(cortas (list "Lista" "de" "palabras" "sin" "sentido"))