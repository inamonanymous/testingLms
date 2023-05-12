"""from flask import Blueprint, render_template

class Firstlane:
    def __init__(self):
        self.index_view = Blueprint("index", __name__)
        self.success_view = Blueprint("success", __name__)
        self.index_view.add_url_rule("/", view_func=self.index)
        self.index_view.add_url_rule("/", view_func=self.success)

    index_view = Blueprint("/", __name__)
    success_view = Blueprint("/success", __name__)


    @index_view.route("/index")
    def index(self):
        return render_template("index.html")
    
    @success_view.route("/success")
    def success(self):
        return render_template("success.html")"""