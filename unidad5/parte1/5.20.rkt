;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.20|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 20

(require 2htdp/image)

; img : Image -> Number 
; dada una imagen, devuelve su ancho
(define (img i)
  (image-width i))

; anchos : Listof Image -> Listof Numbers
; dada una lista de imagenes,
; devuelve una lista de numeros
; de los anchos de cada imagen
(define (anchos l)
  (cond [(empty? l) empty]
        [else(cons(img (first l))(anchos (rest l)))]))


(anchos (list (circle 30 "solid" "red") (rectangle 10 30 "outline" "blue")))