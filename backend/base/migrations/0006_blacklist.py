# Generated by Django 3.1.4 on 2022-09-01 04:03

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('base', '0005_auto_20220901_0230'),
    ]

    operations = [
        migrations.CreateModel(
            name='Blacklist',
            fields=[
                ('review', models.TextField(blank=True, null=True)),
                ('datetime', models.DateTimeField(blank=True, null=True)),
                ('product_id', models.TextField(blank=True, null=True)),
                ('_id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('score', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
