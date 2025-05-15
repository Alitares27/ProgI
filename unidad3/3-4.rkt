;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3-4) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

;4
;representamos el movimiento de un cirlulo en un plano, dado una posicion en el plano
;El estado es un Number, que representa la posicion del círculo a dibujar en pantalla.
 
(define HEIGHT 300)
(define WIDTH 300)
(define RADIOI 20)
(define STARTX (/ WIDTH 2))
(define STARTY (/ HEIGHT 2))
(define CENTER (/ HEIGHT 2))

(define DELTA 10)

; creator : Event -> Number
; transforma el estado del sistema en una imagen a mostrar a través
; de la cláusula to-draw

(define
  (creator p)
  (place-image (circle RADIOI "solid" "green") STARTX p (empty-scene HEIGHT WIDTH)))


; upper : Number -> Number
; modifica restando la posicion vertical del circulo graficado en el plano,
;dependiendo del tamaño de la escena
(define (upper p)
  (if (> p RADIOI)
      (- p DELTA)
      p))


; lower : Number -> Number
; modifica sumando la posicion vertical del circulo graficado en el plano,
;dependiendo del tamaño de la escena
(define (lower p)
  (if (< p (- HEIGHT RADIOI))
      (+ p DELTA)
      p))

; movement Estado String -> Estado
; Toma un evento y una tecla para indicar la direccion del
; desplazamiento del circulo en el plano
(define (movement p k) (cond [(key=? k "up") (upper p)]
                             [(key=? k "down") (lower p)]
                             [(key=? k " ") STARTY]
                             [else p]))


(define (mouse-handler n x y event) (cond [(string=? event "button-down") y]
                                          [else n]))


(big-bang CENTER ; estado inicial del sistema
  [to-draw creator] ; dibuja en la pantalla 
                    ; y el círculo en el estado actual
  [on-key movement]; cuando se presiona una tecla,
                    ; la función movement
                    ; se invoca para modificar el evento
[on-mouse mouse-handler])


