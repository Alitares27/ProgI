;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname pinteractivos) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ejemplo 1
(require 2htdp/image)
(require 2htdp/universe)
 ; El estado del sistema sera una cadena
 ; que representa el color del cırculo.
 ; Posibles valores: ”red”, ”green” y ”yellow”
 ; Estado inicial
 (define INICIAL "red")

 ; interpretar: Estado-> Image
 ; dado un estado, devuelve la imagen a mostrar
 (define (interpretar e)
   (place-image (circle 50 "solid" e)
                150
                150
                (empty-scene 300 300)))

 ; cambiar-color: Estado-> Estado
 ; dado un color, devuelve el siguiente color del cırculo

 (check-expect (cambiar-color "green") "red")

(define (cambiar-color c)
  (cond [(string=? c "red") "yellow"]
        [(string=? c "yellow") "green"]
        [(string=? c "green") "red"]))


(big-bang INICIAL ; estado inicial
  [to-draw interpretar] ; evento obligatorio
  [on-tick cambiar-color 1])

;Modificacion Ej. 1

(define INIT 20)

(define (interpreter t)
  (place-image (circle t "solid" "blue")
               150
               150
               (empty-scene 300 300)))


(define (cambiar-tamaño t)
  (cond
    [(< t 150)(+ t 5)]
    [else INIT]))

(big-bang INIT
  [to-draw interpreter]
  [on-tick cambiar-tamaño 0.5])

(check-expect(cambiar-tamaño 20) 25)


;Manejador de on-key "Left & right"
 ; manejador-on-key: Estado String → Estado
 ; controla los eventos del teclado de acuerdo a :
 ; ”r” → ”red” , ”y” → ”yellow” , ”g” → ”green”
 ; ”left” → color anterior, ”right” → color siguiente
 (check-expect (manejador-teclado "red" "g") "green")
(check-expect (manejador-teclado "red" "right") "green")

(define (anterior e)
  (cond
    [(string=? e "red")"yellow"]
    [(string=? e "green")"red"]
    [(string=? e "yellow")"green"]
    ))

(define (siguiente e)
  (cond
    [(string=? e "red")"green"]
    [(string=? e "green")"yellow"]
    [(string=? e "yellow")"red"]
  ))

(define (manejador-teclado e k)
  (cond [(key=? k "y") "yellow"]
        [(key=? k "g") "green"]
        [(key=? k "r") "red"]
        [(key=? k "left") (anterior e)]
        [(key=? k "down") (anterior e)]
        [(key=? k "right") (siguiente e)]
        [(key=? k "up") (siguiente e)]
        [else e]))

(big-bang INICIAL ; estado inicial
  [to-draw interpretar] ; evento obligatorio
  [on-key manejador-teclado])


;Ejercicio 2
(define (cambiar-tamañok t k)
  (if (< t 150)
      (cond
        [(key=? k "down")(- t 10)]
        [(key=? k "up")(+ t 10)]) INIT))

;Ejemplo con stop-when
(define (finalizar? t)
  (zero? t))

(big-bang INIT
  [to-draw interpreter]
  [on-key cambiar-tamañok]
  [stop-when finalizar?])

(check-expect(cambiar-tamañok 20 "up") 30) 


;Agregamos el evento on-mouse
;Ejemplo: Manejador de on-mouse

; manejador-mouse: Estado Number Number String → Estado
; controla los eventos del mouse de acuerdo a :
; si se precion ́o el bot ́on del mouse el estado devuelto es la
; distancia del punto donde ocurri ́o el evento y el origen del c ́ırculo
;(check-expect (manejador-mouse 100 280
 ;                              250 ”button-down”) 30)

;(define (manejador-on-mouse e x y b)
 ; (if (string=? b "button-down")
  ;    (dist x y 250 250)
   ;   e))


























