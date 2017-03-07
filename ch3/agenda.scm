(load "p3-29.scm")
(load "queue.scm")

(define (after-delay delay action)
    (add-to-agenda! (+ delay (current-time the-agenda))
                    action
                    the-agenda)
)

; 模拟驱动函数
(define (propagate)
    (if (empty-agenda? the-agenda)
        'done
        (let ((first-item (first-agenda-item the-agenda)))
            (first-item)
            (remove-first-agenda-item! the-agenda)
            (propagate)
        )))

; 显示模拟器的监视器
(define (probe name wire)
    (add-action! wire
            (lambda ()
                (newline)
                (display name)
                (display " ")
                (display (current-time the-agenda))
                (display " New-value = ")
                (display (get-signal wire)))
    ))

; 待处理表的实现

; 时间段实现
(define (make-time-segment time queue)
    (cons time queue))
; 获取时间
(define (segment-time s) (car s))
; 获取当前时间内的带处理过程
(define (segment-queue s) (cdr s))

; 表实现
(define (make-agenda) (list 0))
(define (current-time agenda) (car agenda))
(define (set-current-time! agenda time)
    (set-car! agenda time))
(define (segments agenda) (cdr agenda))
(define (set-segments! agenda segments)
    (set-cdr! agenda segments))
(define (first-segment agenda) (car (segments agenda)))
(define (rest-segments agenda) (cdr (segments agenda)))
(define (empty-agenda? agenda) (null? (segments agenda)))

; 将动作加入待处理表
(define (add-to-agenda! time action agenda)
    ; 检测时间是否在某时间段之前
    (define (belongs-before? segments)
        (or (null? segments)
            (< time (segment-time (car segments)))))
    ; 创建时间动作序对
    (define (make-new-time-segment time action)
        (let ((q (make-queue)))
            (insert-queue! q action)
            (make-time-segment time q)))
    (define (add-to-segments! segments)
        (if (= (segment-time)（car segments)
            (insert-queue! (segment-queue (car segments)) action)
            (let ((rest (cdr segments)))
                (set-cdr!
                segments
                (cons (make-new-time-segment time action) (cdr segments)))
                (add-to-segments! rest)
            )))
    (let ((segments (segments agenda)))
        (if (belongs-before? segments)
            (set-segments!
                agenda
                (cons (make-new-time-segment time action)
                        segments))
            (add-to-segments! segments))
    )
    ; 删除表中第一项
    (define (remove-first-agenda-item! agenda)
        (let ((q (segment-queue (first-segment agenda))))
            (delete-queue! q)
            (if (empty-queue? q)
                (set-segments agenda (rest-segments agenda)))
        ))
    ; 获得表中第一项
    (define (first-agenda-item agenda)
        (if (empty-agenda? agenda)
            (error ("Agenda is empty -- FIRST-AGENDA-ITEM"))
            (let ((first-seg (first-segment agenda)))
                (set-current-time! agenda (segment-time first-seg))
                (front-queue (segment-queue first-seg)))))
)
