(load "p1-21.scm")
(load "fermat-test.scm")

(define (time-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (fast-prime? n 20000)
        (report-prime (- (runtime) start-time))))

(define (report-prime elasped-time)
    (display " *** ")
    (display elasped-time))

非常数原因：1.费马检查是产生随机数计算，抽到的数是1还是n-1对计算时间会有影响，从而在抽样数目较小时对结果产生一定干扰 
2.随着n的数目增大，随机数a的期望变大，a^n%n计算花费的时间也变长，导致单步时间变长
