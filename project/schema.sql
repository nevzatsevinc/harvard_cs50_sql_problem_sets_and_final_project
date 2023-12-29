-- Table for stores information about doctors
CREATE TABLE DoctorDetails (
    DoctorID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    Specialty TEXT,
    Email TEXT,
    Phone TEXT
);

-- Index for search by doctors last name and specialty
CREATE INDEX idx_doctor_lastname ON DoctorDetails(LastName);
CREATE INDEX idx_doctor_specialty ON DoctorDetails(Specialty);

-- View for access to doctors contact details
CREATE VIEW DoctorContactInfo AS
SELECT DoctorID, FirstName, LastName, Specialty, Email, Phone
FROM DoctorDetails;


-- Table for stores information about patient
CREATE TABLE PatientInformation (
    PatientID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    DateOfBirth DATE,
    Gender TEXT,
    Address TEXT,
    Phone TEXT,
    Email TEXT,
    InsuranceID INTEGER
);

-- Index for search by patients last name and insurance ID
CREATE INDEX idx_patient_lastname ON PatientInformation(LastName);
CREATE INDEX idx_patient_insurance ON PatientInformation(InsuranceID);

-- View for access to patient contact details
CREATE VIEW PatientContactInfo AS
SELECT PatientID, FirstName, LastName, Phone, Email, Address
FROM PatientInformation;


-- Table for stores information about insurance
CREATE TABLE InsuranceInformation (
    InsuranceID INTEGER PRIMARY KEY,
    PatientID INTEGER NOT NULL,
    ProviderName TEXT NOT NULL,
    PolicyNumber TEXT NOT NULL,
    CoverageDetails TEXT,
    ValidFrom DATE,
    ValidUntil DATE,
    FOREIGN KEY (PatientID) REFERENCES PatientInformation(PatientID)
);

-- Index for search by patients id and insurance provider name
CREATE INDEX idx_insurance_patient ON InsuranceInformation(PatientID);
CREATE INDEX idx_insurance_provider ON InsuranceInformation(ProviderName);

-- View for access to patient insurance details
CREATE VIEW PatientInsuranceDetails AS
SELECT
    PatientInformation.PatientID,
    PatientInformation.FirstName,
    PatientInformation.LastName,
    InsuranceInformation.ProviderName,
    InsuranceInformation.PolicyNumber,
    InsuranceInformation.CoverageDetails,
    InsuranceInformation.ValidFrom,
    InsuranceInformation.ValidUntil
FROM
    InsuranceInformation
JOIN
    PatientInformation ON InsuranceInformation.PatientID = PatientInformation.PatientID;


-- Table for stores information about appointments
CREATE TABLE Appointments (
    AppointmentID INTEGER PRIMARY KEY,
    PatientID INTEGER NOT NULL,
    DoctorID INTEGER NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Reason TEXT,
    FOREIGN KEY (PatientID) REFERENCES PatientInformation(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES DoctorDetails(DoctorID)
);

-- Index for search by appointment date, patient, and doctor
CREATE INDEX idx_appointment_date ON Appointments(AppointmentDate);
CREATE INDEX idx_appointment_patient ON Appointments(PatientID);
CREATE INDEX idx_appointment_doctor ON Appointments(DoctorID);

-- View for access to appointments details
CREATE VIEW DetailedAppointments AS
SELECT
    Appointments.AppointmentID,
    PatientInformation.FirstName AS PatientFirstName,
    PatientInformation.LastName AS PatientLastName,
    DoctorDetails.FirstName AS DoctorFirstName,
    DoctorDetails.LastName AS DoctorLastName,
    Appointments.AppointmentDate,
    Appointments.AppointmentTime,
    Appointments.Reason
FROM
    Appointments
JOIN
    PatientInformation ON Appointments.PatientID = PatientInformation.PatientID
JOIN
    DoctorDetails ON Appointments.DoctorID = DoctorDetails.DoctorID;


-- Table for stores information about medical records
CREATE TABLE MedicalRecords (
    RecordID INTEGER PRIMARY KEY,
    PatientID INTEGER NOT NULL,
    VisitDate DATE NOT NULL,
    DoctorID INTEGER,
    Diagnosis TEXT,
    Treatment TEXT,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES PatientInformation(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES DoctorDetails(DoctorID)
);

-- Index for search by patient, doctor, and visit date
CREATE INDEX idx_medicalrecords_patient ON MedicalRecords(PatientID);
CREATE INDEX idx_medicalrecords_doctor ON MedicalRecords(DoctorID);
CREATE INDEX idx_medicalrecords_visitdate ON MedicalRecords(VisitDate);

-- View for access to medical history
CREATE VIEW MedicalHistory AS
SELECT
    MedicalRecords.RecordID,
    MedicalRecords.PatientID,
    PatientInformation.FirstName AS PatientFirstName,
    PatientInformation.LastName AS PatientLastName,
    MedicalRecords.VisitDate,
    DoctorDetails.FirstName AS DoctorFirstName,
    DoctorDetails.LastName AS DoctorLastName,
    MedicalRecords.Diagnosis,
    MedicalRecords.Treatment,
    MedicalRecords.Notes
FROM
    MedicalRecords
JOIN
    PatientInformation ON MedicalRecords.PatientID = PatientInformation.PatientID
JOIN
    DoctorDetails ON MedicalRecords.DoctorID = DoctorDetails.DoctorID;


-- Table for stores information about medications
CREATE TABLE Medications (
    MedicationID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Description TEXT,
    CommonUses TEXT,
    SideEffects TEXT
);

-- Index for search by medication name and uses
CREATE INDEX idx_medication_name ON Medications(Name);
CREATE INDEX idx_medication_uses ON Medications(CommonUses);

-- View for access to medication summary
CREATE VIEW MedicationSummary AS
SELECT
    MedicationID,
    Name,
    CommonUses,
    SideEffects
FROM
    Medications;
