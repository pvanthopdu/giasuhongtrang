from django import forms
from ..models import Question

class QuestionForm(forms.ModelForm):
    class  Meta:
        model= Question
        fields = ['topic','content','user']
        exclude = ['status', 'time', 'view', 'like']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})
        self.fields['user'].widget.attrs.update({'hidden': ''})
        self.fields['content'].widget.attrs.update({'required': 'required'})