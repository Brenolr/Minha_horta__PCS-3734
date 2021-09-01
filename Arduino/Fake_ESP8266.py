import serial 
import json
import re  # regx
import requests 


def main():
    motor_on = 1
    ser = serial.Serial('COM9',115200)

    while(True):
        char = clean_line(ser.readline())
        if(char== "|"):
            umidade_solo = float(clean_line(ser.readline()))
            umidade_ar = float(clean_line(ser.readline()))
            temp = float(clean_line(ser.readline()))
            luz = float(clean_line(ser.readline()))
            ser.write(bytes("teste", 'utf-8'))
            send_data(json.dumps({"umid_ar": float(umidade_ar), "luz":float(luz), "temp": float(temp), "umid_solo": float(umidade_solo)}))
            lim_umidade = get_humidity_limits()
            motor_on = engine_control(lim_umidade,umidade_solo,motor_on)
            ser.write(bytes(str(motor_on), 'utf-8'))
        print(ser.readline())
    
    # send_data(json.dumps({"umid_ar": 2.1, "luz": 50.7, "temp": 23.6, "umid_solo": 50.0}))  
    #send_data({"umid_ar": 2.1, "luz": 50.0, "temp": 23.6, "umid_solo": 5})
def send_data(data):
    print(data)
    try:
        requests.post(url = "http://localhost:8000/polls/measure/geral", data = data)
        print("Deu bom")
    except:
        print("Conection error")

def get_humidity_limits():
    try:
        data = requests.get(url = "http://localhost:8000/polls/threshold/geral")
        print("Deu bom tresh")
        data = json.loads(data.text)
        return(data["umid_solo"][len(data["umid_solo"])-1])
    except:
        print("Conection error")
    
def engine_control(lim_umidade,umidade,motor_on):
    print(lim_umidade)
    if((lim_umidade["min_value"])>umidade):
        print("Deveria ligar")
        return(1)
    if(lim_umidade["max_value"]<=umidade):
        print("Deveria Desligar")
        return(0)
    print("Deveria Manter")
    return(motor_on)

def clean_line(bruto):
    bruto = str(bruto)
    new = re.sub("[a-z]+", "", bruto)
    new = re.sub("\\\\", "", new)
    new = re.sub("'", "", new)
    return(new)

main()