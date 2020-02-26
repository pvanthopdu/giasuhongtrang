from django import forms

from ..models import Course
from django.apps import apps

class CourseForm(forms.ModelForm):
    profileModel = apps.get_model('accounts', 'Profile')
    course_teachers = forms.ModelMultipleChoiceField(
        queryset=profileModel.objects.filter(role=2),
        widget=forms.CheckboxSelectMultiple,
        required=True
    )
    course_students = forms.ModelMultipleChoiceField(
        queryset = profileModel.objects.filter(role = 1),
        widget = forms.CheckboxSelectMultiple,
        required = False
    )
    class  Meta:
        model= Course
        fields = '__all__'

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})
        self.fields['course_status'].widget.attrs.update({'class': 'text-choice'})
        self.fields['course_teachers'].widget.attrs.update({'class': 'text-choice'})
        self.fields['course_students'].widget.attrs.update({'class': 'text-choice'})
        self.fields['course_target'].widget.attrs.update({'required': 'required'})
        self.fields['course_duration'].widget.attrs.update({'required': 'required'})
        self.fields['course_description'].widget.attrs.update({'required': 'required'})

        self.fields['course_name'].widget.attrs.update(
            {'placeholder': 'Enter name of course. This name is not duplicate in courses.'})

    # @transaction.atomic
    # def save(self):
    #     course = super().save(commit=False)
    #     course.course_teachers.add(self.cleaned_data.get('course_teachers'))
    #     course.save()
    #     return course

