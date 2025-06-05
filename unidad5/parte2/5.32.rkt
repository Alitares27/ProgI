;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.32|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 32

(define-struct alumno [nombre nota faltas])
; alumno  (String, Number, Natural). Interpretación
; - nombre representa el nombre del alumno.
; - nota representa la calificación obtenida por el alumno (entre 0 y 10).
; - faltas: número de clases a las el alumno no asistió.


; escoge : Struct -> Boolean
; Devuelve #t si la nota del
; alumno es mayor o igual a 9
(define (escoge l)
  (>= (alumno-nota l) 9))

; destacados : Listof Struct -> String
; Devuelve el nombre del estudiante que tiene
; una nota mayor o igual a 9
(define (destacados l)
  (if (empty?(filter escoge l))
      "" (alumno-nombre (first (filter escoge l)))))

(check-expect
 (destacados
  (list (make-alumno "Ada Lovelace" 10 20)
        (make-alumno "Carlos Software" 3.5 12))) "Ada Lovelace")


; clasificar: Struct -> String
; dada una nota de alumno indica la condicion
(define (clasificar l)
  (cond
    [(< (alumno-nota l) 6) "libre"]
    [(< (alumno-nota l) 8) "regular"]
    [else "promovido"]))

; condicion : Listof Struct -> Listof String
; devuelve la condicion del alumno dada una nota obtenida
(define (condicion l)
  (map clasificar l))

(check-expect
 (condicion
  (list (make-alumno "Ada Lovelace" 10 20)
        (make-alumno "Carlos Software" 3.5 12)
        (make-alumno "Juan Computación" 7 2)))
 (list "promovido" "libre" "regular"))



















