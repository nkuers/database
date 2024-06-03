from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort
from sqlalchemy import text
from flaskr.auth import login_required
from flaskr.db import get_db

bp = Blueprint('blog', __name__)
@bp.route('/')
def index():
    #这里是主页 展示了最近的一些新闻还有搜索框

    if request.method == 'GET':
        if request.values:
            _search = request.values['search']
            return redirect(url_for('blog.searchpage', _search=_search))

    db = get_db()
    posts = db.execute(text("SELECT * FROM content")).fetchall()
    # content ['contentid',userid,'1title' ,'2head', '3body', '4label', '5owner', '6likes', '7time']
    logs = [dict( zip(['id','userid','title' ,'head', 'body', 'label', 'owner', 'likes', 'time'],
                          [p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8].strftime("%Y-%m-%d %H:%M:%S")])) for p in posts]


    # 渲染几篇文章
    #posts = [{'id': posts[0], 'title':posts[1], 'cteated':posts[5],'body':posts[2],'author_id':posts[3],'username':posts[4]}]
    return render_template('blog/index.html', posts=logs)


@bp.route('/homepage/create', methods=('GET', 'POST'))
# @bp.route('/create', methods=('GET', 'POST'))
@login_required
def create():
    # 创建article
    if request.method == 'POST':
        label = ''
        print(request.form)
        for k, v in request.form.items():
            print(k,v)
            if k=='title':
                title = v
            elif k == 'head':
                head = v
            elif k=='content':
                body = v
            elif v =='on':
                label = label+ k+';'

        error = None

        if not title:
            error = 'Title is required.'
        if not head:
            error = 'Head is required.'
        if not label:
            error = 'Label is required.'

        if error is not None:
            flash(error)
        else:
            db = get_db()
            id = g.user['userid']
            db.execute(text(
                f'call createcontent({id},"{title}", "{head}","{body}",  "{label}" )'
            ))
            db.commit()
            return redirect(url_for('blog.index'))

    return render_template('blog/create.html')


def get_post(id, check_author=True):
    columns = get_db().execute(text(f'SELECT * from userinfo natural join content where userid={id}')).keys()
    if columns is None:
        abort(404, "Post id {0} doesn't exist.".format(id))
    post = get_db().execute(text(f'SELECT * from userinfo natural join content where userid={id}')).fetchone()
    dic = dict(zip(columns, post))
    # if check_author and post['author_id'] != g.user['id']:
    #     abort(403)

    return dic


@bp.route('/<int:id>/update', methods=('GET', 'POST'))
@login_required
def update(id):
    #更新个人信息
    post = get_post(id)
    if request.method == 'POST':
        title = request.form['title']
        body = request.form['body']
        error = None

        if not title:
            error = 'Title is required.'

        if error is not None:
            flash(error)
        else:
            db = get_db()
            db.execute('UPDATE post SET title = ?, body = ? WHERE id = ?',)
            db.commit()
            return redirect(url_for('blog.index'))

#del user
@bp.route('/', methods=('POST',))
@login_required
def delete(id):
    #log out
    get_post(id)
    db = get_db()
    db.execute('DELETE FROM post WHERE id = ?', (id,))
    db.commit()

    return redirect(url_for('blog.index'))



@bp.route('/homepage/<int:id>', methods=('POST','GET'))
@login_required
def homepage(id):


    columns = get_db().execute(text(f'SELECT * from userinfo ')).keys()
    if columns is None:
        abort(404, "Post id {0} doesn't exist.".format(id))

    post = get_db().execute(text(f'SELECT * from userinfo WHERE userid={id}')).fetchone()
    info = dict(zip(columns, post))
    columns_ = get_db().execute(text(f'SELECT * from content ')).keys()
    post_ = get_db().execute(text(f'SELECT * from content where userid={id}')).fetchall()
    articles = [dict(zip(columns_, p)) for p in post_]
    return render_template('blog/homepage.html',id=id, post = info, arti=articles)



@bp.route('/homepage/<int:id>/modeify', methods=('POST','get'))
@login_required
def modify(id):
    db = get_db()
    print(request.form)
    if request.method == 'POST':
        p = request.form
        db.execute(text(f'call updateinfo({g.user["userid"]}, "{p["username"]}", '
                        f'"{p["sex"]}",{p["age"]},"{p["area"]}")'))
        db.commit()
        return redirect(url_for('blog.homepage',id=g.user['userid']))


    columns = get_db().execute(text(f'SELECT * from userinfo ')).keys()
    post = get_db().execute(text(f'SELECT * from userinfo WHERE userid={id}')).fetchone()
    info = dict(zip(columns, post))

    return render_template('blog/modify.html', post=info)

 #del content
@bp.route('/homepage/<int:id>/del/<int:articleid>', methods=('POST','get'))
def deletearticle(id, articleid):
    #id 用户id article：要删除的articleid
    db = get_db()
    db.execute(text(f'call deletearticle({articleid})'))
    db.commit()
    return redirect(url_for('blog.homepage', id=id))

@bp.route('/homepage/<int:id>/fix/<int:articleid>', methods=('POST','get'))
def updatearticle(id, articleid):
    # id 用户id article：要删除的articleid
    db = get_db()

    if request.method == 'POST':

        db.execute(text(f'call updateblog({articleid},"{request.form["title"]}",'
                        f'"{request.form["head"]}","{request.form["content"]}")'))
        db.commit()

        return redirect(url_for('blog.homepage', id=id))

    column = db.execute(text('select * from content')).keys()
    res = db.execute(text(f'select * from content where contentid={articleid}')).fetchone()

    post = dict(zip(column,res))
    return render_template('blog/fix.html', post=post)



@bp.route('/homepage/alluser', methods=['POST','GET'])
def alluser():
    db = get_db()
    co = db.execute(text('select * from alluser')).keys()
    res = db.execute(text('select * from alluser')).fetchall()
    res = [dict(zip(co, r)) for r in res]
    return render_template('blog/alluser.html', res=res)



@bp.route('/search/<string:_search>', methods=['POST','GET'])
def searchpage(_search):
    db = get_db()
    res = db.execute(text('select  title, head, username,contentid from allview')).fetchall()

    if not _search == '*':
        r = []
        for item in res:
            if (_search in item[0]) or (_search in item[1]) or (_search in item[2]):
                r.append(item)
    else:
        r=res

    return render_template('blog/searchpage.html', res=r)


@bp.route('/homepage/history', methods=['POST','GET'])
def history():
    db=get_db()
    id = g.user["userid"]
    co = db.execute(text(f'select title, author, tag, time from allhistory where userid={id}')).keys()
    res = db.execute(text('select * from allhistory')).fetchall()
    res = [dict(zip(co, r)) for r in res]
    return render_template('blog/allhistory.html', res=res)


@bp.route('/deluser/<int:id>', methods=('GET', 'POST'))
def deluser(id):
    db=get_db()
    db.execute(text(f'call deleteuser({id})'))
    db.commit()
    return redirect(url_for('blog.alluser'))