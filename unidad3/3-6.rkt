;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3-6) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

;6
;representamos un mini editor de texto, el cual captura los valores de la tecla presionada
;y muestra esos valores en pantalla, ademas permite borrar caracteres al presionar backspace.

(define HEIGHTC 800)
(define WIDTHC 60)
(define CADENA "")

; drawer : Estado-> Image
; dado un estado, devuelve la imagen a mostrar
(define (drawer t)
  (place-image/align
   (text t 20 "indigo")
   0 0 "left" "top"
   (empty-scene HEIGHTC WIDTHC)))

; newtext : Estado String -> Image
; dado un Estado y un String, devuelve una imagen mostrando los valores de las teclas presionadas
(define (newtext t k)
  (cond
    [(string=? k "\b")
     (if (> (string-length t) 0)
         (substring t 0 (- (string-length t) 1))
         t)]
    [else (string-append t k)]))


(big-bang CADENA ; estado inicial
  [to-draw drawer] ; evento obligatorio
  [on-key newtext]) 


