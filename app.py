#!/usr/bin/python3.10

from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def index():
    return render_template('base.html')

@app.route('/plants')
def page():
    return render_template('plants.html')

@app.route('/owner')
def hello_world():
    return 'Сенченко Никита Тестовое'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0',port=5001)
