INSERT INTO tbl_courier ("id", "name", "type") VALUES (1, 'J&T', 'Reguler');

INSERT INTO tbl_customer ("id", "name", "phone", "email") VALUES (2, 'Sum Ting Wong', '08123456789', 'sumtingwong@gmail.com');
INSERT INTO tbl_customer ("id", "name", "phone", "email") VALUES (3, 'John Doe', '085378478374', 'johndoe@gmail.com');

INSERT INTO "tbl_order" ("id", "invoice_no", "created_at", "delete_at", "update_at", "cust_id", "seller_id", "address_id", "total_amount", "service_fee", "application_fee") VALUES (1, 'INV/20330111/mpl/3694776524', '2024-05-29 02:41:40', NULL, '2024-05-29 08:50:33', 2, 2, 2, 20685000, 1000, 1000);
INSERT INTO "tbl_order" ("id", "invoice_no", "created_at", "delete_at", "update_at", "cust_id", "seller_id", "address_id", "total_amount", "service_fee", "application_fee") VALUES (2, 'INV/20330111/mpl/3694776525', '2024-05-31 22:25:03', NULL, '2024-05-31 22:25:12', 2, 2, 4, 18685000, 1000, 1000);

INSERT INTO "tbl_orderitems" ("id", "product_id", "order_id", "unit_price", "quantity", "weight") VALUES (1, 2, 1, 20500000, 1, 5);
INSERT INTO "tbl_orderitems" ("id", "product_id", "order_id", "unit_price", "quantity", "weight") VALUES (2, 3, 2, 18500000, 1, 5);

INSERT INTO "tbl_orderpayments" ("id", "order_id", "payment_amount", "payment_date", "payment_methodid", "payment_statusid") VALUES (1, 1, 685000, '2024-05-31 14:33:44', 2, 2);
INSERT INTO "tbl_orderpayments" ("id", "order_id", "payment_amount", "payment_date", "payment_methodid", "payment_statusid") VALUES (2, 1, 20000000, '2024-05-31 14:33:44', 1, 2);
INSERT INTO "tbl_orderpayments" ("id", "order_id", "payment_amount", "payment_date", "payment_methodid", "payment_statusid") VALUES (3, 2, 18685000, '2024-05-31 22:59:51', 1, 1);

INSERT INTO "tbl_orderpromo" ("id", "order_id", "promo_id", "total") VALUES (1, 1, 1, 986385);

INSERT INTO "tbl_ordershipment" ("id", "order_id", "courier_id", "shipping_cost", "insurance_cost", "tracking_number", "total_weigth") VALUES (1, 1, 1, 126000, 57700, NULL, 10);
INSERT INTO "tbl_ordershipment" ("id", "order_id", "courier_id", "shipping_cost", "insurance_cost", "tracking_number", "total_weigth") VALUES (2, 2, 1, 126000, 57700, NULL, 5);

INSERT INTO "tbl_paymentmethod" ("id", "name") VALUES (1, 'BCA Virtual Account');
INSERT INTO "tbl_paymentmethod" ("id", "name") VALUES (2, 'GoPay Coins');

INSERT INTO "tbl_paymentstatus" ("id", "name") VALUES (1, 'Unpaid');
INSERT INTO "tbl_paymentstatus" ("id", "name") VALUES (2, 'Paid');

INSERT INTO "tbl_product" ("id", "name", "weight", "price", "seller_id") VALUES (2, 'SAPPHIRE NITRO+ Radeon RX 7900 XTX 24GB', 5, 20500000, 2);
INSERT INTO "tbl_product" ("id", "name", "weight", "price", "seller_id") VALUES (3, 'Lenovo Thinkpad X1 Carbon Gen 12 2024 Intel Ultra 7 165U 32GB RAM 1TB SSD Windows 11 Pro Touch 14"', 5, 18500000, 2);

INSERT INTO "tbl_promotion" ("id", "promo_code", "promo_typeid") VALUES (1, 'DDDT845', 2);

INSERT INTO "tbl_promotiontype" ("id", "name") VALUES (1, 'Discount');
INSERT INTO "tbl_promotiontype" ("id", "name") VALUES (2, 'Cashback');

INSERT INTO "tbl_seller" ("id", "name", "location") VALUES (2, 'COC Komputer', 'Jakarta');

