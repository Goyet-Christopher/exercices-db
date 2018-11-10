from django.db import models
from mptt.models import MPTTModel, TreeForeignKey
from imagekit.models import ImageSpecField
from imagekit.processors import ResizeToFill
import hashlib
import os
from django.conf import settings
from django.core.files.storage import FileSystemStorage

class TEditeur(models.Model):
    edi_id = models.AutoField(db_column='EDI_ID', primary_key=True)  
    edi_nom = models.CharField(db_column='EDI_NOM', max_length=25)  
    edi_lieu = models.TextField(db_column='EDI_LIEU', blank=True, null=True)  

    class Meta:
        db_table = 'T_EDITEUR'
        verbose_name = "Table Editeur"
    def __str__(self):
        return self.edi_nom

class TAuteur(models.Model):
    aut_id = models.AutoField(db_column='AUT_ID', primary_key=True)  
    aut_nom = models.CharField(db_column='AUT_NOM', max_length=25, blank=False, null=False)  
    aut_prenom = models.CharField(db_column='AUT_PRENOM', max_length=25, blank=True, null=True)  
    
    class Meta:
        db_table = 'T_AUTEUR'
        verbose_name = "Table Auteur"
    def __str__(self):
        return self.aut_nom+ ", "+self.aut_prenom


class TBibliographie(MPTTModel):
    bib_id = models.AutoField(db_column='BIB_ID', primary_key=True)  
    bib_titre = models.CharField(db_column='BIB_TITRE', max_length=25)  
    bib_sous_titre = models.TextField(db_column='BIB_SOUS_TITRE', blank=True, null=True)  
    bib_isbn = models.BigIntegerField(db_column='BIB_ISBN', blank=True, null=True)  
    bib_url = models.TextField(db_column='BIB_URL', blank=True, null=True)  
    bib_annee = models.DateField(db_column='BIB_ANNEE', blank=True, null=True)  
    bib_biblatex = models.TextField(db_column='BIB_BIBLATEX')  
    parent =  TreeForeignKey('self', on_delete=models.CASCADE, null=True, blank=True, related_name='children')
    bib_edi = models.ForeignKey('TEditeur', models.PROTECT, db_column='EDI_ID', blank=True, null=True)  
    # Mes ajouts : 
    bib_aut_id = models.ManyToManyField(TAuteur, db_column='AUT_ID', related_name='+', blank=True)
    #bib_aut_id = models.ManyToManyField(TAuteur, db_column='AUT_ID', through='EcritPar', related_name='+')  

    class Meta:
        db_table = 'T_BIBLIOGRAPHIE'
        verbose_name = "Table Références biblio"
    def __str__(self):
        return self.bib_titre


class TBoClasse(models.Model):
    cla_id = models.AutoField(db_column='CLA_ID', primary_key=True)  
    cla_label = models.TextField(db_column='CLA_Label')  
    cla_infos = models.TextField(db_column='CLA_INFOS', blank=True, null=True) 
    cla_annee_bo_depart = models.DateField(db_column='CLA_ANNEE_BO_DEPART')  
    cla_annee_bo_fin = models.DateField(db_column='CLA_ANNEE_BO_FIN')  

    class Meta:
        db_table = 'T_BO_CLASSE'
        verbose_name = "Table BO"
    def __str__(self):
        return self.cla_label + " (BO "+ self.cla_annee_bo_depart.__str__() +")"


class TCompetences(models.Model):
    comp_id = models.AutoField(db_column='COMP_ID', primary_key=True)  
    comp_label = models.TextField(db_column='COMP_LABEL')  
    comp_infos = models.TextField(db_column='COMP_INFOS')  

    class Meta:
        db_table = 'T_COMPETENCES'
        verbose_name = "Table Compétence"
    def __str__(self):
        return self.comp_label


