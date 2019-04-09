; Homework 5 -- Scheme Project
#lang racket/base

(define l_add
  (lambda (list1 list2) 
    (if (null? list1)
	list2
	(if (null? list2) 
	  list1 
	  (cons (+ (car list1) (car list2))
		(l_add (cdr list1) (cdr list2)))))))

(define poly_check
  (lambda (poly)
    (if (null? poly)
        '()
        (if (= 0 (car poly))
            (if (null? (cdr poly))
                '()
                (poly_check (cdr poly)))
            poly))))

(define poly_add
  (lambda (poly1 poly2)
    (if (null? poly1)
        poly2
        (if (null? poly2)
            poly1
            (cons (l_add (car poly1) (car poly2))
                   (poly_add (cdr poly1) (cdr poly2)))))))