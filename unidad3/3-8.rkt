;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3-8) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

;8
(define ANCH 400)
(define ALTO 300)
(define COLORF "skyblue")
(define COLORE "yellow")
(define EMAX 30)
(define EMIN 5)
(define FONDO (empty-scene ANCH ALTO COLORF))

; estrella : Number Number Number Estado -> Estado 
;Dibuja una estrella, dada una coordenada y un fondo
(define (estrella x y t img)
  (place-image (star t "solid" COLORE) x y img))

; dibujante : Lista Estado -> Estado
; Dibuja todas las estrellas en el fondo
(define (dibujante estrellas img)
  (cond
    [(empty? estrellas) img]
    [else
     (let* ([est (first estrellas)]
            [x (first est)]
            [y (second est)]
            [t (third est)]
            [nuevo-img (estrella x y t img)])
       (dibujante (rest estrellas) nuevo-img))]))
 
; dibujar : Estado -> Estado
; muestra la estrella en el fondo
(define (dibujar e)
  (dibujante e FONDO))

; tamaño-estrella : Number -> Estado
; calcula el tamaño de la basandose en el ancho del lienzo
(define (tamaño-estrella x)
  (+ EMIN (* (/ (- ANCH x) ANCH) (- EMAX EMIN))))

; adaptador : Number Number Number -> Estado
; Verifica si la estrella puede encajar correctamente en el lienzo
(define (adaptador x y t)
  (and (>= x t)
       (<= x (- ANCH t))
       (>= y t)
       (<= y (- ALTO t))))
 
; ubicador : Estado Number Number String -> Estado
; actualiza la lista de estrellas dependiendo de donde se hace click con el mouse 
(define (ubicador e x y tipo)
  (cond
    [(string=? tipo "button-down")
     (let ([t (tamaño-estrella x)])
       (if (adaptador x y t)
           (cons (list x y t) e)
           e))]
    [else e])) 

; borrador : Estado String -> Estado
; elimina todas las estrellas y solo muestra el lienzo vacio
(define (borrador e k)
  (if (string=? k "\b") '() e))


(big-bang '()
  [to-draw dibujar]
  [on-mouse ubicador]
  [on-key borrador])

