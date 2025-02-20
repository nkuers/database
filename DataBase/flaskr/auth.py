import functools

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text
from flaskr.db import get_db


bp = Blueprint('auth', __name__, url_prefix='/auth')

@bp.route('/register', methods=('GET', 'POST'))
def register():
    # 注册
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        db = get_db()
        error = None
        number = db.execute(text('SELECT COUNT(userid) FROM userinfo')).fetchone()[0]
        if not username:
            error = 'Username is Null'
        elif not password:
            error = 'Password is Null'
        elif db.execute(text(f'SELECT userid FROM userinfo WHERE username = "{username}"')).fetchone() is not None:
            error = f'User {username} has registered !'

        if error is None:
            db.execute(text(
            f'INSERT INTO userinfo (userid,username,password) VALUES ({number+1}, "{username}", "{password}")'
            ))
            db.commit()
            return redirect(url_for('auth.login'))
        flash(error)

    return render_template('auth/register.html')


@bp.route('/login', methods=('GET', 'POST'))
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        db = get_db()
        error = None
        user = db.execute(text( f'SELECT * FROM userinfo WHERE username = "{username}" ')).fetchone()
        if user is None:
            error = 'Incorrect username'
        if not user[2] == password:
            error = 'Incorrect password'
        if error is None:
            session.clear()
            session['user_id'] = user[0]
            return redirect(url_for('index'))
        flash(error)
    return render_template('auth/login.html')


@bp.before_app_request
def load_logged_in_user():
    user_id = session.get('user_id')

    if user_id is None:
        g.user = None
    else:

        rs = [get_db().execute(text(
            f'SELECT * FROM userinfo WHERE userid = {user_id}'

        )).fetchone()]
        g.user = [dict(zip(['userid', 'username', 'password', 'age', 'birthday', 'area', 'sex', 'level'],
                         [p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7]])) for p in rs][0]


@bp.route('/logout')
def logout():
    session.clear()
    g.user=None
    return redirect(url_for('index'))


def login_required(view):
    @functools.wraps(view)
    def wrapped_view(**kwargs):
        if g.user is None:
            return redirect(url_for('auth.login'))

        return view(**kwargs)

    return wrapped_view