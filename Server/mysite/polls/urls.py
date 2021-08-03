from django.urls import path

from . import views


urlpatterns = [
    path('', 							views.index,	name='index'),
    path('status/<slug:measure_name>', views.status, 	name='a')
]