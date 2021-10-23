(define (domain multimodal)
(:requirements :durative-actions :typing :fluents :negative-preconditions)
(:types combustion electric pedido punto - object)

;;; LOS PEDIDOS PUEDEN ESTAR EN LOS PUNTOS

(:predicates (at ?v - (either combustion electric pedido) ?pun - punto)
             (in ?ped - pedido ?v - (either combustion electric))
             (intercambio ?p - punto)
             (zle ?p - punto)
             )


(:functions (total-distancia-combustion)
            (dinero-disponible)
            (dinero-gastado)
            (distance ?p1 - punto ?p2 - punto)
            )



(:durative-action transportar-electric
 :parameters (?e - electric ?p1 ?p2 - punto)
 :duration (= ?duration (distance ?p1 ?p2))
 :condition (and (at start (at ?e ?p1))
            )
 :effect (and (at start (not (at ?e ?p1)))
              (at end (at ?e ?p2))
          )
)


(:durative-action transportar-combustion
 :parameters (?v - combustion ?p1 ?p2 - punto)
 :duration (= ?duration (/ (distance ?p1 ?p2) 4) )
 :condition (and
                (over all (and
                    (>= (total-distancia-combustion) (distance ?p1 ?p2) )
                    (not (zle ?p1))
                    (not (zle ?p2))
                ))
                (at start (and 
                    (at ?v ?p1)
                ))
            )
 :effect (and   (at start (not (at ?v ?p1)))
                (at start (decrease (total-distancia-combustion) (distance ?p1 ?p2)))
                (at end (at ?v ?p2))
              
          )
)

(:durative-action intercambiar
    :parameters (?v1 ?v2 - (either combustion electric) ?p - punto ?ped -pedido)
    :duration (= ?duration 3)
    :condition (and 
        (at start (and
            (in ?ped ?v1)
        ))
        (over all (and
            (intercambio ?p)
            (at ?v1 ?p)
            (at ?v2 ?p)
        ))
    )
    :effect (and 
        (at start (and
            (not (in ?ped ?v1))
        ))
        (at end (and 
            (in ?ped ?v2)
        ))
    )
)




(:durative-action incrementar
:parameters ()
:duration (= ?duration 1)
:condition (and (at start (>= (dinero-disponible) 20) )
            )
:effect (at end (and
            (decrease (dinero-disponible) 20)
            (increase (total-distancia-combustion) 20)
            (increase (dinero-gastado) 20)
        ))
)



(:durative-action recoger
    :parameters (?v - (either combustion electric) ?ped - pedido ?p - punto)
    :duration (= ?duration 1)
    :condition (and 
        (at start (and
                    (at ?v ?p)
                    (at ?ped ?p)
        ))
    )
    :effect (and 
        (at start (and 
                    (not (at ?ped ?p) )
        ))
        (at end (and
                    (in ?ped ?v)
        ))
    )
)

(:durative-action entregar
    :parameters (?v - (either combustion electric) ?ped - pedido ?p - punto)
    :duration (= ?duration 2)
    :condition (and 
        (at start (and
            (at ?v ?p)
            (in ?ped ?v)
        ))
    )
    :effect (and 
        (at start (and
            (not (in ?ped ?v))
        ))
        (at end (and
            (at ?ped ?p)
        ))
    )
)
)
