;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.26|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 26

; pegar : Listof Strings -> String
; Dada una lista de cadenas, devuelve una cadena
(define (pegar l)
  (if (empty? l)
      ""
      (string-append (first l) (pegar (rest l)))))


(pegar (list "Las " "lis" "tas " "son " "complicadas" "."))