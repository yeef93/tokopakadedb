-- public.tbl_courier definition

-- Drop table

-- DROP TABLE public.tbl_courier;

CREATE TABLE public.tbl_courier (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	"name" varchar NULL,
	"type" varchar NULL,
	CONSTRAINT tbl_shipping_pkey PRIMARY KEY (id)
);


-- public.tbl_customer definition

-- Drop table

-- DROP TABLE public.tbl_customer;

CREATE TABLE public.tbl_customer (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	"name" varchar NOT NULL,
	phone varchar NOT NULL,
	email varchar NOT NULL,
	CONSTRAINT tbl_buyer_pkey PRIMARY KEY (id)
);


-- public.tbl_paymentmethod definition

-- Drop table

-- DROP TABLE public.tbl_paymentmethod;

CREATE TABLE public.tbl_paymentmethod (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	"name" varchar(50) NULL,
	CONSTRAINT tbl_paymentmethod_pkey PRIMARY KEY (id)
);


-- public.tbl_paymentstatus definition

-- Drop table

-- DROP TABLE public.tbl_paymentstatus;

CREATE TABLE public.tbl_paymentstatus (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	"name" varchar NULL,
	CONSTRAINT tbl_paymentstatus_pkey PRIMARY KEY (id)
);


-- public.tbl_promotiontype definition

-- Drop table

-- DROP TABLE public.tbl_promotiontype;

CREATE TABLE public.tbl_promotiontype (
	id serial4 NOT NULL,
	"name" varchar(30) NULL,
	CONSTRAINT tbl_promotiontype_pkey PRIMARY KEY (id)
);


-- public.tbl_seller definition

-- Drop table

-- DROP TABLE public.tbl_seller;

CREATE TABLE public.tbl_seller (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	"name" varchar(100) NOT NULL,
	"location" text NOT NULL,
	CONSTRAINT tbl_seller_pkey PRIMARY KEY (id)
);


-- public.tbl_customeraddress definition

-- Drop table

-- DROP TABLE public.tbl_customeraddress;

CREATE TABLE public.tbl_customeraddress (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	cust_id int4 NOT NULL,
	address_alias varchar(50) NOT NULL,
	address_location text NOT NULL,
	city varchar NULL,
	zipcode int4 NULL,
	CONSTRAINT tbl_addresscustomer_pkey PRIMARY KEY (id),
	CONSTRAINT "FK_tbl_customeraddress_tbl_customer" FOREIGN KEY (cust_id) REFERENCES public.tbl_customer(id)
);


-- public.tbl_order definition

-- Drop table

-- DROP TABLE public.tbl_order;

CREATE TABLE public.tbl_order (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	invoice_no varchar(200) NOT NULL,
	created_at timestamp NULL,
	delete_at timestamp NULL,
	update_at timestamp NULL,
	cust_id int4 NULL,
	seller_id int4 NULL,
	address_id int4 NULL,
	total_amount int4 NULL,
	service_fee int4 NULL,
	application_fee int4 NULL,
	CONSTRAINT tbl_invoice_pkey PRIMARY KEY (id),
	CONSTRAINT "FK_tbl_invoice_tbl_customer" FOREIGN KEY (cust_id) REFERENCES public.tbl_customer(id),
	CONSTRAINT "FK_tbl_invoice_tbl_customeraddress" FOREIGN KEY (address_id) REFERENCES public.tbl_customeraddress(id),
	CONSTRAINT "FK_tbl_invoice_tbl_seller" FOREIGN KEY (seller_id) REFERENCES public.tbl_seller(id)
);


-- public.tbl_orderpayments definition

-- Drop table

-- DROP TABLE public.tbl_orderpayments;

CREATE TABLE public.tbl_orderpayments (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	order_id int4 NULL,
	payment_amount int4 NULL,
	payment_date timestamp NULL,
	payment_methodid int4 NULL,
	payment_statusid int4 NULL,
	CONSTRAINT tbl_orderpayments_pkey PRIMARY KEY (id),
	CONSTRAINT "FK_tbl_orderpayments_tbl_order" FOREIGN KEY (order_id) REFERENCES public.tbl_order(id),
	CONSTRAINT "FK_tbl_orderpayments_tbl_paymentmethod" FOREIGN KEY (payment_methodid) REFERENCES public.tbl_paymentmethod(id),
	CONSTRAINT "FK_tbl_orderpayments_tbl_paymentstatus" FOREIGN KEY (payment_statusid) REFERENCES public.tbl_paymentstatus(id)
);


-- public.tbl_ordershipment definition

-- Drop table

-- DROP TABLE public.tbl_ordershipment;

CREATE TABLE public.tbl_ordershipment (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	order_id int4 NULL,
	courier_id int4 NULL,
	shipping_cost int4 NULL,
	insurance_cost int4 NULL,
	tracking_number int4 NULL,
	total_weigth int4 NULL,
	CONSTRAINT tbl_ordershipment_pkey PRIMARY KEY (id),
	CONSTRAINT "FK_tbl_ordershipment_tbl_courier" FOREIGN KEY (courier_id) REFERENCES public.tbl_courier(id),
	CONSTRAINT "FK_tbl_ordershipment_tbl_order" FOREIGN KEY (order_id) REFERENCES public.tbl_order(id)
);


-- public.tbl_product definition

-- Drop table

-- DROP TABLE public.tbl_product;

CREATE TABLE public.tbl_product (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	"name" varchar(255) NOT NULL,
	weight float8 NOT NULL,
	price int4 NULL,
	seller_id int4 NULL,
	CONSTRAINT tbl_product_pkey PRIMARY KEY (id),
	CONSTRAINT "FK_tbl_product_tbl_seller" FOREIGN KEY (seller_id) REFERENCES public.tbl_seller(id)
);


-- public.tbl_promotion definition

-- Drop table

-- DROP TABLE public.tbl_promotion;

CREATE TABLE public.tbl_promotion (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	promo_code varchar NULL,
	promo_typeid int4 NULL,
	CONSTRAINT tbl_promotion_pkey PRIMARY KEY (id),
	CONSTRAINT "FK_tbl_promotion_tbl_promotiontype" FOREIGN KEY (promo_typeid) REFERENCES public.tbl_promotiontype(id)
);


-- public.tbl_orderitems definition

-- Drop table

-- DROP TABLE public.tbl_orderitems;

CREATE TABLE public.tbl_orderitems (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	product_id int4 NULL,
	order_id int4 NULL,
	unit_price int4 NULL,
	quantity int4 NULL,
	weight int4 NULL,
	CONSTRAINT tbl_invoiceitems_pkey PRIMARY KEY (id),
	CONSTRAINT "FK_tbl_invoiceitems_tbl_invoice" FOREIGN KEY (order_id) REFERENCES public.tbl_order(id),
	CONSTRAINT "FK_tbl_invoiceitems_tbl_product" FOREIGN KEY (product_id) REFERENCES public.tbl_product(id)
);


-- public.tbl_orderpromo definition

-- Drop table

-- DROP TABLE public.tbl_orderpromo;

CREATE TABLE public.tbl_orderpromo (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	order_id int4 NULL,
	promo_id int4 NULL,
	total int4 NULL,
	CONSTRAINT tbl_orderpromo_pkey PRIMARY KEY (id),
	CONSTRAINT "FK_tbl_orderpromo_tbl_order" FOREIGN KEY (order_id) REFERENCES public.tbl_order(id),
	CONSTRAINT "FK_tbl_orderpromo_tbl_promotion" FOREIGN KEY (promo_id) REFERENCES public.tbl_promotion(id)
);