create database TEST;
use TEST;

-- Create Doctor table (parent table for many relationships)
CREATE TABLE Doctor (
    doctor_id VARCHAR(6) PRIMARY KEY,
    dr_first_name VARCHAR(15),
    dr_middle_name VARCHAR(15),
    dr_last_name VARCHAR(15)
);

-- Create Patient table (parent table for Appointment)
CREATE TABLE Patient (
    patient_id VARCHAR(6) PRIMARY KEY,
    p_first_name VARCHAR(15),
    p_middle_name VARCHAR(15),
    p_last_name VARCHAR(15),
    address VARCHAR(20),
    city VARCHAR(15),
    contact_number VARCHAR(10),
    p_app INT
);

-- Create Appointment table (references Doctor and Patient)
CREATE TABLE Appointment (
    app_number VARCHAR(6) PRIMARY KEY,
    app_date DATE,
    app_time VARCHAR(8),
    app_reason VARCHAR(20),
    doctor_id VARCHAR(6),
    patient_id VARCHAR(6),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Create BIII table (references Appointment)
CREATE TABLE BIII (
    bil_number VARCHAR(6) PRIMARY KEY,
    bil_date DATE,
    bil_status VARCHAR(8),
    bil_amount DECIMAL(7, 2),
    app_number VARCHAR(6),
    FOREIGN KEY (app_number) REFERENCES Appointment(app_number)
);

-- Create Payment table (references BIII)
CREATE TABLE Payment (
    payment_id VARCHAR(6) PRIMARY KEY,
    pay_date DATE,
    Pay_node VARCHAR(15),
    pay_amount DECIMAL(7, 2),
    bil_number VARCHAR(6),
    FOREIGN KEY (bil_number) REFERENCES BIII(bil_number)
);

-- Insert sample data into Doctor table
INSERT INTO Doctor (doctor_id, dr_first_name, dr_middle_name, dr_last_name) VALUES
('DOC001', 'John', 'A.', 'Smith'),
('DOC002', 'Sarah', 'M.', 'Johnson'),
('DOC003', 'Michael', NULL, 'Williams'),
('DOC004', 'Emily', 'R.', 'Brown'),
('DOC005', 'David', 'K.', 'Jones'),
('DOC006', 'Jennifer', NULL, 'Garcia'),
('DOC007', 'Robert', 'T.', 'Miller'),
('DOC008', 'Lisa', 'P.', 'Davis'),
('DOC009', 'Thomas', 'E.', 'Rodriguez'),
('DOC010', 'Nancy', NULL, 'Martinez');

-- Insert sample data into Patient table
INSERT INTO Patient (patient_id, p_first_name, p_middle_name, p_last_name, address, city, contact_number, p_app) VALUES
('PAT001', 'James', 'B.', 'Wilson', '123 Main St', 'Boston', '6175550101', 3),
('PAT002', 'Mary', 'L.', 'Taylor', '456 Oak Ave', 'New York', '2125550202', 5),
('PAT003', 'William', NULL, 'Anderson', '789 Pine Rd', 'Chicago', '3125550303', 2),
('PAT004', 'Patricia', 'S.', 'Thomas', '321 Elm St', 'Houston', '7135550404', 1),
('PAT005', 'Richard', 'D.', 'Jackson', '654 Maple Dr', 'Phoenix', '6025550505', 4),
('PAT006', 'Jennifer', NULL, 'White', '987 Cedar Ln', 'Philadelphia', '2155550606', 3),
('PAT007', 'Charles', 'F.', 'Harris', '147 Birch Ct', 'San Antonio', '2105550707', 2),
('PAT008', 'Linda', 'G.', 'Martin', '258 Walnut Way', 'San Diego', '6195550808', 5),
('PAT009', 'Joseph', NULL, 'Thompson', '369 Spruce Pl', 'Dallas', '2145550909', 1),
('PAT010', 'Susan', 'H.', 'Robinson', '741 Aspen Blvd', 'San Jose', '4085551010', 4);

-- Insert sample data into Appointment table
INSERT INTO Appointment (app_number, app_date, app_time, app_reason, doctor_id, patient_id) VALUES
('APP001', '2023-01-10', '09:00 AM', 'Annual Checkup', 'DOC001', 'PAT001'),
('APP002', '2023-01-11', '10:30 AM', 'Flu Symptoms', 'DOC002', 'PAT002'),
('APP003', '2023-01-12', '02:15 PM', 'Back Pain', 'DOC003', 'PAT003'),
('APP004', '2023-01-13', '11:00 AM', 'Vaccination', 'DOC004', 'PAT004'),
('APP005', '2023-01-14', '03:45 PM', 'Allergy Consult', 'DOC005', 'PAT005'),
('APP006', '2023-01-15', '08:30 AM', 'Follow-up', 'DOC006', 'PAT006'),
('APP007', '2023-01-16', '01:00 PM', 'Skin Rash', 'DOC007', 'PAT007'),
('APP008', '2023-01-17', '04:30 PM', 'Blood Test', 'DOC008', 'PAT008'),
('APP009', '2023-01-18', '09:45 AM', 'Physical Exam', 'DOC009', 'PAT009'),
('APP010', '2023-01-19', '10:15 AM', 'Headache', 'DOC010', 'PAT010');

-- Insert sample data into BIII table
INSERT INTO BIII (bil_number, bil_date, bil_status, bil_amount, app_number) VALUES
('BIL001', '2023-01-10', 'Paid', 150.00, 'APP001'),
('BIL002', '2023-01-11', 'Pending', 200.00, 'APP002'),
('BIL003', '2023-01-12', 'Paid', 175.50, 'APP003'),
('BIL004', '2023-01-13', 'Pending', 120.00, 'APP004'),
('BIL005', '2023-01-14', 'Paid', 90.75, 'APP005'),
('BIL006', '2023-01-15', 'Pending', 250.00, 'APP006'),
('BIL007', '2023-01-16', 'Paid', 180.25, 'APP007'),
('BIL008', '2023-01-17', 'Pending', 300.00, 'APP008'),
('BIL009', '2023-01-18', 'Paid', 150.00, 'APP009'),
('BIL010', '2023-01-19', 'Pending', 125.50, 'APP010');

-- Insert sample data into Payment table
INSERT INTO Payment (payment_id, pay_date, Pay_node, pay_amount, bil_number) VALUES
('PAY001', '2023-01-10', 'Credit Card', 150.00, 'BIL001'),
('PAY002', '2023-01-12', 'Cash', 175.50, 'BIL003'),
('PAY003', '2023-01-14', 'Insurance', 90.75, 'BIL005'),
('PAY004', '2023-01-16', 'Credit Card', 180.25, 'BIL007'),
('PAY005', '2023-01-18', 'Check', 150.00, 'BIL009'),
('PAY006', '2023-01-20', 'Credit Card', 100.00, 'BIL002'),
('PAY007', '2023-01-21', 'Cash', 120.00, 'BIL004'),
('PAY008', '2023-01-22', 'Insurance', 125.00, 'BIL006'),
('PAY009', '2023-01-23', 'Credit Card', 200.00, 'BIL008'),
('PAY010', '2023-01-24', 'Check', 125.50, 'BIL010');

select * from BIII;

select * from Payment;


--1)