class TCorrection(models.Model):
    cor_id = models.AutoField(db_column='COR_ID', primary_key=True)  
    cor_latex = models.TextField(verbose_name="Votre correction en LATEX", db_column='COR_LATEX', blank=True, null=True)
    cor_qcm_bool = models.BooleanField(db_column='COR_QCM_BOOL')  
    cor_aleatoire_bool = models.BooleanField(db_column='COR_ALEATOIRE_BOOL')  
    cor_lua_bool = models.BooleanField(db_column='COR_LUA_BOOL')  
    cor_python_bool = models.BooleanField(db_column='COR_PYTHON_BOOL')  
    # Mes ajouts : 
    cor_bib = models.ManyToManyField(TBibliographie, db_column='BIB_ID', through='SeTrouveDans', related_name='+')

    class Meta:
        db_table = 'T_CORRECTION'
        verbose_name = "Table Correction"
    def __str__(self):
        return str(self.cor_id)


class TDifficulte(models.Model):
    diff_id = models.AutoField(db_column='DIFF_ID', primary_key=True)  
    diff_label = models.TextField(db_column='DIFF_label')  
    diff_echelle = models.IntegerField(db_column='DIFF_echelle')  

    class Meta:
        db_table = 'T_DIFFICULTE'
        verbose_name = "Table Difficulté"
        
    def __str__(self):
        return self.diff_label


class TEnsemble(MPTTModel):
    ens_id = models.AutoField(db_column='ENS_ID', primary_key=True)  
    ens_nom = models.CharField(db_column='ENS_NOM', max_length=25)  
    parent =  TreeForeignKey('self', on_delete=models.CASCADE, null=True, blank=True, related_name='children')

    class Meta:
        db_table = 'T_ENSEMBLE'
        verbose_name = "Table Ensemble"
    def __str__(self):
        return self.ens_nom


class TSujetClassification(MPTTModel):
    suj_id = models.AutoField(db_column='SUJ_ID', primary_key=True)  
    suj_nom = models.CharField(db_column='SUJ_NOM', max_length=100)  
    suj_infos = models.TextField(db_column='SUJ_INFOS', blank=True, null=True)  
    parent =  TreeForeignKey('self', on_delete=models.CASCADE, null=True, blank=True, related_name='children')

    class Meta:
        db_table = 'T_SUJET_CLASSIFICATION'
        verbose_name = "Table Classification"
    def __str__(self):
        return self.suj_nom


class TType(models.Model):
    typ_id = models.AutoField(db_column='TYP_ID', primary_key=True)  
    typ_label = models.CharField(db_column='TYP_LABEL', max_length=50)  

    class Meta:
        db_table = 'T_TYPE'
        verbose_name = "Table Type"
    def __str__(self):
        return self.typ_label


class TVariantes(models.Model):
    var_id = models.IntegerField(db_column='VAR_ID', primary_key=True)  
    var_label = models.TextField(db_column='VAR_LABEL', blank=True, null=True)  

    class Meta:
        db_table = 'T_VARIANTES'
        verbose_name = "Table Variante"
    def __str__(self):
        return self.var_label

class MediaFileSystemStorage(FileSystemStorage):
    def get_available_name(self, name, max_length=None):
        if max_length and len(name) > max_length:
            raise(Exception("name's length is greater than max_length"))
        return name
    def _save(self, name, content):
        if self.exists(name):
            # if the file exists, do not call the superclasses _save method
            return name
        # if the file is new, DO call it
        return super(MediaFileSystemStorage, self)._save(name, content)

def media_file_name(instance, filename):
    h = instance.md5sum
    basename, ext = os.path.splitext(filename)
    return settings.MEDIA_ROOT+'upload/images/'+ h + ext.lower()   
   
     
