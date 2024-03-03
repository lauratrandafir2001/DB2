CREATE TABLE Pets (
	pet_id int NOT NULL,
	owner_id int NOT NULL,
	name varchar(255) NOT NULL,
	species varchar(255) NOT NULL,
	breed varchar(255) NOT NULL,
	date_ofbirth DATE NOT NULL,
	medical_history varchar(255) NOT NULL,
	PRIMARY KEY (pet_id)
);
CREATE TABLE Appointments (
	app_id int NOT NULL,
	pet_id int NOT NULL,
	app_date DATE NOT NULL,
	app_time TIMESTAMP NOT NULL,
	reason varchar(255) NOT NULL,
	veterinary_id int NOT NULL,
	PRIMARY KEY (app_id)
);
CREATE TABLE Veterinarians (
	vet_id int NOT NULL,
	name varchar(255) NOT NULL,
	specialization varchar(255) NOT NULL,
	phone varchar(255) NOT NULL,
	PRIMARY KEY (vet_id)
);
CREATE TABLE Owners (
	owner_id int NOT NULL,
	name varchar(255) NOT NULL,
	adress varchar(255) NOT NULL,
	phone varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	PRIMARY KEY (owner_id)
);
CREATE TABLE Treatments (
	treatment_id int NOT NULL,
	pet_id int NOT NULL,
	treat_date DATE NOT NULL,
	cost int NOT NULL,
	veterinarian_id int NOT NULL,
	PRIMARY KEY (treatment_id)
);
CREATE TABLE Vet_Programs (
	vet_name varchar(255) NOT NULL,
	vet_id int NOT NULL,
	date_ofwork DATE NOT NULL,
	work_hours int NOT NULL,
	app_id int NOT NULL,
	PRIMARY KEY (vet_name)
);

ALTER TABLE Pets ADD CONSTRAINT Pets_fk0 FOREIGN KEY (owner_id) REFERENCES Owners(owner_id);

ALTER TABLE Appointments ADD CONSTRAINT Appointments_fk0 FOREIGN KEY (pet_id) REFERENCES Pets(pet_id);

ALTER TABLE Appointments ADD CONSTRAINT Appointments_fk1 FOREIGN KEY (veterinary_id) REFERENCES Veterinarians(vet_id);

ALTER TABLE Treatments ADD CONSTRAINT Treatments_fk0 FOREIGN KEY (pet_id) REFERENCES Pets(pet_id);

ALTER TABLE Treatments ADD CONSTRAINT Treatments_fk1 FOREIGN KEY (veterinarian_id) REFERENCES Veterinarians(vet_id);

ALTER TABLE Vet_Programs ADD CONSTRAINT Vet_Programs_fk0 FOREIGN KEY (vet_id) REFERENCES Veterinarians(vet_id);

ALTER TABLE Vet_Programs ADD CONSTRAINT Vet_Programs_fk1 FOREIGN KEY (app_id) REFERENCES Appointments(app_id);

-- Inserting data into Owners
INSERT INTO Owners (owner_id, name, adress, phone, email) VALUES
(100, 'John Doe', '1234 Elm Street', '555-1234', 'john.doe@email.com'),
(101, 'Jane Smith', '5678 Oak Avenue', '555-5678', 'jane.smith@email.com');
INSERT INTO Owners (owner_id, name, adress, phone, email) VALUES
(102, 'Kyle Dime', '1234 Elm Street', '555-1234', 'john.doe@email.com'),
(103, 'Mary Thai', '6738 Oak Avenue', '523-5638', 'thai.mary@email.com'),
(104, 'July Morgan', '4672 5th Avenue', '512-6478', 'july.morgan@email.com');
INSERT INTO Owners (owner_id, name, adress, phone, email) VALUES
(105, 'Alice Brown', '2345 Maple Street', '555-2345', 'alice.brown@email.com'),
(106, 'Mike Johnson', '7890 Birch Road', '555-7890', 'mike.johnson@email.com'),
(107, 'Rachel Green', '3456 Pine Lane', '555-3456', 'rachel.green@email.com'),
(108, 'Lucas White', '8901 Cedar Blvd', '555-8901', 'lucas.white@email.com'),
(109, 'Sara Miller', '4567 Spruce Dr', '555-4567', 'sara.miller@email.com'),
(110, 'David Wilson', '9012 Willow Way', '555-9012', 'david.wilson@email.com'),
(111, 'Emma Taylor', '5678 Aspen Court', '555-5678', 'emma.taylor@email.com'),
(112, 'Jack Davis', '6789 Redwood St', '555-6789', 'jack.davis@email.com'),
(113, 'Olivia Lee', '7890 Magnolia Path', '555-7890', 'olivia.lee@email.com'),
(114, 'James Martin', '8901 Sycamore Ave', '555-8901', 'james.martin@email.com');
INSERT INTO Owners (owner_id, name, adress, phone, email) VALUES
(115, 'Michael Johnson', '3456 Oak Street', '555-3456', 'michael.johnson@email.com'),
(116, 'Sophia Martinez', '5678 Pine Avenue', '555-5678', 'sophia.martinez@email.com'),
(117, 'Ethan Davis', '1234 Cedar Road', '555-1234', 'ethan.davis@email.com'),
(118, 'Emma Wilson', '7890 Birch Lane', '555-7890', 'emma.wilson@email.com'),
(119, 'William Anderson', '2345 Maple Court', '555-2345', 'william.anderson@email.com');

