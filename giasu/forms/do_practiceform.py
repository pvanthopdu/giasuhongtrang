from django import forms
from ckeditor_uploader.fields import RichTextUploadingFormField

class Do_practiceForm(forms.Form):
    answer = RichTextUploadingFormField(config_name='answer')

