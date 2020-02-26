from django import forms
from ..models import Lesson

class LessonForm(forms.ModelForm):
    class Meta:
        model = Lesson
        fields = '__all__'

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})
        self.fields['lesson_status'].widget.attrs.update({'class': ''})
        self.fields['lesson_image'].widget.attrs.update({'class': ''})
        self.fields['lesson_doc'].widget.attrs.update({'class': ''})
