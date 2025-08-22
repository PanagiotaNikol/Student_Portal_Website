# Εισαγωγή των απαραίτητων βιβλιοθηκών
from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

# Δημιουργία Flask εφαρμογής
app = Flask(__name__)

# Σύνδεση με τη MySQL
try:
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='database project',
        charset='utf8mb4'
    )
    cursor = conn.cursor(dictionary=True)
except mysql.connector.Error as err:
    print(f"Error connecting to MySQL: {err}")
    exit(1)

# Αρχική σελίδα
@app.route('/')
def index():
    return render_template('index.html')
 
# Εισαγωγή νέου φοιτητή στη βάση
@app.route('/insert_student', methods=['GET', 'POST'])
def insert_student():
    error = None
    success = None
    if request.method == 'POST':
        student_id = request.form['student_id']
        full_name = request.form['full_name']
        address = request.form['address']
        phone = request.form['phone']
        email = request.form['email']
        advisor = request.form['advisor']
        category = request.form['category']  # Νέα επιλογή κατηγορίας

        cursor.execute("SELECT * FROM student WHERE STUDENT_ID = %s OR EMAIL = %s", (student_id, email))
        existing = cursor.fetchone()

        if existing:
            error = "Ο φοιτητής με αυτό το ID ή email υπάρχει ήδη!"
        else:
            # Εισαγωγή στον βασικό πίνακα student
            cursor.execute("""
                INSERT INTO student (STUDENT_ID, FULL_NAME, ADDRESS, PHONE, EMAIL, ADVISOR)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (student_id, full_name, address, phone, email, advisor))
            
            # Ανάλογα με την κατηγορία, εισάγουμε και στον υποπίνακα
            if category == 'undergraduate':
                cursor.execute("INSERT INTO undergraduate (STUDENT_ID) VALUES (%s)", (student_id,))
            elif category == 'postgraduate':
                cursor.execute("INSERT INTO postgraduate (STUDENT_ID) VALUES (%s)", (student_id,))
            elif category == 'teaching_certification':
                cursor.execute("INSERT INTO teaching_certification (STUDENT_ID) VALUES (%s)", (student_id,))
            
            conn.commit()
            success = "Ο φοιτητής καταχωρήθηκε με επιτυχία!"
            return render_template('insert_student.html', success=success)

    return render_template('insert_student.html', error=error)

# Εισαγωγή νέου καθηγητή
@app.route('/insert_professor', methods=['GET', 'POST'])
def insert_professor():
    error = None
    success = None
    if request.method == 'POST':
        professor_id = request.form['professor_id']
        full_name = request.form['full_name']
        phone = request.form['phone']
        specialization = request.form['specialization']
        academic_rank = request.form['academic_rank']
        address = request.form['address']
        field_of_study = request.form['field_of_study']

        cursor.execute("SELECT * FROM professor WHERE PROFESSOR_ID = %s OR PHONE = %s", (professor_id, phone))
        existing = cursor.fetchone()

        if existing:
            error = "Ο καθηγητής με αυτό το ID ή τηλέφωνο υπάρχει ήδη!"
        else:
            cursor.execute("""
                INSERT INTO professor (PROFESSOR_ID, FULL_NAME, PHONE, SPECIALIZATION, ACADEMIC_RANK, ADDRESS, FIELD_OF_STUDY)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
            """, (professor_id, full_name, phone, specialization, academic_rank, address, field_of_study))
            conn.commit()
            success = "Ο καθηγητής καταχωρήθηκε με επιτυχία!"
            return render_template('insert_professor.html', success=success)

    return render_template('insert_professor.html', error=error)

# Εισαγωγή νέου μαθήματος
@app.route('/insert_course', methods=['GET', 'POST'])
def insert_course():
    error = None
    success = None
    if request.method == 'POST':
        course_id = request.form['course_id']
        course_name = request.form['course_name']
        ects = request.form['ects']
        academic_program = request.form['academic_program']
        category = request.form['category']
        course_weight = request.form['course_weight']
        semester = request.form['semester']

        cursor.execute("SELECT * FROM courses WHERE COURSE_ID = %s OR COURSE_NAME = %s", (course_id, course_name))
        existing = cursor.fetchone()

        if existing:
            error = "Το μάθημα με αυτό το ID ή όνομα υπάρχει ήδη!"
        else:
            cursor.execute("""
                INSERT INTO courses (COURSE_ID, COURSE_NAME, ECTS, ACADEMIC_PROGRAM, CATEGORY, COURSE_WEIGHT, SEMESTER)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
            """, (course_id, course_name, ects, academic_program, category, course_weight, semester))
            conn.commit()
            success = "Το μάθημα καταχωρήθηκε με επιτυχία!"
            return render_template('insert_course.html', success=success)

    return render_template('insert_course.html', error=error)

# Εισαγωγή νέας εξέτασης
@app.route('/insert_exam', methods=['GET', 'POST'])
def insert_exam():
    error = None
    success = None
    if request.method == 'POST':
        student_id = request.form['student_id']
        course_id = request.form['course_id']
        grade = request.form['grade']

        # Μπορείς να προσθέσεις έλεγχο ύπαρξης φοιτητή/μαθήματος αν θες

        cursor.execute("""
            INSERT INTO was_examined (STUDENT_ID, COURSE_ID, GRADE)
            VALUES (%s, %s, %s)
        """, (student_id, course_id, grade))
        conn.commit()
        success = "Η εξέταση καταχωρήθηκε με επιτυχία!"
        return render_template('insert_exam.html', success=success)

    return render_template('insert_exam.html', error=error)

# Σελίδα για εκτέλεση ερωτημάτων
@app.route('/queries')
def queries():
    return render_template('queries.html')

@app.route('/query', methods=['POST'])
def query():
    query_type = request.form['query_type']
    value = request.form['value'].strip()
    results = []

    try:
        if query_type == 'b1':
            # B1: Μαθήματα που παρακολουθεί φοιτητής
            cursor.execute("""
                SELECT 
                    s.STUDENT_ID,
                    s.FULL_NAME AS STUDENT_NAME,
                    c.COURSE_ID,
                    c.COURSE_NAME
                FROM student s
                JOIN registers r ON s.STUDENT_ID = r.STUDENT_ID
                JOIN courses c ON r.COURSE_ID = c.COURSE_ID
                WHERE s.FULL_NAME = %s OR s.STUDENT_ID = %s
                ORDER BY s.STUDENT_ID
            """, (value, value))
            results = cursor.fetchall()

        elif query_type == 'b2':
            # B2: Μαθήματα + Καθηγητής + Βαθμός
            cursor.execute("""
                SELECT 
                    s.STUDENT_ID,
                    s.FULL_NAME AS STUDENT_NAME,
                    c.COURSE_ID,
                    c.COURSE_NAME,
                    p.FULL_NAME AS PROFESSOR_NAME,
                    w.GRADE
                FROM student s
                JOIN was_examined w ON s.STUDENT_ID = w.STUDENT_ID
                JOIN courses c ON w.COURSE_ID = c.COURSE_ID
                JOIN teaches t ON c.COURSE_ID = t.COURSE_ID
                JOIN professor p ON t.PROFESSOR_ID = p.PROFESSOR_ID
                WHERE s.FULL_NAME = %s OR s.STUDENT_ID = %s
                ORDER BY s.STUDENT_ID, c.COURSE_ID
            """, (value, value))
            results = cursor.fetchall()

        elif query_type == 'b3':
            if ',' not in value:
                error = "Για το ερώτημα B3, εισάγετε δύο τιμές χωρισμένες με κόμμα (π.χ. S03, P03)."
                return render_template('queries.html', error=error)

            student_input, professor_input = map(str.strip, value.split(',', 1))

            cursor.execute("""
                SELECT 
                    s.STUDENT_ID,
                    s.FULL_NAME AS STUDENT_NAME,
                    c.COURSE_ID,
                    c.COURSE_NAME,
                    c.ACADEMIC_PROGRAM,
                    c.CATEGORY,
                    c.COURSE_WEIGHT,
                    c.SEMESTER AS ATTENDED_SEMESTER,
                    p.FULL_NAME AS PROFESSOR_NAME,
                    CASE 
                        WHEN w.STUDENT_ID IS NOT NULL THEN 'Ναι'
                        ELSE 'Όχι'
                    END AS WAS_EXAMINED,
                    w.GRADE
                FROM student s
                JOIN registers r ON s.STUDENT_ID = r.STUDENT_ID
                JOIN courses c ON r.COURSE_ID = c.COURSE_ID
                LEFT JOIN teaches t ON c.COURSE_ID = t.COURSE_ID
                LEFT JOIN professor p ON t.PROFESSOR_ID = p.PROFESSOR_ID
                LEFT JOIN was_examined w ON s.STUDENT_ID = w.STUDENT_ID AND c.COURSE_ID = w.COURSE_ID
                WHERE (s.FULL_NAME = %s OR s.STUDENT_ID = %s)
                AND (p.FULL_NAME = %s OR p.PROFESSOR_ID = %s)
                ORDER BY s.STUDENT_ID, c.SEMESTER, c.COURSE_ID
            """, (student_input, student_input, professor_input, professor_input))
            results = cursor.fetchall()

        elif query_type == 'b4':
            # Αν δόθηκε value, φιλτράρουμε, αλλιώς εμφανίζουμε όλους
            if value:
                cursor.execute("""
                    SELECT 
                        p.PROFESSOR_ID,
                        p.FULL_NAME AS PROFESSOR_NAME,
                        p.SPECIALIZATION,
                        d.DEPT_NAME AS DEPARTMENT_NAME,
                        d.DEPT_LOCATION AS DEPARTMENT_LOCATION,
                        c.COURSE_ID,
                        c.COURSE_NAME
                    FROM professor p
                    JOIN teaches t ON p.PROFESSOR_ID = t.PROFESSOR_ID
                    JOIN courses c ON t.COURSE_ID = c.COURSE_ID
                    LEFT JOIN department d ON p.PROFESSOR_ID = d.PROFESSOR_ID
                    WHERE p.FULL_NAME = %s OR p.PROFESSOR_ID = %s
                    ORDER BY p.PROFESSOR_ID, c.COURSE_ID
                """, (value, value))
            else:
                cursor.execute("""
                    SELECT 
                        p.PROFESSOR_ID,
                        p.FULL_NAME AS PROFESSOR_NAME,
                        p.SPECIALIZATION,
                        d.DEPT_NAME AS DEPARTMENT_NAME,
                        d.DEPT_LOCATION AS DEPARTMENT_LOCATION,
                        c.COURSE_ID,
                        c.COURSE_NAME
                    FROM professor p
                    JOIN teaches t ON p.PROFESSOR_ID = t.PROFESSOR_ID
                    JOIN courses c ON t.COURSE_ID = c.COURSE_ID
                    LEFT JOIN department d ON p.PROFESSOR_ID = d.PROFESSOR_ID
                    ORDER BY p.PROFESSOR_ID, c.COURSE_ID
                """)
            results = cursor.fetchall()


        elif query_type == 'b5':
            # B5: Μέσος βαθμός φοιτητή
            cursor.execute("""
                SELECT 
                    s.STUDENT_ID,
                    s.FULL_NAME,
                    ROUND(AVG(w.GRADE), 2) AS AVERAGE_GRADE
                FROM student s
                JOIN was_examined w ON s.STUDENT_ID = w.STUDENT_ID
                WHERE s.FULL_NAME = %s OR s.STUDENT_ID = %s
                GROUP BY s.STUDENT_ID, s.FULL_NAME
                ORDER BY s.STUDENT_ID
            """, (value, value))
            results = cursor.fetchall()

        elif query_type == 'b6':
            # B6: Μέσος βαθμός επιτυχίας (>=5)
            cursor.execute("""
                SELECT 
                    s.STUDENT_ID,
                    s.FULL_NAME,
                    ROUND(AVG(w.GRADE), 2) AS AVERAGE_PASSED_GRADE
                FROM student s
                JOIN was_examined w ON s.STUDENT_ID = w.STUDENT_ID
                WHERE (s.FULL_NAME = %s OR s.STUDENT_ID = %s) AND w.GRADE >= 5
                GROUP BY s.STUDENT_ID, s.FULL_NAME
                ORDER BY s.STUDENT_ID
            """, (value, value))
            results = cursor.fetchall()

        elif query_type == 'b7':
            # B7: Πτυχιακές ανά καθηγητή (φιλτράρισμα αν υπάρχει value)
            if value:
                cursor.execute("""
                    SELECT gp.GP_ID, gp.GP_TITLE,
                           p.PROFESSOR_ID, p.FULL_NAME AS PROFESSOR_NAME
                    FROM graduation_project gp
                    JOIN professor p ON gp.GP_ID = p.GP_ID
                    WHERE p.FULL_NAME = %s OR p.PROFESSOR_ID = %s
                    ORDER BY p.PROFESSOR_ID, gp.GP_ID
                """, (value, value))
            else:
                cursor.execute("""
                    SELECT gp.GP_ID, gp.GP_TITLE,
                           p.PROFESSOR_ID, p.FULL_NAME AS PROFESSOR_NAME
                    FROM graduation_project gp
                    JOIN professor p ON gp.GP_ID = p.GP_ID
                    ORDER BY p.PROFESSOR_ID, gp.GP_ID
                """)
            results = cursor.fetchall()

    except Exception as e:
        error = f"Σφάλμα στην εκτέλεση του ερωτήματος: {e}"
        return render_template('queries.html', error=error)

    return render_template('results.html', results=results, query_type=query_type, search_value=value)


if __name__ == '__main__':
    app.run(debug=True)



