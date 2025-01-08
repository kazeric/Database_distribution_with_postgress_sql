-- For transparency we create a view that can retreive data from all the 3 shards without knowledge of the 3 shards existance
CREATE OR REPLACE VIEW payment_view AS
SELECT payment_id, tenant_id, amount, date FROM pay_shard_1.payments
UNION ALL
SELECT payment_id, tenant_id, amount, date FROM pay_shard_2.payments
UNION ALL
SELECT payment_id, tenant_id, amount, date FROM public.payments;

SELECT * FROM payment_view ;

SELECT tenant_id, amount, date FROM payment_view;

SELECT * FROM payment_view WHERE tenant_id=1;