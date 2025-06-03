;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.19|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 19

; largas : Listof Strings Number -> Listof Strings
; dada una lista de strings y un numero devuelve las strings,
; cuya logitud sean mayores al numero dado. 

(define (largas l t)
  (local(
         (define (longitud s)
           (>(string-length s)t)))
    (filter longitud l)))

(check-expect(largas (list "Hola" "estudiantes" "de" "LCC" "Rosario") 4)(list "estudiantes" "Rosario"))  