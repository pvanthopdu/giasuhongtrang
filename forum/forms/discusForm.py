from django import forms
from ..models import Discussion

class DiscussForm(forms.ModelForm):
    class  Meta:
        model= Discussion
        fields = ['question','dis_content','image', 'curiculum', 'dis_user']
        exclude = ['dis_super', 'time', 'view', 'like']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})
        self.fields['question'].widget.attrs.update({'hidden': ''})
        self.fields['dis_user'].widget.attrs.update({'hidden': ''})
        self.fields['dis_content'].widget.attrs.update({'required': 'required'})