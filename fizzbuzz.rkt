;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname fizzbuzz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
 ; div? : Number Number-> Boolean
 (define (div? x y) (= 0 (modulo x y)))
 ; fizzbuzz : Number-> String
 (define (fizzbuzz n)
 (cond [(div? n 15) "fizzbuzz"]
 [(div? n 3) "fizz"]
 [(div? n 5) "buzz"]
 [else (number->string n )]))