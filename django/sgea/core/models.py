from django.db import models
from django.contrib.auth.models import User
class Institution(models.Model):
    name = models.CharField(max_length=120)
    phone = models.CharField(max_length=30, blank=True)
    def __str__(self): return self.name
class Location(models.Model):
    name = models.CharField(max_length=120)
    address = models.CharField(max_length=200, blank=True)
    def __str__(self): return self.name
class UserProfile(models.Model):
    ROLE_CHOICES = [('student','student'),('teacher','teacher'),('organizer','organizer'),('admin','admin')]
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    role = models.CharField(max_length=20, choices=ROLE_CHOICES, default='student')
    institution = models.ForeignKey(Institution, on_delete=models.SET_NULL, null=True, blank=True)
    def __str__(self): return self.user.get_full_name() or self.user.username
class Event(models.Model):
    KIND_CHOICES = [('seminar','seminar'),('lecture','lecture'),('course','course'),('week','week')]
    title = models.CharField(max_length=160)
    kind = models.CharField(max_length=20, choices=KIND_CHOICES)
    starts_at = models.DateTimeField()
    ends_at = models.DateTimeField()
    place = models.ForeignKey(Location, on_delete=models.PROTECT)
    capacity = models.PositiveIntegerField(default=0)
    organizer = models.ForeignKey(User, on_delete=models.PROTECT, related_name='organized_events')
    def __str__(self): return self.title
class Enrollment(models.Model):
    STATUS_CHOICES = [('pending','pending'),('confirmed','confirmed'),('canceled','canceled')]
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    event = models.ForeignKey(Event, on_delete=models.CASCADE)
    status = models.CharField(max_length=12, choices=STATUS_CHOICES, default='confirmed')
    class Meta: unique_together = ('user','event')
class Certificate(models.Model):
    enrollment = models.OneToOneField(Enrollment, on_delete=models.CASCADE)
    code = models.CharField(max_length=40, unique=True)
    issued_at = models.DateTimeField(auto_now_add=True)