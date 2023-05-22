from flask import Flask, render_template, request, redirect, url_for
from flask_mysqldb import MySQL
#from .routes.firstlane import Firstlane

app = Flask(__name__)
app.secret_key = "981254678"

app.config['MYSQL_HOST'] = "localhost"
app.config['MYSQL_USER'] = "root"
app.config['MYSQL_PASSWORD'] = "password"
app.config['MYSQL_DB'] = "testinglms"

db = MySQL(app)

#login page
@app.route("/")
def index():
    if "registerBtn" in request.form:
        return render_template("register.html")
    return render_template("index.html")

#completedlogin page
@app.route("/success", methods=["POST"])
def success():
    username, password, logType = request.form.get("username").strip(), request.form.get("pass").strip(), request.form.get("loginType")
    cur = db.connection.cursor()
    logBool = 0
    if logType is None:
        return "Invalid Parameters"
    if logType == "lib":
        logBool = 1
        cur.execute("SELECT id FROM librarian WHERE username = %s and pass = %s", (username, password))    
        lib = cur.fetchone()
        cur.close
        num = str(lib)[1:-2]
        
        if len(username) == 0:
            return "input fields cannot be blank(ERR.CD:3)"
        elif len(password) == 0:
            return "input fields cannot be blank(ERR.CD:3)"

        if not lib:
            return "invalid username or password"

        return render_template("libSuccess.html", logBool=logBool, lib=num)
    
    elif logType == "stud":
        cur.execute("SELECT id FROM USERS WHERE username = %s and pass = %s", (username, password))
        user = cur.fetchone()
        num = str(user)[1:-2]
        cur.close()
        
        if len(username) == 0:
            return "input fields cannot be blank(ERR.CD:3)"
        elif len(password) == 0:
            return "input fields cannot be blank(ERR.CD:3)"

        if not user:
            return "invalid username or password"

        return render_template("success.html", logBool=logBool, user=num)

#register page
@app.route("/register")
def register():
    return render_template("register.html")

#executes when all of the fields registered
@app.route("/registering", methods=["POST"])
def registering():
    name, bdate, username, password, password2 = request.form.get("fNameR").strip(), request.form.get("birthdateR"), request.form.get("usernameR").strip(), request.form.get("passR").strip(), request.form.get("passR2").strip()
    
    if len(name) == 0:
        return "<h1>please provide real time data (ERR.CD:1)"
    elif len(username) == 0 or len(username) < 8:
        return "<h1>please provide real time data (ERR.CD:1)"
    elif len(password) == 0 or len(password) < 8:
        return "<h1>please provide real time data (ERR.CD:1)"
    elif len(password2) == 0 or len(password2) < 8:
        return "<h1>please provide real time data (ERR.CD:1)"
    elif len(bdate) == 0:
        return "<h1>please provide real time data (ERR.CD:1)"

    if password != password2:
        return "<h1>please make sure the two password field is matching (ERR.CD:2)<h1>" 

    if not checkUsername(username):
        return "username not available"

    cur = db.connection.cursor()
    cur.execute("INSERT INTO users (fName, bdate, username, pass) VALUES (%s, %s, %s, %s)", (name, bdate, username, password))
    db.connection.commit()
    cur.close()
    return redirect(url_for("index"))

#loginpage actions
@app.route("/actions", methods=["POST"])
def actions():
    if "libraryBtn" in request.form:
        return render_template("library.html")
    elif "settingsBtn" in request.form:
        id = request.form.get("user")
        return render_template("accountSettings.html", id=id)
    elif "logoutBtn" in request.form:
        return redirect(url_for("index"))
    
@app.route("/actionsLib", methods=["POST"])
def actionsLib():
    if request.method == "POST":
        if "showBtn" in request.form:
            return redirect(url_for("showBooks"))
        elif "searchBtn" in request.form:
            return render_template("searchBooks.html")
        elif "backBtn" in request.form:
            return redirect(request.referrer or url_for("success"))
    else:
        return "method not allowed"

@app.route("/showBooks", methods=["GET"])
def showBooks():
    cur = db.connection.cursor()
    cur.execute("SELECT * FROM books_1")
    data = cur.fetchall()
    cur.close()
    return render_template("showBooks.html", books=data)

@app.route("/searching", methods=["POST"])
def searching():
    query, search = request.form.get("query"), request.form.get("search")
    print(query)
    if len(query) == 0 or search is None:
        return "Invalid Parameters"
    cur = db.connection.cursor()
    if search == "Sisbn":
        cur.execute("SELECT * FROM books_1 WHERE isbn LIKE %s", (query,))
        
    elif search == "Sbooks": 
        cur.execute("SELECT * FROM books_1 WHERE title LIKE %s", (query,))
    
    books = cur.fetchall()
    cur.close()
    return render_template("searched.html", books=books)
    
@app.route("/controls", methods=["POST"])
def controls():
    if "libraryBtn" in request.form:
        return render_template("libLibrary.html")
    elif "settingsBtn" in request.form:
        id = request.form.get("lib")
        return render_template("libAccountSettings.html", id=id)
    elif "logoutBtn" in request.form:
        return redirect(url_for("index"))

