from django import template
from django import forms

register = template.Library()

@register.filter(name='is_empty')
def is_empty(field):
    return (field==None) or (field=={})

@register.filter(name='is_notempty')
def is_notempty(field):
    return not is_empty(field)

@register.filter(name='is_checkbox')
def is_checkbox(field):
    return isinstance(field.field.widget, forms.fields.CheckboxInput)
    
@register.filter(name='is_textarea')
def is_textarea(field):
    return isinstance(field.field.widget, forms.Textarea)
    
@register.filter('input_type')
def input_type(input):
    return input.field.widget.__class__.__name__
#{% if field|input_type == "Textarea" %}