;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3-10) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

; 10

(define PIEDER (bitmap "C:/Users/aldai/OneDrive/UNR/Racket/der.png"))
(define PIEIZQ (bitmap "C:/Users/aldai/OneDrive/UNR/Racket/izq.png"))
(define LCAMINO 600)
(define ACAMINO 200)
(define PASO 70)
(define PIE-ANCHO (image-width PIEDER))
(define LIMITE-IZQ (/ PIE-ANCHO 2))
(define LIMITE-DER (- LCAMINO (/ PIE-ANCHO 2)))
(define ESPACIO (empty-scene LCAMINO ACAMINO "white"))
(define PARTIDA (list 0 'der 'izq empty))

; dibujar-huellas : Estado Imagen -> Imagen
; Dibuja las huellas sobre la escena, usa 'der o 'izq para voltear la imagen

(define (dibujar-huellas lista escena)
  (cond
    [(empty? lista) escena]
    [else
     (let* ([h (first lista)]
            [x (first h)]
            [pie (second h)]
            [dir (third h)]
            [img (cond [(and (equal? pie 'izq) (equal? dir 'der)) PIEIZQ]
                       [(and (equal? pie 'der) (equal? dir 'der)) PIEDER]
                       [(and (equal? pie 'izq) (equal? dir 'izq)) (flip-horizontal PIEIZQ)]
                       [else (flip-horizontal PIEDER)])])
       (dibujar-huellas (rest lista)
                        (place-image img x (- ACAMINO 40) escena)))]))

; camino : Estado -> Imagen
; muestra la escena y agrega las huellas almacenadas

(define (camino estado)
  (let ([hist (fourth estado)])
    (dibujar-huellas hist ESPACIO)))

; npaso : Estado -> Estado
; calcula la posicion del proximo paso y cambia de direccion al llegar al limite
(define (npaso estado)
  (let* ([x (first estado)]
         [dir (second estado)]
         [pie (third estado)]
         [hist (fourth estado)]
         [nuevo-x (if (equal? dir 'der) (+ x PASO) (- x PASO))]
         [nuevo-dir (cond [(> nuevo-x LIMITE-DER) 'izq]
                          [(< nuevo-x LIMITE-IZQ) 'der]
                          [else dir])]
         [ajustado-x (cond [(> nuevo-x LIMITE-DER) LIMITE-DER]
                           [(< nuevo-x LIMITE-IZQ) LIMITE-IZQ]
                           [else nuevo-x])]
         [nuevo-pie (if (equal? pie 'izq) 'der 'izq)]
         [nueva-huella (list ajustado-x nuevo-pie nuevo-dir)])
    (list ajustado-x nuevo-dir nuevo-pie (cons nueva-huella hist))))

; maneja-tecla : Estado String -> Estado
; reinicia la escena cuando se presiona la barra espaciadora
(define (maneja-tecla estado tecla)
  (if (string=? tecla " ")
      PARTIDA
      estado))

; maneja-click : Estado Number Number String -> Estado
; agrega la huella en la posicion del eje x donde se presiona el mouse
(define (maneja-click estado x y tipo)
  (if (mouse=? tipo "button-down")
      (let* ([ajustado-x (max LIMITE-IZQ (min x LIMITE-DER))]
             [dir (second estado)]
             [pie (third estado)]
             [hist (fourth estado)]
             [nueva-huella (list ajustado-x pie dir)])
        (list ajustado-x dir (if (equal? pie 'izq) 'der 'izq)
              (cons nueva-huella hist)))
      estado))


(big-bang PARTIDA
  [to-draw camino]
  [on-tick npaso 1]
  [on-key maneja-tecla]
  [on-mouse maneja-click])