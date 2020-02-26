import calendar
import datetime
from .models import Calendar_Group


class Calendar(calendar.HTMLCalendar):
    def __init__(self, year = None, month = None, schedules=None, authentication = False):
        self.schedules = schedules
        self.month = month
        self.year = year
        self.authen = authentication
        super(Calendar, self).__init__()

        self.previous_month = datetime.date(year=self.year, month=self.month, day=1)  # find first day of current month
        self.previous_month = self.previous_month - datetime.timedelta(days=1)  # backs up a single day
        self.previous_month = datetime.date(year=self.previous_month.year, month=self.previous_month.month,
                                       day=1)  # find first day of previous month

        last_day = calendar.monthrange(self.year, self.month)
        self.next_month = datetime.date(year=self.year, month=self.month, day=last_day[1])  # find last day of current month
        self.next_month = self.next_month + datetime.timedelta(days=1)  # forward a single day
        self.next_month = datetime.date(year=self.next_month.year, month=self.next_month.month,
                                   day=1)  # find first day of next month

    def formatday(self, day, weekday, schedules):
        """
        Return a day as a table cell.
        """
        dayselect = day if day>0 else 1
        dayselect = datetime.date(year=self.year, month= self.month, day=dayselect)
        schedules_from_day = schedules.filter(day__day=day)
        schedules_html = "<ul>"
        for schedule in schedules_from_day:
            schedules_html += schedule.get_absolute_urlfrontend() + "<br/>"
        schedules_html += "</ul>"
        today = datetime.datetime.today()
        btn_add = '<a class="add-calendar" data-toggle="modal" data-target="#add-calendar" data-key="'+str(dayselect)+'">' \
                  '<i class="far fa-plus-square"></i></a>' if self.authen else ''
        option = '<div class="d-flex header-day">' \
                    '<div class="mr-auto">' + str(day) + '</div>' \
                    +btn_add+ \
                 '</div>'

        if day == 0:
            return '<td class="noday">&nbsp;</td>'  # day outside month
        elif today.day == day and self.month == today.month and self.year == today.year:
            return '<td class="%s current">%s%s</td>' % (self.cssclasses[weekday], option, schedules_html)
        else:
            return '<td class="%s">%s%s</td>' % (self.cssclasses[weekday], option, schedules_html)


    def formatweek(self, theweek, schedules):
        """
        Return a complete week as a table row.
        """
        s = ''.join(self.formatday(d, wd, schedules) for (d, wd) in theweek)
        return '<tr>%s</tr>' % s

    def formatweekheader(self):
        """
        Return a header for a week as a table row.
        """
        s = ''.join(self.formatweekday(i) for i in self.iterweekdays())
        return '<tr class="weekheader">%s</tr>' % s

    def formatmonthname(self, withyear=True):
        """
        Return a month name as a table row.
        """
        strmonth = str(self.month) if self.month >= 10 else ('0'+str(self.month))
        month_year = strmonth+'-'+str(self.year)
        return '<div class="card-header contact_info_title d-flex">' \
               '<i class="far fa-calendar-alt align-self-center"> '+month_year+'</i>' \
               '<div class="ml-auto">' \
                    '<a href="?month='+str(self.previous_month)+'" class="btn btn-warning mr-1"><i class="fas fa-angle-left"></i></a>'\
                    '<a href="?month='+str(self.next_month)+'" class="btn btn-warning"><i class="fas fa-angle-right"></i></a>'\
               '</div>'\
               '</div>'

    def formatmonth(self, withyear=True):
        """
        Return a formatted month as a table.
        """

        schedules = Calendar_Group.objects.filter(day__month=self.month)

        v = []
        a = v.append
        a(self.formatmonthname(withyear=withyear))
        a('\n')
        a('<div class="card-body table-responsive"><table class="table table-bordered" cellpadding="0" cellspacing="0">')
        a('\n')
        a(self.formatweekheader())
        a('\n')
        for week in self.monthdays2calendar(self.year, self.month):
            a(self.formatweek(week, schedules))
            a('\n')
        a('</table></div>')
        a('\n')
        return ''.join(v)
