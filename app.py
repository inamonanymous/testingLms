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
#fl = Firstlane()

#app.register_blueprint(fl.index_view)

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
        cur.execute("SELECT * FROM librarian WHERE username = %s and pass = %s", (username, password))    
        lib = cur.fetchone()
        cur.close
        
        if len(username) == 0:
            return "input fields cannot be blank(ERR.CD:3)"
        elif len(password) == 0:
            return "input fields cannot be blank(ERR.CD:3)"

        if not lib:
            return "invalid username or password"

        return render_template("libSuccess.html", logBool=logBool)
    
    elif logType == "stud":
        cur.execute("SELECT * FROM USERS WHERE username = %s and pass = %s", (username, password))
        user = cur.fetchone()
        cur.close()
        
        if len(username) == 0:
            return "input fields cannot be blank(ERR.CD:3)"
        elif len(password) == 0:
            return "input fields cannot be blank(ERR.CD:3)"

        if not user:
            return "invalid username or password"

        return render_template("success.html", logBool=logBool)

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
        return "settings"
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
        return "settings"
    elif "logoutBtn" in request.form:
        return redirect(url_for("index"))

@app.route("/controlsLib", methods=["POST"])
def controlsLib():
    if request.method == "POST":
        if "addBtn" in request.form:
            return render_template("addBooks.html")
        elif "showBtn" in request.form:
            return redirect(url_for("showBooks"))
        elif "searchBtn" in request.form:
            return render_template("searchbooks.html")
    else:
        return "method not allowed"

def checkUsername(username):
    cur = db.connection.cursor()
    cur.execute("SELECT * FROM users where username = %s", (username,))
    usernames = cur.fetchall()
    if usernames:
        for row in usernames:
            print(username, row[3])
            if username == str(row[3]):
                return False

    return True

if __name__ == "__main__":
    app.run(debug=True)