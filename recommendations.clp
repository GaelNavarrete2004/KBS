;; RULE 1: Content-Based Recommendations 
;; Logic: If a client buys a product, recommend another one of the same category 
(defrule recommend-by-category
   ;; client buys a product from a random category
   (customer (customer-id ?cid) (name ?cname))
   (order (customer-id ?cid) (order-number ?onum))
   (line-item (order-number ?onum) (part-number ?part1))
   (product (part-number ?part1) (name ?pname1) (category ?cat))
   
   ;; if theres an existen product from the same category this applies
   (product (part-number ?part2&~?part1) (name ?pname2) (category ?cat))
   
   ;; and the client cant have bought that second product
   (not (exists (order (customer-id ?cid) (order-number ?onum2))
                (line-item (order-number ?onum2) (part-number ?part2))))
                
   ;; and the last condition is that we havent made this recommendation yet
   (not (recommendation (customer-id ?cid) (recommended-product-name ?pname2)))

   ;; the category hasn't been recommended yet
   (not (category-recommended (customer-id ?cid) (category ?cat)))
   
   =>
   
   ;; and if all the conditions met we create the recommendation
   (assert (recommendation (customer-id ?cid) 
                           (customer-name ?cname) 
                           (recommended-product-name ?pname2)
                           (reason (str-cat "Vimos que compraste " ?pname1 ", quizas te interese otro de " ?cat "."))))

   ;; just a flag
   (assert (category-recommended (customer-id ?cid) (category ?cat)))
)


;; RULE 2: Item-Based Recommendations
;; Logic: If they buy something similar like an amp they probably would buy some earphones
(defrule recommend-associated-item
   ;; 1. lets say a client bought an amp
   (customer (customer-id ?cid) (name ?cname))
   (order (customer-id ?cid) (order-number ?onum))
   (line-item (order-number ?onum) (part-number ?part-amp))
   (product (part-number ?part-amp) (name "Amplifier"))
   
   ;; if you usually buy an amp you should get some earphones
   (product (part-number ?part-headset) (name "IEMS Earphones"))
   
   ;; and you gotta make sure the client hasnt bought them yet
   (not (exists (order (customer-id ?cid) (order-number ?onum2))
                (line-item (order-number ?onum2) (part-number ?part-headset))))
                
   ;; and also we gotta be careful that we havent made this recommendation yet
   (not (recommendation (customer-id ?cid) (recommended-product-name "IEMS Earphones")))
   
   =>
   
   ;; and thats it if all the conditions met we can make the recommendation
   (assert (recommendation (customer-id ?cid)
                           (customer-name ?cname)
                           (recommended-product-name "IEMS Earphones")
                           (reason "Quienes compran 'Amplifier' suelen interesarse por 'IEMS Earphones'.")))
)


;; RULE 3: Show the recommendations
;; Logic: Once we exec the code at the end show the recommendations
(defrule display-recommendations
   (declare (salience -10)) 
   ?rec <- (recommendation (customer-name ?cname) 
                           (recommended-product-name ?pname)
                           (reason ?r))
   =>
   (printout t crlf "--- RECOMENDACIÓN PARA " ?cname " ---" crlf)
   (printout t "   Motivo: " ?r crlf)
   (printout t "   Producto: " ?pname crlf)
)