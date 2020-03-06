# Written by David Glennan 03/01/20

from flask import Flask, render_template, request, redirect
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'mysql'
app.config['MYSQL_DB'] = 'flaskapp'

mysql = MySQL(app)


@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        details = request.form
        name = details['name']
        email = details['email']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO users(name, email) VALUES (%s, %s)", (name, email))
        mysql.connection.commit()
        cur.close()
        return redirect('/users')
    return render_template('index.html')


@app.route('/users')
def users():
    cur = mysql.connection.cursor()
    value = cur.execute("SELECT * FROM users")
    if value > 0:
        details = cur.fetchall()
        return render_template('users.html', details=details)


if __name__ == '__main__':
    app.run()
