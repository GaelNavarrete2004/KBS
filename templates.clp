

(deftemplate customer
  (slot customer-id)
  (multislot name)
  (multislot address)
  (slot phone)
)

(deftemplate product
  (slot part-number)
  (slot name)
  (slot category)
  (slot price)
)

(deftemplate order
  (slot order-number)
  (slot customer-id)
)

(deftemplate recommendation
  (slot customer-id)
  (multislot customer-name)
  (slot recommended-product-name)
  (slot reason) 
)

(deftemplate category-recommended
  (slot customer-id)
  (slot category)
)

(deftemplate line-item
  (slot order-number)
  (slot part-number)
  (slot customer-id)
  (slot quantity (default 1)))


