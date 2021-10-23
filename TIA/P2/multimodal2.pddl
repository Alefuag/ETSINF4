(define (domain multimodal2)
(:requirements :durative-actions :typing :fluents :negative-preconditions :equality)
(:types combustion electric pedido neutro zle intercambio - object)

;;; LOS PEDIDOS PUEDEN ESTAR EN LOS PUNTOS

(:predicates (at ?v - (either combustion electric pedido) ?pun - (either zle neutro intercambiador))
             (in ?ped - pedido ?v - (either combustion electric))
             )


(:functions (total-distancia-combustion)
            (dinero-disponible)
            (dinero-gastado)
            (distance ?p1 - (either zle neutro intercambiador) ?p2 - (either zle neutro intercambiador))
            )



(:durative-action transportar-electric
 :parameters (?v - electric ?p1 - (either zle neutro intercambiador) ?p2 - (either zle neutro intercambiador))
 :duration (= ?duration (distance ?p1 ?p2))
 :condition (and (at start (at ?v ?p1))
            )
 :effect (and (at start (not (at ?v ?p1)))
              (at end (at ?v ?p2))
          )
)


(:durative-action transportar-combustion
 :parameters (?v - combustion ?p1 - (either neutro intercambiador) ?p2 - (either neutro intercambiador))
 :duration (= ?duration (/ (distance ?p1 ?p2) 4) )
 :condition (and
                (at start (at ?v ?p1))
                (at start (>= (total-distancia-combustion) (distance ?p1 ?p2)))
            )
 :effect (and   (at start (not (at ?v ?p1)))
                (at start (decrease (total-distancia-combustion) (distance ?p1 ?p2)))
                (at end (at ?v ?p2))
              
          )
)

(:durative-action intercambiar
    :parameters (?v1 ?v2 - (either combustion electric) ?p - (either zle intercambiador neutra) ?ped -pedido)
    :duration (= ?duration 3)
    :condition (and 
        (over all (at ?v1 ?p))
        (over all (at ?v2 ?p))
        (at start (in ?ped ?v1))
        )
    :effect (and 
        (at start (not (in ?ped ?v1)))
        (at end (in ?ped ?v2))
        )
    
)




(:durative-action incrementar
:parameters ()
:duration (= ?duration 1)
:condition (and (at start (>= (dinero-disponible) 20) )
            )
:effect (and
        (at end (decrease (dinero-disponible) 20))
        (at end (increase (dinero-gastado) 20) )
        (at end (increase (total-distancia-combustion) 20) )
        )
)



(:durative-action recoger
    :parameters (?v - (either combustion electric) ?ped - pedido ?p - (either zle neutro intercambiador))
    :duration (= ?duration 1)
    :condition (and
                (over all (at ?v ?p))
                (at start (at ?ped ?p))
                )
    :effect (and 
                (at start (not (at ?ped ?p)))
                (at end (in ?ped ?v))
                )
)

(:durative-action entregar
    :parameters (?v - (either combustion electric) ?ped - pedido ?p - (either zle neutro intercambiador))
    :duration (= ?duration 2)
    :condition (and 
                (over all (at ?v ?p))
                (at start (in ?ped ?v))
                
                )
    :effect (and 
                (at start (not (in ?ped ?v)))
                (at end (at ?ped ?p))
    )
)

)
