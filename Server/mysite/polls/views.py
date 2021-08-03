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

#def get_temp, get_umid_ar, get_umid_solo(), get_luz():
def status(req, measure_name):
	if req.method == 'GET':	
		return get_status(req, measure_name)
	elif req.method == 'POST':	
		return set_status(req, measure_name)
	else:	
		return HttpResponse("Esta URL só aceita POST e GET requests")


def get_status(req, measure_name):
	
	Measure.objects.filter(last_update__gt='2021-08-01') # Aug 1st

	# methods = {
	# 	'temp': ,
	# 	'umid_ar': ,
	# 	'umid_solo': ,
	# 	'luz': ,
	# }

	return HttpResponse("Success")

def set_status(req, measure_name):

	value = req.POST['value']
	origin = measure_name
	today = datetime.datetime.now()

	m = Measure(value=value, origin=origin, last_update=today)
	m.save()

	# methods = {
	# 	'temp': ,
	# 	'umid_ar': ,
	# 	'umid_solo': ,
	# 	'luz': ,
	# }

	return HttpResponse(value)