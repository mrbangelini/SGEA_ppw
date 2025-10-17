from django.contrib import admin
from .models import Institution, Location, UserProfile, Event, Enrollment, Certificate
admin.site.register(Institution)
admin.site.register(Location)
admin.site.register(UserProfile)
admin.site.register(Event)
admin.site.register(Enrollment)
admin.site.register(Certificate)