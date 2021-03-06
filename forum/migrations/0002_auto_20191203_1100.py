# Generated by Django 2.2.6 on 2019-12-03 04:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('forum', '0001_initial'),
        ('giasu', '0001_initial'),
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='question',
            name='topic',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='giasu.Course', verbose_name='Chủ đề'),
        ),
        migrations.AddField(
            model_name='question',
            name='user',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='accounts.Profile', verbose_name='Tạo bởi'),
        ),
        migrations.AddField(
            model_name='discussion',
            name='dis_super',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='forum.Discussion'),
        ),
        migrations.AddField(
            model_name='discussion',
            name='question',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='discuss', to='forum.Question', verbose_name='Câu hỏi thảo luận'),
        ),
    ]
