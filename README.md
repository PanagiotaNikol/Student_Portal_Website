# Student Portal Database Project

## 📌 Overview
This project was developed as part of a **Database Systems university course**.  
It is a simple **Student Portal Web Application** built with **Python (Flask)** and **MySQL**.  

The database schema and the web interface demonstrate how relational databases can be integrated into real-world applications.  
⚠️ **Note:** All data in the project is fake and created for demonstration purposes only.

The application allows users to:
- Insert and manage students, courses, professors, and exams.
- Execute queries on the database.
- View results in a user-friendly web interface.

---

## 🗂 Project Structure
```
DataBase-Project/
│── student_portal_app.py     # Main Flask application
│── templates/                # HTML templates for the web interface
│   ├── base.html
│   ├── index.html
│   ├── insert_student.html
│   ├── insert_course.html
│   ├── insert_professor.html
│   ├── insert_exam.html
│   ├── queries.html
│   └── results.html
│── database-with-data_project.sql   # MySQL database schema + fake data
```

---

## ⚙️ Requirements
Before running the project, make sure you have installed:

- [Python 3.x](https://www.python.org/downloads/)  
- [Flask](https://flask.palletsprojects.com/)  
- [XAMPP (MySQL/MariaDB)](https://www.apachefriends.org/) or any MySQL server  

You can install Flask using pip:
```bash
pip install flask mysql-connector-python
```

---

## 🛠 Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/DataBase-Project.git
   cd DataBase-Project
   ```

2. **Import the database**
   - Start **XAMPP** and ensure that **Apache** and **MySQL** services are running.
   - Open [http://localhost/phpmyadmin](http://localhost/phpmyadmin).
   - Create a new database (e.g., `student_portal`).
   - Import the file `database-with-data_project.sql`.

3. **Configure the database connection**
   - Open `student_portal_app.py`.
   - Update the database connection details (username, password, database name) to match your MySQL setup.

   Example:
   ```python
   db = mysql.connector.connect(
       host="localhost",
       user="root",
       password="your_password",
       database="student_portal"
   )
   ```

4. **Run the application**
   ```bash
   python student_portal_app.py
   ```

5. **Open in browser**
   - Visit [http://127.0.0.1:5000](http://127.0.0.1:5000) to access the application.

---

## 🎯 Features
- Add, edit, and manage:
  - Students  
  - Courses  
  - Professors  
  - Exams  
- Execute SQL queries through the web interface.  
- Display query results in a formatted HTML table.  

---

## 🚀 Future Improvements
- Add authentication for professors/students.  
- Enhance the UI with CSS/JS frameworks (Bootstrap/Tailwind).  
- Include REST API endpoints.  

---

## 📄 License
This project is for **educational purposes only** and uses **fake data**.  
Feel free to use, modify, and share it under the terms of the MIT License.  


---

## 👥 Authors
- Panagiota-Spyridoula Nikolidaki (https://github.com/PanagiotaNikol)
- Efsevia Makri (https://github.com/Efseviamakri)
