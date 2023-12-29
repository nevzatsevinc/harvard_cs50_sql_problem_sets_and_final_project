--INSERT Queries
--Add a doctor
INSERT INTO DoctorDetails (FirstName, LastName, Specialty, Email, Phone)
VALUES ('John', 'Doe', 'Pediatrics', 'johndoe@email.com', '111222222');

--Add a patient
INSERT INTO PatientInformation (FirstName, LastName, DateOfBirth, Gender, Address, Phone, Email, InsuranceID)
VALUES ('Jane', 'Smith', '1990-05-15', 'Female', '123 Main St', '111333333', 'janesmith@email.com', 1);

--Add a insurance info
INSERT INTO InsuranceInformation (InsuranceID, PatientID, ProviderName, PolicyNumber, CoverageDetails, ValidFrom, ValidUntil)
VALUES (1, 1, 'A Insurance', 'POLICY123', 'Full coverage', '2023-01-01', '2025-01-01');

--Add an appointment
INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, Reason)
VALUES (1, 1, 1, '2023-04-30', '10:00:00', 'Routine Checkup');

--Add a medical record
INSERT INTO MedicalRecords (RecordID, PatientID, VisitDate, DoctorID, Diagnosis, Treatment, Notes)
VALUES (1, 1, '2023-04-30', 1, 'Diagnosis', 'Diagnosed with Type 2 Diabetes', '');

--Add a medication
INSERT INTO Medications (MedicationID, Name, Description, CommonUses, SideEffects)
VALUES (1, 'Amo123', 'Antibiotic used to treat various infections', '500mg', 'unknown');


--UPDATE Queries
--Update the phone number of a patient
UPDATE PatientInformation
SET Phone = '123456789'
WHERE LastName = 'Smith';

--Update the specialty of a specific doctor
UPDATE DoctorDetails
SET Specialty = 'General Medicine'
WHERE LastName = 'Doe';


--SELECT Queries
--All details for a doctor by last name
SELECT * FROM DoctorDetails
WHERE LastName = 'Doe';

--Find all doctors with a specialty
SELECT *
FROM DoctorDetails
WHERE Specialty = 'General Medicine';

--Get contact information for a patient
SELECT * FROM PatientContactInfo
WHERE LastName = 'Smith';

--insurance information for a patient
SELECT * FROM PatientInsuranceDetails
WHERE LastName = 'Smith' AND FirstName = 'Jane';


--DELETE Queries
--Remove a patient
DELETE FROM PatientInformation
WHERE LastName = 'Smith';

--Remove a doctor
DELETE FROM DoctorDetails
WHERE LastName = 'Doe';

--Remove a insurance
DELETE FROM InsuranceInformation
WHERE InsuranceID = 1;

--Remove a appointment
DELETE FROM Appointments
WHERE AppointmentID = 1;

--Remove a medical record
DELETE FROM MedicalRecords
WHERE RecordID = 1;

--Remove a medication
DELETE FROM Medications
WHERE MedicationID = 1;

