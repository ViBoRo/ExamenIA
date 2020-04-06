(deffacts datos (max 650) 
(peso 300 origen 1 destino 3 actual 1)
(peso 500 origen 2 destino 3 actual 2)
(peso 300 origen 2 destino 4 actual 2)
(pos 0 carga 0)
)


(defrule cargar-paquete
	(salience 10)
	?f1 <- (pos ?x carga ?y)
	?f2 <- (max ?m)
	(test (<> (- ?x 1) 0))
	=>
	(retract ?f1)
	(assert (pos (- ?x 1) ?y))
)

(defrule entregar-paquete
	(salience 10)
)

(defrule mover-arriba
	
)


(defrule mover-abajo
	
)

