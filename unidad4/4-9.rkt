;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 4-9) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)
(require 2htdp/image) 

(define-struct crear [forma col tam pos]) 

(define ANCH 400)
(define ALTO 300)
(define INI (make-crear "" "green" 20 (make-posn (/ ANCH 2) (/ ALTO 2)))) 

; dibujar-forma : String Number String String -> Image
; produce la imagen de la forma segun el tipo
(define (dibujar-forma tipo tam estilo color)
  (cond
    [(string=? tipo "triangle") (triangle tam estilo color)]
    [(string=? tipo "square") (square tam estilo color)]
    [(string=? tipo "circle") (circle tam estilo color)]
    [(string=? tipo "star") (star tam estilo color)]
    [else (empty-scene 1 1)])) 

; colorear : Estado String -> Estado
; cambia el color, tamaño y tipo de forma segun la tecla que se oprime
(define (colorear e k)
  (cond
    [(string=? k "\b") INI] 
    [(string=? k "t")(make-crear "triangle" (crear-col e) (crear-tam e) (crear-pos e))]
    [(string=? k "c")(make-crear "square" (crear-col e) (crear-tam e) (crear-pos e))]
    [(string=? k "o")(make-crear "circle" (crear-col e) (crear-tam e) (crear-pos e))]
    [(string=? k "e")(make-crear "star" (crear-col e) (crear-tam e) (crear-pos e))]
    
    [(string=? k "f1") (make-crear (crear-forma e) "blue" (crear-tam e) (crear-pos e))]
    [(string=? k "f2") (make-crear (crear-forma e) "green" (crear-tam e) (crear-pos e))]
    [(string=? k "f3") (make-crear (crear-forma e) "red" (crear-tam e) (crear-pos e))]
    [(string=? k "f4") (make-crear (crear-forma e) "yellow" (crear-tam e) (crear-pos e))]
    [(string=? k "f5") (make-crear (crear-forma e) "orange" (crear-tam e) (crear-pos e))]
    [(string=? k "f6") (make-crear (crear-forma e) "brown" (crear-tam e) (crear-pos e))]

    [(string=? k "m")(make-crear (crear-forma e) (crear-col e) (+ (crear-tam e) 2) (crear-pos e))]
    [else e])) 

; ubicar : Estado Number Number String -> Estado
; ubica la forma segun el lugar donde se hizo click
(define (ubicar e x y event)
  (cond
    [(string=? event "button-down")
     (make-crear (crear-forma e) (crear-col e) (crear-tam e) (make-posn x y))]
    [else e])) 

; fondo : Estado -> Image
; Dibuja la escena y muestra las formas agregadas a la escena
(define (fondo e)
  (place-image (dibujar-forma (crear-forma e) (crear-tam e) "solid" (crear-col e))
               (posn-x (crear-pos e)) 
               (posn-y (crear-pos e))
               (empty-scene ANCH ALTO)))
 
(big-bang INI
  [on-key colorear]
  [to-draw fondo]
  [on-mouse ubicar])