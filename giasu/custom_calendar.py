import calendar
from datetime import datetime
from .models import Calendar_Group


class CustomHTMLCal(calendar.HTMLCalendar):
    cssclasses = [style + " text-nowrap" for style in
                  calendar.HTMLCalendar.cssclasses]
    cssclass_month_head = "text-center text-month"
    cssclass_month = "text-center month"

    def __init__(self, schedules=None):
        super(CustomHTMLCal, self).__init__()
        self.schedules = schedules

    def formatday(self, day, weekday, schedules):
        """
        Return a day as a table cell.
        """
        schedules_from_day = schedules.filter(day__day=day)
        schedules_html = "<ul>"
        for schedule in schedules_from_day:
            schedules_html += schedule.get_absolute_url() + "<br/>"
        schedules_html += "</ul>"
        today = datetime.today()
        option = '<div class="d-flex header">' \
                 '<div class="mr-auto title-day">' + str(day) + '</div>' \
                 '<a href = "add" class="add-calendar"><i class="far fa-plus-square"></i></a></div>'

        if day == 0:
            return '<td class="noday">&nbsp;</td>'  # day outside month
        elif today.day == day:
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

    def formatmonth(self, theyear, themonth, withyear=True):
        """
        Return a formatted month as a table.
        """

        schedules = Calendar_Group.objects.filter(day__month=themonth)

        v = []
        a = v.append
        a('<div class="table-responsive"><table class="table table-bordered" cellpadding="0" cellspacing="0" class="month">')
        a('\n')
        a(self.formatmonthname(theyear, themonth, withyear=withyear))
        a('\n')
        a(self.formatweekheader())
        a('\n')
        for week in self.monthdays2calendar(theyear, themonth):
            a(self.formatweek(week, schedules))
            a('\n')
        a('</table></div>')
        a('\n')
        return ''.join(v)
