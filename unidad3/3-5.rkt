;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3-5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

;5
(define HEIGHT 300)
(define WIDTH 300)
(define CENTER (/ HEIGHT 2))
(define DELTA 10)
(define INIT "yellow")
(define RADIUS 30)

; designer : Estado-> Image
; dado un estado, devuelve la imagen a mostrar
(define (designer t)
  (place-image (circle RADIUS "solid" t)
               CENTER
               CENTER
               (empty-scene HEIGHT WIDTH)))


; newcolor : String -> String
; dado un color, devuelve el siguiente color del cırculo
(define (newcolor t)
  (cond [(string=? t "yellow") "red"]
        [(string=? t "red") "green"]
        [(string=? t "green") "blue"]
        [(string=? t "blue") "yellow"]
        [else t]))

(big-bang INIT ; estado inicial
  [to-draw designer] ; evento obligatorio
  [on-tick newcolor 1])

