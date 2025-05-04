;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname practica1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Ejercicios
;1
(require 2htdp/image)

(define (clasificar-imagen img)
  (if (>= (image-height img) (image-width img))
      "Angosta"
      "Ancha"))
(clasificar-imagen (rectangle 90 30 "solid" "red"))

;2
(define (clasificar-imagen2 img)
  (cond
    [(> (image-height img) (image-width img)) "Angosta"]
    [(< (image-height img) (image-width img)) "Ancha"]
    [else "Cuadrada"]))

  
(clasificar-imagen2 (rectangle 20 30 "solid" "red"))

;3
(define (tipoTriangulo a b c)
      (cond
        [(and (= a b) (= b c)) "Equilatero"]
        [(or (= a b) (= a c) (= b c)) "Isoceles"]
        [else "Escaleno"]))

(tipoTriangulo 40 50 70)
      
;4
(define (triangleType a b c)
  (if (= (+ a b c) 180)
      (cond
        [(and (= a b) (= b c)) "Equilatero"]
        [(or (= a b) (= a c) (= b c)) "Isoceles"]
        [else "Escaleno"]) "medidas no corresponden a un triangulo"))

(triangleType 90 70 70)

;5
(define PC 60)
(define PL 8)

(define (monto l c)
  (+ (if (>= l 5) (* PL 0.85 l) (* PL l))
     (if (>= c 4) (* PC 0.9 c) (* PC c))))

(monto 5 4)

;6
(define (amount l c)
  (+ (cond
       [(>= l 10) (* PL 0.82 l)]
       [(>= l 5) (* PL 0.85 l)]
       [else (* PL l)])

     (cond
       [(>= c 10) (* PC 0.82 c)]
       [(>= c 4) (* PC 0.9 c)]
       [else (* PC c)])))

(amount 10 10)

;7
(define (pitagorica? a b c)
  (if (= (+ (expt a 2) (expt b 2)) (expt c 2))
      #t
      (if (= (+ (expt a 2) (expt c 2)) (expt b 2))
          #t
          (if (= (+ (expt b 2) (expt c 2)) (expt a 2))
              #t
              #f))))

(pitagorica? 3 4 5)

;8
(define (collatz n)
  (if(= 0 (modulo n 2)) (/ n 2) (+ 1 (* 3 n))))


(collatz 1)

;Banderas
;a - Peru
(place-image 
  (rectangle 30 60 "solid" "red") 15 30
  (place-image 
    (rectangle 30 60 "solid" "red") 75 30
    (empty-scene 90 60)))

;b - Italy
(place-image 
  (rectangle 30 60 "solid" "green") 15 30
  (place-image 
    (rectangle 30 60 "solid" "red") 75 30
    (empty-scene 90 60)))

;c - funcion banderaV
(define (banderaV c1 c2 c3)
  (place-image 
       (rectangle 30 60 "solid" c1) 15 30
       (place-image 
       (rectangle 30 60 "solid" c2) 45 30
       (place-image 
        (rectangle 30 60 "solid" c3) 75 30 
        (empty-scene 90 60)))))

(banderaV "green" "yellow" "red")

;d - Alemania
(place-image 
  (rectangle 90 20 "solid" "black")  45 10
  (place-image 
    (rectangle 90 20 "solid" "red") 45 30
    (place-image 
    (rectangle 90 20 "solid" "yellow") 45 50
    (empty-scene 90 60))))

;e - Paises Bajos
(place-image 
  (rectangle 90 20 "solid" "red")  45 10
  (place-image 
    (rectangle 90 20 "solid" "white") 45 30
    (place-image 
    (rectangle 90 20 "solid" "blue") 45 50
    (empty-scene 90 60))))

;f - funcion banderaH
(define (banderaH c1 c2 c3)
(place-image 
  (rectangle 90 20 "solid" c1)  45 10
  (place-image 
    (rectangle 90 20 "solid" c2) 45 30
    (place-image 
    (rectangle 90 20 "solid" c3) 45 50
    (empty-scene 90 60)))))

(banderaH "skyblue" "white" "skyblue")

;g - funcion banderaH/V
(define (banderaH/V c1 c2 c3 sentido)
  (if (equal? sentido"V")
      (place-image 
       (rectangle 30 60 "solid" c1) 15 30
       (place-image 
       (rectangle 30 60 "solid" c2) 45 30
       (place-image 
        (rectangle 30 60 "solid" c3) 75 30 
        (empty-scene 90 60)))) 

      (place-image 
       (rectangle 90 20 "solid" c1)  45 10
       (place-image 
        (rectangle 90 20 "solid" c2) 45 30
        (place-image 
         (rectangle 90 20 "solid" c3) 45 50
         (empty-scene 90 60))))))
      
(banderaH/V "red" "white" "green" "V")

;h - francia
(banderaH/V "blue" "white" "red" "V")

;i - Sudán
(place-image 
  (rhombus  44 90 "solid" "green")  0 30
  (place-image 
   (rectangle 90 20 "solid" "red")  45 10
   (place-image 
    (rectangle 90 20 "solid" "white") 45 30
    (place-image 
     (rectangle 90 20 "solid" "black") 45 50
     (empty-scene 90 60)))))

;i - Argentina
(place-image 
  (circle  8 "solid" "yellow")  45 30
  (banderaH "skyblue" "white" "skyblue"))

;i - Camerum
(place-image 
  (star  8 "solid" "yellow")  45 30
  (banderaV "green" "red" "yellow"))

;j - Brasil
(place-image 
  (circle  15 "solid" "blue")  45 30
  (place-image
   (rhombus  45 120 "solid" "yellow")  45 30
   (rectangle 90 60 "solid" "green"))) 

;k - dobleTamaño
(define ancho 90)
(define alto 60)
(define escala 2)

(define (flagH/V c1 c2 c3 sentido)
  (if (equal? sentido"V")
      (place-image 
       (rectangle (* (/ ancho 3) escala) (* alto escala) "solid" c1) (* 15 escala) (* 30 escala)
       (place-image 
       (rectangle (* (/ ancho 3) escala) (* alto escala) "solid" c2) (* 45 escala) (* 30 escala)
       (place-image 
        (rectangle (* (/ ancho 3) escala) (* alto escala) "solid" c3) (* 75 escala) (* 30 escala) 
        (empty-scene (* ancho escala)(* alto escala))))) 

      (place-image 
       (rectangle (* ancho escala) (/ ( * alto escala) 3) "solid" c1)  (* 45 escala) (* 10 escala)
       (place-image 
        (rectangle (* ancho escala) (/ ( * alto escala) 3) "solid" c2) (* 45 escala) (* 30 escala)
        (place-image 
         (rectangle (* ancho escala) (/ ( * alto escala) 3) "solid" c3) (* 45 escala) (* 50 escala)
         (empty-scene (* ancho escala)(* alto escala)))))))
      
(flagH/V "red" "white" "red" "V")

