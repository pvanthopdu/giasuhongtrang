# Generated by Django 2.2.6 on 2019-12-31 08:25

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('giasu', '0010_auto_20191231_1447'),
    ]

    operations = [
        migrations.AlterField(
            model_name='calendar_group',
            name='day',
            field=models.DateField(default=datetime.datetime(2019, 12, 31, 15, 25, 33, 673485), verbose_name='Ngày học'),
        ),
    ]
