Explain Analyze SELECT * FROM student where id = 10;
Explain Analyze SELECT * FROM student where name = 'Stu';
Explain Analyze SELECT * FROM student where name like '%Stu%'

 B-tree (Balanced-Tree)
CREATE INDEX idx_name ON student(name); 

hash
CREATE INDEX idx_name_hash ON student USING HASH (name);
