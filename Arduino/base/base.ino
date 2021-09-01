#include <DHT.h>;
#include <BH1750.h>
#include <Wire.h>

#define pino_hidrometro A0
#define Motor 8
#define DHTPIN 7 //PINO DIGITAL UTILIZADO PELO DHT22
#define DHTTYPE DHT22 //DEFINE O MODELO DO SENSOR (DHT22 / AM2302)

//BH1750 lightMeter(0x23);
DHT dht(DHTPIN, DHTTYPE);

void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(Motor, OUTPUT);
  Serial.begin(115200);
//  lightMeter.begin(BH1750::ONE_TIME_LOW_RES_MODE);
  Wire.begin(); //INICIALIZA O I2C BUS
  dht.begin(); 
//  lightMeter.begin();
}
 
 void loop()
{
  int humidade;
  float humidade_ar;
  float temp;
  int controle;
  float luz;

  humidade = hidrometro();
  humidade_ar = DHT22_humidade();
  temp = DHT22_tempe();
  luz = BH1750_luz();
  engine_controler(humidade, 100, 10);
  Serial.print("|\n");
  Serial.print(humidade);
  Serial.print("\n");
  Serial.print(humidade_ar);//umidade ar
  Serial.print("\n");
  Serial.print(temp);//temp
  Serial.print("\n");
  Serial.print(luz);//luz
  Serial.print("\n");
  controle = Serial.readString().toInt();
  if(controle == 1){
    digitalWrite(LED_BUILTIN, HIGH);
    Serial.print("Motor ligado\n");
  }
   else{
    digitalWrite(LED_BUILTIN, LOW);
    Serial.print("Motor desligado\n");
   }
   
  delay(10000);
  
}

void engine_controler(int humidade, int limite_superior, int limite_inferior)
{
   if(humidade >= limite_inferior && humidade < limite_superior){
      digitalWrite(Motor, HIGH);   
   }
   digitalWrite(13, LOW); 
}

int hidrometro(){
  int valor_analogico = analogRead(pino_hidrometro);
//   Serial.print(valor_analogico);
//   Serial.print("\n");
  valor_analogico = 1023 - valor_analogico;
//  Serial.print(valor_analogico);
//   Serial.print("\n");
  valor_analogico = valor_analogico*100;
  valor_analogico = valor_analogico/1024;
//  Serial.print(valor_analogico);
//   Serial.print("\n");
  return(valor_analogico);
}

float DHT22_humidade(){
  float hum = dht.readHumidity();
  return(hum);
}

int DHT22_tempe(){
  float temp = dht.readTemperature();
  return(temp);
}

float BH1750_luz(){
//  float lux = lightMeter.readLightLevel();
  double lux= 50.0;
  if(lux <0){
    return 0;
  }
  return(lux);
}
