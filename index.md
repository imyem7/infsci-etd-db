# etd_db|Abstract
**INFSCI 2710: Database Management Systems|Professor: Dr. Dmitriy Babichenko|Due: March 13, 2023**
**Title of the Project: Efficient ETD Submission Management System using Drupal and MySQL**
**Team members: Stephen Wludarski, Ye Mun**
**GitHub Repository: https://imyem7.github.io/infsci-etd-db/**

### 1.	Description: 

Submitting Electronic Theses and Dissertations (ETDs) is a graduation requirement in 
many graduate schools. At Duquesne University, we have identified issues with the 
current process for managing ETD submission data. Specifically, the ETD coordinator 
faces challenges in tracking and updating ETD data locally. Although approved ETDs 
are published in the institutional repository and ProQuest Central, a local tracking 
database is still necessary to include basic information about students, committee 
members, school representatives, time stamps, and document information, including 
major metadata. This data management is particularly crucial in ensuring the safety 
of students' records, even in the event of institutional repository or ProQuest 
database corruption. 

The ETD coordinator is responsible for tracking students' progress and reminding 
them and school representatives of major deadlines throughout the process. 
Additionally, the coordinator must track embargo dates and process embargo expired 
documents. Currently, data collection at Duquesne University involves the use of a 
PDF version of the approval form, and the ETD coordinator records data manually in a 
temporal Excel spreadsheet, following up with students who have submitted the 
approval form or finished the formatting review. Later, this data is entered again 
in the ETD status data file, which is also an Excel spreadsheet. However, the 
process is redundant, inefficient, and prone to errors. 

To address these challenges, we propose building an efficient relational database to 
streamline the process of ETD submissions. Our solution will use MySQL to create a 
relational database, and we will implement an application using Drupal 8 or another 
CMS platform to create a RESTful API endpoint. In particular, our solution will also 
enable the ETD coordinator to have basic Create, Read, Update, and Delete (CRUD) 
database functions. With this approach, we aim to reduce the time spent entering the 
same data repeatedly, minimize errors, and improve overall efficiency. By creating a 
more efficient data management process, we will ensure that students' records are 
kept safe and secure.



### 2.	Usefulness/Meaningfulness: 

This project will be beneficial and meaningful for Duquesne University and other 
institutions that face similar challenges in managing ETD submissions. By creating 
an efficient and streamlined process for tracking ETD submissions, we can 
significantly reduce the time and effort required by the ETD coordinator to manage 
the data. In addition, the risk of errors or data loss will be greatly reduced, and 
students' records will be kept safe and secure.
For example, by implementing a relational database, the ETD coordinator will be able 
to easily track students' progress and deadlines, ensuring that all necessary steps 
are completed on time. The database will also provide a centralized location for all 
ETD submission data, eliminating the need for the ETD coordinator to maintain 
multiple files and spreadsheets. Finally, the ability to set alerts for embargo 
expiration dates will ensure that these documents are processed on time, further 
improving the efficiency of the overall process.


### 3.	Technical Platform Description: 

To implement this project, we will use a combination of MySQL and a CMS platform 
such as Drupal. MySQL will be used to create the relational database to store all 
ETD submission data, including student information, committee member information, 
school representative information, time stamps, and document metadata. 

We will also use Drupal 8 to build the front end of the application, which will 
include the user interface that students, committee members, and school 
representatives will interact with. Drupal 8 supports the creation of web forms, 
simplifying the process of collecting and validating user data.  Users will be able 
to query the ETD database, export their queried data as a spreadsheet and import 
data. Lastly, users will be able to identify and notify those individuals whose ETD 
needs assistance in the system by building a web-based dashboard using a RESTful API 
to provide users with an intuitive interface for managing their ETD submissions. The 
dashboard will provide real-time updates on submission status, allow users to 
receive notifications, and access additional resources related to the submission 
process. 

To integrate Drupal 8 with other systems and applications, we will use Apache as the 
backend web server for our project. Apache is capable of serving both static and 
dynamic content, including PHP-based applications like Drupal. 
