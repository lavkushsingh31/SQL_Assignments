CREATE TABLE churn_modelling (
	RowNumber SERIAL PRIMARY KEY,
	CustomerId INTEGER,
	Surname	VARCHAR(80),
	CreditScore	INTEGER,
	Geography VARCHAR(80),
	Gender	VARCHAR(10),
	Age	SMALLINT,
	Tenure SMALLINT,
	Balance	DECIMAL,
	NumOfProducts SMALLINT,
	HasCrCard SMALLINT,
	IsActiveMember SMALLINT,
	EstimatedSalary	DECIMAL,
	Exited SMALLINT
);


COPY churn_modelling FROM 'E:\Github\Datasets\Churn_Modelling.csv' WITH (FORMAT csv, HEADER);

SELECT *
FROM churn_modelling;

COPY churn_modelling TO 'E:\AlmaBetter\Modules\Module 3 - Relational Databases\Chapter 1\Dataset\churn_data_frm_postgresql.csv' WITH (FORMAT csv, HEADER);
