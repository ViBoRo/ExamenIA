(deffacts datos (posRobot 4 1 0) 
	(posCasa 1 3) 
	(posCaja 4 5 0)
	(obstaculo 3 1)
	(obstaculo 1 4)
	(obstaculo 3 4)
	(obstaculo 4 4)
	(obstaculo 5 4)
	(obstaculo 3 5)
	(obstaculo 3 6)
	(dimension 5 8)
	(profundidad 20)
)

(defrule mover-arriba
	?f1 <- (posRobot ?x ?y)
	(not (obstaculo = (- ?x 1) ?y))
		(test (<> (- ?x 1) 0))
	=>
	(retract ?f1)
	(assert (posRobot (- ?x 1) ?y))
)

(defrule mover-abajo
	(dimension ?filas ?columnas)
	?f2 <- (posRobot ?x ?y)
	(not (obstaculo =(+ ?x 1) ?y))
		(test (<> (+ ?x 1) (+ ?filas 1)))
	=>
	(retract ?f2)
	(assert (posRobot (+ ?x 1) ?y))
)

(defrule mover-derecha
	(dimension ?filas ?columnas)
	?f3 <- (posRobot ?x ?y)
	(not (obstaculo ?x =(+ ?y 1)))
		(test (<> (+ ?y 1) (+ ?columnas 1)))
	=>
	(retract ?f3)
	(assert (posRobot  ?x (+ ?y 1)))
)

(defrule mover-izquierda
	?f4 <- (posRobot ?x ?y)
	(not (obstaculo ?x =(- ?y 1)))
		(test (<> (- ?y 1) 0))
	=>
	(retract ?f4)
	(assert (posRobot  ?x (- ?y 1))) 
)

(defrule recogerCaja 
	(salience 10)
	(posRobot ?x ?y)
	(posCaja ?x2 ?y2 ?estado)
		(test (= ?x ?x2))
		(test (= ?y ?y2))
	=>
	(assert (posCaja ?x2 ?y2 1))
)

(defrule entregaCaja
	(salience 10)
	(posRobot ?x ?y)
	(posCaja ? ? ?estado)
	(posCasa ?x3 ?y3)
		(test (= ?x ?x3))
		(test (= ?y ?y3))
		(test (= ?estado 1))
	=>
	(printout t "He encontrado la solucion " crlf)
	(halt)
)