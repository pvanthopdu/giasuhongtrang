from django import template
from ..models import Category

register = template.Library()

@register.inclusion_tag('giasu/categories.html', name='categories')
def categorys_tag():
    categories = Category.objects.all()
    return {'categories': categories}

@register.inclusion_tag('giasu/block_search.html', name='block_search')
def block_search():
    categories = Category.objects.all()
    return {'categories': categories}

@register.inclusion_tag('giasu/block_re_search.html', name='block_re_search')
def block_re_search():
    categories = Category.objects.all()
    return {'categories': categories}