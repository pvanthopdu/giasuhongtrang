from django.core.mail import send_mail
from django.conf import settings
from django.template.loader import render_to_string

def send_mail_register(email_to, content):
    subject = "Notification: have user register enroll the course"
    msg_plain = render_to_string('giasu/email_plain.txt', content)
    msg_html = render_to_string('giasu/email_html.html', content)
    email_from = settings.EMAIL_HOST_USER
    send_mail(subject=subject, message=msg_plain, from_email=email_from,
              recipient_list= email_to, html_message=msg_html)