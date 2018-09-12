from flask import Flask, request
import json
app = Flask(__name__)
from search.recipe import Recipe

rec = Recipe()

# @app.route('/search/recipes', methods=['GET', 'POST'])
# def index():
# 	print(str(json.loads(request.data)['query']))
# 	data = rec.get_recipe(str(json.loads(request.data)['query']))
# 	print(data)
# 	response = app.response_class(response=json.dumps(data), status=200, mimetype='application/json')
# 	return response

@app.route('/recipes', methods=['GET'])
def get_all():
	data = rec.get_all_recipes()
	# print(data)
	response = app.response_class(response=json.dumps(data), status=200, mimetype='application/json')
	return response

@app.route('/getitems', methods=['GET'])
def get_items():
	id = request.args.get('recipe_id')
	data = rec.get_items(id)
	response = app.response_class(response=json.dumps(data), status=200, mimetype='application/json')
	return response

@app.route('/login', methods=['GET'])
def login():
	uid = request.args.get('u_id')
	password = request.args.get('pass')
	cart = request.args.get('cart')
	data = rec.login(cart, uid, password)
	response = app.response_class(response=json.dumps(data), status=200, mimetype='application/json')
	return response


@app.route('/getitem', methods=['GET'])
def get_item():
	id = request.args.get('item_id')
	data = rec.get_item(id)
	response = app.response_class(response=json.dumps(data), status=200, mimetype='application/json')
	return response

@app.route('/additem', methods=['GET'])
def add_item():
	id = request.args.get('item_id')
	data = rec.add_item(id)
	response = app.response_class(response=json.dumps(data), status=200, mimetype='application/json')
	return response

@app.route('/getlocation', methods=['GET'])
def get_location():
	id = request.args.get('location')
	data = rec.get_location(id)
	response = app.response_class(response=json.dumps(data), status=200, mimetype='application/json')
	return response


@app.route('/')
def root():
	return "Yo, it's working!"

if __name__ == "__main__":
	app.run(host='0.0.0.0', debug=True)
