(defun random-animal ()
  (nth (random 5) '("dog" "tick" "tiger" "walrus" "kangaroo")))

(loop repeat 10
      do (format t "~5t~a ~15t~a ~25t~a~%"
                 (random-animal)
                 (random-animal)
                 (random-animal)))
#|
    walrus    kangaroo  walrus
     tiger     tiger     kangaroo
     tick      dog       walrus
     kangaroo  tiger     tiger
     walrus    dog       tick
     walrus    kangaroo  kangaroo
     walrus    dog       kangaroo
     tick      tick      walrus
     tiger     tick      dog
     dog       dog       dog
|#

(loop repeat 10
      do (format t "~30<~a~;~a~;~a~>~%"
                 (random-animal)
                 (random-animal)
                 (random-animal)))
#|
walrus        tiger        dog
tick         tiger         dog
kangaroo       tick        dog
kangaroo     walrus      tiger
dog        walrus        tiger
walrus     tiger      kangaroo
tiger      tick       kangaroo
tiger      tick       kangaroo
dog         dog          tiger
dog       kangaroo       tiger
|#

(defparameter *animals* (loop repeat 8 collect (random-animal)))

(format t "~{I see a ~a! ~}" *animals*)
; I see a tiger! I see a dog! I see a dog! I see a tiger! I see a tiger! I see a tick! I see a walrus! I see a kangaroo!

(format t "~{I see a ~a... or was it a ~a?~%~}" *animals*)
#|
I see a tiger... or was it a dog?
I see a dog... or was it a tiger?
I see a tiger... or was it a tick?
I see a walrus... or was it a kangaroo?
|#

(format t "|~{~<|~%|~,33:;~2d ~>~}|" (loop for x below 100 collect x))
#|
| 0  1  2  3  4  5  6  7  8  9 |
|10 11 12 13 14 15 16 17 18 19 |
|20 21 22 23 24 25 26 27 28 29 |
|30 31 32 33 34 35 36 37 38 39 |
|40 41 42 43 44 45 46 47 48 49 |
|50 51 52 53 54 55 56 57 58 59 |
|60 61 62 63 64 65 66 67 68 69 |
|70 71 72 73 74 75 76 77 78 79 |
|80 81 82 83 84 85 86 87 88 89 |
|90 91 92 93 94 95 96 97 98 99 |
|#