class TImages(models.Model):
    ima_id = models.AutoField(db_column='IMA_ID', primary_key=True)
    ima_titre = models.CharField(db_column='IMA_TITRE', max_length=255)
    ima_file = models.ImageField(upload_to=media_file_name, 
                                storage=MediaFileSystemStorage(),
                                #upload_to="upload/images/",  
                                null=True, blank=True)
    ima_thumbnail = ImageSpecField(source='ima_file',
                                   processors=[ResizeToFill(170, 150)],
                                   format='JPEG',
                                   options={'quality': 60})
    ima_thumbUrl = models.CharField(db_column='IMA_THUMBURL', max_length=255, blank=False, null=False )
    ima_filename = models.CharField(db_column='IMA_FILENAME', max_length=255, blank=False, null=False )
    ima_hash = models.CharField(db_column='IMA_HASH', max_length=255, blank=False, null=False)
    md5sum = ""
    
    class Meta:
        db_table = 'T_IMAGES'
        verbose_name = "Table image"
        
    def __str__(self):
        return self.ima_titre
        
    def image_tag(self):
        return (u'<img src="%s" />' % ima_thumbUrl)
    image_tag.short_description = 'Image'
    image_tag.allow_tags = True 
    
    def save(self, *args, **kwargs):
        if not self.pk:  # file is new
            md5 = hashlib.md5()
            for chunk in self.ima_file.chunks():
                md5.update(chunk)
            self.md5sum = md5.hexdigest()
        super(TImages, self).save(*args, **kwargs)

class TEnonce(models.Model):
    eno_id = models.AutoField(db_column='ENO_ID', primary_key=True)  
    eno_titre = models.CharField(verbose_name="Titre de l'exercice", db_column='ENO_TITRE', max_length=255, default="Titre", blank=False, null=False)
    eno_latex = models.TextField(verbose_name="Votre énoncé en LATEX", db_column='ENO_LATEX', blank=True, null=True)  
    eno_qcm_bool = models.BooleanField(verbose_name="Avec AMC", db_column='ENO_QCM_BOOL', default=False)
    eno_aleatoire_bool = models.BooleanField(verbose_name="Valeurs aléatoires", db_column='ENO_ALEATOIRE_BOOL')  
    eno_lua_bool = models.BooleanField(verbose_name="Avec LuaLatex", db_column='ENO_LUA_BOOL')  
    eno_python_bool = models.BooleanField(verbose_name="Avec pythontex", db_column='ENO_PYTHON_BOOL')  
    eno_nombre_questions = models.SmallIntegerField(verbose_name="Nombre de questions", db_column='ENO_NOMBRE_QUESTIONS')
    eno_cor = models.ForeignKey(TCorrection, models.DO_NOTHING, verbose_name="Choisir la correction",db_column='COR_ID', blank=True, null=True)
    # Mes ajouts : 
    eno_cla = models.ManyToManyField(TBoClasse, through='AdapteAUneClasseDeNiveau', db_column='CLA_ID', related_name='+')
    eno_diff = models.ManyToManyField(TDifficulte, through='AdapteAUneClasseDeNiveau', db_column='DIFF_ID', related_name='+')
    eno_ens = models.ManyToManyField(TEnsemble, verbose_name="Ensembles", db_column='ENS_ID', blank=True, related_name='+')
    #eno_ens = models.ManyToManyField(TEnsemble, through='AppartientA', db_column='ENS_ID', blank=True, related_name='+')
    eno_type = models.ManyToManyField(TType, verbose_name="Types", db_column='TYP_ID', related_name='+')
    #eno_type = models.ManyToManyField(TType, db_column='TYP_ID', through='EstDuType', related_name='+')
    #eno_comp = models.ManyToManyField(TCompetences, db_column='COMP_ID', through='Travaille', related_name='+')
    eno_comp = models.ManyToManyField(TCompetences, verbose_name="Compétences", db_column='COMP_ID', related_name='+')
    question_comp = models.ManyToManyField(TCompetences, db_column='COMP_ID', through='QuestionCompetence', related_name='+')
    eno_classification = models.ManyToManyField(TSujetClassification, db_column='SUJ_ID', related_name='+') 
    #eno_classification = models.ManyToManyField(TSujetClassification, db_column='SUJ_ID', through='EnRapport', related_name='+') 
    question_connaissance = models.ManyToManyField(TSujetClassification, db_column='SUJ_ID', through='QuestionConnaissance', related_name='+')
    eno_evalue = models.ManyToManyField(TSujetClassification, db_column='SUJ_ID', related_name='+')
    #eno_evalue = models.ManyToManyField(TSujetClassification, db_column='SUJ_ID', through='Evalue', related_name='+')
    eno_bib = models.ManyToManyField(TBibliographie, db_column='BIB_ID', through='RedigeDans', related_name='+')
    eno_variantes = models.ManyToManyField(TVariantes, verbose_name="Variantes disponibles", db_column='VAR_ID', blank=True, related_name='+')
    #eno_variantes = models.ManyToManyField(TVariantes, db_column='VAR_ID', through='SeDeclineEn', blank=True, related_name='+')
    eno_images = models.ManyToManyField(TImages, db_column='IMA_ID', through='ImagesAssociees', related_name='+')

    class Meta:
        db_table = 'T_ENONCE'
        verbose_name = "Table Enoncé"
    def __str__(self):
        return self.eno_titre

