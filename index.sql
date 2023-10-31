
-- DROP TABLE IF EXISTS public.student;

CREATE TABLE IF NOT EXISTS public.student
(
    id integer NOT NULL DEFAULT nextval('student_id_seq'::regclass),
    name character varying(50) COLLATE pg_catalog."default",
    age integer,
    CONSTRAINT student_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.student
    OWNER to postgres;

Explain Analyze SELECT * FROM student where id = 10;
Explain Analyze SELECT * FROM student where name = 'Stu';
Explain Analyze SELECT * FROM student where name like '%Stu%'

 B-tree (Balanced-Tree)
CREATE INDEX idx_name ON student(name); 

hash
CREATE INDEX idx_name_hash ON student USING HASH (name);
-- Table: public.student

SELECT COUNT(*) FROM public.student;



CREATE EXTENSION IF NOT EXISTS pg_trgm;

Explain Analyze SELECT * FROM student where name like  '%asjhdk%';


CREATE INDEX idx_gin_fts ON student USING gin (to_tsvector('english', name));

CREATE INDEX idx_trgm ON student USING gin (name gin_trgm_ops);


SELECT tablename, indexname, indexdef
FROM pg_indexes
WHERE schemaname = 'public';
