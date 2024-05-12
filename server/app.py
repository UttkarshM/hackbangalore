from pymongo import MongoClient

from dotenv import load_dotenv
import json
from flask import Flask, request, jsonify, send_file, render_template
import os
from dotenv import load_dotenv
from flask_pymongo import PyMongo as pymongo
import google.generativeai as genai
from datetime import datetime

load_dotenv()

#props
'''

'''

client = MongoClient(os.environ['MONGO_URI'])
db = client["Cluster2"]
collectionUsers = db["Users"]
app = Flask(__name__)

GEMINI_API_KEY = os.getenv('GEMINI_API_KEY')

genai.configure(api_key=GEMINI_API_KEY)
model = genai.GenerativeModel('gemini-pro')


@app.route('/chatbot', methods = ['POST', 'GET'])
def chatbot():
    if request.method == 'POST':
        prompt = request.json.get('prompt')
        response = model.generate_content(prompt)
        
        response_text = response.candidates[0].content.parts[0].text
        
        chat = {
            'prompt' : prompt,
            'response' : response_text,
            'timestamp' : datetime.now(),
        }
        
        db.gemini.insert_one(chat)
        
        return jsonify({'message': 'response generated successfully'}), 200
    
    elif request.method == 'GET':
        chats = db.gemini.find().sort('timestamp', 1)
        formatted_chats = [{
            'prompt': chat['prompt'],
            'response': chat['response'],
            'timestamp': chat['timestamp'],
        } for chat in chats]
        
        return jsonify({'chats': formatted_chats}), 200

# post = {"id":0,"name":"jake","credits":1000}
# collection.insert_one(post)
# import dns.resolver
# dns.resolver.default_resolver=dns.resolver.Resolver(configure=False)
# dns.resolver.default_resolver.nameservers=['8.8.8.8']
#inserts elements into the database
@app.route('/addusers', methods=['POST'])
def InsertUsers():
  try:
    json_data_list =  request.json.get('data')
    result = collectionUsers.insert_many(json_data_list)
    print("Documents inserted successfully:", result.inserted_ids)
  except Exception as e:
    print("Error inserting documents:", e)

  return jsonify({"message":"get request has been noticed"})



#used to return elements with similar attributes
@app.route('/findbyattrib',methods=['GET'])
def FilterByAttribute():
  search_param = request.json.get("value")
  search_field = request.json.get("name")

  obj ={search_field:search_param}
  fields = collectionUsers.find(obj)
  fie = [str(doc) for doc in fields]
  json_str = jsonify(fie)
  return json_str



@app.route('/Update',methods=['POST','GET'])
def UpdateEntries():
  search_param = request.json.get("sv")
  search_field = request.json.get("sf")
  replace_with_field = request.json.get("cf")
  replace_with_param = request.json.get("cv")

  obj ={search_field:search_param}

  results = collectionUsers.update_one(obj,{"$set":{replace_with_field:replace_with_param}})
  return jsonify({"message":"entry updated."})


#gives all the documents that are present in the database
@app.route('/display',methods=['GET'])
def display():
  li = [str(l) for l in collectionUsers.find()]
  return jsonify(li)


#clears all the data
@app.route('/ClearAllData',methods=['POST'])
def ClearAllUsers():
  collectionUsers.delete_many({})

def convert_to_json_with_hex_objectid(data):
    """
    Converts the provided data (assumed to be a dictionary or list)
    to a JSON string, ensuring any ObjectId instances are represented
    as hexadecimal strings.

    Args:
        data (dict or list): The input data containing an ObjectId.

    Returns:
        str: The JSON representation of the data with ObjectIds as hex strings.
    """

    if isinstance(data, (dict, list)):
        # Recursively convert nested dictionaries and lists
        for key, value in data.items():
            data[key] = convert_to_json_with_hex_objectid(value)
        return json.dumps(data)
    elif isinstance(data, ObjectId):
        # Convert ObjectId to its hexadecimal string representation
        return str(data)
    else:
        # Return other data types as-is (can be customized if needed)
        return data

def manual_parsing(string):
  #made specifically for the attributes we have
  string = (string[1:])[:-2]
  string = string.replace("\'","")
  string = string.replace('"',"")
  string = string.replace("(","")
  string = string.replace(")","")
  string = string.replace("{","")
  string = string.replace("}","")
  string = string.replace(' ',"")
  string = string.replace("ObjectId","")
  list = string.split(',')
  newlist= []
  for l in list:
    d = []
    l = l.split(":")
    d.append(l[0])
    d.append(l[1])
    newlist.append(d)
  dictionary = {}
  for dit in newlist:
    dictionary[dit[0]]=dit[1]
  return dictionary


#you can fundraise for any org
@app.route('/Fundraise',methods=["GET","POST"])
def deduct():
  search_param = request.json.get("value")
  price = request.json.get('price')
  search_field = request.json.get("name")
  obj = {'name':search_field}
  try:
    fields = collectionUsers.find(obj)
    fie = [str(doc) for doc in fields]
    dict_list = manual_parsing(fie[0])
    prev = int(dict_list['age'])
    if(price>prev):
      return jsonify({"message":"insufficent balance"})
    else:
      result = collectionUsers.update_one(obj,{"$set":{"age":(prev-price)}})
  except:
    return jsonify({"message":"invalid name!"})
  # return jsonify({"message":"amount has been deducted"})
  return jsonify({"message":dict_list})
def Close():
  client.close()

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