INSERT INTO Pets (pet_id, owner_id, name, species, breed, date_ofbirth, medical_history) VALUES
(1, 100, 'Buddy', 'Dog', 'Golden Retriever', '2019-5-1', 'Healthy'),
(2, 101, 'Whiskers', 'Cat', 'Siamese', '2020-7-5', 'Allergic to peanuts');
INSERT INTO Pets (pet_id, owner_id, name, species, breed, date_ofbirth, medical_history) VALUES
(3, 102, 'Luna', 'Dog', 'Pitbull', '2018-5-1', 'Healthy'),
(4, 103, 'Thor', 'DOg', 'Rottweiler', '2017-7-5', 'Has a cold'),
(5, 104, 'Maya', 'Cat', 'British', '2016-7-5', 'Healthy');

INSERT INTO Pets (pet_id, owner_id, name, species, breed, date_ofbirth, medical_history) VALUES
(6, 105, 'Max', 'Dog', 'Beagle', '2020-4-12', 'Healthy'),
(7, 106, 'Shadow', 'Cat', 'Persian', '2019-9-30', 'Sensitive stomach'),
(8, 107, 'Bella', 'Dog', 'Labrador', '2021-1-15', 'Healthy'),
(9, 108, 'Charlie', 'Dog', 'Dachshund', '2018-11-20', 'Minor skin allergies'),
(10, 109, 'Daisy', 'Cat', 'Maine Coon', '2017-6-10', 'Healthy'),
(11, 110, 'Rocky', 'Dog', 'Boxer', '2021-3-25', 'Hip dysplasia'),
(12, 111, 'Milo', 'Cat', 'Ragdoll', '2020-5-5', 'Healthy'),
(13, 112, 'Ruby', 'Dog', 'German Shepherd', '2019-8-8', 'Routine vaccinations'),
(14, 113, 'Oscar', 'Cat', 'Sphinx', '2018-7-22', 'Healthy'),
(15, 114, 'Ginger', 'Dog', 'Cocker Spaniel', '2017-9-14', 'Ear infections');

INSERT INTO Pets (pet_id, owner_id, name, species, breed, date_ofbirth, medical_history) VALUES
(16, 115, 'Lola', 'Dog', 'Golden Retriever', '2019-2-8', 'Healthy'),
(17, 116, 'Leo', 'Cat', 'Siamese', '2020-6-20', 'Allergic to seafood'),
(18, 117, 'Molly', 'Dog', 'Poodle', '2020-11-1', 'Routine checkup'),
(19, 118, 'Rusty', 'Dog', 'Labrador', '2018-7-12', 'Arthritis'),
(20, 119, 'Luna', 'Cat', 'Persian', '2017-3-5', 'Healthy');


INSERT INTO Veterinarians (vet_id, name, specialization, phone) VALUES
(1, 'Dr. Smith', 'Canine Specialist', '555-0001'),
(2, 'Dr. Jones', 'Feline Specialist', '555-0002');

-- Inserting data into Appointments
INSERT INTO Appointments (app_id, pet_id, app_date, app_time, reason, veterinary_id) VALUES
(1, 1, '2024-01-10', DEFAULT, 'Regular Checkup', 1),
(2, 2, '2024-01-11', DEFAULT, 'Vaccination', 2);
INSERT INTO Appointments (app_id, pet_id, app_date, app_time, reason, veterinary_id) VALUES
(3, 1, '2024-01-16', DEFAULT, 'Regular Checkup', 1),
(4, 1, '2024-01-20', DEFAULT, 'Nails Clip', 2);
INSERT INTO Appointments (app_id, pet_id, app_date, app_time, reason, veterinary_id) VALUES
(5, 3, '2024-01-15', DEFAULT, 'Dental Cleaning', 1),
(6, 4, '2024-01-18', DEFAULT, 'Flea Treatment', 1),
(7, 5, '2024-01-22', DEFAULT, 'Checkup', 2);
INSERT INTO Appointments (app_id, pet_id, app_date, app_time, reason, veterinary_id) VALUES
(8, 6, '2024-02-05', DEFAULT, 'Vaccination', 1),
(9, 7, '2024-02-10', DEFAULT, 'Grooming', 2),
(10, 8, '2024-02-15', DEFAULT, 'Checkup', 2),
(11, 9, '2024-02-20', DEFAULT, 'Dental Cleaning', 1),
(12, 10, '2024-02-25', DEFAULT, 'Vaccination', 2);

INSERT INTO Appointments (app_id, pet_id, app_date, app_time, reason, veterinary_id) VALUES
(13, 11, '2024-03-05', DEFAULT, 'Checkup', 1),
(14, 12, '2024-03-10', DEFAULT, 'Vaccination', 2),
(15, 13, '2024-03-15', DEFAULT, 'Dental Cleaning', 1),
(16, 14, '2024-03-20', DEFAULT, 'Grooming', 1),
(17, 15, '2024-03-25', DEFAULT, 'Checkup', 2);


