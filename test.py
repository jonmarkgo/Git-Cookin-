import datetime

from django.conf import settings

from djangogcal.adapter import CalendarAdapter, CalendarEventData
from djangogcal.observer import CalendarObserver

from django.contrib.auth.models import User

class ShowingCalendarAdapter(CalendarAdapter):
    """
    A calendar adapter for the Showing model.
    """

    def get_event_data(self, instance):
        """
        Returns a CalendarEventData object filled with data from the adaptee.
        """
        return CalendarEventData(
            start=instance.start_time,
            end=instance.end_time,
            title=instance.title
        )
observer = CalendarObserver(email='bgleitzman@gmail.com',
                            password='kPants1492')
observer.observe(User, ShowingCalendarAdapter())
