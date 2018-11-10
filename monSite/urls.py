from django.urls import path
from django.conf.urls import url
from . import views

urlpatterns = [
    
    path('uploadimage/', views.uploadimage, name='upload_image_addr'),
    path('enonce/ajouter', views.formulaire, name='ajouter'),
    path('enonce/<int:eno_id>/edit/', views.formulaire, name='edit'),
]