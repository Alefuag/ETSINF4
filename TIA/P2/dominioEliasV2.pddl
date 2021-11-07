;Dominio mercancias

;Breve descripción del dominio: se dispone de furgonetas, camiones, zona ZLE, zona intercambiador
;neutra y pedidos. Los pedidos se transportan con las furgonetas entre las distintas zonas. Un camión
;no puede circular por ua zona ZLE, una furgoneta por donde quiera. Los camiones solo pueden recorrer 70km diarios
;(entre todos), pero se puede ampliar 20km pagando 20€ (solo incrementos de 20). 

(define (domain mercanciasDomain) ;nombre del dominio
(:requirements :durative-actions :typing :fluents :strips)

(:types 
        pedido zona vehiculo - object 
        intercambiador neutra zle - zona
        furgoneta camion - vehiculo) ; existen camiones, furgonetas, pedidos, ZLE, intercambiador

(:predicates 
        (at ?v - (either vehiculo pedido) ?z - zona)
        (in ?p - pedido ?v - vehiculo)
)

(:functions 
            (distance ?z1 - zona ?z2 - zona)
	    (kilometraje)
	    (dinero-extra)
            (presupuesto)
)

(:durative-action transportar-camion
        :parameters (?v - camion ?z1 ?z2 - (either intercambiador neutra))
        :duration (= ?duration (/ (distance ?z1 ?z2) 4))
        :condition (and
                (at start(at ?v ?z1))
		(at start (>= (kilometraje) (distance ?z1 ?z2)))
        )
        :effect (and 
                (at start (not (at ?v ?z1)))
                (at end (at ?v ?z2))
	        (at start (decrease (kilometraje) (distance ?z1 ?z2)))  
        )
)

(:durative-action transportar-furgo
        :parameters (?v - furgoneta ?z1 - zona ?z2 - zona)
        :duration (= ?duration (distance ?z1 ?z2))
        :condition (and 
                (at start(at ?v ?z1))
        )
        :effect (and 
                (at start (not (at ?v ?z1)))
                (at end (at ?v ?z2))    
        )
)


(:durative-action incrementar
        :parameters ()
        :duration (= ?duration 1)
        :condition (and 
                (at start (>= (presupuesto) 20))
                (at start (>= (presupuesto) 0))
        )
        :effect (and 
                (at start (decrease (presupuesto) 20))
	        (at end (increase (dinero-extra) 20))
	        (at end (increase (kilometraje) 20))
        )
)

(:durative-action recoger
        :parameters (?v - vehiculo ?z1 - zona ?p - pedido)
        :duration (= ?duration 1)
        :condition (and 
                (at start (at ?p ?z1))
                (over all (at ?v ?z1))
        )
        :effect (and
                (at start (not (at ?p ?z1)))
                (at end (in ?p ?v))    
        )        
)

(:durative-action entregar
        :parameters (?v - vehiculo ?z1 - zona ?p - pedido)
        :duration (= ?duration 2)
        :condition (and 
                (at start (in ?p ?v))
                (over all (at ?v ?z1))
        )
        :effect (and 
                (at start (not (in ?p ?v)))
                (at end (at ?p ?z1))    
        )
)

(:durative-action swap
        :parameters (?v1  - vehiculo ?v2 - vehiculo ?z - intercambiador ?p - pedido)
        :duration (= ?duration 3)
        :condition (and 
                (over all (at ?v1 ?z))
		(over all (at ?v2 ?z))
		(at start (in ?p ?v1))
        )
        :effect (and    
                (at start (not (in ?p ?v1)))
                (at end (in ?p ?v2))	
        ) 
)
)
