(define (problem problem_name) (:domain mercancias)
(:objects
c1 - camion
c2 - camion
f1 - furgoneta
f2 - furgoneta
A - zle
B - zle
C - intercambiador
D - intercambiador
E - intercambiador
F - neutra
p1 - pedido
p2 - pedido
p3 - pedido
p4 - pedido
p5 - pedido
)

(:init
    ;Vehiculos
    (at c1 C)
    (at c2 C)
    (at f1 B)
    (at f2 B)
    ;Paquetes
    (at p1 A)
    (at p2 B)
    (at p3 F)
    (at p4 D)
    (at p5 E)
    ;Funciones
    (= (distance A A) 0)
    (= (distance A B) 4)
    (= (distance B A) 4)
    (= (distance A C) 6)
    (= (distance C A) 6)
    (= (distance A D) 10)
    (= (distance D A) 10)
    (= (distance A E) 52)
    (= (distance E A) 52)
    (= (distance A F) 100)
    (= (distance F A) 100)

    (= (distance B B) 0)
    (= (distance B C) 4)
    (= (distance C B) 4)
    (= (distance B D) 16)
    (= (distance D B) 16)
    (= (distance B E) 20)
    (= (distance E B) 20)
    (= (distance B F) 40)
    (= (distance F B) 40)

    (= (distance C C) 0)
    (= (distance C D) 28)
    (= (distance D C) 28)
    (= (distance C E) 55)
    (= (distance E C) 55)
    (= (distance C F) 30)
    (= (distance F C) 30)

    (= (distance D D) 0)
    (= (distance D E) 30)
    (= (distance E D) 30)
    (= (distance D F) 10)
    (= (distance F D) 10)

    (= (distance E E) 0)
    (= (distance E F) 160)
    (= (distance F E) 160)

    (= (distance F F) 0)
    
    (= (kilometraje) 70)
    (= (presupuesto) 40)
    (= (dinero-extra) 0)

)
(:goal (and
	(at p1 F)
	(at p2 E)
	(at p3 D)
    (at p4 E)
    (at p5 A)
	))

(:metric minimize (+ (* 0.8 (total-time)) (* 0.2 (dinero-extra))))
)
