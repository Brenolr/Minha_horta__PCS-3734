#include <DHT.h>;
#include <BH1750.h>
#include <Wire.h>

#define pino_hidrometro A0
#define Motor 8
#define DHTPIN 7 //PINO DIGITAL UTILIZADO PELO DHT22
#define DHTTYPE DHT22 //DEFINE O MODELO DO SENSOR (DHT22 / AM2302)

DHT dht(DHTPIN, DHTTYPE);

void setup()
{
  pinMode(Motor, OUTPUT);
  Serial.begin(115200);
  Wire.begin(); //INICIALIZA O I2C BUS
  dht.begin(); 
//  lightMeter.begin();
}
 
 void loop()
{
  int humidade;
  float humidade_ar;
  float temp;
  humidade = hidrometro();
  humidade_ar = DHT22_humidade();
  temp = DHT22_tempe();
  engine_controler(humidade, 100, 10);
  Serial.print("|\n");
  Serial.print(humidade);
  Serial.print("\n");
  Serial.print(humidade_ar);
  Serial.print("\n");
  Serial.print(temp);
  Serial.print("\n");
  Serial.print("45.0");
  Serial.print("\n");
  delay(5000);
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

//float BH1750_luz(){
//  float lux = lightMeter.readLightLevel();
//  return(lux);
//}
