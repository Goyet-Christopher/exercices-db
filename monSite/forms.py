from django import forms
from django.forms import formset_factory, modelformset_factory, inlineformset_factory
from mptt.forms import TreeNodeChoiceField, TreeNodeMultipleChoiceField
from .mpttsnippets.MPTTModel import MPTTFilteredSelectMultiple, MPTTModelMultipleChoiceField
from django.contrib.admin.widgets import FilteredSelectMultiple
from .models import * 

Corr_CHOICES = (("True", 'A Rédiger'), ("False", 'Déjà rédigé'))

class EnonceForm(forms.ModelForm):
    cor_add = forms.BooleanField(label="Avec correction ?", required=False)
    cor_new = forms.ChoiceField(choices=Corr_CHOICES, initial="True", widget=forms.RadioSelect())
    eno_comp = forms.ModelMultipleChoiceField(queryset=TCompetences.objects.all(),
                                              label=('Compétences'),
                                              widget=FilteredSelectMultiple(('Compétences'),False,)
                                              )                                        
    eno_ens = MPTTModelMultipleChoiceField(
                    TEnsemble.objects.all(),
                    widget = MPTTFilteredSelectMultiple("regroupements",False,attrs={'rows':'10'})
                )
#     class Media:
#        js = ('/static/admin/js/jsi18n.js',)
    class Meta:
        model = TEnonce
        fields = ('eno_titre', 'eno_latex', 'eno_nombre_questions',
                'eno_qcm_bool', 'eno_aleatoire_bool', 'eno_lua_bool','eno_python_bool',
                'eno_cor', 'eno_type', 'eno_comp', 'eno_variantes', 'eno_ens',
                )
        
    def latex_fields(self):
        return [field for field in self if not field.is_hidden
               and field.name in ('eno_titre', 'eno_latex')]

    def boolean_fields(self):
        return [field for field in self if not field.is_hidden
               and field.name in ('eno_qcm_bool', 'eno_aleatoire_bool', 'eno_lua_bool', 'eno_python_bool')] 
    def correction_fields(self):
        return [field for field in self if not field.is_hidden
               and field.name in ('cor_add', 'cor_new', 'eno_cor')]
    def others_fields(self):
        return [field for field in self if not field.is_hidden
               and field.name in ('eno_type', 'eno_comp', 'eno_variantes', 'eno_ens')]

class CorrectionEditForm(forms.ModelForm):
    class Meta:
        model = TCorrection
        fields = ('cor_latex',)

class ImageForm(forms.ModelForm):
    class Meta:
        model = TImages
        fields = ('ima_file',)
    def __init__(self, *args, **kwargs):
        super(ImageForm, self).__init__(*args, **kwargs)
        self.fields['ima_file'].required = False
        self.fields['ima_file'].widget.attrs\
            .update({
                'class': 'picture'
            })

class EnonceImagesForm(forms.ModelForm):
    class Meta:
        model = ImagesAssociees
        fields = ('ima_id',)

class EnonceDifficulteForm(forms.ModelForm):
    class Meta:
        model = AdapteAUneClasseDeNiveau
        fields = ('diff', 'cla', 'duree')
        
class EnonceBiblioForm(forms.ModelForm):
    class Meta:
        model = RedigeDans
        fields = ('bib', 'page', 'prenote', 'postnote')

# Création du formset avec une seule itération : extra=1
#ImagesAssocieesForm = inlineformset_factory(TEnonce, ImagesAssociees, fields = ('eno_id', 'ima_id'), extra=1)
ImagesJoitureForm = inlineformset_factory(TEnonce, ImagesAssociees, form=EnonceImagesForm, extra = 0)
ImagesAssocieesForm = modelformset_factory(TImages, form=ImageForm)
AdapteAUneClasseDeNiveauForm = inlineformset_factory(TEnonce, 
                                                    AdapteAUneClasseDeNiveau, 
                                                    #fk_name='eno', 
                                                    fields=('diff', 'cla', 'duree'), 
                                                    extra=1)
#BiblioForm = modelformset_factory(RedigeDans,form=EnonceBiblioForm)
BiblioForm = inlineformset_factory(TEnonce, RedigeDans, form=EnonceBiblioForm, extra=1)
