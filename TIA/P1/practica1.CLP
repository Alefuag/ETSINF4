(deftemplate coche
  (slot id (type SYMBOL))
  (slot distancia (type INTEGER)) 
  (slot velocidad (type INTEGER))
  (slot fuerzaFrenadoMax (type FLOAT))
  (slot fuerzaAceleracionMax (type FLOAT))
  (slot fuerzaFrenadoMom (type FLOAT))
  (slot fuerzaAceleracionMom (type FLOAT))  
)

(deftemplate distancia-difusa ;es una variable difusa
    0 50 metros
    (   (cerca (5 1) (15 0))
        (medio (10 0) (20 1) (30 1) (35 0))
        (lejos (30 0) (35 1))  
    )
)

(deftemplate velocidad-difusa ;es una variable difusa
    -30 30 kmh
    (   (alejando (-30 1) (0 0))
        (constante (-10 0) (0 1) (15 0))
        (acercando (0 0) (30 1))  
    )
)

(deftemplate fuerza-aceleracion-difusa ;es una variable difusa
    0 100 porciento
    (   (nula (0 0) (0 1) (0 0))
        (baja (5 1) (20 0))
        (media (10 0) (40 1) (60 1) (70 0))
        (alta (60 0) (100 1))  
    )
)

(deftemplate presion-freno-difusa ;es una variable difusa
    0 100 porciento
    (   (nula (0 0) (0 1) (0 0))
        (baja (5 1) (20 0))
        (media (10 0) (40 1) (60 1) (70 0))
        (alta (60 0) (100 1))   
    )
)

(deffunction fuzzify (?fztemplate ?value ?delta)
    (bind ?low (get-u-from ?fztemplate)) ;coge el mínimo del valor del template
    (bind ?hi (get-u-to ?fztemplate)) ;coge el máximo del valor del template
    
    (if (<= ?value ?low)
        then
            (assert-string
            (format nil "(%s (%g 1.0) (%g 0.0))" ?fztemplate ?low ?delta))
        else
            (if (>= ?value ?hi)
                then
                    (assert-string
                        (format nil "(%s (%g 0.0) (%g 1.0))"
                                    ?fztemplate (- ?hi ?delta) ?hi))
                else
                    (assert-string
                        (format nil "(%s (%g 0.0) (%g 1.0) (%g 0.0))"
                            ?fztemplate (max ?low (- ?value ?delta))
                            ?value (min ?hi (+ ?value ?delta)) ))
)))


; Fuerza aceleración difusa

(defrule fuerza-cerca-alejando
    (distancia-difusa cerca)
    (velocidad-difusa alejando)
    =>
    (assert (fuerza-aceleracion-difusa media) )
)


(defrule fuerza-cerca-constante
    (distancia-difusa cerca)
    (velocidad-difusa constante)
    =>
    (assert (fuerza-aceleracion-difusa nula) )
)

(defrule fuerza-cerca-acercando
    (distancia-difusa cerca)
    (velocidad-difusa acercando)
    =>
    (assert (fuerza-aceleracion-difusa nula) )
)

(defrule fuerza-medio-alejando
    (distancia-difusa medio)
    (velocidad-difusa alejando)
    =>
    (assert (fuerza-aceleracion-difusa more-or-less alta) )
)

(defrule fuerza-medio-constante
    (distancia-difusa medio)
    (velocidad-difusa constante)
    =>
    (assert (fuerza-aceleracion-difusa media) )
)

(defrule fuerza-medio-acercando
    (distancia-difusa medio)
    (velocidad-difusa acercando)
    =>
    (assert (fuerza-aceleracion-difusa nula) )
)

(defrule fuerza-lejos-alejando
    (distancia-difusa lejos)
    (velocidad-difusa alejando)
    =>
    (assert (fuerza-aceleracion-difusa very alta) )
)

(defrule fuerza-lejos-constante
    (distancia-difusa lejos)
    (velocidad-difusa constante)
    =>
    (assert (fuerza-aceleracion-difusa alta) )
)

(defrule fuerza-lejos-acercando
    (distancia-difusa lejos)
    (velocidad-difusa acercando)
    =>
    (assert (fuerza-aceleracion-difusa very baja) )
)


; Presion freno difusa

(defrule presion-cerca-alejando
    (distancia-difusa cerca)
    (velocidad-difusa alejando)
    =>
    (assert (presion-freno-difusa nula)) 
)

(defrule presion-cerca-constante
    (distancia-difusa cerca)
    (velocidad-difusa constante)
    =>
    (assert (presion-freno-difusa very baja)) 
)

(defrule presion-cerca-acercando
    (distancia-difusa cerca)
    (velocidad-difusa acercando)
    =>
    (assert (presion-freno-difusa alta)) 
)

(defrule presion-medio-alejando
    (distancia-difusa medio)
    (velocidad-difusa alejando)
    =>
    (assert (presion-freno-difusa nula)) 
)

(defrule presion-medio-constante
    (distancia-difusa medio)
    (velocidad-difusa constante)
    =>
    (assert (presion-freno-difusa nula))
)

(defrule presion-medio-acercando
    (distancia-difusa medio)
    (velocidad-difusa acercando)
    =>
    (assert (presion-freno-difusa more-or-less media)) 
)

(defrule presion-lejos-alejando
    (distancia-difusa lejos)
    (velocidad-difusa alejando)
    =>
    (assert (presion-freno-difusa nula)) 
)

(defrule presion-lejos-constante
    (distancia-difusa lejos)
    (velocidad-difusa constante)
    =>
    (assert (presion-freno-difusa nula))
)

(defrule presion-lejos-acercando
    (distancia-difusa lejos)
    (velocidad-difusa acercando)
    =>
    (assert (presion-freno-difusa very baja)) 
)

(defrule entrada
    (declare (salience 10))
    ; ?f1 <- (coche $?features )
    =>
    ; (retract ?f1 )

    (printout t "Introduzca velocidad del vehiculo"crlf)
    (bind ?Rvel (read) )
    (fuzzify velocidad-difusa ?Rvel 0.0 )

    (printout t "Introduzca distancia del vehiculo"crlf)
    (bind ?Rdist (read) )
    (fuzzify distancia-difusa ?Rdist 0.0 )    

    (assert (coche (id micoche) (distancia ?Rdist) (velocidad ?Rvel)
        (fuerzaFrenadoMax 0.0) (fuerzaAceleracionMax 0.0) (fuerzaFrenadoMom 0.0) (fuerzaAceleracionMom 0.0) )
    )

)




(defrule defuzzificar-fren
    (declare (salience -1) )
    ?f1 <- (presion-freno-difusa ?pfd)
    =>
    (assert (pfmax (maximum-defuzzify ?pfd) ) )
    (assert (pfmom (moment-defuzzify ?pfd) ) )
)

(defrule defuzzificar-vel
    (declare (salience -1) )
    ?f1 <- (fuerza-aceleracion-difusa ?fad)
    =>
    (assert (famax (maximum-defuzzify ?fad)))
    (assert (famom (moment-defuzzify ?fad)))   
)

(defrule final
    (declare (salience -10) )
    (pfmax ?pf1)
    (famax ?fa1)
    (pfmom ?pf2)
    (famom ?fa2)
    =>
    (printout t (format nil "Fuerza de frenado max: %f" ?pf1)crlf )
    (printout t (format nil "Fuerza de aceleracion max: %f" ?fa1)crlf )
    (printout t (format nil "Fuerza de frenado mom: %f" ?pf2)crlf )
    (printout t (format nil "Fuerza de aceleracion mom: %f" ?fa2)crlf )
)













