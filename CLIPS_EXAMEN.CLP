(deffacts datos (max 650) 
(peso 300 origen 1 destino 3 actual 1)
(peso 500 origen 2 destino 3 actual 2)
(peso 300 origen 2 destino 4 actual 2)
(pos 0 carga 0 entregar-en)
)


(defrule cargar-paquete
	(salience 100)
	?f1 <- (pos ?x carga ?c entregar-en ?)
	?f2 <- (max ?m)
	?f3 <- (peso ?p origen ?o destino ?d actual ?a)
	(test (< ?c ?m))
	(test (< ?c ?m))
	=>
	(retract ?f1)
	(assert (peso (+ ?p ?c) ?y))
)

(defrule entregar-paquete
	(salience 100)
)

(defrule mover-arriba
	

)


(defrule mover-abajo

	
)

