import json
 
# Opening JSON file
f = open('dummy.json')

# returns JSON object as
# a dictionary
data = json.load(f)
 
# Iterating through the json
print("All Keys :")
for key, value in data.items():
    print(key)

print("\nAll site_name :")
for val in data['site_list']:
    print(val['site_name'])


print("\nsite_name = 'Clerk Quarter'")
site_name = 'Clerk Quarter'
feeder_id = ''
found = 0
for val in data['site_list']:
    if(val['site_name'] == site_name):
        print('feeder_id = ' + val['feeder_id'])
        feeder_id = val['feeder_id']
        found = 1
if(found == 0):
    print('No entry found for "' + site_name + '" in site_list')


pss_id = ''
for val in data['feeder_list']:
    if(val['feeder_id'] == feeder_id):
        print('feeder_name = ' + val['feeder_name'])
        print('pss_id = ' + val['pss_id'])
        pss_id = val['pss_id']

for val in data['pss_list']:
    if(val['pss_id'] == pss_id):
        print('pss_name = ' + val['pss_name'])

# Closing file
f.close()