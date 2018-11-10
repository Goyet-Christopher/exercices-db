from django.shortcuts import render, redirect
from django.db import transaction
#from django.core.exceptions import ValidationError, ObjectDoesNotExist
from django.http import JsonResponse
#from django.core import serializers
from PIL import Image
import imagehash
#from django.conf import settings
#from django.forms import formset_factory, modelformset_factory
from .forms import *
from .models import *

# def get_or_none(classmodel, **kwargs):
#     try:
#         return classmodel.objects.get(**kwargs)
#     except classmodel.ObjectDoesNotExist:
#         return None

# Create your views here.
    
def saveEnonce(request, eno_form, cor_form):
    print("request.POST :", request.POST)
    print("form.cleaned_data: "+str(eno_form.cleaned_data))
    # Itération du formset pour afficher les données 
    eno = eno_form.save(commit=False)
    cor_instance = cor_form.save(commit=False)
    if eno_form.cleaned_data['cor_add'] == True:
        print("cor_instance: "+str(cor_instance))
        if eno_form.cleaned_data['cor_new'] == "True":
            cor_instance.cor_qcm_bool=eno.eno_qcm_bool
            cor_instance.cor_aleatoire_bool=eno.eno_aleatoire_bool
            cor_instance.cor_lua_bool=eno.eno_lua_bool
            cor_instance.cor_python_bool=eno.eno_python_bool
            cor_instance.save()
            eno.eno_cor = cor_instance
            eno_form.fields['eno_cor'] = cor_instance
        else:
            eno.eno_cor = eno_form.cleaned_data['eno_cor']
    eno.save()
    for ens_id in eno_form.cleaned_data['eno_ens'].all():
        AppartientA.objects.create(ens = ens_id, eno = eno)
#     for type_id in eno_form.cleaned_data['eno_type'].all():
#         EstDuType.objects.create(typ = type_id, eno = eno)
#     for comp_id in eno_form.cleaned_data['eno_comp'].all():
#         Travaille.objects.create(comp = comp_id, eno = eno) 
#     for suj_id in eno_form.cleaned_data['eno_classification'].all():
#         EnRapport.objects.create(suj = suj_id, eno = eno) 
#     for suj_id in eno_form.cleaned_data['eno_evalue'].all():
#         Evalue.objects.create(suj = suj_id, eno = eno)
#     for var_id in eno_form.cleaned_data['eno_variantes'].all():
#         SeDeclineEn.objects.create(var = var_id, eno = eno)  
    #for instance in imaSet:
    #    instance.save()
        #if instance.cleaned_data != {}:
            ##imageForm = instance.save(commit=False)
            #niveauForm.eno = eno
#    imaSet.save()
#     images = imaSet.save(commit=False)
#     for instance in images:
#         instance.save()
#    difficSet.save()    
#     for instance in difficSet:
#         if instance.cleaned_data != {}:
#             niveauForm = instance.save(commit=False)
#             if (niveauForm.duree is None):
#                 raise ValidationError(('Le champs durée (difficulté) est obligatoire.'))
#             niveauForm.eno = eno
#             niveauForm.save()
#    biblioSet.save()
#     for instance in biblioSet:
#         if instance.cleaned_data != {}:
#             redigeDansForm = instance.save(commit=False)
#             redigeDansForm.eno = eno
#             redigeDansForm.save()
    return True, eno

def render_all(request, list):
    # Quoiqu'il arrive, on affiche la page du formulaire.
    return render(request, 'monSite/formulaire.html', list)
    
def post(request, eno_instance):
    print("request.POST: "+str(request.POST))
    # Récupération du formulaire géré par le mécanisme formset
    eno_form = EnonceForm(request.POST, instance=eno_instance)
    if isinstance(eno_instance.eno_cor, TCorrection):
        #print("isinstance : OK")
        cor_instance = TCorrection.objects.get(cor_id=eno_instance.eno_cor.cor_id)
        cor_form = CorrectionEditForm(request.POST, instance=cor_instance, prefix='correction')
        #print('cor_form : '+str(cor_form.data))
    else:
        #print("isinstance : NON")
        cor_form = CorrectionEditForm(request.POST, prefix='correction')
    imagesJoiture_formset = ImagesJoitureForm(request.POST, instance=eno_instance, prefix='imageJoint') 
    image_formset = ImagesAssocieesForm(request.POST, request.FILES, prefix='upimage')
    difficulte_formset = AdapteAUneClasseDeNiveauForm(request.POST, instance=eno_instance, prefix='difficulte')
    biblio_formset = BiblioForm(request.POST,instance=eno_instance, prefix='biblio')
    # Nous vérifions que les données envoyées sont valides
    # Cette méthode renvoie False s'il n'y a pas de données 
    # dans le formulaire ou qu'il contient des erreurs.
    if eno_form.is_valid() and cor_form.is_valid() : 
        if  difficulte_formset.is_valid() and biblio_formset.is_valid() :
            if imagesJoiture_formset.is_valid() and image_formset.is_valid() :
            # Ne pas modifier la db avant la fin
            #with transaction.atomic():
                resultat, eno_instance = saveEnonce(request, eno_form, cor_form)
                imagesJoiture_formset.save()
                difficulte_formset.save()
                biblio_formset.save()
                return redirect('edit',eno_id=eno_instance.eno_id)
            else:
                print("ERROR: ")
                print(str( image_formset.errors ))
                print(str( imagesJoiture_formset.errors ))
                resultat = False
        else:
            print("ERROR: ")
            print(str( difficulte_formset.errors ))
            print(str( biblio_formset.errors ))
            resultat = False
    else:
        print("ERROR: ")
        print(str( cor_form.errors ))
        print(str( eno_form.errors ))
        resultat = False
    # Quoiqu'il arrive, on affiche la page du formulaire.
    return render_all(request, locals())

