-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/gn5TOt
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE TABLE "departments" (
    "dept_no" text NOT NULL,
    "dept_name" varchar NOT NULL,
    PRIMARY KEY dept_no
);

CREATE TABLE "dept_emp" (
    "emp_no" int NOT NULL,
    "dept_no" text NOT NULL,
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE "dept_manager" (
    "dept_no" text NOT NULL,
    "emp_no" int NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int NOT NULL,
    "emp_title" text NOT NULL,
    "birth_date" int NOT NULL,
    "first_name" varchar NOT NULL,
    "last_name" varchar NOT NULL,
    "sex" varchar NOT NULL,
    "hire_date" int NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE "salaries" (
    "emp_no" int NOT NULL,
    "salary" int NOT NULL
);

CREATE TABLE "titles" (
    "title_id" text NOT NULL,
    "title" varchar NOT NULL,
    PRIMARY KEY(title_id)
);

ALTER TABLE
    "departments" FOREIGN KEY("dept_no") REFERENCES "dept_emp" ("dept_no");

ALTER TABLE
    "dept_emp" FOREIGN KEY("emp_no") REFERENCES "salaries" ("emp_no");

ALTER TABLE
    "dept_manager" FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no");

ALTER TABLE
    "dept_manager" FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no");

ALTER TABLE
    "employees" FOREIGN KEY("emp_title") REFERENCES "titles" ("title");

ALTER TABLE
    "salaries" FOREIGN KEY("emp_no") REFERENCES "dept_manager" ("emp_no");