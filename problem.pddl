(define (problem comenzi)

(:domain livrare-mancare)
(:objects
     comanda123 - comanda
     comanda45 - comanda
     comanda66 - comanda
     comanda12 - comanda
     comanda3 - comanda
     
     bic1 - biciclist
     sofer2 - sofer
     sofer3 - sofer
     
     restaurant - locatie
     dorobantilor - locatie
     mihali - locatie
     baritiu - locatie
    bucuresti - locatie
     
)

(:init
(not(ploua))
(= (total-cost) 0)

(not(comanda-mare comanda123))
(not(comanda-mare comanda66))
(comanda-mare comanda45)
(comanda-mare comanda12)
(comanda-mare comanda3)

(la-locatie comanda123 baritiu)
(la-locatie comanda45 restaurant)
(la-locatie comanda12 restaurant)
(la-locatie comanda66 restaurant)
(la-locatie comanda3 restaurant)

(la-locatie sofer2 restaurant)
(la-locatie sofer3 mihali)
(la-locatie bic1 mihali)
(fara-benzina sofer2)
(not(fara-benzina sofer3))


)

(:goal
(and(la-locatie comanda123 dorobantilor)(la-locatie comanda45 mihali)(la-locatie comanda66 dorobantilor)(la-locatie comanda12 bucuresti)(la-locatie comanda3 dorobantilor))
)

(:metric minimize (total-cost))

)