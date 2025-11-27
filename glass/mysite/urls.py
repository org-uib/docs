from django.conf.urls.defaults import *
from django.conf import settings
#from django.contrib import admin

from mysite.glass.views import MainPage
from mysite.glass.views import TheGallery
from mysite.glass.views import TheGallery_Romer
from mysite.glass.views import TheGallery_Maigelein
from mysite.glass.views import TheGallery_Nuppen
from mysite.glass.views import TheGallery_Stangen
from mysite.glass.views import TheGallery_Is
from mysite.glass.views import TheGallery_Stett
from mysite.glass.views import TheGallery_Filigran
from mysite.glass.views import History
from mysite.glass.views import HistoryHvordan
from mysite.glass.views import HistoryTerminologi
from mysite.glass.views import HistoryTeknikker
from mysite.glass.views import HistoryTeknikkerOptisk
from mysite.glass.views import HistoryTeknikkerPaalagt
from mysite.glass.views import HistoryTeknikkerFiligrandekor
from mysite.glass.views import HistoryTeknikkerIsglassdekor
from mysite.glass.views import HistoryTeknikkerPaamaltdekor
from mysite.glass.views import HistoryTeknikkerSliptoggravert
from mysite.glass.views import HistorySkogsglass
from mysite.glass.views import HistorySkogsglassNuppenbecher
from mysite.glass.views import HistorySkogsglassRomerogberkemeyer
from mysite.glass.views import HistorySkogsglassStangen
from mysite.glass.views import HistoryVenetianskeglass
from mysite.glass.views import HistoryVenetianskeglassIsglass
from mysite.glass.views import HistoryVenetianskeglassStettglass
from mysite.glass.views import HistoryVenetianskeglassFiligranglass
from mysite.glass.views import HistoryAndretyperglass
from mysite.glass.views import HistoryAndretyperglassFadenrippenbecher
from mysite.glass.views import HistoryAndretyperglassBlaattbeger
from mysite.glass.views import HistoryAndretyperglassKaraffel
from mysite.glass.views import HistoryAndretyperglassLureglass
from mysite.glass.views import HistoryNyglassmote
from mysite.glass.views import HistoryNyglassmoteTumbler
from mysite.glass.views import HistoryNyglassmoteBalusterstett
from mysite.glass.views import HistoryNyglassmotePokal
from mysite.glass.views import HistoryNyglassmoteBlaattbegerhvitdekor
from mysite.glass.views import HistoryNyglassmoteOpak
from mysite.glass.views import HistoryReferanser
from mysite.glass.views import om
from mysite.glass.views import kontakt


#admin.autodiscover()

urlpatterns = patterns('',
    (r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT }), 
    #(r'^admin/(.*)', admin.site.root),  
    (r'^photologue/', include('photologue.urls')),
    ('^$', MainPage),
    ('^index.html$', MainPage),    
    ('^history/$', History),
	('^history/hvordan/$', HistoryHvordan),
	('^history/terminologi/$', HistoryTerminologi),	
	('^history/teknikker/$', HistoryTeknikker),	
	('^history/teknikker/optisk/$', HistoryTeknikkerOptisk),
	('^history/teknikker/paalagt/$', HistoryTeknikkerPaalagt),
	('^history/teknikker/filigrandekor/$', HistoryTeknikkerFiligrandekor),
	('^history/teknikker/isglassdekor/$', HistoryTeknikkerIsglassdekor),
	('^history/teknikker/paamaltdekor/$', HistoryTeknikkerPaamaltdekor),
	('^history/teknikker/sliptoggravertdekor/$', HistoryTeknikkerSliptoggravert),
	('^history/skogsglass/$', HistorySkogsglass),
	('^history/skogsglass/nuppenbecher/$', HistorySkogsglassNuppenbecher),
	('^romerogberkemeyer/(\d{1,2})/$', TheGallery_Romer),
	('^maigelein/(\d{1,2})/$', TheGallery_Maigelein),
	('^stangen/(\d{1,2})/$', TheGallery_Stangen),
	('^nuppenbecher/(\d{1,2})/$', TheGallery_Nuppen),
	('^history/venetianske-glass/$', HistoryVenetianskeglass),
	('^history/venetianske-glass/isglass/$', HistoryVenetianskeglassIsglass),
	('^isglass/(\d{1,2})/$', TheGallery_Is),
	('^stettglass/(\d{1,2})/$', TheGallery_Stett),
	('^filigranglass/(\d{1,2})/$', TheGallery_Filigran),
	('^history/venetianske-glass/stettglass/$', HistoryVenetianskeglassStettglass),
	('^history/venetianske-glass/filigranglass/$', HistoryVenetianskeglassFiligranglass),
	('^history/andretyperglass/$', HistoryAndretyperglass),
	('^history/andretyperglass/fadenrippenbecher/$', HistoryAndretyperglassFadenrippenbecher),
	('^history/andretyperglass/blaattbeger/$', HistoryAndretyperglassBlaattbeger),
	('^history/andretyperglass/karaffel/$', HistoryAndretyperglassKaraffel),
	('^history/andretyperglass/lureglass/$', HistoryAndretyperglassLureglass),
	('^history/nyglassmote/$', HistoryNyglassmote),
	('^history/nyglassmote/tumbler/$', HistoryNyglassmoteTumbler),
	('^history/nyglassmote/balusterstett/$', HistoryNyglassmoteBalusterstett),
	('^history/nyglassmote/pokal/$', HistoryNyglassmotePokal),
	('^history/nyglassmote/blaattbegerhvitdekor/$', HistoryNyglassmoteBlaattbegerhvitdekor),
	('^history/nyglassmote/opak/$', HistoryNyglassmoteOpak),
	('^history/lesningogreferanser/$', HistoryReferanser),
    ('^om/$', om),
    ('^kontakt/$', kontakt),
    ('^Gallery/(\d{1,2})/$', TheGallery), 
)
