;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname practica4) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej1

(define p (make-posn 3 4))
(define q (make-posn -2 0.5))

(check-expect(posn-x p)3) ;3
(check-expect(- (posn-y p) (posn-y q))3.5) ; 3.5
(check-expect(posn-y (make-posn (posn-x p) (posn-x q)))-2) ;-2

;Ej2
(define (dist-origen p)
  (sqrt (+ (sqr (posn-x p))(sqr (posn-y p)))))

(check-expect(dist-origen (make-posn (/ 6 2) 4))5)
(check-expect(+ (dist-origen (make-posn 12 5)) 4)17)

;Ej3
(define (simétrico p)
  (make-posn (- (posn-x p))(- (posn-y p))))

(check-expect(simétrico (make-posn 27 9))(make-posn -27 -9))

;Ej4
(define (distancia p1 p2)
  (if (and (posn? p1) (posn? p2))
      (sqrt (+ (sqr (- (posn-x p2) (posn-x p1)))
               (sqr (- (posn-y p2) (posn-y p1)))))
      "Tipos incorrectos para la función."))

(check-expect(distancia (make-posn 0 0)(make-posn 3 4))5)

;Ej5
;representamos el movimiento de un cirlulo en un plano, dado una posicion en el plano
;El estado es un Number, que representa la posicion del círculo a dibujar en pantalla.
 
(define HEIGHT 300)
(define WIDTH 300)
(define RADIOI 20)
(define STARTX (/ WIDTH 2))
(define STARTY (/ HEIGHT 2))
(define CENTER (make-posn STARTX STARTY))

(define DELTA 10)

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


(define (sider p)
  (if (> (posn-x p) RADIOI)
      (make-posn (- (posn-x p) DELTA) (posn-y p))
      (posn-x)))


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


(define (mouse-handler p x y event)
  (if
    (string=? event "button-down")
    (make-posn x y)
    p))

(big-bang CENTER
  [to-draw creator] 
  [on-key movement]
  [on-mouse mouse-handler])



