select p_first_name,p_middle_name,p_last_name from Patient where city ='New York' or city='Chicago' or city='Boston';

--2)

SELECT d.*
FROM Doctor d
LEFT JOIN Appointment a ON d.doctor_id = a.doctor_id
WHERE a.doctor_id IS NULL;



--3)
select*  from Patient where p_middle_name IS NULL;


--4)
select * from BIII where bil_status is not null;


--5)

select * from Appointment 
set doctor_id ='UNASSIGNED' where doctor_id is null;


SELECT 
    app_number,
    app_date,
    app_time,
    app_reason,
    ISNULL(doctor_id, 'UNASSIGNED') AS doctor_id,
    patient_id
FROM Appointment;


--6)


select * from Payment 
where pay_date BETWEEN' 2023-01-12' AND '2023-01-18';


---7)

select DISTINCT city from Patient;


---8)
 
select concat(d.dr_last_name,' ',p.p_last_name) as 'Combined names' 
from Doctor d 
join Appointment a on a.doctor_id=d.doctor_id 
join Patient p on p.patient_id=a.patient_id;

---9)

SELECT DISTINCT p.* 
FROM Patient p 
INNER JOIN Appointment a on p.patient_id=a.patient_id
INNER JOIN BIII b on a.app_number=b.app_number;

