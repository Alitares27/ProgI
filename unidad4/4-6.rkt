;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 4-6) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej6
(define MOSCA
  (bitmap "C:/Users/aldai/OneDrive/UNR/Racket/fly.png"))

(define ALT 500)
(define ANC 500)
(define MOSCANC 50)
(define AIRE(empty-scene ANC ALT "skyblue"))
(define DELTAI 21)
(define GAMMA 30)
(define ESTADO-FINAL (make-posn -1 -1))

(define-struct estado (pos dx dy))

(define POSICION (make-estado (make-posn (/ ANC 2)(/ ALT 2))
  (- (random DELTAI)10)
  (- (random DELTAI)10)))

; espacio : Estado -> Imagen
; Dibuja la escena y si la mosca es atrapada muestra un mensaje
(define (espacio m)
  (if (equal? (estado-pos m)ESTADO-FINAL)
      (place-image (text "MOSCA ATRAPADA" 30 "red")(/ ANC 2)(/ ALT 2)
                   (empty-scene ANC ALT))
      (place-image MOSCA
                   (posn-x (estado-pos m))
                   (posn-y (estado-pos m))
                   (empty-scene ANC ALT))))

; vuelo : Estado -> Estado
; Calcula la nueva posicion de la mosca
; y tambien hace que rebotesi toca un borde
(define (vuelo m)
  (let* ([dx (estado-dx m)]
         [dy (estado-dy m)]
         [p (estado-pos m)]
         [x (+ (posn-x p) dx)]
         [y (+ (posn-y p) dy)]
         [nx (cond [(< x 0) 0]
                   [(> x (- ANC MOSCANC)) (- ANC MOSCANC)]
                   [else x])]
         [ny (cond [(< y 0) 0]
                   [(> y (- ALT MOSCANC)) (- ALT MOSCANC)]
                   [else y])]
         [ndx (if (or (< x 0) (> x (- ANC MOSCANC))) (- dx) dx)]
         [ndy (if (or (< y 0) (> y (- ALT MOSCANC))) (- dy) dy)])
    (make-estado (make-posn nx ny) ndx ndy)))


#|distance : posn -> Number
  Calcula la distancia entre dos puntos|#
(define (distance p1 p2)
  (sqrt (+(sqr (- (posn-x p1)(posn-x p2)))
          (sqr (- (posn-y p1)(posn-y p2))))))

#|atrapar : Estado Number Number Evento -> Estado
  evalua si las coordenadas donde se hizo click
  esta cerca de la mosca para cambiar estado a atrapada |#
(define (atrapar m x y e)
  (if (string=? e "button-down")
      (if(< (distance (estado-pos m)(make-posn x y)) GAMMA)
         (make-estado ESTADO-FINAL 0 0)
         m)
      m)) 

#|muerta : Estado -> Boolean
  Revisa si la posion es el ESTADO-FINAL|#

(define (muerta m)
  (equal? (estado-pos m) ESTADO-FINAL))

(big-bang POSICION
  [to-draw espacio]
  [on-tick vuelo 0.1]
  [on-mouse atrapar]
  [stop-when muerta espacio]
)