;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.28|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 28


; ancha : Image -> Boolean
; dada una imagen devuelve #t si la imagen es ancha
(define (ancha l)
  (> (image-width l)(image-height l)))

; escogidas : Listof Images -> Listof Images
; dada una lista de imagenes devuelve una lista de imagenes anchas
(define (escogidas l)
  (filter ancha l))

; area : Imagen -> Number
; dada una imagen devuelve el area de la imgen
(define (area l)
  (* (image-width l)(image-height l)))

; saa : Listof Images -> Number
; dada una lista de imagenes devuelve la suma del area
; de las imagenes anchas
(define (saa l) 
  (foldr + 0 (map area (escogidas l))))

(check-expect(saa (list (circle 20 "solid" "red")
              (rectangle 40 20 "solid" "blue")
              (rectangle 10 20 "solid" "yellow")
              (rectangle 30 20 "solid" "green")))1400)