from django.http import HttpResponse

def index(request):
	if request.method == 'GET':
		return HttpResponse("Batatinha quando nasce")
	elif request.method == 'POST':
		return HttpResponse("Recebido: ", request.POST)

	return HttpResponse("Hello, world. You're at the polls index.")