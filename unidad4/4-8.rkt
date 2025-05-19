;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 4-8) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 8

(define-struct texto [s color tam])
; Texto es (String, Color, Number)
; Intepretación: El primer elemento es la cadena a mostarse, mientras que el segundo y
; el tercero determinan el color y tamaño de la fuente en píxeles respectivamente.

(define HEIGHTC 800)
(define WIDTHC 60)
(define CADENA (make-texto " " "black" 20))

; escritor : Estado -> Estado
; dado un estado y un string, devuelve la imagen a mostrar
(define (escritor c)
  (place-image/align
   (text (texto-s c) (texto-tam c) (texto-color c))
   0 0 "left" "top"
   (empty-scene HEIGHTC WIDTHC)))

; ncadena : Estado String -> Image
; dado un Estado y un String, devuelve una imagen mostrando los valores de las teclas presionadas,
; ademas el texto puede cambia de tamaño y color 
(define (ncadena s k)
  (cond
    [(string=? k "\b") 
     (if (> (string-length (texto-s s)) 0)
         (make-texto (substring (texto-s s) 0 (- (string-length (texto-s s)) 1))
                     (texto-color s)
                     (texto-tam s))
         s)]
    [(string=? k "f1") (make-texto (texto-s s) "blue" (texto-tam s))]
    [(string=? k "f2") (make-texto (texto-s s) "green" (texto-tam s))]
    [(string=? k "f3") (make-texto (texto-s s) "red" (texto-tam s))]
    [(string=? k "f4") (make-texto (texto-s s) "yellow" (texto-tam s))]
    [(string=? k "f5") (make-texto (texto-s s) "orange" (texto-tam s))]
    [(string=? k "f6") (make-texto (texto-s s) "brown" (texto-tam s))]
    [(string=? k "up")(make-texto (texto-s s) (texto-color s) (+ (texto-tam s) 2))]
    [(string=? k "down")(make-texto (texto-s s) (texto-color s) (- (texto-tam s) 2))]
    [else (make-texto (string-append (texto-s s) k)
                      (texto-color s)
                      (texto-tam s))]))


(big-bang CADENA ; estado inicial
  [to-draw escritor] ; evento obligatorio
  [on-key ncadena])