@app.route("/controlsLib", methods=["POST"])
def controlsLib():
    if request.method == "POST":
        if "addBtn" in request.form:
            return render_template("addBooks.html")
        elif "showBtn" in request.form:
            return redirect(url_for("libShowBooks"))
        elif "searchBtn" in request.form:
            return render_template("searchbooks.html")
        elif "delBtn" in request.form:
            return render_template("delBooks.html")
    else:
        return "method not allowed"

@app.route("/adding", methods=["POST"])
def adding():
    isbn, rAge, title, price, author = request.form.get("isbn"), request.form.get("rAge"), request.form.get("title"), request.form.get("price"), request.form.get("author")
    cur = db.connection.cursor()
    cur.execute("INSERT INTO books_1 (isbn, recommendedAge, title, price, author) VALUES (%s, %s, %s, %s, %s)", (isbn, rAge, title, price, author))
    db.connection.commit()
    cur.close()
    return redirect(url_for("libShowBooks"))

@app.route("/libShowBooks", methods=["GET"])
def libShowBooks():
    cur = db.connection.cursor()
    cur.execute("SELECT * FROM books_1")
    data = cur.fetchall()
    cur.close()
    return render_template("libShowBooks.html", books=data)

@app.route("/deleting", methods=["POST"])
def deleting():
    isbn = request.form.get("isbn")
    cur = db.connection.cursor()
    cur.execute("DELETE FROM books_1 WHERE isbn = %s", (isbn,))
    db.connection.commit()
    cur.close()
    return redirect(url_for("libShowBooks"))

@app.route("/updating", methods=["POST"])
def updating():
    fName, bdate, username, passw, passw2, id = request.form.get("fNameU").strip(), request.form.get("birthdateU").strip(), request.form.get("usernameU").strip(), request.form.get("passU").strip(), request.form.get("passU2").strip(), request.form.get("id")
    
    if len(fName) == 0:
        return "<h1>please provide real time data (ERR.CD:1)"
    elif len(username) == 0 or len(username) < 8:
        return "<h1>please provide real time data (ERR.CD:1)"
    elif len(passw) == 0 or len(passw) < 8:
        return "<h1>please provide real time data (ERR.CD:1)"
    elif len(passw2) == 0 or len(passw2) < 8:
        return "<h1>please provide real time data (ERR.CD:1)"
    elif len(bdate) == 0:
        return "<h1>please provide real time data (ERR.CD:1)"

    if passw != passw2:
        return "<h1>please make sure the two password field is matching (ERR.CD:2)<h1>" 

    if not checkUsername(username):
        return "username not available"

    cur = db.connection.cursor()
    cur.execute("UPDATE users SET fName = %s, bdate = %s, username = %s, pass = %s WHERE id = %s", (fName, bdate, username, passw, id))
    db.connection.commit()
    cur.close()
    return "account updated successfully, click the topleft (left arrow) button to go back, we will fix this feature soon"

@app.route("/libupdating", methods=["POST"])
def libupdating():
    fName, username, passw, passw2, id = request.form.get("fNameU").strip(), request.form.get("usernameU").strip(), request.form.get("passU").strip(), request.form.get("passU2").strip(), request.form.get("id")
    
    if len(fName) == 0:
        return "<h1>please provide real time data (ERR.CD:1)"
    elif len(username) == 0 or len(username) < 8:
        return "<h1>please provide real time data (ERR.CD:1)"
    elif len(passw) == 0 or len(passw) < 8:
        return "<h1>please provide real time data (ERR.CD:1)"
    elif len(passw2) == 0 or len(passw2) < 8:
        return "<h1>please provide real time data (ERR.CD:1)"
    
    if passw != passw2:
        return "<h1>please make sure the two password field is matching (ERR.CD:2)<h1>" 

    if checkUsername2(username):
        return "username not available"

    cur = db.connection.cursor()
    cur.execute("UPDATE librarian SET name = %s, username = %s, pass = %s WHERE id = %s", (fName, username, passw, id))
    db.connection.commit()
    cur.close()
    return "account updated successfully, click the topleft (left arrow) button to go back, we will fix this feature soon"

def checkUsername(username):
    cur = db.connection.cursor()
    cur.execute("SELECT * FROM users WHERE username = %s", (username,))
    usernames = cur.fetchall()
    if usernames:
        for row in usernames:
            print(username, row[3])
            if username.strip() == str(row[3]).strip():
                return False
    cur.close()
    return True

def checkUsername2(username):
    cur = db.connection.cursor()
    cur.execute("SELECT * FROM librarian WHERE username = %s", (username,))
    usernames = cur.fetchall()
    if usernames:
        for row in usernames:
            print(username, row[3])
            if username.strip() == str(row[3]).strip():
                return True
    cur.close()
    return False

if __name__ == "__main__":
    app.run(debug=True)