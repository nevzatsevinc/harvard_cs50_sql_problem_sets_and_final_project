--Index on students table
CREATE INDEX idx_student_id ON students(id);

--Indexes on courses table
CREATE INDEX idx_course_id ON courses(id);
CREATE INDEX idx_course_dept_num_sem ON courses(department, number, semester);
CREATE INDEX idx_course_title ON courses(title);

--Indexes on enrollments table
CREATE INDEX idx_enrollment_student_id ON enrollments(student_id);
CREATE INDEX idx_enrollment_course_id ON enrollments(course_id);

--Index on requirements table
CREATE INDEX idx_requirement_id ON requirements(id);

--Indexes on satisfies table
CREATE INDEX idx_satisfies_course_id ON satisfies(course_id);
CREATE INDEX idx_satisfies_requirement_id ON satisfies(requirement_id);