class ImagesAssociees(models.Model):
    id = models.AutoField(primary_key=True) 
    eno_id = models.ForeignKey(TEnonce, models.PROTECT, db_column='ENO_ID', blank=False, null=False)  
    ima_id = models.ForeignKey(TImages, models.PROTECT, db_column='IMA_ID', blank=False, null=False)  

    class Meta:
        db_table = 'images_associees'
        unique_together = (('eno_id', 'ima_id'),)
        verbose_name = "Jointure Enonce-Image"

class AdapteAUneClasseDeNiveau(models.Model):
    id = models.AutoField(primary_key=True)
    eno = models.ForeignKey(TEnonce, models.PROTECT, db_column='ENO_ID')
    diff = models.ForeignKey(TDifficulte, models.PROTECT, db_column='DIFF_ID', blank=False, null=False)
    cla = models.ForeignKey(TBoClasse, models.PROTECT, db_column='CLA_ID', blank=False, null=False)
    duree = models.IntegerField(db_column='duree', blank=False, null=False)
    
    class Meta:
        db_table = 'adapte_a_une_classe_de_niveau'
        unique_together = (('eno', 'cla', 'diff'),)
        verbose_name = "Jointure Enonce-Difficulté-BO"

class QuestionCompetence(models.Model):
    id = models.AutoField(primary_key=True) 
    num_question = models.IntegerField(db_column='Num_question')  
    comp = models.ForeignKey(TCompetences, models.PROTECT, db_column='COMP_ID')  
    eno = models.ForeignKey(TEnonce, models.PROTECT, db_column='ENO_ID')  

    class Meta:
        db_table = 'question_competence'
        unique_together = (('eno', 'comp', 'num_question'),)
        verbose_name = "Jointure Questions-Compétence"

class QuestionConnaissance(models.Model):
    id = models.AutoField(primary_key=True) 
    num_question = models.IntegerField(db_column='Num_question')  
    eno = models.ForeignKey(TEnonce, models.PROTECT, db_column='ENO_ID')  
    suj = models.ForeignKey(TSujetClassification, models.PROTECT, db_column='SUJ_ID')  

    class Meta:
        db_table = 'question_connaissance'
        unique_together = (('eno', 'suj', 'num_question'),)
        verbose_name = "Jointure Questions-Sujet"


class RedigeDans(models.Model):
    id = models.AutoField(primary_key=True) 
    eno = models.ForeignKey(TEnonce, models.PROTECT, db_column='ENO_ID')
    bib = models.ForeignKey(TBibliographie, models.PROTECT, db_column='BIB_ID', blank=False, null=False)
    page = models.IntegerField(blank=False, null=False)
    prenote = models.CharField(max_length=1000, blank=True, null=True)
    postnote = models.CharField(max_length=1000, blank=True, null=True)
    
    class Meta:
        db_table = 'redige_dans'
        unique_together = ('eno', 'bib')
        verbose_name = "Jointure Enonce-Biblio"

