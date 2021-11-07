(define (problem multiproblembasic)
(:domain multimodal)

(:objects
    c1 - combustion
    c2 - combustion

    ;; Ampliación 1
    c3 - combustion
    c4 - combustion


    e1 - electric
    e2 - electric

    pa - punto
    pb - punto
    pc - punto
    pd - punto
    pe - punto
    pf - punto

    ped1 - pedido
    ped2 - pedido
    ped3 - pedido
    ped4 - pedido
    ped5 - pedido

    ; Ampliación 1
    ped6 - pedido
    ped7 - pedido
)

(:init
    (= (dinero-disponible) 0)
    (= (total-distancia-combustion) 70)
    (= (dinero-gastado) 0)
    (= (total-transporte-camiones) 0)

    (= (distance pa pa) 0)
    (= (distance pa pb) 4)
    (= (distance pa pc) 6)
    (= (distance pa pd) 10)
    (= (distance pa pe) 52)
    (= (distance pa pf) 100)

    (= (distance pb pa) 4)
    (= (distance pb pb) 0)
    (= (distance pb pc) 4)
    (= (distance pb pd) 16)
    (= (distance pb pe) 20)
    (= (distance pb pf) 40)

    (= (distance pc pa) 6)
    (= (distance pc pb) 4)
    (= (distance pc pc) 0)
    (= (distance pc pd) 28)
    (= (distance pc pe) 55)
    (= (distance pc pf) 30)

    (= (distance pd pa) 10)
    (= (distance pd pb) 16)
    (= (distance pd pc) 28)
    (= (distance pd pd) 0)
    (= (distance pd pe) 30)
    (= (distance pd pf) 10)

    (= (distance pe pa) 52)
    (= (distance pe pb) 20)
    (= (distance pe pc) 55)
    (= (distance pe pd) 30)
    (= (distance pe pe) 0)
    (= (distance pe pf) 160)

    (= (distance pf pa) 100)
    (= (distance pf pb) 40)
    (= (distance pf pc) 30)
    (= (distance pf pd) 10)
    (= (distance pf pe) 160)
    (= (distance pf pf) 0)


    (zle pa)
    (zle pb)
    (intercambio pc)
    (intercambio pd)
    (intercambio pe)

    (at c1 pc)
    (at c2 pc)
    (at e1 pb)
    (at e2 pb)

    ;; Camiones añadidos
    (at c3 pd)
    (at c4 pd)


    (at ped1 pa)
    (at ped2 pb)
    (at ped3 pf)
    (at ped4 pd)
    (at ped5 pe)

    ;; Pedidos añadidos
    (at ped6 pd)
    (at ped7 pe)


)

(:goal (and
    (at ped1 pf)
    (at ped2 pe)
    (at ped3 pd)
    (at ped4 pe)
    (at ped5 pa)
    (at ped6 pc)
    (at ped7 pf)

))


(:metric minimize (+ (* 0.2 (total-time)) (* 0.2 (total-transporte-camiones)) ))
)
