-- Create database HospitalDB
create database HospitalDB;
-- Create schema hospital
create schema hospital;
-- Create table patients
create table hospital.patients(
	patient_id bigserial primary key,
	patient_name varchar(200) not null,
	patient_birth varchar(15),
	patient_address text not null,
	patient_phone varchar(15) not null,
	patient_email varchar(200) not null unique
);
-- Create table Patient_records
create table hospital.patient_records(
	patient_record_id bigserial primary key,
	disease_name text not null,
	status boolean default true,
	patient_id bigint not null references hospital.patients(patient_id)
);
-- Create table Departments
create table hospital.departments(
	department_id bigserial primary key,
	department_name varchar(200) not null
);
-- Create table Doctors
create table hospital.doctors(
	doctor_id bigserial primary key,
	doctor_name varchar(200) not null,
	doctor_birth varchar(15) not null,
	doctor_address text not null,
	doctor_phone varchar(15) not null,
	doctor_email varchar(200) not null unique,
	department_id bigint not null references hospital.departments(department_id)
);
-- Create table Examination_Details
create table hospital.examination_details(
	patient_record_id bigint not null references hospital.patient_records(patient_record_id),
	doctor_id bigint not null references hospital.doctors(doctor_id),
	notes text null,
	primary key(patient_record_id, doctor_id)
);