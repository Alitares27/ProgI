;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname part1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Op. Aritmeticas
; 1
(-(* 12 5)(* 7 6))
(+ (- (* 3 5) (/ (* 7 4) 14)) (/ 3 1))
(+ (cos 0.8) (/ 1 5) (* (sin 0.5) 3.5))

;2
(/ 1 (sin (sqrt 3)))
(* (sqrt 2) (sin pi))
(+ 3 (sqrt (- 4)))
(* (sqrt 5) (sqrt (/ 3 (cos pi))))
;(/ (sqrt 5) (sin (* 3 0)))
(/ (+ 3) (* 2 4))
(* 1 2 3 4 5 6 7 8)
(/ 120 2 3 2 2 5)

;Strings
(string-append "Program" "ar")
(string-append "El " "oso " "sala " "la " "sopa.")
(string-length "Primer año")
(number->string 42)
;1
(string-append "Hola" "mundo")
(string-append "Pro" "gra" "ma.")
(number->string 1357)
;(string-append "La respuesta es " (+ 21 21))
(string-append "La respuesta es " (number->string (+ 21 21)))
(* (string-length "Hola") (string-length "Chau"))

; Images
(require 2htdp/image)
(circle 10 "solid" "green")
(rectangle 10 20 "solid" "blue")
(rectangle 20 12 "outline" "magenta")
(overlay (rectangle 20 20 "solid" "blue") (circle 15 "solid" "green"))
(empty-scene 100 100)
(place-image (circle 10 "solid" "blue") 40 80 (empty-scene 100 100))
(+ (image-width (circle 10 "solid" "red")) (image-height (rectangle 10 20 "solid" "blue")))


;Ejercicios
;1
(define (doble x) (* x 2))
(define (cuad-azul x) (square x "solid" "blue"))
(cuad-azul (doble 20))
(define (h x y) (< x (doble y)))
(and (h 2 3) (h 5 2))

(define (f x) (+ x 1))
(= (f 3) (doble 2))

;2
(define (distancia x y) (sqrt (+ (sqr x) (sqr y))))
(distancia -5 12)

;3
(define (distanciaPuntos x1 y1 x2 y2)
  (sqrt (+ (sqr (- x2 x1)) (sqr (- y2 y1)))))
(distanciaPuntos 1 1 4 5)

;4
(define (vol-cubo a)(expt a 3))
(vol-cubo 5)

;5
(define (area-cubo b)(* 6 (sqr b)))
(area-cubo 2)

;6
(define (metro-pie c) (* c 3.28084))
(metro-pie 5)

;7
(define (cel-far d)(+ (* d 9/5) 32))
(cel-far 27)

;8
(define (posible? a b c)
  (and (> (+ a b) c)
       (> (+ a c) b)
       (> (+ b c) a)))
(posible? 1 2 3)


;9
(define (pitagorica? a b c)
  (if (or (= (+ (expt a 2) (expt b 2)) (expt c 2))
          (= (+ (expt a 2) (expt c 2)) (expt b 2))
          (= (+ (expt b 2) (expt c 2)) (expt a 2)))
      #t
      #f))

(pitagorica? 3 4 5)

;10
(define (suma-long a b)
  (+(string-length a)(string-length b)))

(suma-long "Hola" "Mundo")

;11
(define (comienzaA a)
(equal?(string-ith (string-downcase a) 0) "a"))

(comienzaA "apple")

;12
 (define (poner- s i)
    (string-append (substring s 0 i) "-" (substring s i)))

(poner- "Amarillo" 6)



   