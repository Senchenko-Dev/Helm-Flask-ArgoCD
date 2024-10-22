#!/usr/bin/python3.10

from flask import Flask, render_template
from config import variables 
from jinja2.exceptions import TemplateNotFound
from werkzeug.exceptions import abort

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('base.html', **variables)

@app.route('/<file_name>')
def page(file_name):
    try:
        return render_template(f'{file_name}.html',**variables)
    except TemplateNotFound:
        abort(404)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0',port=5000)