class SeTrouveDans(models.Model):
    id = models.AutoField(primary_key=True) 
    cor = models.ForeignKey(TCorrection, models.PROTECT, db_column='COR_ID')  
    bib = models.ForeignKey(TBibliographie, models.PROTECT, db_column='BIB_ID')  
    page = models.IntegerField(blank=True, null=True)
    prenote = models.CharField(max_length=1000, blank=True, null=True)
    postnote = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        db_table = 'se_trouve_dans'
        unique_together = (('cor', 'bib'),)
        verbose_name = "Jointure Correction-Biblio"

# class SeDeclineEn(models.Model):
#     id = models.AutoField(primary_key=True) 
#     eno = models.ForeignKey(TEnonce, models.PROTECT, db_column='ENO_ID')  
#     var = models.ForeignKey(TVariantes, models.PROTECT, db_column='VAR_ID')  
# 
#     class Meta:
#         db_table = 'se_decline_en'
#         unique_together = (('eno', 'var'),)
#         verbose_name = "Jointure Enonce-Variante"

# class AppartientA(models.Model):
#     id = models.AutoField(primary_key=True) 
#     eno = models.ForeignKey(TEnonce, models.PROTECT, db_column='ENO_ID')  
#     ens = models.ForeignKey(TEnsemble, models.PROTECT, db_column='ENS_ID')  
# 
#     class Meta:
#         db_table = 'appartient_a'
#         unique_together = (('eno', 'ens'),)
#         verbose_name = "Jointure Enonce-Ensemble"

# class EcritPar(models.Model):
#     id = models.AutoField(primary_key=True) 
#     bib = models.ForeignKey(TBibliographie, models.PROTECT, db_column='BIB_ID')  
#     aut = models.ForeignKey(TAuteur, models.PROTECT, db_column='AUT_ID')  
# 
#     class Meta:
#         db_table = 'ecrit_par'
#         unique_together = (('bib', 'aut'),)
#         verbose_name = "Jointure Biblio-Auteur"


# class EnRapport(models.Model):
#     id = models.AutoField(primary_key=True) 
#     eno = models.ForeignKey(TEnonce, models.PROTECT, db_column='ENO_ID')  
#     suj = models.ForeignKey(TSujetClassification, models.PROTECT, db_column='SUJ_ID')  
# 
#     class Meta:
#         db_table = 'en_rapport'
#         unique_together = (('eno', 'suj'),)
#         verbose_name = "Jointure Enonce-Sujet"


# class EstDuType(models.Model):
#     id = models.AutoField(primary_key=True) 
#     eno = models.ForeignKey(TEnonce, models.PROTECT, db_column='ENO_ID')  
#     typ = models.ForeignKey(TType, models.PROTECT, db_column='TYP_ID')  
# 
#     class Meta:
#         db_table = 'est_du_type'
#         unique_together = (('eno', 'typ'),)
#         verbose_name = "Jointure Enonce-Type"


# class Evalue(models.Model):
#     id = models.AutoField(primary_key=True) 
#     eno = models.ForeignKey(TEnonce, models.PROTECT, db_column='ENO_ID')  
#     suj = models.ForeignKey(TSujetClassification, models.PROTECT, db_column='SUJ_ID')  
# 
#     class Meta:
#         db_table = 'evalue'
#         unique_together = (('eno', 'suj'),)
#         verbose_name = "Jointure Enonce-Sujets évalués"

# class Travaille(models.Model):
#     id = models.AutoField(primary_key=True) 
#     comp = models.ForeignKey(TCompetences, models.PROTECT, db_column='COMP_ID')  
#     eno = models.ForeignKey(TEnonce, models.PROTECT, db_column='ENO_ID')  
# 
#     class Meta:
#         db_table = 'travaille'
#         unique_together = (('comp', 'eno'),)
#         verbose_name = "Jointure Enonce-Compétence"
