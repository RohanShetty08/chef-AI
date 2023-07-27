import requests
img = 'food1.jpg'
api_user_token = 'e9338e57e3eda54b26a28570397212eb377c32a7'
headers = {'Authorization': 'Bearer ' + api_user_token}

# Single/Several Dishes Detection
url = 'https://api.logmeal.es/v2/image/segmentation/complete'
resp = requests.post(url,files={'image': open(img, 'rb')}, headers=headers)
result = (resp.json()["segmentation_results"]) # display dish only

ingredient_list = []
for key in result:
    rec_results = key["recognition_results"]
    ingredient = rec_results[0]['name']
    ingredient_list.append(ingredient)
    
print("ingredient_list:")
print(ingredient_list)


