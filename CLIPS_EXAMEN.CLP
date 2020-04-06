(deffacts datos (max 650) 
(peso 300 origen 1 destino 3 actual 1)
(peso 500 origen 2 destino 3 actual 2)
(peso 300 origen 2 destino 4 actual 2)
(pos 0 carga 0)
)


(defrule cargar-paquete
	(salience 100)
	?f1 <- (pos ?x carga ?c)
	?f2 <- (max ?m)
	?f3 <- (peso ?p origen ?o destino ?d actual ?a)
	(test (< ?c ?m))
	(test (<= (+ (?c ?p) 650)
	=>
	(retract ?f1)
	(assert (pos ?x carga (+ ?p ?c)))
)

(defrule entregar-paquete
	(salience 100)
	?f1 <- (pos ?x carga ?c)
	?f3 <- (peso ?p origen ?o destino ?d actual ?a)
	(test (= ?a ?d))
	=>
	(retract ?f1)
	(assert (pos ?x carga (- ?p ?c)))
)

(defrule mover-arriba
	(salience 50)
	?f1 <- (pos ?x carga ?c)
	?f3 <- (peso ?p origen ?o destino ?d actual ?a)
	(test (> ?a ?d))
	=>
	(retract ?f1)
	(assert (pos (+ ?x 1) carga ?c))
	(assert (peso ?p origen ?o destino ?d actual (+ ?a 1))
)


(defrule mover-abajo
	(salience 50)
	?f1 <- (pos ?x carga ?c)
	?f3 <- (peso ?p origen ?o destino ?d actual ?a)
	(test (> ?a ?d))
	=>
	(retract ?f1)
	(assert (pos (- ?x 1) carga ?c))
	(assert (peso ?p origen ?o destino ?d actual (- ?a 1))
	
)

(defrule todo-entregado
	(salience 1)
	=>
	(halt)
)
