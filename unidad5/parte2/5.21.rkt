;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.21|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 21

; sumar : Listod Numbers Number -> Listof Number
; dada una lista de numeros devuelve una lista
; de numeros sumando el termino dado a cada numero de la lista


(define (elevar l t)
  (local (
          (define (termino n)
            (expt n t)))
    (map termino l))) 

(check-expect(elevar (list 3 0 2 1) 3)(list 27 0 8 1))