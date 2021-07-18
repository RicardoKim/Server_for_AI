import requests
import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Message')
    parser.add_argument('--message', help="Type message", default="test")
    args = parser.parse_args()
    text_massage = args.message
    resp = requests.post("http://localhost:5000/test", data = text_massage, headers={'Content-Type': 'text/plain'})