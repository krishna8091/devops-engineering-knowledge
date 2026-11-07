import os
from flask import Flask, jsonify

app = Flask(__name__)
visits = 0


@app.route("/")
def home():
    global visits
    visits += 1
    return jsonify(service="shop-status", status="ok", visits=visits)


@app.route("/health")
def health():
    return jsonify(status="ok")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))
