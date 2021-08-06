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
            send_data(json.loads('{}"Umidade": {}, "humidade_r": {}, "Temp": {}, "luz": {}{}'.format("{",umidade_solo, umidade_ar, temp, luz, "}")))
       

def send_data(data):
    print(data)
    try:
        requests.post(url = "http://localhost:8000/polls/measure/geral", data = data)
    except:
        print("Conection error")

def clean_line(bruto):
    bruto = str(bruto)
    new = re.sub("[a-z]+", "", bruto)
    new = re.sub("\\\\", "", new)
    new = re.sub("'", "", new)
    return(new)

main()