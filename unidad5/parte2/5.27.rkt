;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.27|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 27

;verificar : Number -> Boolean
; dado un numero devuelve #t si el numero es positivo
(define (verificar l)
  (>= l 0))

; filtrar : Listof Numbers -> List of Numbers
; dada una lista de numeros filtra los numeros no negativos
(define (filtrar l)
  (filter verificar l))

; raices : Listof Numbers -> List of Numbers
; dada una lista de numeros devuelve una lista de numeros con 
; las raices de dicha lista
(define (raices l)
  (map sqrt (filtrar l)))

(check-expect(raices (list 16 -4 9 0))(list 4 3 0))
