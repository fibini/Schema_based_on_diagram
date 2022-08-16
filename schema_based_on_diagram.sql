CREATE TABLE patients (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE
);

CREATE TABLE medical_histories (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(100)
);

CREATE TABLE treatments(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type VARCHAR(50),
    name VARCHAR (100)
);
CREATE TABLE invoice_items(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unit_price DECIMAL(5,2),
    quantity INT,
    total_price DECIMAL(5,2),
    invoice_id INT REFERENCES invoices (id),
    treatment_id INT REFERENCES treatments (id)
);

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    total_amount DECIMAL(5,2),
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_histories(id)
);    


CREATE TABLE medication (
    treatment_id INT REFERENCES treatments(id),
    medical_history_id INT REFERENCES medical_histories(id)
);

CREATE INDEX index_patient_id ON medical_histories(patient_id);
CREATE INDEX index_invoice_id ON invoice_items(invoice_id);
CREATE INDEX index_treatment_id ON invoice_items(treatment_id);
CREATE INDEX index_medical_history_id ON invoices(medical_history_id);
CREATE INDEX index_treatment_id_medication ON medication(treatment_id);
CREATE INDEX index_medical_history_id_medication ON medication(medical_history_id);