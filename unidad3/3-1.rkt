;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname practica3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

;Ejercicio 1
; Estado es un string, que representa el color del círculo a dibujar en pantalla.
; Posibles valores:
; - "blue"
; - "red"
; - "green"

; interpretar: Estado -> Image
; dado un estado, devuelve la imagen a mostrar por el programa
; (omitimos los ejemplos para faciltar la legibilidad)

(define INICIAL "blue")
(define
  (interpretar s)
  (place-image (circle 50 "solid" s) 100 100 (empty-scene 200 200)))

; manejarTeclado: Estado String -> Estado
(define (manejarTeclado s k) (cond [(key=? k "a") "blue"]
                                   [(key=? k "r") "red"]
                                   [(key=? k "v") "green"]
                                   [(key=? k "n") "black"]
                                   [(key=? k " ") INICIAL]
                                   [else s]))

(big-bang INICIAL ; estado inicial del sistema
  [to-draw interpretar] ; dibuja en la pantalla 
                        ; el círculo en el estado actual
  [on-key manejarTeclado])  ; cuando se presiona una tecla,
                            ; la función manejarTeclado
                            ; se invoca para manejar el evento)






























