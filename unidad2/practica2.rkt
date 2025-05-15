;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname practica2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Representamos temperaturas mediante números
; far->cel: Number -> Number
; recibe una temperatura en Fahrenheit, devuelve su equivalente en Celsius

(define
    (far->cel t)
    (* 5/9 (- t 32)))

(check-expect(far->cel 122)50)

;1.3 Diseñemos funciones simples

;1
;representamos
; - las coordenadas de un punto con numeros
; - una distancia entre puntos mediante numeros
;

; distancia-origen : Number Number -> Number
; recibe las coordenadas de un punto y devuelve la distancia de éste al origen

; entrada: -5 12, salida: 13
; entrada: 10 2, salida: 10.198
; entrada: 2 7, salida: 7.28

(define (distancia-origen x y)
  (sqrt (+ (sqr x) (sqr y))))

(check-expect (distancia-origen -5 12) 13)

;2
;representamos una distancia entre puntos mediante numeros
;distancia-puntos: number number number number -> number
; recibe dos coordenada y devuelve la distancia entre los puntos

; entrada: 1 5 3 4, salida: 2.236
; entrada: 5 9 6 8, salida: 1.414
; entrada: -3 -4 0 0, salida: 5
(define (distancia-puntos x1 y1 x2 y2)
  (sqrt (+ (sqr (- x2 x1)) (sqr (- y2 y1)))))
(check-expect(distancia-puntos  -3 -4 0 0)5)

;3
;representamos
; - las longitudes de un cubo con números
; - el volumen de un cubo con un numero
; siendo 1 el equivalente a 1m^3

;vol-cubo: Number -> Number
; dada la arista de un cubo, calcula su volumen

;recibe un numero que representa la longitud de una arista y
; devuelve el volumen de un cubo cuya arista es la dada

; entrada: 4, salida: 64
; entrada: 5, salida: 125 
; entrada: 3, salida: 27

(define (vol-cubo a)
  (expt a 3))

(check-expect(vol-cubo 4) 64)

;4
;representamos
;- el area de un cubo dado un numero
;- las longitudes de un cubo con un numero
; siendo 1 el equivalente a 1m^2

;area-cubo: Number -> Number
;dada la arista de un cubo, calcula su area

; entrada: 2, salida: 24
; entrada: 6, salida: 216 
; entrada: 10, salida: 600

(define (area-cubo b)(* 6 (sqr b)))
(check-expect(area-cubo 2)24)

;5
; sin diseño
; Representamos la posición de un caracter en una cadena con un número

;string-insert: String Number -> String
;recibe una cadena y un numero y devuelve un nuevo string agregando un '-' en
; la posicion indicada por el numero

; entrada: "hola" 0, salida: "-hola"
; entrada: "hola" 2, salida: "ho-la 
; entrada: "hola" 4, salida:  "hola-"

 (define (string-insert s i)
    (string-append (substring s 0 i) "-" (substring s i)))

(check-expect (string-insert "hola" 0) "-hola")

;6
; sin diseño
;string-last: String -> String
;recibe una cadena no vacia y devuelve el ultimo caracter de la cadena

; entrada: "hola", salida: "a"
; entrada: "plato", salida: "o"
; entrada: "mesa", salida: "a"
(define (string-last b)
      (string (string-ref b (- (string-length b) 1))))

(check-expect(string-last "Hola") "a")

;7
; sin diseño
;string-remove-last: String -> String
;recibe una cadena no vacia y devuelve una cadena sin el ultimo caracter

; entrada: "Manzana", salida: "Manzan"
; entrada: "Naranja", salida: "Naranj"
; entrada: "Kiwi", salida: "Kiw"

(define (string-remove-last b)
  (if (string=? b "")
      "cadena vacia"
      (substring b 0 (- (string-length b) 1))))

(check-expect(string-remove-last "Manzana") "Manzan")

;9
;representamos
;- la cantidad de personas registradas dado un numero
;- la cantidad de meses abonada dado un numero
; siendo p el numero de personas y m la cantidad de meses

;monto-persona: Number Number -> Number
;Dada una cantidad de personas y una cantidad de cuotas pagadas
;se aplicara un descuento al monto que el cliente debe pagar

; entrada: 2 2, salida: 975
; entrada: 3 3, salida: 1267.50
; entrada: 1 5, salida: 2437.50

