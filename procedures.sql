
CREATE PROCEDURE GetAppointmentss
    
AS
BEGIN
    SELECT 
        P.name AS PetName,
        P.species,
        P.breed,
        A.app_date,
        A.app_time,
        A.reason AS AppointmentReason,
        V.name AS VeterinarianName,
        V.specialization AS VeterinarianSpecialization,
        O.name AS OwnerName,
        O.adress AS OwnerAddress
    FROM 
        Pets P
    JOIN 
        Appointments A ON P.pet_id = A.pet_id
    JOIN 
        Veterinarians V ON A.veterinary_id = V.vet_id
    JOIN 
        Owners O ON P.owner_id = O.owner_id
    WHERE 
        A.app_date >= '2024-01-11';
END
EXEC GetAppointmentss;



CREATE PROCEDURE GetRegularCheckupAppointments
AS
BEGIN
    -- Definiți instrucțiunea SELECT pentru a obține rezultatele
    SELECT 
        P.name AS PetName,
        P.species,
        P.breed,
        P.date_ofbirth,
        A.app_date,
        A.app_time,
        V.name AS VeterinarianName
    FROM 
        Pets P
    JOIN 
        Appointments A ON P.pet_id = A.pet_id
    JOIN 
        Veterinarians V ON A.veterinary_id = V.vet_id
    WHERE 
        A.reason = 'Regular Checkup';
END;

EXEC GetRegularCheckupAppointments;



/*Acesta procedura va arăta numele animalului de companie, specia, rasa, numele și adresa proprietarului, numărul total de tratamente și costul total 
al acestor tratamente. Procedura se concentrează pe animalele de companie care au avut mai mult de două tratamente*/
CREATE PROCEDURE GetPetTreatmentSummary
AS
BEGIN
    SELECT 
        P.name AS PetName,
        P.species,
        P.breed,
        O.name AS OwnerName,
        O.adress AS OwnerAddress,
        COUNT(T.treatment_id) AS NumberOfTreatments,
        SUM(T.cost) AS TotalCost
    FROM 
        Pets P
    JOIN 
        Treatments T ON P.pet_id = T.pet_id
    JOIN 
        Owners O ON P.owner_id = O.owner_id
    GROUP BY 
        P.pet_id, P.name, P.species, P.breed, O.name, O.adress
    HAVING 
        COUNT(T.treatment_id) > 2;
END;
EXEC GetPetTreatmentSummary;



/*Procedura include și numele și specializarea veterinarului care a efectuat tratamentele, împreună cu informațiile despre animalul de 
companie și proprietarul acestuia. Interogarea afișează doar acele animale care au avut mai mult de două tratamente efectuate de același 
veterinar (cu veterinarian_id = 1) în ultimul an.*/
CREATE PROCEDURE GetPetDetails
AS
BEGIN
    SELECT 
        P.name AS PetName,
        P.species,
        P.breed,
        O.name AS OwnerName,
        O.adress AS OwnerAddress,
        V.name AS VeterinarianName,
        V.specialization AS VeterinarianSpecialization,
        COUNT(T.treatment_id) AS NumberOfTreatments,
        SUM(T.cost) AS TotalCost
    FROM 
        Pets P
    JOIN 
        Treatments T ON P.pet_id = T.pet_id
    JOIN 
        Owners O ON P.owner_id = O.owner_id
    JOIN 
        Veterinarians V ON T.veterinarian_id = V.vet_id
    WHERE 
        T.treat_date > DATEADD(year, -1, SYSDATETIME())
        AND T.veterinarian_id = 1
    GROUP BY 
        P.pet_id, P.name, P.species, P.breed, O.name, O.adress, V.name, V.specialization
    HAVING 
        COUNT(T.treatment_id) > 2;
END
EXEC GetPetDetails

/*Această procedură oferă o privire de ansamblu asupra tratamentelor și programărilor veterinare pentru fiecare animal de companie în ultimul an, inclusiv numărul de tratamente, costul total, și ultima dată de tratament, focalizându-se pe animalele

care au fost tratate de mai mult de un veterinar.*/

CREATE PROCEDURE GetPetTreatmentAppointmentSumm
AS
BEGIN
    SELECT 
        P.name AS PetName,
        P.species,
        P.breed,
        O.name AS OwnerName,
        O.adress AS OwnerAddress,
        V.name AS VeterinarianName,
        COUNT(DISTINCT T.treatment_id) AS NumberOfTreatments,
        COUNT(DISTINCT A.app_id) AS NumberOfAppointments,
        MAX(T.treat_date) AS LastTreatmentDate,
        SUM(T.cost) AS TotalCost
    FROM 
        Pets P
    JOIN 
        Treatments T ON P.pet_id = T.pet_id
    JOIN 
        Owners O ON P.owner_id = O.owner_id
    JOIN 
        Veterinarians V ON T.veterinarian_id = V.vet_id
    JOIN
        Appointments A ON P.pet_id = A.pet_id
    WHERE 
        T.treat_date > DATEADD(year, -1, SYSDATETIME())
    GROUP BY 
        P.pet_id, P.name, P.species, P.breed, O.name, O.adress, V.name
    HAVING 
        COUNT( T.veterinarian_id) > 1;
END;
EXEC GetPetTreatmentAppointmentSumm;