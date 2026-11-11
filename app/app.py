
import os

import redis
from flask import Flask, jsonify, render_template

app = Flask(__name__)

# Redis configuration
redis_client = redis.Redis(
    host=os.getenv("REDIS_HOST", "localhost"),
    port=int(os.getenv("REDIS_PORT", "6379")),
    decode_responses=True,
    socket_connect_timeout=2,
    socket_timeout=2,
)

# Supported lab categories
CATEGORIES = ("aws", "docker", "terraform")


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/health")
def health():
    try:
        redis_client.ping()
        return jsonify(status="ok"), 200
    except redis.RedisError:
        return jsonify(status="unhealthy"), 503


@app.route("/version")
def version():
    return jsonify(version=os.getenv("APP_VERSION", "1.0.0"))


@app.route("/api/labs")
def get_labs():
    try:
        counts = {
            category: int(redis_client.get(f"labs:{category}") or 0)
            for category in CATEGORIES
        }
        return jsonify(counts), 200
    except redis.RedisError:
        return jsonify(error="Database unavailable"), 503


@app.route("/api/labs/<category>/increment", methods=["POST"])
def increment_lab(category):
    if category not in CATEGORIES:
        return jsonify(error="Invalid lab category"), 404

    try:
        count = redis_client.incr(f"labs:{category}")
        return jsonify(category=category, count=count), 200
    except redis.RedisError:
        return jsonify(error="Database unavailable"), 503


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000)