(define (monto-persona p m)
  (let*(
        (precio 650)
        (2p 0.1)
        (3p 0.2)
        (2m 0.15)
        (3m 0.25)
        (dmax 0.35)
        
        (dpersona
         (cond
           [(= p 2) 2p]
           [(>= p 3) 3p]
           [else 0]))

        (dmes
         (cond
           [(= m 2) 2m]
           [(>= m 3) 3m]
           [else 0]))

        (dtotal
         (if (> (+ dpersona dmes) dmax)
             dmax
             (+ dpersona dmes)))
        )
        (* m precio (- 1 dtotal))))

(check-expect(monto-persona 1 5)2437.5)

;10
;representamos
;- la edad de una persona dado un numero
;- la hemoglobina en sangre dado un numero
; siendo e la edad de la persona y h la hemoglobina en sangre

;anemia: Number Number -> Boolean
;dada la edad y la cantidad de hemoglobina en sangre se determina
;si la persona es anemica o no.

; entrada: 3 11, salida: #f
; entrada: 8 12, salida: #f
; entrada: 61 12, salida: #t

(define (anemia e h)
  (cond
    [(<= e 1)(< h 13)]
    [(and (> e 1) (<= e 6))(< h 10)]
    [(and (> e 6) (<= e 12))(< h 11)]
    [(and (> e 12) (<= e 60))(< h 11.5)]
    [(and (> e 60) (<= e 120))(< h 12.6)]
    [else (< h 13)]))

(check-expect(anemia 61 12)#t) 

;11
;representamos un grupo de numeros para saber
;si son autopromediables
; siendo a b y c los numeros ingresados

;autopromediable: Number Number Number -> Number
;dados 3 numeros se determina si uno de sus valores
;concide con el promedio de los otros dos

; entrada: 7 5 9, salida: 315
; entrada: 2 4 6, salida: 48
; entrada: 5 4 5, salida: 14

(define (autopromediable a b c)
 (cond
    [(= (/ (+ a b) 2) c) (* a b c)]
    [(= (/ (+ b c) 2) a) (* a b c)]
    [(= (/ (+ a c) 2) b) (* a b c)]
    [else (+ a b c)]))

(check-expect(autopromediable 2 4 6) 48)


;12
;representamos
;- cantidad de litros restante dado un numero
;- la clase de combustible dado un numero
;- la distancia en Kilometros con numeros

(define KM/l-Ciudad-2 8)
(define KM/l-ruta-2 11)
(define mejora-grado-3 1.1)

;autonomia-ciudad: Number Number -> Number
;autonomia-ciudad recibe la cantidad de litros restante
;y el tipo de combustible, luego retorna un numero
;que indica la cantidad de Km que el auto puede recorrer en ciudad
(define (autonomia-ciudad litros grados)
  (cond
   [(= grados 2)(* KM/l-Ciudad-2 litros)]
   [(= grados 3)(* KM/l-Ciudad-2 litros mejora-grado-3)]))

;autonomia-ruta: Number Number -> Number
;autonomia-ruta recibe la cantidad de litros restante
;y el tipo de combustible, luego retorna un numero
;que indica la cantidad de Km que el auto puede recorrer en ruta

(define (autonomia-ruta litros grados)
  (cond
   [(= grados 2)(* KM/l-ruta-2 litros)]
   [(= grados 3)(* KM/l-ruta-2 litros mejora-grado-3)]))



; autonomia: Number Number -> String
;autonomia recibe la cantidad de litros restante
;y el tipo de combustible, luego retorna un String
;que indica la cantidad de Km que el auto puede recorrer
;en ruta o ciudad

(define (autonomia litros grados)
  (cond [(or (= grados 2)(= grados 3))
         (string-append "Autonomia en ciudad: "
                        (number->string(autonomia-ciudad litros grados))
                        "Km. Autonomia en ruta: "
                        (number->string(autonomia-ruta litros grados))
                        "Km."
                        )]
        [else "Tipo de nafta no valido"]))

(check-expect(autonomia 20 2) "Autonomia en ciudad: 160Km. Autonomia en ruta: 220Km.")
(check-expect(autonomia 20 3) "Autonomia en ciudad: 176Km. Autonomia en ruta: 242Km.")
(check-expect(autonomia 20 1) "Tipo de nafta no valido")






















