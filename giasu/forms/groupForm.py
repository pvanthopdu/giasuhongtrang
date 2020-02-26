from django import forms
from django.apps import apps
from ..models import Student_Group
from django.contrib.auth.models import Group
from ..models import Course


class CustomGroupForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        self.course = kwargs.pop('course', None)
        super().__init__(*args, **kwargs)

        self.fields['belong_course'].initial = self.course
        self.fields['member'] = forms.ModelMultipleChoiceField(
            required=False,
            queryset=self.course.course_students,
            widget=forms.CheckboxSelectMultiple)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})
        self.fields['member'].widget.attrs.update({'class': ''})
        self.fields['belong_course'].widget.attrs.update({'hidden': ''})

    class Meta:
        model = Student_Group
        fields= ['belong_course', 'member']
        exclude = ['group', 'created_by']

class GroupForm(forms.ModelForm):
    class Meta:
        model = Group
        fields= '__all__'

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})
        self.fields['name'].widget.attrs.update(
            {'placeholder': 'Nhập tên nhóm. Tên nhóm không được trùng với tên nhóm đã có.'})





