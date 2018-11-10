from django.contrib import admin
from django.apps import apps
from django import forms
from mptt.admin import MPTTModelAdmin, DraggableMPTTAdmin
#from mptt.forms import TreeNodeChoiceField, TreeNodeMultipleChoiceField
from .mpttsnippets.MPTTModel import MPTTFilteredSelectMultiple, MPTTModelMultipleChoiceField

# Register your models here.
from .models import *

class AdapteAUneClasseDeNiveauInline(admin.TabularInline):
    model = AdapteAUneClasseDeNiveau
    fields = ('diff', 'cla', 'duree')
    extra = 1

class QuestionCompetenceInline(admin.TabularInline):
    model = QuestionCompetence
    extra = 1
    
class QuestionConnaissanceInline(admin.TabularInline):
    model = QuestionConnaissance
    extra = 1
    
class RedigeDansInline(admin.TabularInline):
    model = RedigeDans
    fields = ('bib', 'page', 'prenote', 'postnote')
    extra = 1

class ImagesInline(admin.TabularInline):
    model = ImagesAssociees
    extra = 1

class TEnonceAdminModelForm(forms.ModelForm):
    eno_classification = MPTTModelMultipleChoiceField(
                    TSujetClassification.objects.all(),
                    widget = MPTTFilteredSelectMultiple("Sujets",False,attrs={'rows':'10'})
                )
    eno_evalue = MPTTModelMultipleChoiceField(
                    TSujetClassification.objects.all(),
                    widget = MPTTFilteredSelectMultiple("Sujets évalués",False,attrs={'rows':'10'})
                )
    eno_ens = MPTTModelMultipleChoiceField(
                    TEnsemble.objects.all(),
                    widget = MPTTFilteredSelectMultiple("regroupements",False,attrs={'rows':'10'})
                )
    class Meta:
        model= TEnonce
        fields = '__all__'
    
class TEnonceAdmin(admin.ModelAdmin):
    form = TEnonceAdminModelForm
    fieldsets = (
        (None, {
            'fields': ('eno_titre', 
                'eno_latex', 
                'eno_nombre_questions',
                ('eno_qcm_bool', 'eno_aleatoire_bool', 'eno_lua_bool','eno_python_bool'),
                'eno_cor',)
        }),
        ('Type de l\'exercice ', {
            'fields': ('eno_type',),
        }),
        ('Compétences utilisées', {
            'fields': ('eno_comp',),
        }),
        ('Thèmes utilisés', {
            'fields': ('eno_classification',),
        }),
        ('Connaissances évaluées', {
            'fields': ('eno_evalue',),
        }),
        ('Variantes de cet exercice', {
            'fields': ('eno_variantes',),
        }),
        ('Regroupement des exercices', {
            'fields': ('eno_ens',),
        }),
        
    )
    filter_horizontal = ['eno_classification', 'eno_ens', 'eno_type', 'eno_comp', 'eno_evalue', 'eno_variantes']
    inlines = (ImagesInline, AdapteAUneClasseDeNiveauInline,
                RedigeDansInline,
                QuestionCompetenceInline,
                QuestionCompetenceInline,
                )
                
class SeTrouveDansInline(admin.TabularInline):
    model = SeTrouveDans
    fields = ('bib', 'page', 'prenote', 'postnote')
    extra = 1

class TCorrectionAdmin(admin.ModelAdmin):
    model= TCorrection
    fields = ('cor_latex', 
             ('cor_qcm_bool', 'cor_aleatoire_bool', 'cor_lua_bool','cor_python_bool'),
             )
    inlines = (SeTrouveDansInline,
              )
              
class TBibliographieAdmin(DraggableMPTTAdmin):
    model= TBibliographie
    fieldsets = (
        (None, {
            'fields': ('bib_titre', 
                        'bib_sous_titre',
                    )
        }),
        ('Auteurs ', {
            'fields': ('bib_aut_id',),
        }),
        ('Edition ', {
            'fields': ('bib_edi',
                        'bib_isbn',
                        'bib_url',
                        'bib_annee',
                        )
        }),
        ('Arborescence ', {
            'fields': ('parent',),
        }),
        ('Biblatex (respecter l\'arborescence ! )', {
            'fields': ('bib_biblatex',),
        }),
    )
    filter_horizontal = ['bib_aut_id',] 
    
class TImagesAdmin(admin.ModelAdmin):
    model= TImages
    fields = ('ima_titre', 'ima_file', 'ima_filename', 'ima_thumbUrl', 'ima_hash', 'md5sum', )
    readonly_fields = ('image_tag', 'ima_thumbUrl', 'ima_hash', 'md5sum',)

app = apps.get_app_config('monSite')
for model_name, model in app.models.items():
     #if (model != TEnonce) and (model != TSujetClassification) and (model != EnRapport) and (model != TBibliographie): 
     if (model not in [TEnonce, TCorrection, TBibliographie, TImages, TSujetClassification, TEnsemble]):
     #and (model != TDifficulte) and (model != TBoClasse):
         admin.site.register(model)
         
admin.site.register(TEnonce, TEnonceAdmin)
admin.site.register(TCorrection, TCorrectionAdmin)
admin.site.register(TImages, TImagesAdmin)
#admin.site.register(TSujetClassification, MPTTModelAdmin)
admin.site.register(TSujetClassification, DraggableMPTTAdmin)
admin.site.register(TBibliographie, TBibliographieAdmin)
admin.site.register(TEnsemble, DraggableMPTTAdmin)