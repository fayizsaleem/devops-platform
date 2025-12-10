from flask import Flask, jsonify

app = Flask(__name__)

users = [
    {"id": 1, "name": "Fayiz"},
    {"id": 2, "name": "Alice"},
]

@app.route("/users", methods=["GET"])
def get_users():
    return jsonify(users)

@app.route("/health", methods=["GET"])
def health():
    return "OK", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
