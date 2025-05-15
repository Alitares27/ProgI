;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 4-5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej5
;representamos el movimiento de un cirlulo en un plano, dado una posicion en el plano
;El estado es un Number, que representa la posicion del círculo a dibujar en pantalla.
 
(define HEIGHT 300)
(define WIDTH 300)
(define RADIOI 20)
(define STARTX (/ WIDTH 2))
(define STARTY (/ HEIGHT 2))
(define CENTER (make-posn STARTX STARTY))
(define DELTA 5)

; creator : Event -> Number
; transforma el estado del sistema en una imagen a mostrar a través
; de la cláusula to-draw

(define
  (creator p)
  (place-image (circle RADIOI "solid" "green")
               (posn-x p)(posn-y p)
               (empty-scene WIDTH HEIGHT)))

; upper : Number -> Number
; modifica restando la posicion vertical del circulo graficado en el plano,
; dependiendo del tamaño de la escena
(define (upper p)
  (if (> (posn-y p) RADIOI)
      (make-posn (posn-x p) (- (posn-y p) DELTA))
      p))


; lower : Number -> Number
; modifica sumando la posicion vertical del circulo graficado en el plano,
; dependiendo del tamaño de la escena
(define (lower p)
  (if (< (posn-y p) (- HEIGHT RADIOI))
      (make-posn (posn-x p) (+ (posn-y p) DELTA))
     p))

; sider : Number -> Number
; modifica sumando la posicion horizontal del circulo graficado en el plano,
; dependiendo del tamaño de la escena
(define (sider p)
  (if (> (posn-x p) RADIOI)
      (make-posn (- (posn-x p) DELTA) (posn-y p))
      (posn-x)))

; sidel : Number -> Number
; modifica restando la posicion horizontal del circulo graficado en el plano,
; dependiendo del tamaño de la escena
(define (sidel p)
  (if (< (posn-x p) (- WIDTH RADIOI))
      (make-posn (+ (posn-x p) DELTA) (posn-y p))
      p))

; movement Estado String -> Estado
; Toma un evento y una tecla para indicar la direccion del
; desplazamiento del circulo en el plano
(define (movement p k)
  (cond
    [(key=? k "up") (upper p)]
    [(key=? k "down") (lower p)]
    [(key=? k "left") (sider p)]
    [(key=? k "right") (sidel p)]
    [(key=? k " ") CENTER]
    [else p]))


; mouse-handler : posn Number Number String -> posn
; captura las coordenadas donde se hizo click con el mouse
; y actualiza la posicion del circulo
(define (mouse-handler p x y event)
  (if
    (string=? event "button-down")
    (make-posn x y)
    p))

(big-bang CENTER
  [to-draw creator] 
  [on-key movement]
  [on-mouse mouse-handler])

