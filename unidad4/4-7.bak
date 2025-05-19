;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 4-7) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej7

(require 2htdp/image)
(require 2htdp/universe)


; Representamos el desplazamiento de una imagen sobre un plano,
; la cual posee una posicion que puede ser modificada al presionar una tecla o presionar el mouse

(define AUTOIMG (bitmap "C:/Users/aldai/OneDrive/UNR/Racket/car.png"))
(define LONGITUD 600)
(define ANCHURA 200)
(define LIMITED (- LONGITUD 60))
(define LIMITEI (+ LONGITUD 60))
(define INITIAL 60)

(define-struct Auto [hpos vel])

; screen : Estado -> Image
; Dado un estado, dibuja la imagen del auto en su posición correspondiente
(define (screen m)
  (place-image AUTOIMG
               m (- ANCHURA 30)
               (place-image
                (rectangle LONGITUD 20 "solid" "black")
                (/ LONGITUD 2) (- ANCHURA 10)
               (empty-scene LONGITUD ANCHURA))))

; driver : Estado String -> Estado
; dado una tecla presionada, mueve el auto, lo reinicia o lo deja igual
(define (driver m k)
  (cond [(string=? k "up") (avanzar m)]
        [(string=? k "down") (retroceder m)]
        [(string=? k " ") INITIAL]))

; avanzar : Estado -> Estado
; Aumenta la posición del auto en X, hasta un límite derecho
(define (avanzar m)
  (if (>= m LIMITED)
      m  
      (+ m 3)))

; retroceder : Estado -> Estado
; Disminuye la posición del auto en X, hasta un límite izquierdo
(define (retroceder m)  
  (if (<= m 0)  
      m 
      (- m 3)))

; manipulador : Estado Number Number String -> Estado
; al presionar el mouse, mueve el auto a la posición X del clic
(define (manipulador m x y event)
  (cond [(string=? event "button-down") x]
        [else m]))


(big-bang INITIAL
  [to-draw screen]
  [on-tick avanzar 0.5]
  [on-key driver]
  [on-mouse manipulador]
  )