from flask import Flask, jsonify
import os


app = Flask(__name__)


@app.route("/")
def index():
return jsonify({
"message": "Hello from ECS Fargate!",
"version": os.getenv("APP_VERSION", "0.0.0")
})


@app.route("/health")
def health():
return "OK", 200


if __name__ == "__main__":
app.run(host="0.0.0.0", port=int(os.getenv("PORT", 8080)))
