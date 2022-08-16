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
)