(define (domain multimodal)
(:requirements :durative-actions :typing :fluents)
(:types combustion electric pedido punto - object)

;;; LOS PEDIDOS PUEDEN ESTAR EN LOS PUNTOS

(:predicates (at ?v - (either combustion electric pedido) ?pun - punto)
             (in ?ped - pedido ?v - (either combustion electric))
             (intercambio ?p - punto)
             (zle ?p - punto)
             )

(:functions (total-distancia-combustion)
            (dinero-disponible)
            (distance ?p1 - punto ?p2 - punto)

            )


(:durative-action transportar-combustion
 :parameters (?c - combustion ?p1 ?p2 - punto)
 :duration (= ?duration (/ (distance ?p1 ?p2) 4) )
 :condition (and (at start (at ?c ?p1))
                 (over all (not (zle ?p1)) )
                 (over all (not (zle ?p2)) )
                 (at start (>= (total-distancia-combustion) (distance -p1 -p2) ))
            )
 :effect (and (at start (not (at ?c ?p1)))
              (at end (at ?c ?p2))
              (decrease (total-distancia-combustion) (distance -p1 -p2))
          )
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

(:durative-action ampliar
:parameters ()
:duration (= ?duration 1)
:condition (and (>= (dinero-disponible) 20)
            )
:effect (and (decrease (dinero-disponible) 20)
             (increase (total-distancia-combustion) 20)
        )
)


)
