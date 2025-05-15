;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3-9) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

;9
(define ANCH 400)
(define ALTO 300)
(define COLORF "skyblue")
(define TAMAÑO 50)
(define INI (list "t" "green" (list (list 200 200 "t" "green"))))

; cforma : String String -> Imagen
; Crea la imagen de una figura deseada con el color correspondiente,
; si "c" es circulo o "t" triangulo 

(define (cforma forma color)
  (cond
    [(string=? forma "c")(circle TAMAÑO "solid" color)]
    [(string=? forma "t") (triangle TAMAÑO "solid" color)]
    [else (circle 0 "solid" COLORF)]))


; ubicar : Estado Number Number String -> Estado
; Se agrega la imagen en la posicion donde se hace click
; tomando los valores de color y forma guardadas en la lista

(define (ubicar e x y event)
  (cond
    [(string=? event "button-down")
     (let* ([forma (first e)]
       [color (second e)]
       [formas (third e)]
       [nueva (list x y forma color)])
     (list forma color (cons nueva formas)))]
[else e]))

; colorear : Estado String -> Estado
; Estado String -> Estado
; Captura los valores de las teclas presionadas, para cambiar el color y la forma

(define (colorear e k)
  (let* ([forma (first e)]
         [color (second e)]
         [formas (third e)])
  (cond
    [(string=? k "c")(list "c" color formas)]
    [(string=? k "t")(list "t" color formas)]
    [(string=? k "a")(list forma "blue" formas)]
    [(string=? k "v")(list forma "green" formas)]
    [else e])))

; colorv : Estado -> Estado
; Cambia el color de la figura escogida
(define (colorv e)
  (let* (
         [forma (first e)]
         [color (second e)]
         [formas (third e)]
         [ncolor (if (string=? color "green") "blue" "green")])
    (list forma ncolor formas)))

; formador : Estado Imagen -> Estado
; Coloca las formas en una escena una por una
(define (formador e f)
  (cond
    [(empty? e)f]
    [else
     (let* ([created (first e)]
            [x (first created)] 
            [y (second created)]
            [forma (third created)]
            [color (fourth created)]
            [img (cforma forma color)])
       (formador (rest e)
                 (place-image img x y f)))]))

; dibujador : Estado -> Estado
; Dibuja la escena completa con todas las formas que se agregaron previamente

(define (dibujador e)
  (formador (third e)
            (empty-scene ANCH ALTO COLORF)))

 
(big-bang INI
  [on-key colorear]
  [to-draw dibujador]
  [on-mouse ubicar]
  [on-tick colorv 1]
  )

