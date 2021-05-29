import pymongo

myclient = pymongo.MongoClient("mongodb+srv://RedRastaRigger:*INPUT_PASSWORD*@gamedata.7qipj.mongodb.net/myFirstDatabase?retryWrites=true&w=majority")
mydb = myclient["Stable"]
mycol = mydb["Races"]

x = mycol.find_one()

print(x)