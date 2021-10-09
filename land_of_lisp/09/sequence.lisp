(reduce (lambda (best item)
          (if (and (evenp item) (> item best))
              item
              best))
        '(7 4 6 5 2)
        :initial-value 0)
; 6

(reduce (lambda (best item)
          (if (and (evenp item) (> item best))
              item
              best))
        '(7 4 6 5 2))
; 7

(map 'list
     (lambda (x)
       (if (eq x #\s)
           #\S
           x))
     "this is a string")
; (t h i S i S a S t r i n g)

(subseq "america" 2 6)
; eric

(sort '(5 8 2 4 9 3 6) #'<)
; (2 3 4 5 6 8 9)