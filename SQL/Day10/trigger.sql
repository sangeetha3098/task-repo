use normal_db;

CREATE TABLE emp_insert_backup (
    empid INT PRIMARY KEY AUTO_INCREMENT,
    empname VARCHAR(100),
    empdepart VARCHAR(100),
    salary DECIMAL(10,2),
    city VARCHAR(100)
);

CREATE TABLE teaemp (
    empid INT PRIMARY KEY AUTO_INCREMENT,
    empname VARCHAR(100),
    empdepart VARCHAR(100),
    salary DECIMAL(10,2),
    city VARCHAR(100)
);

DELIMITER $$

CREATE TRIGGER trg_after_insert_emp
AFTER INSERT
ON teaemp
FOR EACH ROW
BEGIN
    INSERT INTO emp_insert_backup
    (empid, empname, empdepart, salary, city)
    VALUES
    (NEW.empid, NEW.empname, NEW.empdepart, NEW.salary, NEW.city);
END$$

DELIMITER ;

INSERT INTO teaemp
VALUES (1, 'Rahul Singh', 'IT', 50000, 'Chennai');

CREATE TABLE emp_update_backup (
    empid INT,
    empname VARCHAR(100),
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2)
);

DELIMITER $$

CREATE TRIGGER trg_after_update_salary
AFTER UPDATE
ON teaemp
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO emp_update_backup
        (empid, empname, old_salary, new_salary)
        VALUES
        (NEW.empid, NEW.empname, OLD.salary, NEW.salary);
    END IF;
END$$

DELIMITER ;

INSERT INTO teaemp
VALUES (2, 'Rahul Singh', 'IT', 50000, 'Chennai');

CREATE TABLE emp_delete_backup (
    empid INT PRIMARY KEY AUTO_INCREMENT,
    empname VARCHAR(100),
    empdepart VARCHAR(100),
    salary DECIMAL(10,2),
    city VARCHAR(100)
);

DELIMITER $$

CREATE TRIGGER trg_after_delete_emp
AFTER DELETE
ON teaemp
FOR EACH ROW
BEGIN
    INSERT INTO emp_delete_backup
    (empid, empname, empdepart, salary, city)
    VALUES
    (OLD.empid, OLD.empname, OLD.empdepart, OLD.salary, OLD.city);
END$$

DELIMITER ;

SELECT * FROM teaemp;