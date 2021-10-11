(defparameter *node-num* 1000)
(defparameter *edge-num* 1000)

(defun random-node ()
  (1+ (random *node-num*)))

(defun edge-pair (a b)
  (unless (eql a b)
    (list (cons a b) (cons b a))))

(defun make-edge-list ()
  (apply #'append (loop repeat *edge-num*
                        collect (edge-pair (random-node) (random-node)))))

(defun direct-edges (node edge-list)
  (remove-if-not (lambda (x)
                   (eql (car x) node))
                 edge-list))

(defun get-connected (node edge-list)
  (let ((visited nil))
    (labels ((traverse (node)
               (unless (member node visited)
                 (push node visited)
                 (mapc (lambda (edge)
                         (traverse (cdr edge)))
                       (direct-edges node edge-list)))))
      (traverse node))
    visited))

(defun hash-edges (edge-list)
  (let ((tab (make-hash-table)))
    (mapc (lambda (x)
            (let ((node (car x)))
              (push (cdr x) (gethash node tab))))
          edge-list)
    tab))

(defun get-connected-hash (node edge-tab)
  (let ((visited (make-hash-table)))
    (labels ((traverse (node)
               (unless (gethash node visited)
                 (setf (gethash node visited) t)
                 (mapc (lambda (edge)
                         (traverse edge))
                       (gethash node edge-tab)))))
      (traverse node))
    visited))

#|
(time (dotimes (i 100) (get-connected 1 (make-edge-list))))
Evaluation took:
  0.779 seconds of real time
  0.779055 seconds of total run time (0.778437 user, 0.000618 system)
  ...

(time (dotimes (i 100) (get-connected-hash 1 (hash-edges (make-edge-list)))))
Evaluation took:
  0.032 seconds of real time
  0.032402 seconds of total run time (0.031614 user, 0.000788 system)
  [ Run times consist of 0.006 seconds GC time, and 0.027 seconds non-GC time. ]
|#