#We need to write code that will query the metadata of an instance within AWS or Azure or GCP and provide a json formatted output.
#SThe choice of language and implementation is up to you.

import requests
import json

metadata_url='http://169.254.169.254/latest/'
metadatajsonfile = open("myfile.txt", "w")

def get_ec2_metadata():
        initial= ["meta-data/"]
        meta_data_response = get_ec2_metadata_json(metadata_url, initial)
        return meta_data_response


def get_ec2_metadata_json(url, arr):
        output = {}
        for ele in arr:
                url_framed = url + ele
                res = requests.get(url_framed)
                txt = res.text
                if ele[-1] == "/":
                      list_of_values = res.text.splitlines()
                    #remove trailing '/' in key and retrive the elements within
                      output[ele[:-1]] = get_ec2_metadata_json(url_framed, list_of_values)
                elif isjson(txt):
                    #to convert the JSON String document into the Python dictionary#
                    output[ele] = json.loads(txt)
                else:
                    #if it is leaf node /just value update key val in dict object
                      output[ele] = txt
        # to write dict object to json file
        ec2_metadatajson = json.dump(output, metadatajsonfile, indent=4)
        return output


#to validate if dict obj val is json
def isjson(myjson):
    try:
        json_object = json.loads(myjson)
    except ValueError as e:
        return False
    return True


#function to ftech all the values of all occurances of key in dict object
def get_value(obj, findkey):
    #list to hold the values for matching keys
    resulted_values = []
    #to find all matching keys recursively iterate through dict object
    for key, value in obj.items():
        #if the key is same as key to find add value to result
        if key == findkey:
            resulted_values.append(value)
        #Validate if value of any key is list and traverse through the list to fetch the key and its value
        elif isinstance(value, list):
            for item in value:
                #check if the value found under list in dict obj and iterative with that dic obj
                if isinstance(item, dict):
                    list_dicvalues = get_value(item, findkey)
                    #iterate and append the values to final list
                    for i in list_dicvalues:
                        resulted_values.append(i)
        #validate if vlue is dictionary , if so repeat the excercise
        elif isinstance(value, dict):
            dicvalues = get_value(value, findkey)
            for val in dicvalues:
                resulted_values.append(val)
    return resulted_values



if __name__ == '__main__':
        isfound = False
        value =get_value(get_ec2_metadata(),"Rapidops-Instance-SSM")
        print("saras", value)
