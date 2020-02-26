from django import forms
from ..models import Calendar_Group

class CalendarGroupForm(forms.ModelForm):
    def __init__(self, member, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control',
                                                    'required': 'required'})
        self.fields['users_impled'] = forms.ModelMultipleChoiceField(
            required=False,
            queryset=member,
            widget=forms.CheckboxSelectMultiple)

    class Meta:
        model = Calendar_Group
        fields = '__all__'
        exclude = ('note',)
        widgets = {
            'day': forms.DateInput(attrs={'type': 'date'}),
            'start_time': forms.TimeInput(attrs={'type': 'time'}),
            'end_time': forms.TimeInput(attrs={'type': 'time'})
        }


