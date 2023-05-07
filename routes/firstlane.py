from flask import Blueprint, render_template

class Firstlane:
    def __init__(self):
        self.index_view = Blueprint("index", __name__)
        self.index_view.add_url_rule("/", view_func=self.index)

    index_view = Blueprint("/", __name__)

    @index_view.route("/index")
    def index(self):
        return render_template("index.html")