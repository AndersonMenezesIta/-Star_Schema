-- Dimension Tables

-- Date Dimension
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE,
    year INT,
    quarter INT,
    month INT,
    month_name VARCHAR(20),
    day INT,
    day_of_week INT,
    semester INT
);

-- Professor Dimension
CREATE TABLE dim_professor (
    professor_key INT PRIMARY KEY,
    professor_id INT,
    name VARCHAR(200),
    email VARCHAR(200),
    gender VARCHAR(50),
    birth_date DATE,
    academic_degree VARCHAR(100),
    admission_date DATE
);

-- Department Dimension
CREATE TABLE dim_department (
    department_key INT PRIMARY KEY,
    department_id INT,
    department_name VARCHAR(200),
    location VARCHAR(200),
    head_professor_id INT
);

-- Course Dimension
CREATE TABLE dim_course (
    course_key INT PRIMARY KEY,
    course_id INT,
    course_name VARCHAR(200),
    course_description TEXT,
    course_type VARCHAR(100),
    total_credits INT,
    department_key INT
);

-- Fact Table
CREATE TABLE fact_professor_courses (
    fact_key INT PRIMARY KEY,
    professor_key INT,
    department_key INT,
    course_key INT,
    date_key INT,
    
    -- Metrics
    total_classes_taught INT,
    total_students_enrolled INT,
    workload_hours DECIMAL(10,2),
    
    -- Optional additional metrics
    average_course_rating DECIMAL(5,2),
    performance_score DECIMAL(5,2),
    
    -- Foreign Keys
    FOREIGN KEY (professor_key) REFERENCES dim_professor(professor_key),
    FOREIGN KEY (department_key) REFERENCES dim_department(department_key),
    FOREIGN KEY (course_key) REFERENCES dim_course(course_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);
