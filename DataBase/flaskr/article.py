from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort
from sqlalchemy import text
from flaskr.auth import login_required
from flaskr.db import get_db

bp = Blueprint('article', __name__)

@bp.route('/article/<int:id>', methods=('GET', 'POST'))
@login_required
def content(id):
    db = get_db()
    # id 是文章id
    # post 写入 review
    db.execute(text(f'call createhistory({g.user["userid"]},{id})'))
    db.commit()
    print('历史更新')
    if request.method == 'POST':
        # print(request.form)
        article = request.form['comment']
        observer = request.form['author']
        db.execute(text(
            f'call createreview( {g.user["userid"]}, {id}, "{article}","{observer}")'
        ))
        db.commit()
        #print(f'call createreview({g.user["userid"]}, {id}, "{article}","{observer}")')
        #get_db().execute(text(f'INSERT INTO review value ("null","{article}","{request.form["author"]}",0)'))
        #get_db().execute(text(f'INSERT INTO doreview value ("null",{g.user["userid"]},{id})'))
        print("评论成功")

        # except:
        #     print("评论失败")
        return redirect(url_for('article.content', id=id))



    posts = db.execute(text(f"SELECT * FROM content WHERE contentid={id}")).fetchall()

    if posts is None:
        abort(404, "Article id {0} doesn't exist.".format(id))
    # review = db.execute(text()).fetchall()
    logs = [dict(zip(['contentid','userid', 'title', 'head', 'body', 'label', 'owner', 'likes', 'time'],
                     [p[0], p[1], p[2], p[3], p[4], p[5], p[6],p[7] ,p[8].strftime("%Y-%m-%d %H:%M:%S")])) for p in posts]

    r_column = db.execute(text(f"select * from review")).keys()
    review = db.execute(text(f"select * from review r where r.reviewid in (select reviewid from doreview where contentid={id} )")).fetchall()

    l = len(review)
    reviews = [dict(zip(r_column,r))  for r in review ]

    return render_template('blog/content.html', post=logs[0], reviews=reviews, len=l)

#del review
@bp.route('/article/<int:id>/delete/<int:reviewid>', methods=('GET', 'POST'))
def deletereview(id, reviewid):
    db = get_db()
    db.execute(text(f'call deletereview({reviewid})'))
    db.commit()
    return redirect(url_for('article.content', id=id))


