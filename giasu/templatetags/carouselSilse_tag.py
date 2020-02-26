from django import template
from ..models import CarouselSlide

register = template.Library()
@register.inclusion_tag('giasu/block_carouselSlide.html', name='block_carousel')
def block_search():
    carousels = CarouselSlide.objects.order_by('-id')[:5]
    return {'carousels': carousels}