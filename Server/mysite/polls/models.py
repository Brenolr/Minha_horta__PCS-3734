from django.db import models
#import time

class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

class Measure(models.Model):
	value = models.IntegerField(default=25)
	origin = models.CharField(max_length=20, default="")
	last_update = models.DateTimeField('last update')

	def __str__(self):
		last_update = self.last_update.strftime('%X')
		return f'[%s] %s = %d' % (last_update, self.origin, self.value)

class Threshold(Measure):
	pass
	