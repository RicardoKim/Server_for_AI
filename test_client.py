import requests

if __name__ == "__main__":
    text_massage = "test"
    resp = requests.post("http://localhost:5000/test", data = text_massage, headers={'Content-Type': 'text/plain'})