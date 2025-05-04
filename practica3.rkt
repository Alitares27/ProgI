;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname practica3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

;Ejercicio 1
; Estado es un string, que representa el color del círculo a dibujar en pantalla.
; Posibles valores:
; - "blue"
; - "red"
; - "green"

; interpretar: Estado -> Image
; dado un estado, devuelve la imagen a mostrar por el programa
; (omitimos los ejemplos para faciltar la legibilidad)

(define INICIAL "blue")
(define
  (interpretar s)
  (place-image (circle 50 "solid" s) 100 100 (empty-scene 200 200)))

; manejarTeclado: Estado String -> Estado
(define (manejarTeclado s k) (cond [(key=? k "a") "blue"]
                                   [(key=? k "r") "red"]
                                   [(key=? k "v") "green"]
                                   [(key=? k "n") "black"]
                                   [(key=? k " ") INICIAL]
                                   [else s]))

(big-bang INICIAL ; estado inicial del sistema
  [to-draw interpretar] ; dibuja en la pantalla 
                        ; el círculo en el estado actual
  [on-key manejarTeclado])  ; cuando se presiona una tecla,
                            ; la función manejarTeclado
                            ; se invoca para manejar el evento)
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

; Pantalla : Number -> Image
; transforma el estado del sistema en una imagen a mostrar a través
; de la cláusula to-draw
(define
  (pantalla n)
  (place-image (circle  n "outline" (colorn n))
               CENTRO CENTRO (empty-scene LARGO ANCHO)))

; teclado? : Number -> Number
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

; Decrementar : Number -> Number
; Devuelve el predecesor de un número positivo.
; Si el número es 0, devuelve 100. 
(define (decrementar n)
  (if (<= n 10)
      109
      (- n 5)))  

; Incrementar : Number -> Number
; suma uno a su argumento
(define (incrementar n)
  (if (>= n 110)
      9 
      (+ n 5)))

; end? : Number -> Number
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
 
;4
;representamos el movimiento de un cirlulo en un plano, dado una posicion en el plano
;El estado es un Number, que representa la posicion del círculo a dibujar en pantalla.
 
(define HEIGHT 300)
(define WIDTH 300)
(define RADIOI 20)
(define STARTX (/ WIDTH 2))
(define STARTY (/ HEIGHT 2))
(define CENTER (/ HEIGHT 2))

(define DELTA 10)

; creator : Event -> Number
; transforma el estado del sistema en una imagen a mostrar a través
; de la cláusula to-draw

(define
  (creator p)
  (place-image (circle RADIOI "solid" "green") STARTX p (empty-scene HEIGHT WIDTH)))


; upper : Number -> Number
; modifica restando la posicion vertical del circulo graficado en el plano,
;dependiendo del tamaño de la escena
(define (upper p)
  (if (> p RADIOI)
      (- p DELTA)
      p))


; lower : Number -> Number
; modifica sumando la posicion vertical del circulo graficado en el plano,
;dependiendo del tamaño de la escena
(define (lower p)
  (if (< p (- HEIGHT RADIOI))
      (+ p DELTA)
      p))

; movement Estado String -> Estado
; Toma un evento y una tecla para indicar la direccion del
; desplazamiento del circulo en el plano
(define (movement p k) (cond [(key=? k "up") (upper p)]
                             [(key=? k "down") (lower p)]
                             [(key=? k " ") STARTY]
                             [else p]))


(define (mouse-handler n x y event) (cond [(string=? event "button-down") y]
                                          [else n]))


(big-bang CENTER ; estado inicial del sistema
  [to-draw creator] ; dibuja en la pantalla 
                    ; y el círculo en el estado actual
  [on-key movement]; cuando se presiona una tecla,
                    ; la función movement
                    ; se invoca para modificar el evento
[on-mouse mouse-handler])


;5

(define INIT "yellow")
(define RADIUS 30)

; designer : Estado-> Image
; dado un estado, devuelve la imagen a mostrar
(define (designer t)
  (place-image (circle RADIUS "solid" t)
               CENTER
               CENTER
               (empty-scene HEIGHT WIDTH)))


; newcolor : String -> String
; dado un color, devuelve el siguiente color del cırculo
(define (newcolor t)
  (cond [(string=? t "yellow") "red"]
        [(string=? t "red") "green"]
        [(string=? t "green") "blue"]
        [(string=? t "blue") "yellow"]
        [else t]))

(big-bang INIT ; estado inicial
  [to-draw designer] ; evento obligatorio
  [on-tick newcolor 1])

;6
;representamos un mini editor de texto, el cual captura los valores de la tecla presionada
;y muestra esos valores en pantalla, ademas permite borrar caracteres al presionar backspace.

(require 2htdp/universe)
(define HEIGHTC 800)
(define WIDTHC 60)
(define CADENA "")

; drawer : Estado-> Image
; dado un estado, devuelve la imagen a mostrar
(define (drawer t)
  (place-image/align
   (text t 20 "indigo")
   0 0 "left" "top"
   (empty-scene HEIGHTC WIDTHC)))

; newtext : Estado String -> Image
; dado un Estado y un String, devuelve una imagen mostrando los valores de las teclas presionadas
(define (newtext t k)
  (cond
    [(string=? k "\b")
     (if (> (string-length t) 0)
         (substring t 0 (- (string-length t) 1))
         t)]
    [else (string-append t k)]))


(big-bang CADENA ; estado inicial
  [to-draw drawer] ; evento obligatorio
  [on-key newtext]) 

;7
; Representamos el desplazamiento de una imagen sobre un plano,
; la cual posee una posicion que puede ser modificada al presionar una tecla o presionar el mouse

(define AUTO (bitmap "C:/Users/aldai/OneDrive/UNR/Racket/car.png"))
(define LONGITUD 600)
(define ANCHURA 200)
(define LIMITED (- LONGITUD 60))
(define LIMITEI (+ LONGITUD 60))

(define INITIAL 60)

; screen : Estado -> Image
; Dado un estado, dibuja la imagen del auto en su posición correspondiente
(define (screen m)
  (place-image AUTO
               m (- ANCHURA 30)
               (place-image
                (rectangle LONGITUD 20 "solid" "black")
                (/ LONGITUD 2) (- ANCHURA 10)
               (empty-scene LONGITUD ANCHURA))))

; driver : Estado String -> Estado
; dado una tecla presionada, mueve el auto, lo reinicia o lo deja igual
(define (driver m k)
  (cond [(string=? k "right") (avanzar m)]
        [(string=? k "left") (retroceder m)]
        [(string=? k " ") INITIAL]))

; avanzar : Estado -> Estado
; Aumenta la posición del auto en X, hasta un límite derecho
(define (avanzar m)
  (if (>= m LIMITED)
      m  
      (+ m 3)))

; retroceder : Estado -> Estado
; Disminuye la posición del auto en X, hasta un límite izquierdo
(define (retroceder m)  
  (if (<= m 0)  
      m 
      (- m 3)))

; manipulador : Estado Number Number String -> Estado
; al presionar el mouse, mueve el auto a la posición X del clic
(define (manipulador m x y event)
  (cond [(string=? event "button-down") x]
        [else m]))


(big-bang INITIAL
  [to-draw screen]
  [on-tick avanzar 0.5]
  [on-key driver]
  [on-mouse manipulador]
  )

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

;9
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
  [on-mouse ubicador]
  [on-tick colorv 1]
  )

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






























