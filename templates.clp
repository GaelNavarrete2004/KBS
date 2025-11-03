;; para no tener muchos hechos, solo tendremos uno que generaliza todo y lo iremos cambiando con state
(deftemplate state
   (slot monkey-horizontal)   ;; todas las posiciones horizonatales posibles (at-door, at-window, under-bananas)
   (slot box-position)       ;; Ptodas las posiciones de la caja posibles (at-window, under-bananas)
   (slot monkey-vertical)    ;; todas las posiciones verticales posibles (on-floor, on-box)
   (slot has-banana)         ;; (yes, no)
)