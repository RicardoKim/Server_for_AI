import requests

if __name__ == "__main__":
    resp = requests.post("http://localhost:5000/predict",
                     files={"file": open('../image_source/cat.jpg','rb')})
    responded_json = resp.json()
    class_name = responded_json["class_name"]
    print(class_name)