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
    #check if passed value has multiple keys with a seperator
    if len(key) !=1 and key.find('/') != -1 :
        received_keys = key.split("/")
        cnt = 0
    #iterate through the keys provided and increment the counter to trace the path back 
        for ikeys in received_keys:
            #iterate with keys in object to validate the existance and path
            for k, v in obj.items():
                if ikeys == k:
                    #stop inner loop execution and move to outer loop for next element if key found
                    continue
                #condition to validate the last key/leaf node and assiging value to object
                elif received_keys[cnt-1] == k:
                    obj = v
                else:
                #return none if keys passed doesnot match the key path
                    return None
            cnt = cnt + 1
        #return the leaf node value
        return obj.get( list(obj. keys())[0] )

if __name__ == '__main__':
    obj = {"x": {"y": {"z": "a"}}}
    print(getNodeValue(obj, 'x/y/z'))
    