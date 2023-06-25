import pymysql
from app import app
from config import mysql
from flask import jsonify
from flask import flash, request


@app.route('/publications/create', methods=['POST'])
def create_publications():
    try:        
        _json = request.json
        _publish_date = _json['publish_date']
        _dsc_record_id = _json['dsc_record_id']
        _pq_record_id = _json['pq_record_id']
        _coordinator_id = _json['fk_etd_coordinator_id']
        _etd_id = _json['fk_etd_id']
        if _publish_date and _dsc_record_id and _pq_record_id and _coordinator_id and _etd_id and request.method == 'POST':
            conn = mysql.connect()
            cursor = conn.cursor(pymysql.cursors.DictCursor)		
            sqlQuery = "INSERT INTO publications(publish_date, dsc_record_id, pq_record_id, fk_etd_coordinator_id, fk_etd_id) VALUES(%s, %s, %s, %s, %s)"
            bindData = (_publish_date, _dsc_record_id, _pq_record_id, _coordinator_id, _etd_id)            
            cursor.execute(sqlQuery, bindData)
            conn.commit()
            response = jsonify('publications added successfully!')
            response.status_code = 200
            return response
        else:
            return showMessage()
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()         


@app.route('/publications')
def publications():
    try:
        conn = mysql.connect()
        cursor =conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT * FROM publications")
        publicationsRows =cursor.fetchall()
        response =jsonify(publicationsRows)
        response.status_code =200
        return response
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()

@app.route('/publications/<int:publish_id>')
def publications_details(publish_id):
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT * FROM publications WHERE publish_id =%s", publish_id)
        publicationsRow =cursor.fetchone()
        conn.commit()
        response =jsonify(publicationsRow)
        response.status_code =200
        return response
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()


@app.route('/publications/update', methods=['PUT'])
def update_publications():
    try:
        _json = request.json
        _publish_id = _json['publish_id']
        _publish_date = _json['publish_date']
        _dsc_record_id = _json['dsc_record_id']
        _pq_record_id = _json['pq_record_id']
        _coordinator_id = _json['fk_etd_coordinator_id']
        _etd_id = _json['fk_etd_id']
        if _publish_date and _dsc_record_id and _pq_record_id and _coordinator_id and _etd_id and _publish_id and request.method == 'PUT':
            sqlQuery = "UPDATE publications SET publish_date=%s,dsc_record_id=%s, pq_record_id=%s, fk_etd_coordinator_id=%s, fk_etd_id=%s WHERE publish_id=%s"
            bindData = (_publish_date, _dsc_record_id,_pq_record_id, _coordinator_id, _etd_id, _publish_id,)
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.execute(sqlQuery, bindData)
            conn.commit()
            response = jsonify('publications updated successfully!')
            response.status_code = 200
            return response
        else:
            return showMessage()
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()


@app.route('/publications/delete/<int:publish_id>', methods=['DELETE'])  
def delete_publications(publish_id):
    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM publications WHERE publish_id = %s", (publish_id,))
        conn.commit()
        response = jsonify('publications deleted successfully!')
        response.status_code = 200
        return response
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()     

@app.errorhandler(404)
def showMessage(error=None):
    message = {
        'status': 404,
        'message': 'Record not found: ' + request.url,
    }
    response = jsonify(message)
    response.status_code = 404
    return response
        

        
if __name__ == "__main__":
    app.run()