from django.db import models

class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

class Measure(models.Model):
	origin = models.CharField(max_length=20, default="")
	last_update = models.DateTimeField('last update', default='2010')
	value = models.FloatField(default=25)

	def __str__(self):
		last_update = self.last_update.strftime('%X')
		return f'[%s] %s = %d' % (last_update, self.origin, self.value)

class Threshold(models.Model):
	origin = models.CharField(max_length=20, default="")
	last_update = models.DateTimeField('last update', default='2010')
	min_value = models.FloatField(default=25)
	max_value = models.FloatField(default=25)

	def __str__(self):
		last_update = self.last_update.strftime('%X')
		return f'[%s] %s = (%d, %d)' % \
			(last_update, self.origin, self.min_value, self.max_value)
