from django.http import HttpResponse

from .models import *

from django.shortcuts import get_object_or_404

import datetime

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

valid_names = {'temp', 'umid_ar', 'umid_solo', 'luz'} # set, por questoes de desempenho

class Controller():
	def __init__(self, req, name, model):
		self.req = req
		self.name = name
		self.model = model

	def getter(self):

		kwargs = {
			'last_update__gt': '2021-08-01',
			'origin__iexact': self.name,
		}	

		ms = self.model.objects.filter(**kwargs) # Aug 1st
		l = [m.value for m in ms]
		return HttpResponse("Success : %s" % l)

	def setter(self):

		value = self.self.req.POST['value']
		origin = self.name
		today = datetime.datetime.now()

		m = self.model(value=value, origin=origin, last_update=today)
		m.save()

		return HttpResponse(value)

	def handle(self):
		if self.name not in valid_names:
			return HttpResponse("Parametro invalido requerido")

		if self.req.method == 'GET':	
			return self.getter()
		elif self.req.mecookie_valuethod == 'POST':	
			return self.setter()
		else:	
			return HttpResponse("Esta URL só aceita POST e GET requests")

	

def measure(req, measure_name):
	c = Controller(req, measure_name, Measure)
	return c.handle()

def threshold(req, measure_name):
	c = Controller(req, measure_name, Threshold)
	return c.handle()