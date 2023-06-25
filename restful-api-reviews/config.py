from app import app
from flaskext.mysql import MySQL

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = '___' #yourid
app.config['MYSQL_DATABASE_PASSWORD'] = '+++' #yourpw
app.config['MYSQL_DATABASE_DB'] = 'etd_db'
app.config['MYSQL_DATABASE_HOST'] = '67.205.163.33'
mysql.init_app(app)
