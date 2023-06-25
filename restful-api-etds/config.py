from app import app
from flaskext.mysql import MySQL

import os
from dotenv import load_dotenv


# Load environment variables from .env file in the app folder
dotenv_path = os.path.join(os.path.dirname(__file__), '..', 'id.env')
load_dotenv(dotenv_path)



mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = os.environ.get('MYSQL_USER')#yourid
app.config['MYSQL_DATABASE_PASSWORD'] = os.environ.get('MYSQL_PASSWORD')#yourpw
app.config['MYSQL_DATABASE_DB'] = os.environ.get('MYSQL_DB')
app.config['MYSQL_DATABASE_HOST'] = os.environ.get('MYSQL_HOST')

print("MYSQL_DATABASE_USER:", app.config['MYSQL_DATABASE_USER'])
print("MYSQL_DATABASE_PASSWORD:", app.config['MYSQL_DATABASE_PASSWORD'])

mysql.init_app(app)


