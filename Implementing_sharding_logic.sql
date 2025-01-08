CREATE OR REPLACE FUNCTION distribute_payment(
    payment_id INT,
    tenant_id INT,
    amount DECIMAL,
    payment_date DATE
) RETURNS VOID AS $$
BEGIN
    IF tenant_id % 2 = 0 THEN
        -- Insert into shard_2
        EXECUTE format(
            'INSERT INTO pay_shard_2.payments (payment_id, tenant_id, amount, date) VALUES (%L, %L, %L, %L)',
            payment_id, tenant_id, amount, payment_date
        );
    ELSE
        -- Insert into shard_1
        EXECUTE format(
            'INSERT INTO pay_shard_1.payments (payment_id, tenant_id, amount, date) VALUES (%L, %L, %L, %L)',
            payment_id, tenant_id, amount, payment_date
        );
    END IF;
END;
$$ LANGUAGE plpgsql;


SELECT distribute_payment(1, 1, 100.00, '2025-01-07');
SELECT distribute_payment(2, 9, 200.00, '2025-01-07');
SELECT distribute_payment(3, 4, 500.00, '2025-01-07');