def get_or_none(request, eno_instance):
    resultat = False
    eno_form = EnonceForm(None, instance=eno_instance)
    #suj_form = EnonceSujet(instance=eno_instance, prefix='sujetsEnRapport')
    #comp_form = EnonceComp(None)
    #image_form = ImageForm(None)
    imagesJoiture_formset = ImagesJoitureForm(instance=eno_instance, 
                                            #queryset=ImagesAssociees.objects.filter(eno_id=eno_instance.eno_id), 
                                            prefix='imageJoint') 
    image_formset = ImagesAssocieesForm(None, None, queryset=TImages.objects.none(), prefix='upimage')
    cor_form = CorrectionEditForm(None, instance=eno_instance.eno_cor, prefix='correction')
    difficulte_formset = AdapteAUneClasseDeNiveauForm(instance=eno_instance, prefix='difficulte')
    #difficulte_formset = difficulteForm(None, queryset=AdapteAUneClasseDeNiveau.objects.none(), prefix='difficulte')
    biblio_formset = BiblioForm(instance=eno_instance, prefix='biblio')
    # Quoiqu'il arrive, on affiche la page du formulaire.
    return render_all(request, locals())
    #return render(request, 'monSite/formulaire.html', locals())
    
    
def formulaire(request, eno_id=None): 
    if eno_id != None:
        eno_instance = TEnonce.objects.get(eno_id=eno_id)
    else:
        eno_instance = TEnonce()
    if request.method == 'POST':
        return post(request, eno_instance)
    else:
        return get_or_none(request, eno_instance)
    
def uploadimage(request):
    print("request : ", request)
    print("POST : ", request.POST)
    print("FILES :", request.FILES)
    if request.method == 'POST':
        form = ImageForm(request.POST, request.FILES)
        if form.is_valid():
#           photo = TImages()
#           print(str(form.ima_file))
#           photo = form.save()
            photo = form.save(commit=False)
            image = Image.open(photo.ima_file)
            photo.ima_hash = str(imagehash.dhash(image))
            if (request.POST["force"] == "true"):
                #pas de recherche dans la db
                querySet = []; 
            else:
                #query = 'SELECT IMA_ID, IMA_THUMBURL, BIT_COUNT(%s ^ IMA_HASH) as hd from T_IMAGES WHERE BIT_COUNT(%s ^ IMA_HASH)<7 ORDER BY hd ASC'
                #SELECT pk, hash, BIT_COUNT(CONV(hash, 16, 10) ^ CONV('c6474d2584040404', 16, 10)) as hamming_distance
                #FROM image_hashes HAVING hamming_distance < 4 ORDER BY hamming_distance ASC;
                #querySet = TImages.objects.raw(query, [photo.ima_hash, photo.ima_hash])
                #print("serialize: "+serializers.serialize('json', querySet, fields=('ima_id', 'ima_thumbUrl')))
                querySet = TImages.objects.filter(ima_hash=photo.ima_hash)
            if (len(querySet) == 0):
                photo.ima_titre = photo.ima_file.name
                photo.ima_filename = photo.ima_file.name
                photo.ima_thumbUrl = photo.ima_thumbnail.url
                photo.save()             
                data = {'is_valid': True, 
                        'id': photo.ima_id,
                        'titre':photo.ima_titre,
                        'name': photo.ima_filename, 
                        'url': photo.ima_thumbUrl, 
                        'target': request.POST['target']
                        }
                print(str(data))
            else:
                #print(querySet.values("ima_thumbUrl"))
                data = {'is_valid': False, 
                        'similars': True,
                        'target': request.POST['target'],
                        'closeIma' : list(querySet.values_list('ima_id', 'ima_thumbUrl', 'ima_filename'))
                        }
        else:
            data = {'is_valid': False, 'similars': False}
            print(str(data))
        return JsonResponse(data)
