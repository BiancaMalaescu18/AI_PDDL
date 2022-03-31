(define (domain livrare-mancare)

(:requirements :strips :action-costs) 

(:types comanda vehicul - object
		sofer biciclist - vehicul
		locatie 
          
)

(:functions
(total-cost) - number
)




(:predicates
(la-locatie ?obj - object ?loc - locatie)
(in-vehicul ?coma - comanda ?sof - vehicul)
(comanda-mare ?com - comanda)
(fara-benzina ?sof - sofer)
(ploua)
)



(:action preia_comanda_soferul
:parameters (?sof - sofer ?com - comanda ?loc - locatie)
:precondition (and (la-locatie ?sof ?loc)
(la-locatie ?com ?loc))
:effect (and (not (la-locatie ?com ?loc))
(in-vehicul ?com ?sof))
)

(:action preia_comanda_biciclistul
:parameters (?sof - biciclist ?com - comanda ?loc - locatie)
:precondition (and (la-locatie ?sof ?loc)
(la-locatie ?com ?loc)
(not(comanda-mare ?com))
)
:effect (and (not (la-locatie ?com ?loc))
(in-vehicul ?com ?sof))
)


(:action livreaza_comanda
:parameters (?sof - vehicul ?com - comanda ?loc - locatie)
:precondition (and (la-locatie ?sof ?loc)
(in-vehicul ?com ?sof))
:effect (and(not (in-vehicul ?com ?sof))(la-locatie ?com ?loc))
)

(:action conduce-masina
:parameters (?sof - sofer ?loc1 - locatie ?loc2 - locatie)
:precondition (and(la-locatie ?sof ?loc1) (not(fara-benzina ?sof)))
:effect (and (la-locatie ?sof ?loc2) (not(la-locatie ?sof ?loc1)) (increase (total-cost) 9)) 
)

(:action conduce-bicicleta
:parameters (?sof - biciclist ?loc1 - locatie ?loc2 - locatie)
:precondition (and(la-locatie ?sof ?loc1)(not(ploua)))
:effect (and (la-locatie ?sof ?loc2) (not(la-locatie ?sof ?loc1)) (increase (total-cost) 7))
)

(:action alimenteaza
:parameters (?sof - sofer)
:precondition (fara-benzina ?sof)
:effect (and(not(fara-benzina ?sof ))(increase (total-cost) 8))
)


)