

(deffacts products 
 	(product (name "USB Mem") (category storage) (part-number 1234) (price 199.99))
 	(product (name Amplifier) (category electronics) (part-number 2341) (price 399.99))
 	(product (name "Rubber duck") (category mechanics) (part-number 3412) (price 99.99))
	(product (name "1TB SSD") (category storage) (part-number 1235) (price 999.99))
	(product (name "Viper V3 Pro") (category electronics) (part-number 2342) (price 3999.99))
	(product (name Screwdriver) (category mechanics) (part-number 3413) (price 99.99))
	(product (name "Mini SSD") (category storage) (part-number 1236) (price 499.99))
	(product (name "Apex Pro Tkl") (category electronics) (part-number 2343) (price 3999.99))
	(product (name Wrench) (category mechanics) (part-number 3414) (price 149.99))
	(product (name "IEMS Earphones") (category electronics) (part-number 2344) (price 999.99))
)

(deffacts customers
  (customer (customer-id 101) (name joe) (address bla bla bla) (phone 3313073905))
  (customer (customer-id 102) (name mary) (address bla bla bla) (phone 333222345))
  (customer (customer-id 103) (name bob) (address bla bla bla) (phone 331567890)) 
  (customer (customer-id 104) (name andrea) (address bla bla bla) (phone 8110802550))
  (customer (customer-id 105) (name gael) (address bla bla bla) (phone 3511441941))
  (customer (customer-id 106) (name mike) (address bla bla bla) (phone 3517236723))
  (customer (customer-id 107) (name jake) (address bla bla bla) (phone 8120704050))
  (customer (customer-id 108) (name scott) (address bla bla bla) (phone 3336036790))
  (customer (customer-id 109) (name john) (address bla bla bla) (phone 3336323838))
  (customer (customer-id 110) (name mia) (address bla bla bla) (phone 3336053855))
)  	 


(deffacts orders 
	(order (order-number 300) (customer-id 102))
	(order (order-number 301) (customer-id 103))
	(order (order-number 302) (customer-id 104))
	(order (order-number 303) (customer-id 105))
	(order (order-number 304) (customer-id 107))
	(order (order-number 305) (customer-id 109))
	(order (order-number 306) (customer-id 110))
)

(deffacts items-list
	(line-item (order-number 300) (customer-id 102) (part-number 1234))
	(line-item (order-number 301) (customer-id 103) (part-number 2341) (quantity 10))
	(line-item (order-number 302) (customer-id 104) (part-number 2342))
	(line-item (order-number 303) (customer-id 105) (part-number 3413) (quantity 3))
	(line-item (order-number 304) (customer-id 107) (part-number 2344))
	(line-item (order-number 305) (customer-id 109) (part-number 2343))
	(line-item (order-number 306) (customer-id 110) (part-number 1235) (quantity 5))
)



