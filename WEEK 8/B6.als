abstract sig Person {}

sig Doctor extends Person {
    specialty: one Department
}

sig Patient extends Person {
    attending: lone Doctor,
    records: set MedicalRecord
}

sig Department {}

sig MedicalRecord {
    creator: one Doctor
}

pred demo {
    some Patient
    some MedicalRecord
}
run demo for 3
