from django.http import HttpResponse, JsonResponse
from django.shortcuts import get_object_or_404
from django.template import loader

from .models import *

import datetime
import json

def index(request):
	if request.method == 'GET':
		return HttpResponse("Voce fez um get para esta URL")
	elif request.method == 'POST':
		args = request.POST
		response = HttpResponse("Recebido: %s" % args)
		try:
			value = request.COOKIES['cookie_name']
		except KeyError:
		# Cookie is not set
			response.set_cookie('cookie_name', 'cookie_value')
		
		return response

	return HttpResponse("Hello, world. You're at the polls index.")

GERAL = 'geral'

# set, por questoes de desempenho
valid_names = {'temp', 'umid_ar', 'umid_solo', 'luz'} 

class Controller():
	def __init__(self, req, name, model):
		self.req = req
		self.model = model

		if name == GERAL: # pega todos os valores de uma vez
			self.names = valid_names
		else:
			self.names = { name }

	def getter(self):
		d = {}
		for name in self.names:
			kwargs = {
				'last_update__gt': '2021-08-01',
				'origin__iexact': name,
			}	

			ms = self.model.objects.filter(**kwargs) # Aug 1st
			d[name] = [m.value for m in ms]

		template = loader.get_template('polls/index.html')
		context = {
		 	'query_data': d,
		}
		print(context)
		response = JsonResponse(d)
		print(response.content)

		return response#HttpResponse(template.render(context, self.req))

	def setter(self):
		body = self.req.body
		body = body.decode('utf-8')
		values = json.loads(body)
		values = json.loads(values)

		today = datetime.datetime.now()

		l = []
		
		for key in values: # dicionario
			origin = key
			value = values[key]

			m = self.model(value=value, origin=origin, last_update=today)
			m.save()
			l.append(m.value)

		return HttpResponse(str(l))

	def handle(self):
		if not set(self.names).issubset( valid_names.union({GERAL}) ):
			return HttpResponse("Parametro invalido requerido: %s" % self.names)

		if self.req.method == 'GET':	
			return self.getter()
		elif self.req.method == 'POST':	
			return self.setter()
		else:	
			return HttpResponse("Esta URL só aceita POST e GET requests")

	

def measure(req, measure_name):
	c = Controller(req, measure_name, Measure)
	return c.handle()

def threshold(req, measure_name):
	c = Controller(req, measure_name, Threshold)
	return c.handle()