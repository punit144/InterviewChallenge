import sys

def get_value_from_nested_object(obj, key):
    keys = key.split('/')
    value = obj
    try:
        for k in keys:
            value = value[k]
        return value
    except (KeyError, TypeError):
        return None

# Check if the required arguments are provided
if len(sys.argv) < 3:
    print("Usage: python script.py <object> <key>")
    sys.exit(1)

# Extract the object and key from command-line arguments
object_str = sys.argv[1]
key = sys.argv[2]

# Convert the object string to a dictionary
try:
    object_dict = eval(object_str)
except SyntaxError:
    print("Invalid object format. Please provide a valid dictionary object.")
    sys.exit(1)

# Call the function to get the value
value = get_value_from_nested_object(object_dict, key)
print(value)
