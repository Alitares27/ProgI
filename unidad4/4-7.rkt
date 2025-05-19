;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 4-7) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej7

(require 2htdp/image)
(require 2htdp/universe)

; Representamos el desplazamiento de una imagen sobre un plano,
; la cual posee una posicion que puede ser modificada
; al presionar una tecla o presionar el mouse

(define AUTOIMG (bitmap "C:/Users/aldai/OneDrive/UNR/Racket/car.png"))
(define-struct auto [hpos vel])
(define INICIAL (make-auto 50 1))
(define LARGO 800)
(define ALTO 150)
(define DELTA-VEL 10)

(define AUTO-INI INICIAL)

; pintura : Estado -> Image
; Dado un estado, dibuja la imagen del auto en su posición correspondiente
(define (pintura a)
  (place-image AUTOIMG
         (auto-hpos a) 130
         (place-image (rectangle LARGO 30 "solid" "black")400 140
         (empty-scene LARGO ALTO))))

; velocidad : Estado String -> Estado
; dado una tecla presionada, mueve el auto, lo reinicia o lo deja igual
(define (velocidad a k)
  (cond [(string=? k "up") (make-auto (auto-hpos a)(+ (auto-vel a) DELTA-VEL))]
        [(string=? k "down") (make-auto (auto-hpos a)(- (auto-vel a) DELTA-VEL))]
        [else a]))

; mover > Estado -> estado
; Dado un estado aumenta la velocidad de desplazamiento del auto
; y controla que el auto no salga de escena
(define (mover a)
  (if (and (<= 0 (+ (auto-hpos a) (auto-vel a)))
           (<= (+ (auto-hpos a) 50) LARGO))
      (make-auto (+ (auto-hpos a) (auto-vel a)) (auto-vel a))
      (make-auto (auto-hpos a) 0)))

; manipulador : Estado Number Number String -> Estado
; al presionar el mouse, mueve el auto a la posición X del clic
(define (manipulador m x y event)
  (cond [(string=? event "button-down") (make-auto x (auto-vel m))]
        [else m]))


(big-bang AUTO-INI
  [to-draw pintura]
  [on-tick mover 0.05]
  [on-key velocidad]
  [on-mouse manipulador]
  )