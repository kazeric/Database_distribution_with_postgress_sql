-- Create schemas for sharding
CREATE SCHEMA pay_shard_1;
CREATE SCHEMA pay_shard_2;

-- Create `payment` table in shard_1
CREATE TABLE pay_shard_1.payments (
    payment_id integer NOT NULL,
    tenant_id integer NOT NULL,
    number character varying(50),
    transaction_id character varying(100),
    amount numeric(10,2) NOT NULL,
    date date NOT NULL,
    status character varying(50),
    FOREIGN KEY (tenant_id) REFERENCES public.tenants(tenant_id)
);

-- Create `payment` table in shard_2
CREATE TABLE pay_shard_2.payments (
    payment_id integer NOT NULL,
    tenant_id integer NOT NULL,
    number character varying(50),
    transaction_id character varying(100),
    amount numeric(10,2) NOT NULL,
    date date NOT NULL,
    status character varying(50),
    FOREIGN KEY (tenant_id) REFERENCES public.tenants(tenant_id)
);



DROP TABLE pay_shard_1.payments CASCADE;
DROP TABLE pay_shard_2.payments CASCADE;
