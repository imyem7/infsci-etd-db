# INFSCI 2710-Database Systems-Spring 2023
# FINAL part 2-Database Design
# Name: Stephen Wludarski, Ye Mun
# Date: April 3, 2023 
# Professor: Dr.Dmitriy Babichenko

DROP DATABASE IF EXISTS etd_db;
CREATE DATABASE IF NOT EXISTS etd_db;
USE etd_db;

# 0. passwords
DROP TABLE IF EXISTS passwords;
CREATE TABLE IF NOT EXISTS passwords (
  password_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  password VARCHAR(255)
  );

# 0. users
DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
  user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(255),
  access_level VARCHAR(10),
  fk_password_id INT,
  FOREIGN KEY (fk_password_id) REFERENCES passwords(password_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

# 1. institutions

DROP TABLE IF EXISTS institutions;
CREATE TABLE IF NOT EXISTS institutions (
  institution_id INT NOT NULL AUTO_INCREMENT,
  institution_name VARCHAR(255),
  institution_address VARCHAR(255),
  institution_city VARCHAR(50),
  institution_state VARCHAR(2),
  institution_zip VARCHAR(10),
  PRIMARY KEY (institution_id)
);

# 2. schools
DROP TABLE IF EXISTS schools;
CREATE TABLE IF NOT EXISTS schools (
  school_id INT NOT NULL AUTO_INCREMENT,
  school_name VARCHAR(255),
  PRIMARY KEY (school_id)
);

# 3. departments
DROP TABLE IF EXISTS departments;
CREATE TABLE IF NOT EXISTS departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name VARCHAR(255),
  fk_school_id INT,
  PRIMARY KEY (department_id),
  FOREIGN KEY (fk_school_id) REFERENCES schools(school_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

# 4. committees

DROP TABLE IF EXISTS committees;
CREATE TABLE IF NOT EXISTS committees (
  committee_id INT NOT NULL AUTO_INCREMENT,
  cm_first_name VARCHAR(255),
  cm_last_name VARCHAR(255),
  cm_email VARCHAR(255),
  fk_institution_id INT,
  fk_department_id INT,
  PRIMARY KEY (committee_id),
  FOREIGN KEY (fk_institution_id) REFERENCES institutions(institution_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (fk_department_id) REFERENCES departments(department_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

# 5. administrators
DROP TABLE IF EXISTS administrators;
CREATE TABLE IF NOT EXISTS administrators (
  admin_id INT NOT NULL AUTO_INCREMENT,
  admin_first_name VARCHAR(255),
  admin_last_name VARCHAR(255),
  admin_email VARCHAR(255),
  fk_department_id INT,
  fk_user_id INT,
  PRIMARY KEY (admin_id),
  FOREIGN KEY (fk_department_id) REFERENCES departments(department_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (fk_user_id) REFERENCES users(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

# 6. contributors
DROP TABLE IF EXISTS contributors;
CREATE TABLE IF NOT EXISTS contributors (
  contributor_id INT NOT NULL AUTO_INCREMENT,
  contrib_first_name VARCHAR(255),
  contrib_last_name VARCHAR(255),
  contrib_phone VARCHAR(20),
  contrib_email VARCHAR(255),
  PRIMARY KEY (contributor_id)
);

# 7. access_types
DROP TABLE IF EXISTS access_types;
CREATE TABLE IF NOT EXISTS access_types (
  access_type_id INT NOT NULL AUTO_INCREMENT,
  accessibility VARCHAR(255),
  PRIMARY KEY (access_type_id)
);

# 8. degrees
DROP TABLE IF EXISTS degrees;
CREATE TABLE IF NOT EXISTS degrees (
  degree_id INT NOT NULL AUTO_INCREMENT,
  degree VARCHAR(255),
  PRIMARY KEY (degree_id)
);


# 9. etds
DROP TABLE IF EXISTS etds;
CREATE TABLE IF NOT EXISTS etds (
  etd_id INT NOT NULL AUTO_INCREMENT,
  document_title VARCHAR(255),
  document_type VARCHAR(255),
  graduation_date DATE,
  is_embargo BOOLEAN,
  release_date DATE,
  fk_accesstype_id INT,
  fk_degree_id INT,
  fk_contributor_id INT,
  PRIMARY KEY (etd_id),
  FOREIGN KEY (fk_accesstype_id) REFERENCES access_types(access_type_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (fk_degree_id) REFERENCES degrees(degree_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (fk_contributor_id) REFERENCES contributors(contributor_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

#10. defenses
DROP TABLE IF EXISTS defenses;
CREATE TABLE IF NOT EXISTS defenses (
  defense_id INT NOT NULL AUTO_INCREMENT,
  defense_date DATE,
  adviser_id INT,
  1st_committee_id INT,
  2nd_committee_id INT,
  3rd_committee_id INT,
  4th_committee_id INT,
  fk_school_admin_id INT,
  fk_etd_id INT,
  PRIMARY KEY (defense_id),
  FOREIGN KEY (adviser_id) REFERENCES committees(committee_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (1st_committee_id) REFERENCES committees(committee_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (2nd_committee_id) REFERENCES committees(committee_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (3rd_committee_id) REFERENCES committees(committee_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (4th_committee_id) REFERENCES committees(committee_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (fk_school_admin_id) REFERENCES administrators(admin_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (fk_etd_id) REFERENCES etds(etd_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);


# 11. comments
DROP TABLE IF EXISTS comments;
CREATE TABLE IF NOT EXISTS comments (
  comment_id INT NOT NULL AUTO_INCREMENT,
  comment TEXT,
  PRIMARY KEY (comment_id)
);

# 12. etd_comments
DROP TABLE IF EXISTS etd_comments;
CREATE TABLE IF NOT EXISTS etd_comments (
  fk_etd_id INT NOT NULL,
  fk_comment_id INT NOT NULL,
  comment_date DATE,
  PRIMARY KEY (fk_etd_id, fk_comment_id),
  FOREIGN KEY (fk_etd_id) REFERENCES etds(etd_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (fk_comment_id) REFERENCES comments(comment_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);


 # 13. submission_types
 DROP TABLE IF EXISTS submission_types;
CREATE TABLE IF NOT EXISTS submission_types (
  submission_type_id INT NOT NULL AUTO_INCREMENT, 
  submission_type VARCHAR(255),
  PRIMARY KEY(submission_type_id)
);


# 19. submissions
DROP TABLE IF EXISTS submissions;
CREATE TABLE IF NOT EXISTS submissions (
  submit_id INT NOT NULL AUTO_INCREMENT,
  fk_submission_type_id INT,
  submission_date DATE,
  fk_etd_id INT,
  PRIMARY KEY (submit_id),
  FOREIGN KEY (fk_submission_type_id) REFERENCES submission_types(submission_type_id),
  FOREIGN KEY (fk_etd_id) REFERENCES etds(etd_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

# 20. etd_coordinators
DROP TABLE IF EXISTS etd_coordinators; 
CREATE TABLE IF NOT EXISTS etd_coordinators (
  etd_coordinator_id INT NOT NULL AUTO_INCREMENT, 
  etd_coordinator_first_name VARCHAR(255),
  etd_coordinator_last_name VARCHAR(255),
  etd_coordinator_email VARCHAR(255),
  fk_user_id INT,
  PRIMARY KEY (etd_coordinator_id),
  FOREIGN KEY (fk_user_id) REFERENCES users(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

# 21. reviews
DROP TABLE IF EXISTS reviews;
CREATE TABLE IF NOT EXISTS reviews (
  review_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  review_start_date DATE,
  review_complete_date DATE,
  fk_etd_coordinator_id INT,
  fk_etd_id INT,
  FOREIGN KEY (fk_etd_coordinator_id) REFERENCES etd_coordinators(etd_coordinator_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (fk_etd_id) REFERENCES etds(etd_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

# 22. approvals
DROP TABLE IF EXISTS approvals;
CREATE TABLE IF NOT EXISTS approvals (
  accept_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  accept_date DATE,
  fk_etd_coordinator_id INT,
  fk_etd_id INT,
  FOREIGN KEY (fk_etd_coordinator_id) REFERENCES etd_coordinators(etd_coordinator_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (fk_etd_id) REFERENCES etds(etd_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

# 23. etd_backups
DROP TABLE IF EXISTS etd_backups;
CREATE TABLE IF NOT EXISTS etd_backups (
  backup_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  backup_box_link VARCHAR(255),
  backup_creation_date DATE,
  fk_etd_id INT,
  FOREIGN KEY (fk_etd_id) REFERENCES etds(etd_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

# 24. publications
DROP TABLE IF EXISTS publications;
CREATE TABLE IF NOT EXISTS publications (
  publish_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  publish_date DATE,
  dsc_record_id INT,
  pq_record_id INT,
  fk_etd_coordinator_id INT,
  fk_etd_id INT,
  FOREIGN KEY (fk_etd_coordinator_id) REFERENCES etd_coordinators(etd_coordinator_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (fk_etd_id) REFERENCES etds(etd_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

# 25. microfilms
DROP TABLE IF EXISTS microfilms;
CREATE TABLE IF NOT EXISTS microfilms (
  microfilm_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  microfilm_number VARCHAR(255),
  microfilm_received DATE,
  fk_etd_id INT,
  FOREIGN KEY (fk_etd_id) REFERENCES etds(etd_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);










# Create Views

DROP VIEW IF EXISTS etd_process_view;
CREATE VIEW etd_process_view AS
SELECT CONCAT(contributors.contrib_last_name, ', ', contributors.contrib_first_name) AS contributor_name,
       contributors.contrib_email,
       CONCAT(administrators.admin_last_name, ', ', administrators.admin_first_name) AS administrator_name,
       schools.school_name,
       departments.department_name,
       etds.document_title AS etd_title,
       comments.comment,
       defenses.defense_date AS defense_date,
       GROUP_CONCAT(DISTINCT submission_types.submission_type ORDER BY submission_types.submission_type SEPARATOR '; ') AS submission_types,
       IF(COUNT(DISTINCT submissions.submit_id) = 3, 'Complete', 'Pending') AS submission_status,
       MIN(reviews.review_start_date) AS review_start_date,
       MAX(reviews.review_complete_date) AS review_complete_date,
       MAX(approvals.accept_date) AS accept_date,
       etds.is_embargo,
       etds.graduation_date,
       etds.release_date,
       etd_backups.backup_box_link
FROM contributors
JOIN etds ON etds.fk_contributor_id = contributors.contributor_id
JOIN submissions ON submissions.fk_etd_id = etds.etd_id
JOIN submission_types ON submission_types.submission_type_id = submissions.fk_submission_type_id
JOIN access_types ON access_types.access_type_id = etds.fk_accesstype_id
JOIN defenses ON defenses.fk_etd_id = etds.etd_id
JOIN committees AS adviser ON adviser.committee_id = defenses.adviser_id
JOIN administrators ON administrators.admin_id = defenses.fk_school_admin_id
JOIN departments ON departments.department_id = adviser.fk_department_id
JOIN schools ON schools.school_id = departments.fk_school_id
LEFT JOIN reviews ON reviews.fk_etd_id = etds.etd_id
LEFT JOIN approvals ON approvals.fk_etd_id = etds.etd_id
LEFT JOIN etd_comments ON etd_comments.fk_etd_id = etds.etd_id
LEFT JOIN comments ON comments.comment_id = etd_comments.fk_comment_id
LEFT JOIN etd_backups ON etd_backups.fk_etd_id = etds.etd_id
GROUP BY contributors.contrib_last_name, contributors.contrib_first_name, 
contributors.contrib_email, administrators.admin_last_name, administrators.admin_first_name, 
schools.school_name, departments.department_name, etds.document_title, comments.comment, 
defenses.defense_date, etds.is_embargo, 
etds.graduation_date, etds.release_date, etd_backups.backup_box_link;


