from django.urls import path

from . import views


urlpatterns = [
    path('', 							views.index,	name='index'),
    path('measure/<slug:measure_name>', views.measure, 	name='a')
]