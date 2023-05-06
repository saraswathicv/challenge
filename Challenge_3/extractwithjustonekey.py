# We have a nested object, we would like a function that you pass in the object and a key and get back the value. How this is implemented is up to you.
##
# Example Inputs
# object = {“a”:{“b”:{“c”:”d”}}}
# key = a/b/c
##
# object = {“x”:{“y”:{“z”:”a”}}}
# key = x/y/z
# value = a
def getNodeValue(obj: dict, key: str):
    global isfound
    #If we have reached leaf node and key is not found return None
    if type(obj) is not dict and not isfound:
        return None
    #if the search key is present in obj or we have found the key
    if (key in obj.keys() or isfound):
         isfound = True
        #if the value of the key is dict object , call the function with immediate key
         if type(obj[key]) is dict:
            return getNodeValue(obj[key], list(obj[key])[0])
         else:
            #if the obj is not dictonary /if it is leaf node return the value of the immediate key
            return obj[list(obj)[0]]
    else:
        #if key is not present move to next element search
        return getNodeValue(obj[list(obj)[0]], key)



if __name__ == '__main__':
    obj = {"x": {"y": {"z": "a"}}}
    isfound = False
    print(getNodeValue(obj, "y"))