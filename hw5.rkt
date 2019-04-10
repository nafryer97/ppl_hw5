; Homework 5 -- Scheme Project
#lang racket/base

; Calculates the sum of two lists

(define l_add
  (lambda (list1 list2) 
    (if (null? list1)
	list2
	(if (null? list2) 
	  list1 
	  (cons (+ (car list1) (car list2))
		(l_add (cdr list1) (cdr list2)))))))

; Checks if the list is just a list of 0s

(define poly_check
  (lambda (poly)
    (if (null? poly)
        '()
        (if (= 0 (car poly))
            (if (equal? (member 0 (cdr poly)) (cdr poly))
                '()
                poly)
                poly))))

; Uses the above helper functions to add two bivariate polynomials

(define poly_add
  (lambda (poly1 poly2)
    (if (null? poly1)
        poly2
        (if (null? poly2)
            poly1
            (cons (poly_check (l_add (car poly1) (car poly2)))
                  (poly_add (cdr poly1) (cdr poly2)))))))

; Calculates the difference of two lists

(define l_sub
  (lambda (list1 list2)
        (if (null? list2)
            list1
            (if (null? list1)
                (cons (- 0 (car list2))
                      (l_sub '(0) (cdr list2)))
                (cons (- (car list1) (car list2))
                       (l_sub (cdr list1) (cdr list2)))))))

; Uses the above helper functions to calculate the difference of two bivariate polynomials

(define poly_sub
  (lambda (poly1 poly2)
    (if (null? poly1)
        poly2
        (if (null? poly2)
            poly1
            (cons (poly_check (l_sub (car poly1) (car poly2)))
                  (poly_sub (cdr poly1) (cdr poly2)))))))
