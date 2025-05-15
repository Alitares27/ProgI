;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |3-2,3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

;Ejercicio 2, 3, 3.1 
(define INICIOD 110)
(define INICIOI 10)
(define LARGO 300)
(define ANCHO 300)
(define CENTRO (/ 300 2))

; colorn : Number -> String
;Devuelve el color diferente dado un tamaño de la imagen
;si el numero esta entre 0 y 50 el color sera Amarillo
;si el numero esta entre 51 y 100 el color sera Rojo
;si el numero es mayor de 100 el color sera Verde

(define
  (colorn n)
  (cond
    [(and(<= 0 n)(<= n 50))"yellow"]
    [(and(< 50 n)(<= n 100))"red"]
    [else "green"]))

; Pantalla : Estado -> Image
; transforma el estado del sistema en una imagen a mostrar a través
; de la cláusula to-draw
(define
  (pantalla n)
  (place-image (circle  n "outline" (colorn n))
               CENTRO CENTRO (empty-scene LARGO ANCHO)))

; teclado? : Estado String -> Number
;Toma el valor de un numero y lo multiplica por 10
;para incrementar o disminuir su tamaño

(define
  (teclado? n k)
  (cond
    [(string=? k "0") (* 10 0)]
    [(string=? k "1") (* 10 1)]
    [(string=? k "2") (* 10 2)]
    [(string=? k "3") (* 10 3)]
    [(string=? k "4") (* 10 4)]
    [(string=? k "5") (* 10 5)]
    [(string=? k "6") (* 10 6)]
    [(string=? k "7") (* 10 7)]
    [(string=? k "8") (* 10 8)]
    [(string=? k "9") (* 10 9)]
    [else n]))

; Decrementar : Estado -> Estado
; Devuelve el predecesor de un número positivo.
; Si el número es 0, devuelve 100. 
(define (decrementar n)
  (if (<= n 10)
      109
      (- n 5)))  

; Incrementar : Estado -> Estado
; suma uno a su argumento
(define (incrementar n)
  (if (>= n 110)
      9 
      (+ n 5)))

; end? : Estado -> Boolean
; detiene la interaccion
;cuando el radio sea mayor de 110 o menor a 10
(define (end? n)
  (or (> n 110) (< n 10))) 

(big-bang INICIOI ; estado inicial del sistema
  [to-draw pantalla]
  ;[on-tick decrementar 1]
  [on-tick incrementar 1]
  [on-key teclado?]
  [stop-when end?]) 
 
