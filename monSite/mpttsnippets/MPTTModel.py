from itertools import chain
from django import forms
from django.conf import settings
from django.contrib.admin import widgets
from django.utils.encoding import smart_text, force_text
from django.utils.safestring import mark_safe
from django.utils.html import escape, conditional_escape


class MPTTModelChoiceIterator(forms.models.ModelChoiceIterator):
#     def choice(self, obj):
#         tree_id = getattr(obj, getattr(self.queryset.model._meta, 'tree_id_atrr', 'tree_id'), 0)
#         left = getattr(obj, getattr(self.queryset.model._meta, 'left_atrr', 'lft'), 0)
#         return super(MPTTModelChoiceIterator, self).choice(obj) + ((tree_id, left),)
    def choice(self, obj):
        """
        Overloads the choice method to add the position
        of the object in the tree for future sorting.
        """
        tree_id = getattr(obj, self.queryset.model._mptt_meta.tree_id_attr, 0)
        left = getattr(obj, self.queryset.model._mptt_meta.left_attr, 0)
        return super(MPTTModelChoiceIterator, self).choice(obj)+({'data-tree-id':str(tree_id), 'data-left-value':str(left)},)


class MPTTModelMultipleChoiceField(forms.ModelMultipleChoiceField):
    def label_from_instance(self, obj):
        level = getattr(obj, getattr(self.queryset.model._meta, 'level_attr', 'level'), 0)
        return u'%s %s' % ('-'*level, smart_text(obj))
    
    def _get_choices(self):
        #print("_get_choices :")
        if hasattr(self, '_choices'):
            print("self._choices")
            return self._choices
        #print("MPTTModelChoiceIterator:"+str(MPTTModelChoiceIterator(self)))
        return MPTTModelChoiceIterator(self)
    
    choices = property(_get_choices, forms.ChoiceField._set_choices)


class MPTTFilteredSelectMultiple(widgets.FilteredSelectMultiple):
    def __init__(self, verbose_name, is_stacked, attrs=None, choices=()):
        self.option_inherits_attrs = True
        #print("choices:"+str(choices))
        #print("attrs:"+str(attrs))
        #print("verbose_name:"+str(verbose_name))
        super(MPTTFilteredSelectMultiple, self).__init__(verbose_name, is_stacked, attrs, choices)

    def optgroups(self, name, value, attrs=None):
        """
        Overloads the optgroups to add our attrs.
        Return a list of optgroups for this widget.
        """
        groups = []
        has_selected = False

        for index, (option_value, option_label, option_attrs) in enumerate(self.choices):
            if option_value is None:
                option_value = ''

            subgroup = []
            if isinstance(option_label, (list, tuple)):
                group_name = option_value
                subindex = 0
                choices = option_label
            else:
                group_name = None
                subindex = None
                choices = [(option_value, option_label)]
            groups.append((group_name, subgroup, index))

            for subvalue, sublabel in choices:
                selected = (
                    str(subvalue) in value and
                    (not has_selected or self.allow_multiple_selected)
                )
                has_selected |= selected
                attrs.update(option_attrs)
                print("attrs:"+str(attrs))
                print("option_attrs:"+str(option_attrs)+option_attrs.__class__.__name__)
                subgroup.append(self.create_option(
                    name, subvalue, sublabel, selected, index,
                    subindex=subindex, attrs=attrs,
                ))
                if subindex is not None:
                    subindex += 1
        return groups
    
    class Media:
        extend = False
        js = (#settings.STATIC_URL + "admin/js/core.js",
              #settings.STATIC_URL + "admin/js/SelectBox.js",
              #settings.STATIC_URL + "admin/js/SelectFilter2.js",
              settings.STATIC_URL + "admin/js/mptt_m2m_selectbox.js",
              #settings.STATIC_URL + "admin/js/vendor/jquery/jquery.js",
              #settings.STATIC_URL + "admin/js/jquery.init.js",
              settings.STATIC_URL + "admin/js/jsi18n.js",
              )
