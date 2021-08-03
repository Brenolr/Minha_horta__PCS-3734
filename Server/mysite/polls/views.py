from django.http import HttpResponse

def index(request):
	if request.method == 'GET':
		return HttpResponse("Batatinha quando nasce")
	elif request.method == 'POST':
		response = HttpResponse("Recebido: ", request.POST)
		try:
			value = request.COOKIES['cookie_name']
		except KeyError:
		# Cookie is not set
			response.set_cookie('cookie_name', 'cookie_value')
		
		return response

	return HttpResponse("Hello, world. You're at the polls index.")