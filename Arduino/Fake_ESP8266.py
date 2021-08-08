import serial 
import json
import re  # regx
import requests 

def main():
    
    ser = serial.Serial('COM9',115200)
    while(True):
        char = clean_line(ser.readline())
        if(char== "|"):
            umidade_solo = clean_line(ser.readline())
            umidade_ar = clean_line(ser.readline())
            temp = clean_line(ser.readline())
            luz = clean_line(ser.readline())
            send_data(json.dumps({"umid_ar": float(umidade_ar), "luz":float(luz), "temp": float(temp), "umid_solo": float(umidade_solo)}))
    
    # send_data(json.dumps({"umid_ar": 2.1, "luz": 50.7, "temp": 23.6, "umid_solo": 50.0}))  
    #send_data({"umid_ar": 2.1, "luz": 50.0, "temp": 23.6, "umid_solo": 5})
def send_data(data):
    print(data)
    try:
        requests.post(url = "http://localhost:8000/polls/measure/geral", data = data)
        print("Deu bom")
    except:
        print("Conection error")

def clean_line(bruto):
    bruto = str(bruto)
    new = re.sub("[a-z]+", "", bruto)
    new = re.sub("\\\\", "", new)
    new = re.sub("'", "", new)
    return(new)

main()