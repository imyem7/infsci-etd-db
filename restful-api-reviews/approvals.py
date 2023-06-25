import pymysql
from app import app
from config import mysql
from flask import jsonify
from flask import flash, request


@app.route('/approvals/create', methods=['POST'])
def create_approvals():
    try:        
        _json = request.json
        _accept_date = _json['accept_date']
        _coordinator_id = _json['fk_etd_coordinator_id']
        _etd_id = _json['fk_etd_id']
        if _accept_date and _coordinator_id and _etd_id and request.method == 'POST':
            conn = mysql.connect()
            cursor = conn.cursor(pymysql.cursors.DictCursor)		
            sqlQuery = "INSERT INTO approvals(accept_date, fk_etd_coordinator_id, fk_etd_id) VALUES(%s, %s, %s)"
            bindData = (_accept_date, _coordinator_id, _etd_id)            
            cursor.execute(sqlQuery, bindData)
            conn.commit()
            response = jsonify('Approvals added successfully!')
            response.status_code = 200
            return response
        else:
            return showMessage()
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()         


@app.route('/approvals')
def approvals():
    try:
        conn = mysql.connect()
        cursor =conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT accept_id, accept_date, fk_etd_coordinator_id, fk_etd_id FROM approvals")
        approvalsRows =cursor.fetchall()
        response =jsonify(approvalsRows)
        response.status_code =200
        return response
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()

@app.route('/approvals/<int:appr_id>')
def approvals_details(appr_id):
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT accept_id, accept_date, fk_etd_coordinator_id, fk_etd_id FROM approvals WHERE accept_id =%s", appr_id)
        approvalsRow =cursor.fetchone()
        conn.commit()
        response =jsonify(approvalsRow)
        response.status_code =200
        return response
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()


@app.route('/approvals/update', methods=['PUT'])
def update_approvals():
    try:
        _json = request.json
        _accept_id = _json['accept_id']
        _accept_date = _json['accept_date']
        _coordinator_id = _json['fk_etd_coordinator_id']
        _etd_id = _json['fk_etd_id']
        if _accept_date and _coordinator_id and _etd_id and _accept_id and request.method == 'PUT':
            sqlQuery = "UPDATE approvals SET accept_date=%s, fk_etd_coordinator_id=%s, fk_etd_id=%s WHERE accept_id=%s"
            bindData = (_accept_date, _coordinator_id, _etd_id, _accept_id,)
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.execute(sqlQuery, bindData)
            conn.commit()
            response = jsonify('Approvals updated successfully!')
            response.status_code = 200
            return response
        else:
            return showMessage()
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()


@app.route('/approvals/delete/<int:appr_id>', methods=['DELETE'])  
def delete_approvals(appr_id):
    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM approvals WHERE accept_id = %s", (appr_id,))
        conn.commit()
        response = jsonify('Approvals deleted successfully!')
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