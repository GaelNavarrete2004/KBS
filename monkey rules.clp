;; first rule: walk to the cage
;; if the monkey is on the floor, but the cage is not nearby he gotta walk to the box
(defrule walk-to-box
   (declare (salience 10))
   ?s <- (state (box-position ?bp) (monkey-horizontal ?mh&~?bp) (monkey-vertical on-floor) (has-banana no)) ; THE MONKEY IS NOT IN THE POS OF THE BOX
   =>
   (printout t "Step 1: The monkey was '" ?mh "' now he walks and hes at '" ?bp "'" crlf)
   (modify ?s (monkey-horizontal ?bp))
)

;; second rule: push the box
;; basically if the monkey is in the floor, but not in the same pos as the box but the box its not under the bananas
;; we have to push the box into the bananas
(defrule push-box-to-bananas
   (declare (salience 9))
   ?s <- (state (monkey-horizontal ?bp) ; the monkey is in the pos of the box
                (box-position ?bp&~under-bananas) ; the box is not under the bananas
                (monkey-vertical on-floor)
                (has-banana no))
   =>
   (printout t "Step 2: The monkey pushes the box that was '" ?bp "' to 'under-bananas'" crlf)
   (modify ?s (monkey-horizontal under-bananas)
              (box-position under-bananas))
)

;; third rule: get on top of the box
;; if the monkey is on the floor and both are under the bananas then the monkey climbs the box
(defrule climb-box
   (declare (salience 8))
   ?s <- (state (monkey-horizontal under-bananas)
                (box-position under-bananas)
                (monkey-vertical on-floor)
                (has-banana no))
   =>
   (printout t "Step 3: Monkey gets on top of the box" crlf)
   (modify ?s (monkey-vertical on-box))
)

;; fourth rule: grab the bananas
;; if the monkey is on top of the box and both are under the bananas, then GRAB THE BANANAS
(defrule grasp-banana
   (declare (salience 7))
   ?s <- (state (monkey-horizontal under-bananas)
                (box-position under-bananas)
                (monkey-vertical on-box)
                (has-banana no))
   =>
   (printout t "Step 4: Monkey grabs the banana" crlf)
   (modify ?s (has-banana yes))
)

;; the end: wohooo
;; if the monkey has the banana we good
(defrule goal-achieved
   (declare (salience 1))
   (exists (state (has-banana yes)))
   (not (goal-message-printed)) ; Bandera para que no se imprima en bucle
   =>
   (printout t crlf "--- MONKEY SEES BANANA MONKEY HAPPY ---" crlf)
   (assert (goal-message-printed))
)