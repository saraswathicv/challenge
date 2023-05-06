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


if __name__ == "__main__":
        get_ec2_metadata()
