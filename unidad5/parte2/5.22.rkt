;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.22|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 22

; elevar : Listof Numbers Number -> Listof Number
; dada una lista de numeros devuelve una lista
; de numeros elevando cada numero de la lista al termino dado 


(define (elevar l t)
  (local (
          (define (termino n)
            (+ n t)))
    (map termino l))) 

(check-expect(elevar (list 5 3 -4) 10)(list 15 13 6))
