;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname practica1.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (sgn2 x) (cond [(< x 0) -1]
                       [(= x 0) 0]
                       [(> x 0) 1]))

;Ejercicio 1
(sgn2 (- 2 3))
(check-expect (sgn2 6) 1)

;Ejercicio 2
(require 2htdp/image)
(define (clasificar-imagen img)
  (cond
    [(> (image-height img) (image-width img)) "Angosta"]
    [(< (image-height img) (image-width img)) "Ancha"]
    [else "Cuadrada"]))

  
(check-expect (clasificar-imagen (rectangle 50 30 "solid" "red")) "Ancha")

;2.4
(define (triangleType a b c)
  (if (= (+ a b c) 180)
      (cond
        [(and (= a b) (= b c)) "Equilatero"]
        [(or (= a b) (= a c) (= b c)) "Isoceles"]
        [else "Escaleno"]) "medidas no corresponden a un triangulo"))

(check-expect (triangleType 60 60 60) "Equilatero")

;2.6

(define PC 60)
(define PL 8)
(define (amount l c)
  (+ (cond
       [(>= l 10) (* PL 0.82 l)]
       [(>= l 5) (* PL 0.85 l)]
       [else (* PL l)])

     (cond
       [(>= c 10) (* PC 0.82 c)]
       [(>= c 4) (* PC 0.9 c)]
       [else (* PC c)])))

(check-expect (amount 10 10) (+ (* 8 10 0.82) (* 60 10 0.82)))

;Ejercicio 3 - 2.7
(define (pitagorica? a b c)
(cond [(= (+ (sqr a) (sqr b)) (sqr c))#t]
      [(= (+ (sqr a) (sqr c)) (sqr b))#t]
      [(= (+ (sqr b) (sqr c)) (sqr a))#t])
  )

(check-expect (pitagorica? 3 4 5) #t)

;Ejercicio 4.1
(define (clasificar-imagen2 img)
  (cond
    [(> (image-width img) (* 2 (image-height img))) "Muy ancha"]
    [(> (image-height img) (* 2 (image-width img))) "Muy angosta"]
    [(= (image-height img) (image-width img)) "Cuadrada"]
    [(> (image-width img) (image-height img)) "Ancha"]
    [(< (image-width img) (image-height img)) "Angosta"]))

(check-expect (clasificar-imagen2 (rectangle 100 40 "solid" "red")) "Muy ancha")

;Ejercicio 4.2
(define (clasificar-imagen3 img)
  (if (> (image-width img) (* 2 (image-height img)))
      "Muy ancha"
      (if (> (image-height img) (* 2 (image-width img)))
          "Muy angosta"
          (if (= (image-height img) (image-width img))
              "Cuadrada"
              (if (> (image-width img) (image-height img))
                  "Ancha"
                  "Angosta")))))

(check-expect (clasificar-imagen3 (rectangle 100 40 "solid" "red")) "Muy ancha")

;Ejercicio 5
(define (clasificar t) (cond [(< t 0) "Muy frío (MF)"]
                             [(and (>= t 0) (< t 15)) "Frío (F)"]
                             [(and (>= t 15) (<= t 25)) "Agradable (A)"]
                             [(> t 25) "Caluroso (C)"]))

(check-expect (clasificar -3) "Muy frío (MF)")

;Ejercicio 6
(define (sgn3 x) (cond [(number? x) (sgn2 x)]
                       [(string? x) (sgn2 (string->number x))]
                       [(boolean? x) (sgn2 (if x 1 0))]))

(check-expect (sgn3 #t) 1)

;Ejercicio 7
(define (sgnImg img) (cond
                       [(> (image-height img) (image-width img)) -1]
                       [(< (image-height img) (image-width img)) 1]
                       [else 0]))


(check-expect(sgnImg (rectangle 50 60 "solid" "red")) -1)

;Ejercicio 8
(define (sgnvarios x)
  (cond
                       [(number? x) (sgn2 x)]
                       [(string? x) (sgn2 (string->number x))]
                       [(boolean? x) (sgn2 (if x 1 0))]
                       [(image? x)(sgn2
                                   (cond
                       [(> (image-height x) (image-width x)) -1]
                       [(< (image-height x) (image-width x)) 1]
                       [else 0])
                                   )]
                       [else "Clase no soportada por la función."]
                       )) 

(check-expect(sgnvarios(rectangle 50 60 "solid" "red")) -1)

;Ejercicio 9
(define (sgnvarios2 x)
  (cond
    [(number? x) (sgn2 x)]
    [(string? x)
     (if (string->number x)
         (sgn2 (string->number x))
         "La cadena no se puede convertir a un número")]
    [(boolean? x) (sgn2 (if x 1 0))]
    [(image? x)
     (sgn2
      (cond
        [(> (image-height x) (image-width x)) -1]
        [(< (image-height x) (image-width x)) 1]
        [else 0]))]
    [else "Clase no soportada por la función."]))
 

(check-expect(sgnvarios2 9)1) 


