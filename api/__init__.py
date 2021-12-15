from flask import Flask
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
CORS(app)

DB_USER = 'kbice'
DB_PASSWORD = "Test!2#4%"
DB_HOST = 'quilting-ninja-db' 
DB_NAME = 'quiltninja'

app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://" + DB_USER + ":" + DB_PASSWORD + "@" + DB_HOST  + ":" + "3306" + "/" + DB_NAME
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db = SQLAlchemy(app)

@app.route('/')
def hello():
    return 'my first api'