--10)
SELECT d.*
FROM Doctor d
WHERE d.doctor_id NOT IN (
    SELECT DISTINCT doctor_id 
    FROM Appointment 
    WHERE doctor_id IS NOT NULL
);





---1)

SELECT 
    a.app_number,a.app_date,a.app_time,a.app_reason,
    CONCAT(d.dr_first_name,d.dr_middle_name,d.dr_last_name) AS doctor_full_name,
    CONCAT(p.p_first_name,p.p_middle_name , p.p_last_name) AS patient_full_name
FROM Appointment a JOIN Doctor d ON a.doctor_id = d.doctor_id 
JOIN Patient p ON a.patient_id = p.patient_id;

---2)

SELECT b.bil_number,b.bil_amount,p.payment_id,p.pay_amount
FROM BIII b
LEFT JOIN Payment p ON b.bil_number = p.bil_number;

--3)


SELECT p.patient_id,CONCAT(p.p_first_name, p.p_middle_name ,p.p_last_name) AS patient_name,a.app_number,a.app_date,a.app_reason
FROM Patient p
LEFT JOIN Appointment a ON p.patient_id = a.patient_id;


---4)

SELECT d1.doctor_id AS doctor1_id,CONCAT(d1.dr_first_name, ' ', d1.dr_last_name) AS doctor1_name,d2.doctor_id AS doctor2_id,
    CONCAT(d2.dr_first_name, ' ', d2.dr_last_name) AS doctor2_name
FROM Doctor d1 JOIN Doctor d2 ON d1.dr_last_name = d2.dr_last_name;



--5)

SELECT p.patient_id,CONCAT(p.p_first_name,p.p_middle_name ,p.p_last_name) AS patient_name,SUM(py.pay_amount) AS total_paid
FROM Patient p
JOIN Appointment a ON p.patient_id = a.patient_id
JOIN BIII b ON a.app_number = b.app_number
JOIN Payment py ON b.bil_number = py.bil_number
GROUP BY p.patient_id, p.p_first_name, p.p_middle_name, p.p_last_name;


--6)

SELECT d.doctor_id,
CONCAT(d.dr_first_name, ' ', d.dr_last_name) AS doctor_name,
COUNT(a.app_number) AS appointment_count
FROM Doctor d
JOIN Appointment a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.dr_first_name, d.dr_last_name
HAVING COUNT(a.app_number) < 3;


---7)


SELECT DISTINCT p.patient_id,CONCAT(p.p_first_name, p.p_middle_name,p.p_last_name) AS patient_name
FROM Patient p
JOIN Appointment a ON p.patient_id = a.patient_id
JOIN BIII b ON a.app_number = b.app_number
WHERE b.bil_amount > (SELECT AVG(bil_amount) FROM BIII);


---8)


SELECT b.* FROM BIII b
LEFT JOIN Payment p ON b.bil_number = p.bil_number
WHERE p.payment_id ='PENDING';


---9)

SELECT a.app_number,a.app_date,a.app_reason,p.city
FROM Appointment a
JOIN Patient p ON a.patient_id = p.patient_id
WHERE p.city IN (
        SELECT city 
        FROM Patient 
        GROUP BY city 
        HAVING COUNT(patient_id) >= 1);

	

	---10)

	WITH DoctorAppointments AS (
    SELECT d.doctor_id,
        CONCAT(d.dr_first_name, ' ', d.dr_last_name) AS doctor_name,
        COUNT(a.app_number) AS appointment_count,
        RANK() OVER (ORDER BY COUNT(a.app_number) DESC) AS rank
    FROM Doctor d LEFT JOIN Appointment a ON d.doctor_id = a.doctor_id
    GROUP BY d.doctor_id, d.dr_first_name, d.dr_last_name)
SELECT doctor_id,doctor_name,appointment_count
FROM DoctorAppointments
WHERE rank = 1;