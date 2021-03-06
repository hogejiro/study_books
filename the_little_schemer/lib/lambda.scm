(define-module lambda
 (define rember-f
  (lambda (test?)
   (lambda (a l)
    (cond
     ((null? l) quote())
     ((test? (car l) a) (cdr l))
     (else (cons (car l)
            ((rember-f test?) a
             (cdr l))))))))
 (define eq?-c
  (lambda (a)
   (lambda (x)
    (eq? x a))))
 (define seqL
  (lambda (new old l)
   (cons new (cons old l))))
 (define seqR
  (lambda (new old l)
   (cons old (cons new l))))
 (define insert-g
  (lambda (seq)
   (lambda (new old l)
    (cond
     ((null? l) quote())
     ((eq? (car l) old)
      (seq new old (cdr l)))
     (else (cons (car l)
            ((insert-g seq) new old
             (cdr l))))))))
 (define insertL (insert-g seqL))
 (define insertR (insert-g seqR))
 (define seqS
  (lambda (new old l)
   (cons  new l)))
 (define subst (insert-g seqS))
 (define seqrem
  (lambda (new old l)
   l))
 (define rember
  (lambda (a l)
   ((insert-g seqrem) #f a l)))
 (define %
  (lambda (n m)
   (cond
    ((zero? m) 1)
    (else (* n (% n (- m 1)))))))
 (define atom-to-function
  (lambda (x)
   (cond
    ((eq? x (quote +)) +)
    ((eq? x (quote *)) *)
    (else %))))
 (define atom?
  (lambda (x)
   (and (not (null? x))
    (not (pair? x)))))
 (define first-sub-exp
  (lambda (aexp)
   (car (cdr aexp))))
 (define second-sub-exp
  (lambda (aexp)
   (car (cdr (cdr aexp)))))
 (define operator
  (lambda (aexp)
   (car aexp)))
 (define value
  (lambda (nexp)
   (cond
    ((atom? nexp) nexp)
    (else
     ((atom-to-function (operator nexp))
      (value (first-sub-exp nexp))
      (value (second-sub-exp nexp)))))))
 (define multirember-f
  (lambda (test?)
   (lambda (a lat)
    (cond
     ((null? lat) quote())
     ((test? a (car lat))
      ((multirember-f test?) a
       (cdr lat)))
     (else (cons (car lat)
            ((multirember-f test?) a
             (cdr lat))))))))
 (define multirember-eq?
  (multirember-f eq?))
 (define eq?-tuna
  (eq?-c (quote tuna)))
 (define multiremberT
  (lambda (test? lat)
   (cond
    ((null? lat) quote())
    ((test? (car lat))
     (multiremberT test? (cdr lat)))
    (else (cons (car lat)
           (multiremberT test?
            (cdr lat)))))))
 (define multirember&co
  (lambda (a lat col)
   (cond
    ((null? lat)
     (col (quote()) (quote())))
    ((eq? (car lat) a)
     (multirember&co a
      (cdr lat)
      (lambda (newlat seen)
       (col newlat
        (cons (car lat) seen)))))
    (else
     (multirember&co a
      (cdr lat)
      (lambda (newlat seen)
       (col (cons (car lat) newlat)
        seen)))))))
 (define multiinsertLR
  (lambda (new oldL oldR lat)
   (cond
    ((null? lat) (quote()))
    ((eq? (car lat) oldL)
     (cons new
      (cons oldL
       (multiinsertLR new oldL oldR
        (cdr lat)))))
    ((eq? (car lat) oldR)
     (cons oldR
      (cons new
       (multiinsertLR new oldL oldR
        (cdr lat)))))
    (else (cons (car lat)
           (multiinsertLR new oldL oldR
            (cdr lat)))))))
 (define multiinsertLR&co
  (lambda (new oldL oldR lat col)
   (cond
    ((null? lat)
     (col (quote()) 0 0))
    ((eq? (car lat) oldL)
     (multiinsertLR&co new oldL oldR
      (cdr lat)
      (lambda (newlat L R)
       (col (cons new
             (cons oldL newlat))
        (+ 1 L) R))))
    ((eq? (car lat) oldR)
     (multiinsertLR&co new oldL oldR
      (cdr lat)
      (lambda (newlat L R)
       (col (cons oldR
             (cons new newlat))
        L (+ 1 R)))))
    (else (multiinsertLR&co new oldL oldR
            (cdr lat)
            (lambda (newlat L R)
             (col (cons (car lat) newlat)
              L R)))))))
 (define even?
  (lambda (n)
   (= (mod n 2) 0)))
 (define evens-only*
  (lambda (l)
   (cond
    ((null? l) (quote()))
    ((atom? (car l))
     (cond
      ((even? (car l))
       (cons (car l)
        (evens-only* (cdr l))))
      (else (evens-only* (cdr l)))))
    (else (cons (evens-only* (car l))
           (evens-only* (cdr l)))))))
 (define evens-only*&co
  (lambda (l col)
   (cond
    ((null? l) (col (quote()) 1 0))
    ((atom? (car l))
     (cond
      ((even? (car l))
       (evens-only*&co (cdr l)
        (lambda (newl p s)
         (col (cons (car l) newl)
          (* (car l) p) s))))
      (else
       (evens-only*&co (cdr l)
        (lambda (newl p s)
         (col newl
          p (+ (car l) s)))))))
    (else (evens-only*&co (car l)
           (lambda (al ap as)
            (evens-only*&co (cdr l)
             (lambda (dl dp ds)
              (col (cons al dl)
               (* ap dp)
               (+ as ds))))))))))
 (export lambda)
)
