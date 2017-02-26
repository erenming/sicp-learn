(define (look-up given-key tree-of-records)
    (cond
        ((null? tree-of-records) false)
        ((= given-key (key (entry tree-of-records))) true)
        ((< given-key (key (entry tree-of-records))) (look-up given-key (left-branch tree-of-records)))
        ((> given-key (key (entry tree-of-records))) (look-up given-key (right-branch tree-of-records)))
    )
)