INSERT INTO Appointments (app_id, pet_id, app_date, app_time, reason, veterinary_id) VALUES
(18, 8, '2024-03-20', DEFAULT, 'Checkup', 1),
(19, 8, '2024-03-22', DEFAULT, 'Vaccination', 2),
(20, 8, '2024-03-23', DEFAULT, 'Dental Cleaning', 1);

INSERT INTO Appointments (app_id, pet_id, app_date, app_time, reason, veterinary_id) VALUES
(21, 18, '2024-03-20', DEFAULT, 'Checkup', 1),
(22, 18, '2024-03-22', DEFAULT, 'Vaccination', 2),
(23, 18, '2024-03-23', DEFAULT, 'Dental Cleaning', 1);

INSERT INTO Appointments (app_id, pet_id, app_date, app_time, reason, veterinary_id) VALUES
(24, 13, '2024-03-20', DEFAULT, 'Checkup', 1),
(25, 13, '2024-03-22', DEFAULT, 'Vaccination', 2),
(26, 13, '2024-03-23', DEFAULT, 'Dental Cleaning', 1);

-- Inserting data into Vet_Programs
INSERT INTO Vet_Programs (vet_name, vet_id, date_ofwork, work_hours, app_id) VALUES
('Dr. Smith', 1, '2024-01-15', 8, 1),
('Dr. James', 2, '2024-01-16', 6, 2);

-- Inserting data into Treatments
INSERT INTO Treatments (treatment_id, pet_id, treat_date, cost, veterinarian_id) VALUES
(1, 1, '2024-01-20', 200, 1), 
(2, 2, '2024-01-21', 150, 2),
(3, 1, '2024-02-15', 250, 1), 
(4, 2, '2024-02-20', 300, 2);  

INSERT INTO Treatments (treatment_id, pet_id, treat_date, cost, veterinarian_id) VALUES
(6, 1, '2023-01-20', 200, 1), 
(7, 1, '2023-01-20', 200, 1);  

INSERT INTO Treatments (treatment_id, pet_id, treat_date, cost, veterinarian_id) VALUES
(5, 3, '2024-02-25', 180, 1),   
(6, 4, '2024-03-02', 220, 2),
(7, 3, '2024-03-10', 280, 1),
(8, 4, '2024-03-15', 320, 2);

INSERT INTO Treatments (treatment_id, pet_id, treat_date, cost, veterinarian_id) VALUES
(13, 18, '2024-04-05', 150, 1), 
(14, 19, '2024-04-10', 200, 2),
(15, 13, '2024-04-15', 250, 1),
(16, 12, '2024-04-20', 300, 2),
(17, 15, '2024-04-25', 180, 1);

INSERT INTO Treatments (treatment_id, pet_id, treat_date, cost, veterinarian_id) VALUES
(19, 18, '2024-04-05', 250, 1), 
(20, 18, '2024-04-10', 50, 1);

INSERT INTO Treatments (treatment_id, pet_id, treat_date, cost, veterinarian_id) VALUES
(21, 15, '2024-05-05', 250, 2), 
(22, 15, '2024-05-05', 30, 2),
(23, 15, '2024-05-05', 130, 2);

INSERT INTO Treatments (treatment_id, pet_id, treat_date, cost, veterinarian_id) VALUES
(24, 7, '2024-06-04', 150, 1), 
(25, 7, '2024-06-04', 60, 1),
(26, 7, '2024-06-04', 100, 1);

INSERT INTO Treatments (treatment_id, pet_id, treat_date, cost, veterinarian_id) VALUES
(27, 7, '2024-06-05', 150, 2), 
(28, 7, '2024-06-05', 60, 2),
(29, 7, '2024-06-05', 100, 2);

INSERT INTO Treatments (treatment_id, pet_id, treat_date, cost, veterinarian_id) VALUES
(30, 18, '2024-07-08', 250, 2), 
(31, 18, '2024-07-08', 50, 2);

INSERT INTO Treatments (treatment_id, pet_id, treat_date, cost, veterinarian_id) VALUES
(32, 13, '2024-07-08', 100, 2), 
(33, 13, '2024-07-08', 150, 2);

INSERT INTO Treatments (treatment_id, pet_id, treat_date, cost, veterinarian_id) VALUES
(34, 8, '2024-07-08', 100, 1), 
(35, 8, '2024-07-08', 120, 1), 
(36, 8, '2024-07-08', 130, 2), 
(37, 8, '2024-07-08', 150, 2);


INSERT INTO Treatments (treatment_id, pet_id, treat_date, cost, veterinarian_id) VALUES
(38, 8, '2023-12-08', 100, 1), 
(39, 8, '2023-12-08', 120, 1), 
(40, 8, '2023-12-08', 130, 2), 
(41, 8, '2023-12-08', 150, 2);




SELECT* FROM Pets;
SELECT* FROM Owners;
SELECT* FROM Veterinarians;
SELECT* FROM Appointments;
SELECT* FROM Vet_Programs;
SELECT* FROM Treatments;
