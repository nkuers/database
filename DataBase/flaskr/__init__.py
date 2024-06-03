import os
import datetime
from flask import Flask
import auth
import blog
import db
import article
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text
from flask import current_app, g
HOSTNAME = "127.0.0.1"
PORT = 3306
USERNAME = "root"
PASSWORD = "cptbtptp123"
DATABASE = "finalwork"


def create_app(test_config=None):
    # create and configure the app
    #app = Flask(__name__, instance_relative_config=True)
    app = Flask(__name__)
    app.config.from_mapping(
        SECRET_KEY='Fond',
        #DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),

        #SQLALCHEMY_DATABASE_URI="mysql+pymysql://root:cptbtptp123@localhost:3306/finalwork",
        SQLALCHEMY_DATABASE_URI=f"mysql+pymysql://{USERNAME}:{PASSWORD}@{HOSTNAME}:{PORT}/{DATABASE}?charset=utf8mb4",
        DEBUG = True
    )

    # app.config[
    #     'SQLALCHEMY_DATABASE_URI'] = f"mysql+pymysql://{USERNAME}:{PASSWORD}@{HOSTNAME}:{PORT}/{DATABASE}?charset=utf8mb4"
    # app.config['DEBUG'] = True
    db = SQLAlchemy(app)
    with app.app_context():
        if 'db' not in g:
           g.db = db
        with db.engine.connect() as conn:
            username = 'fond'
            rs = conn.execute(text(f'SELECT * FROM userinfo WHERE username = "{username}"')).fetchone()
            #posts = db.execute(text()).fetchall()
            print(rs)


    #
    # if test_config is None:
    #     # load the instance config, if it exists, when not testing
    #     app.config.from_pyfile('config.py', silent=True)
    # else:
    #     # load the test config if passed in
    #     app.config.from_mapping(test_config)

    #
    # @app.route('/hello')
    # def hello():
    #     return 'Hello, World!'


    # db.init_app(app)
    app.register_blueprint(auth.bp)
    app.register_blueprint(blog.bp)
    app.add_url_rule('/', endpoint='index')
    app.register_blueprint(article.bp)

    return app


if __name__ == '__main__':
    create_app().run()