import json
import yaml
import requests
import time
import math

# Before you can use this script you will have to create a file
# called settings.yaml with your login and password to access the API

# You also need two modules pyYAML and requests. They are available on pip.

# It should be in the YAML format as following
# rootUrl: <APIUrl>
# login: <login>
# password: <password> 

with open('settings.yaml', 'r') as f:
    settings = yaml.load(f)

def computeConvergingNumber(convergeParam, step, goal):
	return goal + math.sin(convergeParam*step)/step

headers = {'content-type': 'application/json', 'Accept': 'application/json'}

print("====================================")
print("|         Database clean up        |")
print("====================================")

entities = ['networks','nodes','initTimes','coordinates']

for entity in entities:

	ExistingNetworksJson = requests.get(settings["rootUrl"]+"/"+entity+"/", auth=(settings["login"], settings["password"]), headers=headers)
	print("deletion status code : "+str(ExistingNetworksJson.status_code))
	ExistingNetworks = json.loads(ExistingNetworksJson.text)

	for n in ExistingNetworks["list"]:
		print("Delete "+entity+" : "+str(n))
		requests.delete(settings["rootUrl"]+"/"+entity+"/"+n["_id"], auth=(settings["login"], settings["password"]), headers=headers)

print("\n====================================")
print("|        Dummy data creation       |")
print("====================================")

print("\n -----> network <-----")

network = {'name':'Python network'}
response = requests.post(settings["rootUrl"]+"/networks/", data=json.dumps(network), auth=(settings["login"], settings["password"]), headers=headers)
print("network creation status : "+str(response.status_code))

networksJson = requests.get(settings["rootUrl"]+"/networks/", auth=(settings["login"], settings["password"]), headers=headers)
network = json.loads(networksJson.text)
network = network['list'][0]
# print("network : "+str(network))


print("\n -----> nodes <-----")

node1 = {'path':'nantes','network':network}
node2 = {'path':'paris','network':network}
node3 = {'path':'lyon','network':network}

nodes = [node1,node2,node3]

for n in nodes:
	response = requests.post(settings["rootUrl"]+"/nodes/", data=json.dumps(n), auth=(settings["login"], settings["password"]), headers=headers)
	print(str(n)+"\n ---> creation status : "+ str(response.status_code))

nodesJson = requests.get(settings["rootUrl"]+"/nodes/", auth=(settings["login"], settings["password"]), headers=headers)
nodes = json.loads(nodesJson.text)
nodes = nodes['list']
#print('\n nodes : '+str(nodes))


print("\n -----> initTimes <-----")

for i in range(0,3):
	init = {'timestamp': time.strftime("%Y-%m-%dT%H:%M:%S"),'node': nodes[i]}
	response = requests.post(settings["rootUrl"]+"/initTimes/", data=json.dumps(init), auth=(settings["login"], settings["password"]), headers=headers)
	print(str(init)+"\n ---> creation status : "+ str(response.status_code))

print("\n -----> coordinates <-----")

for node in range(1,4):
	for i in range(1,30):
		coordinate = {'node':nodes[node-1], 'x':computeConvergingNumber(node,i,node), 'y':computeConvergingNumber(node,i,1), 'timestamp': time.strftime("%Y-%m-%dT%H:%M:%S")}
		response = requests.post(settings["rootUrl"]+"/coordinates/", data=json.dumps(coordinate), auth=(settings["login"], settings["password"]), headers=headers)
		print(str(coordinate)+"\n ---> creation status : "+ str(response.status_code))
