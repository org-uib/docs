# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
from django.http import Http404, HttpResponse
from photologue.models import Gallery

def MainPage(request):
    
    main_title = 'Main Page'
    main_content = ''
    return render_to_response('mainpage.html', locals())
	
def TheGallery(request, offset):
   
	try:
		offset = int(offset);
	except ValueError:
		raise Http404();

	pictureCount = 8;

	offset2 = offset - 1;
	startvalue = pictureCount * offset2;
	endvalue = pictureCount * offset;
    
	gallery_res = Gallery.objects.filter(title='Test');  
	object_list = gallery_res[0].public().all()[startvalue:endvalue];
	
	totalPhotoCount = gallery_res[0].public().count();	
	
	photoLinkCount = totalPhotoCount//pictureCount;

	test = photoLinkCount * pictureCount;

	if test != totalPhotoCount:
		photoLinkCount = photoLinkCount + 1;
	
	photo_link ='';

	for i in range(1, photoLinkCount + 1):
		if i == offset:
			photo_link = photo_link + '<div class="shield"><a href="/Gallery/' + str(i) +'">'+ '<img src="/media/glass/nav2.png" width="20" height="20" border="0" alt=" ' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
		else:
			photo_link = photo_link + '<div class="shield"><a href="/Gallery/' + str(i) +'">'+ '<img src="/media/glass/nav.png" width="20" height="20" border="0" title="' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
										
	return render_to_response('gallery.html', locals())
	
def TheGallery_Romer(request, offset):
   
	try:
		offset = int(offset);
	except ValueError:
		raise Http404();

	pictureCount = 10;

	offset2 = offset - 1;
	startvalue = pictureCount * offset2;
	endvalue = pictureCount * offset;
    
	gallery_res = Gallery.objects.filter(title='Rømer og berkemeyerglass');  
	object_list = gallery_res[0].public().all()[startvalue:endvalue];
	
	totalPhotoCount = gallery_res[0].public().count();	
	
	photoLinkCount = totalPhotoCount//pictureCount;

	test = photoLinkCount * pictureCount;

	if test != totalPhotoCount:
		photoLinkCount = photoLinkCount + 1;
	
	photo_link ='';

	for i in range(1, photoLinkCount + 1):
		if i == offset:
			photo_link = photo_link + '<div class="shield"><a href="/romerogberkemeyer/' + str(i) +'">'+ '<img src="/media/glass/nav2.png" width="20" height="20" border="0" alt=" ' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
		else:
			photo_link = photo_link + '<div class="shield"><a href="/romerogberkemeyer/' + str(i) +'">'+ '<img src="/media/glass/nav.png" width="20" height="20" border="0" title="' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
					
	return render_to_response('romerogberkemeyer.html', locals())
		
def TheGallery_Maigelein(request, offset):
   
	try:
		offset = int(offset);
	except ValueError:
		raise Http404();

	pictureCount = 8;

	offset2 = offset - 1;
	startvalue = pictureCount * offset2;
	endvalue = pictureCount * offset;
    
	gallery_res = Gallery.objects.filter(title='Maigeleinglass');  
	object_list = gallery_res[0].public().all()[startvalue:endvalue];
	
	totalPhotoCount = gallery_res[0].public().count();	
	
	photoLinkCount = totalPhotoCount//pictureCount;

	test = photoLinkCount * pictureCount;

	if test != totalPhotoCount:
		photoLinkCount = photoLinkCount + 1;
	
	photo_link ='';

	for i in range(1, photoLinkCount + 1):
		if i == offset:
			photo_link = photo_link + '<div class="shield"><a href="maigelein/' + str(i) +'">'+ '<img src="/media/glass/nav2.png" width="20" height="20" border="0" alt=" ' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
		else:
			photo_link = photo_link + '<div class="shield"><a href="maigelein/' + str(i) +'">'+ '<img src="/media/glass/nav.png" width="20" height="20" border="0" title="' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
										
	return render_to_response('maigelein.html', locals())	
	
def TheGallery_Stangen(request, offset):
   
	try:
		offset = int(offset);
	except ValueError:
		raise Http404();

	pictureCount = 8;

	offset2 = offset - 1;
	startvalue = pictureCount * offset2;
	endvalue = pictureCount * offset;
    
	gallery_res = Gallery.objects.filter(title='Stangenglass');  
	object_list = gallery_res[0].public().all()[startvalue:endvalue];
	
	totalPhotoCount = gallery_res[0].public().count();	
	
	photoLinkCount = totalPhotoCount//pictureCount;

	test = photoLinkCount * pictureCount;

	if test != totalPhotoCount:
		photoLinkCount = photoLinkCount + 1;
	
	photo_link ='';

	for i in range(1, photoLinkCount + 1):
		if i == offset:
			photo_link = photo_link + '<div class="shield"><a href="/Gallery/stangen/' + str(i) +'">'+ '<img src="/media/glass/nav2.png" width="20" height="20" border="0" alt=" ' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
		else:
			photo_link = photo_link + '<div class="shield"><a href="/Gallery/stangen/' + str(i) +'">'+ '<img src="/media/glass/nav.png" width="20" height="20" border="0" title="' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
										
	return render_to_response('stangen.html', locals())	
	
def TheGallery_Nuppen(request, offset):
   
	try:
		offset = int(offset);
	except ValueError:
		raise Http404();

	pictureCount = 8;

	offset2 = offset - 1;
	startvalue = pictureCount * offset2;
	endvalue = pictureCount * offset;
    
	gallery_res = Gallery.objects.filter(title='Nuppenbecher');  
	object_list = gallery_res[0].public().all()[startvalue:endvalue];
	
	totalPhotoCount = gallery_res[0].public().count();	
	
	photoLinkCount = totalPhotoCount//pictureCount;

	test = photoLinkCount * pictureCount;

	if test != totalPhotoCount:
		photoLinkCount = photoLinkCount + 1;
	
	photo_link ='';

	for i in range(1, photoLinkCount + 1):
		if i == offset:
			photo_link = photo_link + '<div class="shield"><a href="/Gallery/nuppen/' + str(i) +'">'+ '<img src="/media/glass/nav2.png" width="20" height="20" border="0" alt=" ' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
		else:
			photo_link = photo_link + '<div class="shield"><a href="/Gallery/nuppen/' + str(i) +'">'+ '<img src="/media/glass/nav.png" width="20" height="20" border="0" title="' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
										
	return render_to_response('nuppenbecher.html', locals())	

def TheGallery_Is(request, offset):
   
	try:
		offset = int(offset);
	except ValueError:
		raise Http404();

	pictureCount = 8;

	offset2 = offset - 1;
	startvalue = pictureCount * offset2;
	endvalue = pictureCount * offset;
    
	gallery_res = Gallery.objects.filter(title='Isglass');  
	object_list = gallery_res[0].public().all()[startvalue:endvalue];
	
	totalPhotoCount = gallery_res[0].public().count();	
	
	photoLinkCount = totalPhotoCount//pictureCount;

	test = photoLinkCount * pictureCount;

	if test != totalPhotoCount:
		photoLinkCount = photoLinkCount + 1;
	
	photo_link ='';

	for i in range(1, photoLinkCount + 1):
		if i == offset:
			photo_link = photo_link + '<div class="shield"><a href="/Gallery/is/' + str(i) +'">'+ '<img src="/media/glass/nav2.png" width="20" height="20" border="0" alt=" ' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
		else:
			photo_link = photo_link + '<div class="shield"><a href="/Gallery/is/' + str(i) +'">'+ '<img src="/media/glass/nav.png" width="20" height="20" border="0" title="' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
										
	return render_to_response('isglass.html', locals())		
	
def TheGallery_Stett(request, offset):
   
	try:
		offset = int(offset);
	except ValueError:
		raise Http404();

	pictureCount = 4;

	offset2 = offset - 1;
	startvalue = pictureCount * offset2;
	endvalue = pictureCount * offset;
    
	gallery_res = Gallery.objects.filter(title='Stettglass');  
	object_list = gallery_res[0].public().all()[startvalue:endvalue];
	
	totalPhotoCount = gallery_res[0].public().count();	
	
	photoLinkCount = totalPhotoCount//pictureCount;

	test = photoLinkCount * pictureCount;

	if test != totalPhotoCount:
		photoLinkCount = photoLinkCount + 1;
	
	photo_link ='';

	for i in range(1, photoLinkCount + 1):
		if i == offset:
			photo_link = photo_link + '<div class="shield"><a href="/Gallery/stett/' + str(i) +'">'+ '<img src="/media/glass/nav2.png" width="20" height="20" border="0" alt=" ' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
		else:
			photo_link = photo_link + '<div class="shield"><a href="/Gallery/stett/' + str(i) +'">'+ '<img src="/media/glass/nav.png" width="20" height="20" border="0" title="' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
										
	return render_to_response('stettglass.html', locals())	

def TheGallery_Filigran(request, offset):
   
	try:
		offset = int(offset);
	except ValueError:
		raise Http404();

	pictureCount = 8;

	offset2 = offset - 1;
	startvalue = pictureCount * offset2;
	endvalue = pictureCount * offset;
    
	gallery_res = Gallery.objects.filter(title='Filigranglass');  
	object_list = gallery_res[0].public().all()[startvalue:endvalue];
	
	totalPhotoCount = gallery_res[0].public().count();	
	
	photoLinkCount = totalPhotoCount//pictureCount;

	test = photoLinkCount * pictureCount;

	if test != totalPhotoCount:
		photoLinkCount = photoLinkCount + 1;
	
	photo_link ='';

	for i in range(1, photoLinkCount + 1):
		if i == offset:
			photo_link = photo_link + '<div class="shield"><a href="/Gallery/filigran/' + str(i) +'">'+ '<img src="/media/glass/nav2.png" width="20" height="20" border="0" alt=" ' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
		else:
			photo_link = photo_link + '<div class="shield"><a href="/Gallery/filigran/' + str(i) +'">'+ '<img src="/media/glass/nav.png" width="20" height="20" border="0" title="' + str(i) + '"/><div class="nav">' + str(i) + '</div></a></div> '
										
	return render_to_response('filigranglass.html', locals())		
		
	
	
def History(request):
	#GlassProduksjon
	history_title = 'Glassproduksjon i middelalderen'
	history_content = '<p>I middelalderen kan glassproduksjonen i Europa deles i en nordlig og en sydlig tradisjon. Nord for Alpene gikk tradisjonen med å lage glass helt tilbake til romertiden, men fra 1200-tallet og i århundrene frem fikk man en stadig mer intensiv produksjon. Produktene var grønnlige drikkeglass med tilnavnet skogsglass, og glass nesten uten farge. De ble laget i glasshytter i Böhmen, i dagens Tsjekkia, i Tyskland og i Nederland.</p><p> I de nordeuropeiske skogsområdene var det god tilgang til brensel til oppfyring av glassovnene og man kunne fremstille pottaske, som ble brukt som smeltemiddel når man laget glassmasse. Skogsglassene ble grønnlige fordi råstoffene var jernholdige. Mange av skogsglasstypene hadde en relativ enkel utforming og ble laget i store mengder. Med det hanseatiske handelsnettverk ble de tyske skogsglassene og andre drikkeglass spredt over store deler av Nordeuropa og var ikke lenger forbeholdt samfunnets absolutte toppsjikt.</p><p>I Sør-Europa tok man opp glassfremstilling på 1200-tallet i Venezia. Man la vekt på å produsere kvalitetsglass. Med gode råstoffer og høyt utviklete blåse- og dekorteknikker kunne de venetianske glassmestre lage glass som var helt klare og svært tynne i godset. I løpet av de neste århundrene ble venetianerne de ledende glassprodusentene i Europa. Ett venetiansk luksusglass kunne koste det samme som fem vanlige vinglass, og var ettertraktet av både adel og kongelige i hele Europa.</p><p> Fra 1600-tallet overtok Tyskland/Böhmen og England rollen som ledende innen glassproduksjonen. Det skyldes først og fremst oppfinnelsen av krittglass og blyglass som var to noenlunde like typer glass. Begge ble kalt krystall. Krittglasset, som inneholder kalk, ble oppfunnet i Tyskland/Böhmen. Det er et klart glass med myk overflate, som er lett å gravere og slipe. Blyglasset var en engelsk oppfinnelse. Det er tyngre og hardere enn krittglasset, men kan også slipes og graveres.</p>'
	return render_to_response('history.html', locals())
	
def HistoryHvordan(request):
	history_title = 'Hvordan lages glassene'
	history_content = '<p>Glass lages av sand, kalk og aske. Kalk tilsettes for å gi glasset bedre holdbarhet. Aske fungerer som smeltemiddel, slik at en ikke trenger så høy varme for å smelte råvarene. I middelalderen ble soda brukt som smeltemiddel i Søreuropa, i Nordeuropa brukte man pottaske. Soda er aske av Barilla, en sjøplante som vokser i middelhavsområdet. Pottaske er aske av skogsplanter.</p><p> Når råvarene varmes opp til mellom 500°C og 1500°C får man en flytende glassmasse som kan munnblåses og formes. </p><p>Med blåseteknikken blåses luft inn i glassmassen gjennom et langt hult rør og glassmesteren former massen til drikkeglass, karafler, flasker osv.</p><p> De ferdige produktene blir sakte nedkjølt i en kjøleovn. Slik unngår man at glasset får indre spenninger, og produktene blir mer holdbare.</p><p> Klart eller ”fargeløst” glass var idealet for middelalderens glassprodusenter. I nordeuropeisk glassproduksjon fikk glassene et grønnskjær. Det kom av jernforurensning av råstoffene som ble brukt. Når en ønsket å lage helt klare glass uten farge tilsatte man mangan eller brunstein som gir en rødfarge. Den røde fargen nøytraliserte den grønne fargen og en sto igjen med et klarere glass. I Søreuropa hadde en tilgang på renere råvarer, slik kunne man lage helt klare glass uten tilsetting av fargestoff. Blått glass fikk man ved å tilsette kobolt. Opakt glass, altså ugjennomsiktig glass, kunne lages i ulike farger. For å få hvitt, opakt glass tilsatte man tinnoksider til glassmassen.</p><p>På 1600-tallet begynte man i Tyskland og England å tilsette henholdsvis bly og kritt i glassmassen. Da fikk man glass med nye egenskaper bl.a. hadde glasset en relativ myk overflate som kunne slipes og graveres.</p>'
	history_image_text = 'Fritt etter ”Glassmaking at The Pitt of Memnon” som viser en 1400-talls glasshytte, sannsynligvis i Böhmen.'
	history_image = '<a href ="/media/glass/glassproduksjon.jpg"><img src="/media/glass/glassproduksjon.jpg" border="none" title="Glassproduksjon" width="234px" /></a>'
	return render_to_response('hvordan.html', locals())
	
def HistoryTerminologi(request):
	history_title = 'Terminologi, hva kalles de forskjellige delene av et glass?'
	history_content = 'This is the history'
	history_image_text = ''
	history_image = '<a href =""><img src="/media/glass/terminologi.jpg" border="none" title="Glassproduksjon" width="642px" /></a>'
	return render_to_response('terminologi.html', locals())
	
	
def HistoryTeknikker(request):
	history_title = 'Varm- og kalddekorrering.'
	history_content = '<p>Glass kan dekoreres mens det er varmt og formbart eller når det ar avkjølt. Varmdekoreringsteknikker som er brukt på glass i denne utstillingen er optisk dekor, pålagt dekor, filigran- og isglassdekor. Kalddekoreringsteknikker som vi viser eksempler på er påmalt, slipt og gravert dekor.</p><p><div class="link_thumb"><a href ="/history/teknikker/optisk/"> <img src="/media/glass/optisk_thumb.jpg" border="none"title="Gå til Optisk dekor"/></a><br/>Optisk dekor</div><div class="link_thumb"><a href ="/history/teknikker/paalagt/"><img src="/media/glass/paalagt_thumb.jpg" border="none"title="Gå til Pålagt dekor"/></a><br/>Pålagt dekor</div><div class="link_thumb"><a href ="/history/teknikker/filigrandekor/"> <img src="/media/glass/fili_thumb.jpg" border="none"title="Gå til Filigrandekor"/></a><br/>Filigrandekor</div><div class="link_thumb"><a href ="/history/teknikker/isglassdekor/"> <img src="/media/glass/isdek_thumb.jpg" border="none"title="Gå til Isglassdekor"/></a><br/>Isglassdekor</div><div class="link_thumb"><a href ="/history/teknikker/paamaltdekor/"> <img src="/media/glass/paadek_thumb.jpg" border="none"title="Gå til Påmaltdekor"/></a><br/>Påmalt dekor</div><div class="link_thumb"><a href ="/history/teknikker/sliptoggravertdekor/"> <img src="/media/glass/slipt_thumb.jpg" border="none"title="Gå til Slipt og gravert dekor"/></a><br/>Slipt og gravert</div></p>'
	history_image_text = ''
	history_image = ''
	return render_to_response('teknikker.html', locals())
	
def HistoryTeknikkerOptisk(request):
	history_title = 'Optisk dekor'
	history_content = '<div id="about_dekor_optisk"><p>Mens glassmassen fremdeles er varm blåses den ned mot en form med mønster. Slik får det ferdige glasset et mønster, slik at lyset brytes på ulik sett når man ser gjennom glasset.</p></div>'
	history_image_text = ''
	history_image = '<img src="/media/glass/optisk_2.jpg" border="none" title="Optisk dekor"  />'
	return render_to_response('optisk.html', locals())
	
def HistoryTeknikkerPaalagt(request):
	history_title = 'Pålagt dekor'
	history_content = '<div id="about_dekor_paalagt"><p>Glassnupper og bånd i ulike farger er lagt på glasset og strukket i form mens glassmassen ennå var varm.</p></div>'
	history_image_text = ''
	history_image = '<img src="/media/glass/paalagt_3.jpg" border="none" title="Pålagt dekor"  />'
	return render_to_response('paalagt.html', locals())
	
def HistoryTeknikkerFiligrandekor(request):
	history_title = 'Filigrandekor'
	history_content = '<div id="about_dekor_filigran"><p>Staver av farget glass smeltes inn i glassmassen før glasset blir blåst ferdig. </p><p>På skåret fra Bergen over ser vi striper av opakt glass i det ellers klare godset.</p></div>'
	history_image_text = ''
	history_image = '<img src="/media/glass/filigrandekor.jpg" border="none" title="Filigrandekor"  />'
	return render_to_response('filigrandekor.html', locals())
	
def HistoryTeknikkerIsglassdekor(request):
	history_title = 'Isglassdekor'
	history_content = '<div id="about_dekor_isglass"><p>Isglasseffekten gjør at glassets overflate blir ruglete og likner på rim. Man kan oppnå effekten på to måter: </p><p>Mens glassmassen fremdeles er varm vendes den i finknust glass før den endelige formen blir blåst.</p><p>Man kan også dyppe den varme glassmassen ned i kaldt vann før den forsiktig varmes opp igjen, og den endelige formen blir blåst. </p></div>'
	history_image_text = ''
	history_image = '<img src="/media/glass/isglassdekor.jpg" border="none" title="Isglassdekor"  />'
	return render_to_response('isglassdekor.html', locals())
	
def HistoryTeknikkerPaamaltdekor(request):
	history_title = 'Påmalt dekor'
	history_content = '<div id="about_dekor_paamalt"><p> Når glasset er nedkjølt kan det males med forskjellige farger. Deretter må det varmes opp igjen slik at emaljefargen herder.</p><p>Her ser vi prikker og streker malt på et beger av blått glass. Emaljefargen er i dag gullig, men kan gjerne ha vært hvit opprinnelig.</p></div>'
	history_image = '<img src="/media/glass/paamalt.jpg" border="none" title="Påmaltdekor"  />'
	return render_to_response('paamaltdekor.html', locals())
	
def HistoryTeknikkerSliptoggravert(request):
	history_title = 'Slipt og gravert dekor'
	history_content = '<div id="about_dekor_slipt"><p>Det nedkjølte glasset kan slipes i fasetter slik som glasset til venstre. Eller det kan graveres, som på glasset til høyre. </p></div>'
	history_image_text = ''
	history_image = '<img src="/media/glass/sliptoggravert_2.jpg" border="none" title="Slipt og gravert dekor"  />'
	return render_to_response('sliptoggravertdekor.html', locals())

def HistorySkogsglass(request):
	history_title = 'Skogsglass'
	history_content = '<p>Skogsglass en samlebetegnelse på farget glass som ble produsert i skogrike områder i Nordeuropa. Et felles kjennetegn for skogsglassene er den grønnlige fargen. Fargen skyldes at råstoffene som var tilgjengelig i skogsområdene var jernholdige.</p><p> I middelalderen var helt klare og fargeløse glass ansett for å være de fineste. For å fjerne den uheldige grønnfargen på skogsglass kunne man tilsette manganoksid som tilførte glassmassen en rødfarge. Den røde fargen nøytraliserte den grønne fargen og man endte opp med et klarere glass.</p><p>Skogsglass ble produsert fra 1200-tallet.</p><p>Skogsglass vi presenterer i denne utstillingen er nuppebecher, rømer- og berkemeyerglass, maigeleinglass og stangenglass</p>'
	
	history_title2 = 'Nuppenbecher'
	history_content2 = '<p>Nuppenbecherglass er begerformet glass med en lav fot. Navnet kommer av de små glassknoppene eller -piggene som er satt på klokken. Glassets fot har ofte piggete kant, og klokken er rund i formen. Øverst på klokken, rett før munningen av glasset, kan det være påsatt en tynn glasstråd som markerer slutningen på knoppene. Begrene er gjerne ca. 10 cm høye.</p><p>Det kan være vanskelig å skille nuppenbegre fra andre skogsglass med knopper/pigger. Nuppenbecher-klokken er rundere i formen enn for eksempel rømerklokken som i tillegg gjerne har piggene på stetten.</p><p>Nuppenbecher ble produsert på 1400-tallet og i første halvdel av 1500-tallet.</p><p><div class="link_thumb2"><a href ="/nuppenbecher/1/"> <img src="/media/glass/nuppen_thumb.jpg" border="none"title="Gå til Nuppenbecher"/></a><br/><p>Nuppenbecher</p></div></p><br clear="all" />'
	
	history_title3 = 'Rømer- og berkemeyerglass'
	history_content3 = '<p>Rømer- og berkemeyerglass er to store grupper av skogsglass som har mye til felles slik at det ikke alltid er enkelt å se om man har med den ene eller den andre gruppen å gjøre. Foten på begge glasstyper kan være glatt, den kan også ha en pigget kant eller den kan være bygget opp av glasstråder. Både rømerglasset og berkemeyerglasset har åpen stett. Stetten er dekorert med pigger/knopper. I rømerglasset sitt tilfelle blir stetten mod slutten av 1600-tallet også dekorert med ”bringebærknopper”. Bringebærknopper er glassknopper med et stempeldekor som likner på et bringebær. Hovedforskjellen på rømer- og berkemeyerglass ligger i formen på klokken. Rømerglassets klokke er mer kuleformet enn berkemeyerglassets, som kan være nesten traktformet. Glassene er gjerne mellom 6-11 cm høye, mot slutningen av 1600-tallet finnes de i opp til 15 cm høyde . </p><p>De minste rømer- og berkemeyerglass var drammeglass, mens de største var vinglass.</p><p> Produksjonen av rømer- og berkemeyerglass startet på 1500-tallet og  fortsatte fram til begynnelsen av 1700-tallet.</p><p>De eldste glassene har gjerne en mørkere grønnfarge enn de yngste, de har ofte pigget fot og pigger/knopper på stetten. De yngste glassene har opphøyd fot, bringebærknopper på stetten, og er klarere i fargen.</p><p><div class="link_thumb2"><a href ="/romerogberkemeyer/1/"> <img src="/media/glass/romer_thumb.jpg" border="none"title="Gå til Rømer- og berkemeyerglass"/></a><br/><p>Rømer- og berkemeyerglass</p></div></p><br clear="all" />'
	
	history_title4 = 'Maigeleinglass'
	history_content4 = '<p>Maigeleinglass er et lavt grønnlig begerglass, med en fot som avsluttes inni klokken. Glassene er gjerne mellom 1,5 og 6 cm høye. I regelen er de optisk dekorert i et rute- eller ribbemønster.</p><p>Maigeleinglasset var et enkelt vinglass som ble masseprodusert. De første kjente funnene av maigeleinglass er kanskje fra slutningen av 1300-tallet, men vanligvis daterer man disse glassene til 1400-tallet og tidlig 1500-tallet. Maigeleinglass finner man ofte i Nederlandene mens de er nærmest ukjent i de østlige deler av dagens Tyskland. I Bergen er de ganske vanlige.</p><p><div class="link_thumb2"><a href ="/maigelein/1/"> <img src="/media/glass/maig_thumb.jpg" border="none"title="Gå til Maigeleinglass"/></a><br/><p>Maigeleinglass</p></div><br clear="all" /></p>'
	
	history_title5 = 'Stangenglass'
	history_content5 = '<p>Stangenglass er en fellesbetegnelse for en gruppe av høye begerglass. Glassene har en høy fot  som avsluttes inni klokken. Klokken begynner slik halvveis oppe på foten. </p><p>Glassene er vanligvis 20-30 cm høye, men kan i enkelte tilfeller være over 40 cm høye. </p><p>Stangenglass ble produsert fra midten av 1400-tallet. De eldste var grønnlige, men utover 1500- og 1600-tallet ble de også laget i klart glass. </p><p>En del stangenglass er optisk dekorerte i tillegg til å ha pålagt dekor i form av vannrette glassbånd, pålagte knopper eller dyrehoder i glass. De yngre glassene kan være dekorert med emaljefarge.</p><p>Passglass er en av de mer kjente former for stangenglass. Pålagte glassbånd deler glasset opp. Denne lagdelingen kalles pässe på tysk, derav det norske navnet passglass. Når man skulle dele glasset med andre, f.eks rundt et bord, viste glassbåndene hvor mye den enkelte kunne eller burde drikke. Passglass ble laget fra 1500- og 1600-tallet.</p><p><div class="link_thumb2"><a href ="/stangen/1/"> <img src="/media/glass/stang_thumb.jpg" border="none"title="Gå til Stangenglass"/></a><br/><p>Stangenglass</p></div></p><br clear="all" /><br/>'
	
	history_image_text = ''
	return render_to_response('skogsglass.html', locals())
	
def HistorySkogsglassNuppenbecher(request):
	history_title = 'Nuppenbecher'
	history_content = '<p>Nuppenbecherglass er begerformet glass med en lav fot. Navnet kommer av de små glassknoppene eller -piggene som er satt på klokken. Glassets fot har ofte piggete kant, og klokken er rund i formen. Øverst på klokken, rett før munningen av glasset, kan det være påsatt en tynn glasstråd som markerer slutningen på knoppene. Begrene er gjerne ca. 10 cm høye.</p><p>Det kan være vanskelig å skille nuppenbegre fra andre skogsglass med knopper/pigger. Nuppenbecher-klokken er rundere i formen enn for eksempel rømerklokken som i tillegg gjerne har piggene på stetten.</p><p> Nuppenbecher ble produsert på 1400-tallet og i første halvdel av 1500-tallet.</p>'
	history_image_text = ''
	history_image = ''
	return render_to_response('nuppenbecher.html', locals())
	
def HistorySkogsglassRomerogberkemeyer(request):
	history_title = 'Rømer- og berkemeyerglass'
	history_content = '<p>Rømer- og berkemeyerglass er to store grupper av skogsglass som har mye til felles slik at det ikke alltid er enkelt å se om man har med den ene eller den andre gruppen å gjøre. Foten på begge glasstyper kan være glatt, den kan også ha en pigget kant eller den kan være bygget opp av glasstråder. Både rømerglasset og berkemeyerglasset har åpen stett. Stetten er dekorert med pigger/knopper. I rømerglasset sitt tilfelle blir stetten mod slutten av 1600-tallet også dekorert med ”bringebærknopper”. Bringebærknopper er glassknopper med et stempeldekor som likner på et bringebær. Hovedforskjellen på rømer- og berkemeyerglass ligger i formen på klokken. Rømerglassets klokke er mer kuleformet enn berkemeyerglassets, som kan være nesten traktformet. Glassene er gjerne mellom 6-11 cm høye, mot slutningen av 1600-tallet finnes de i opp til 15 cm høyde . </p><p>De minste rømer- og berkemeyerglass var drammeglass, mens de største var vinglass.</p><p> Produksjonen av rømer- og berkemeyerglass startet på 1500-tallet og  fortsatte fram til begynnelsen av 1700-tallet.</p><p>De eldste glassene har gjerne en mørkere grønnfarge enn de yngste, de har ofte pigget fot og pigger/knopper på stetten. De yngste glassene har opphøyd fot, bringebærknopper på stetten, og er klarere i fargen.</p>'
	history_image_text = ''
	return render_to_response('romerogberkemeyer.html', locals())

def HistorySkogsglassMaigelein(request):
	history_title = 'Maigeleinglass'
	history_content = '<p>Maigeleinglass er et lavt grønnlig begerglass, med en fot som avsluttes inni klokken. Glassene er gjerne mellom 1,5 og 6 cm høye. I regelen er de optisk dekorert i et rute- eller ribbemønster.</p><p>Maigeleinglasset var et enkelt vinglass som ble masseprodusert. De første kjente funnene av maigeleinglass er kanskje fra slutningen av 1300-tallet, men vanligvis daterer man disse glassene til 1400-tallet og tidlig 1500-tallet. Maigeleinglass finner man ofte i Nederlandene mens de er nærmest ukjent i de østlige deler av dagens Tyskland. I Bergen er de ganske vanlige.</p>'
	history_image_text = ''
	return render_to_response('maigelein.html', locals())
	
def HistorySkogsglassStangen(request):
	history_title = 'Stangenglass'
	history_content = '<p>Stangenglass er en fellesbetegnelse for en gruppe av høye begerglass. Glassene har en høy fot  som avsluttes inni klokken. Klokken begynner slik halvveis oppe på foten. </p><p>Glassene er vanligvis 20-30 cm høye, men kan i enkelte tilfeller være over 40 cm høye. </p><p>Stangenglass ble produsert fra midten av 1400-tallet. De eldste var grønnlige, men utover 1500- og 1600-tallet ble de også laget i klart glass. </p><p>En del stangenglass er optisk dekorerte i tillegg til å ha pålagt dekor i form av vannrette glassbånd, pålagte knopper eller dyrehoder i glass. De yngre glassene kan være dekorert med emaljefarge.'
	history_image_text = ''
	return render_to_response('stangen.html', locals())
	
def HistoryVenetianskeglass(request):
	history_title = 'Venetianske glass'
	history_content = '<p>Venetianske drikkeglass, eller glass laget i de venetianske stil (Facon de Venice), er laget av helt klar glassmasse. Glassene har gjerne meget tynnblåst gods i klokken. Det er eksempler på venetianske glass med gods som er mindre enn 1 mm tykt.</p><p> Venetianske luksusglass ble ikke bare laget i Venezia, fra 1500-tallet ble de også laget i Nederland av venetianske glassmestrer, og de dannet forbilde for europeiske glassprodusenter frem til 1600-tallet. De flotte, fantasifulle glassene kunne ha en verdi som tilsvarte fem ”vanlige” vinglass og de var populære gaver mellom kongelige og adelige i Europa.</p><p> I den nordlige delen av Bryggen og i Vinkjelleren er det bare gjort få funn av disse glasstypene. Som ellers i nordiske funn er det tale om glass som er laget i den ”ventianske stil”, de kommer altså ikke fra selve Venezia.</p> <p>De venetianske glasstypene finnes i mange former. Her viser vi tre forskjellige slag som er funnet i Bergen: isglass, stettglass med vingedekor og slangestettglass, samt filigransglass.</p> <p><div class="link_thumb3"><a href ="/history/venetianske-glass/isglass/"> <img src="/media/glass/is_thumb.jpg" border="none"title="Gå til Isglass"/></a><br/>Isglass</div><div class="link_thumb3"><a href ="/history/venetianske-glass/stettglass/"> <img src="/media/glass/stett_thumb.jpg" border="none"title="Gå til Stettglass"/></a><br/>Stettglass</div><div class="link_thumb3"><a href ="/history/venetianske-glass/filigranglass/"> <img src="/media/glass/fili_thumb.jpg" border="none"title="Gå til Filigranglass"/></a><br/>Filigranglass</div></p>'
	history_image_text = ''
	return render_to_response('venetianske-glass.html', locals())
	
def HistoryVenetianskeglassIsglass(request):
	history_title = 'Isglass'
	history_content = '<div id="about_venetianske"><p>Isglass har fått sitt navn fordi glassets overflate ser ut som knust is. Isglass var gjerne 8–20 cm høye. De finnes både i stettform og i begerform som på rekonstruksjonstegningen. Fra Bergen kjenner vi bare begerformene.</p><p>Isglass ble produsert fra 1500-tallet.</p> <p>Bunnfragmentet øverst til venstre er ca. 3,5 cm høyt (BRM 0/35145), det er funnet i den nordlige delen av Bryggen.</p><p> I midten ser vi skår av isglass funnet på Bryggen.</p><p>Til høyre ser vi en rekonstruksjon av skårene fra isglasset.</p></div>'
	history_image = '<img src="/media/glass/isglass.jpg" border="none" title="Isglass"  />'
	return render_to_response('isglass.html', locals())
	
def HistoryVenetianskeglassStettglass(request):
	history_title = 'Stettglass med vinge- eller slangedekor'
	history_content = '<div id="about_venetianske"><p>Stettglass med vingedekor eller slangedekor, har som navnet forteller en vinge eller en slange festet på stetten. Disse stettglassene regnes blant de flotteste av alle venetianske luksusglass. De var 15-20 cm høye.</p><p>Stettglass med vinge- eller slangedekor ble laget fra 1500-tallet men hadde sin glansperiode på 1600-tallet. Vi har bare funnet få skår av stettglass med vinge- eller slangedekor i Bergen.</p><p>På glasset til venstre (B 6388h) er mye av klokken bevart. Klokken er av svært tynnblåst klart glass. Stetten er omkranset av ormer som slynger seg rundt hverandre. Dette er detaljer i blått glass. Stetten er i klart glass med en stripe hvitt opak glass i midten. Dette skåret er funnet i Vinkjelleren. Det er ca. 11,0 cm høyt.</p><p>I midten (BRM 0/32405) sees en del av en blå vinge og den klare stetten med en hvit opak spiral inni. Fragmentet er 1,7 cm langt. Det er fra den nordlige delen av Bryggen.</p><p>Til høyre sees en rekonstruksjon av et slangestett.</p></div>'
	history_image = '<img src="/media/glass/stettglass.jpg" border="none" title="Stettglass"  />'
	return render_to_response('stettglass.html', locals())
	
def HistoryVenetianskeglassFiligranglass(request):
	history_title = 'Filigranglass '
	history_content = '<div id="about_venetianske"><p>Filigranglass er klart men har tynne, ofte hvite, opake glasstråder innsmeltet i glassmassen.</p><p>Filigranglass var særlig populære som rødvinsglass, da fargen på vinen fremhevet glassets dekor. Filigranteknikken ble også brukt til å lage glassfat og -boller.</p><p> Begre i filigran er gjerne 10-20 cm høye. Filigranglass ble laget fra 1500-tallet. Vi har bare få skår av filigranbegre fra Bergen.</p><p>Fragmentet av filigranglasset på bildet til venstre er ca. 2,0 cm langt (BRM 0/34357). Det er en del av foten til et beger i klart glass med hvite opake glasstråder. Skåret er fra den nordlige delen av Bryggen.</p><p>Til høyre sees en rekonstruksjon av filigranglasset som viser fragmentets plassering.</p></div>'
	history_image = '<img src="/media/glass/filigranglass.jpg" border="none" title="Filigranglass"  />'
	return render_to_response('filigranglass.html', locals())
	
def HistoryAndretyperglass(request):
	history_title = 'Andre typer glass før 1600'
	history_content = '<p>Her presenterer vi diverse glass fra tiden før 1600-tallet</p><p><div class="link_thumb3"><a href ="/history/andretyperglass/fadenrippenbecher/"> <img src="/media/glass/faden_thumb.jpg" border="none"title="Gå til Fadenripperbecher"/></a><br/>Fadenripperbecher</div><div class="link_thumb3"><a href ="/history/andretyperglass/blaattbeger/"> <img src="/media/glass/paalagt_thumb.jpg" border="none"title="Gå til Blått beger"/></a><br/>Blått beger</div><div class="link_thumb3"><a href ="/history/andretyperglass/karaffel/"> <img src="/media/glass/karaffel_thumb.jpg" border="none"title="Gå til Karaffel i blått glass"/></a><br/>Karaffel</div><div class="link_thumb3"><a href ="/history/andretyperglass/lureglass/"> <img src="/media/glass/lure_thumb.jpg" border="none"title="Gå til Lureglass"/></a><br/>Lureglass</div></p> '
	history_image_text = ''
	return render_to_response('andretyperglass.html', locals())
	
def HistoryAndretyperglassFadenrippenbecher (request):
	history_title = 'Fadenrippenbecher '
	history_content = '<div id="about_glass_faden"><p>Fadenrippenbecher er et begerglass av helt klart glass. Det har fått sitt navn av de avlange glassribbene som går nedover glassets sider. Det kan være blå glasstråder langs munningsranden, og det er gjerne små blå glassdråper på ribbene. Dråpene er lagt på begeret ved at en viklet en blå glasstråd rundt begeret da det var nesten ferdigblåst. Når man deretter blåste glasset ytterligere opp ble glasstrådende hengende på ribbene som små dråper.</p><p>Glassene er oftest mellom 10-15 cm høye, men finnes i en høyde på opp til 20 cm.</p><p>Fadenrippenbecher ble produsert fra slutningen av 1200-tallet i Böhmen i det nåværende Tsjekkia. Senere på 1300-1400-tallet ble de også laget i nåværende Tyskland.</p><p>Vi har bare få skår av denne glasstypen i Bergen.</p><p>Fadenrippen-skåret på bildet er ca. 5,0 cm langt (BRM 0/5571). Det er funnet i den nordlige delen av Bryggen i lag som kan dateres bredt til midten av 1300-tallet.</p></div>'
	history_image_text = ''
	history_image = '<img src="/media/glass/fadenrippenbecher2.jpg" border="none" title="Fadenrippenbecher - (BRM 0/5571) og rekonstruksjon"  />'

	return render_to_response('fadenrippenbecher.html', locals())
	
def HistoryAndretyperglassBlaattbeger (request):
	history_title = 'Blått beger'
	history_content = '<div id="about_glass_faden"><p>Blått beger med fot av glasstråder og klokke med pålagt bånddekor. Når og hvor dette glasset er laget vet vi ikke. Det er det eneste glasset av denne typen funnet under utgravningene i den nordlige delen av Bryggen og i Vinkjelleren.</p><p>Fragmentet er ca. 8,5 cm høyt (BRM 0/70465), det er funnet i lag bredt datert til "1500-tallet eller yngre".</p></div> '
	history_image_text = ''
	history_image = '<img src="/media/glass/blaattbeger.jpg" border="none" title="Blått beger - (BRM 0/70465)"  />'
	return render_to_response('blaattbeger.html', locals())
	
def HistoryAndretyperglassKaraffel (request):
	history_title = 'Karaffel i blått glass'
	history_content = '<div id="about_glass_faden"><p>Karaffel i blått glass med pålagt bånddekor (BRM 0/57842). Karafler ble en del av bordtøyet i rike husholdninger fra 1500-tallet.</p><p>Fragmentet er ca. 7,0 cm høyt.</p><p>Under fragmentet sees en rekonstruksjon av karaffelen.</p></div>'
	history_image = '<img src="/media/glass/blaakaraffel2.jpg" border="none" title="Blå karaffel - (BRM 0/57842) og rekonstruksjon"  />'
	return render_to_response('karaffel.html', locals())

def HistoryAndretyperglassLureglass (request):
	history_title = 'Lureglass'
	history_content = '<div id="about_glass_faden"><p>Glasstøvel: "Trick glass" (lureglass) er glass som er laget som en del av tilbehør til drikkeleker.</p><p> Her ser vi bunnen av et glass som var formet som en støvel. Når man drakk av støvelen fra den riktige vinkel gikk det greit, men drakk man fra feil fikk man vinen over seg.</p><p> Disse støvlene ble laget fra 1500-1600-tallet og fremover.</p><p>Fragmentet på bildet er ca. 3 cm høyt over ”tåen” (B6388d). Fragmentet av støvelen er funnet i Vinkjelleren og er det eneste eksemplar vi kjenner fra Bergen (B 6388d).</p><p>Under fragmentet sees en rekonstruksjon av støvelen.</p></div> '
	history_image = '<img src="/media/glass/glasstovel.jpg" border="none" title="Bunn av glasstøvelen og rekonstruksjon"  />'
	history_image_text = ''
	return render_to_response('lureglass.html', locals())
	
def HistoryNyglassmote (request):
	history_title = 'Ny glassmote fra England og Tyskland'
	history_content = '<p>Fra 1600-tallet av blir England og Tyskland de ledende glassprodusenter i Europa. Moten skifter. Med utviklingen av kritt og blyglass, som er utgangspunkt for dagens krystallglass, forandres dekoren på drikkeglass radikalt. En går nesten helt vekk fra pålagt glassdekor. I stedet begynner man å slipe og gravere glassene for å få ulike effekter. Man bruker også luftbobler i glassmasen som dekoreffekt. Farget glass blir populært. </p><p>Den nye moten fra England og Tyskland er i høy grad utgangspunkt for dagens former. Eksemplene som vises her er bare et lite utvalg av det store mangfold av typer som finnes i Bergensmaterialet.</p><p><div class="link_thumb3"><a href ="/history/nyglassmote/tumbler/"> <img src="/media/glass/slipt_thumb.jpg" border="none"title="Gå til Tumbler"/></a><br/>Tumbler</div><div class="link_thumb3"><a href ="/history/nyglassmote/balusterstett/"> <img src="/media/glass/balur_thumb.jpg" border="none"title="Gå til Balurstett"/></a><br/>Balurstett</div><div class="link_thumb3"><a href ="/history/nyglassmote/pokal/"> <img src="/media/glass/pokal_thumb.jpg" border="none"title="Gå til Pokal"/></a><br/>Pokal</div><div class="link_thumb3"><a href ="/history/nyglassmote/blaattbegerhvitdekor/"> <img src="/media/glass/paadek_thumb.jpg" border="none"title="Gå til Blått beger med hvit dekor"/></a><br/>Blått beger</div><div class="link_thumb3"><a href ="/history/nyglassmote/opak/"> <img src="/media/glass/opak_thumb.jpg" border="none"title="Gå til Opak"/></a><br/>Opak</div></p> '
	history_image_text = ''
	return render_to_response('nyglassmote.html', locals())
	
def HistoryNyglassmoteTumbler (request):
	history_title = 'Tumbler'
	history_content = '<div id="about_glass_tumbler"><p>Tumbler er et glass uten stett, det er oftest i klart glass. Fra den nordlige delen av Bryggen har vi likevel enkelte blå/lilla og grønne eksemplarer. </p><p>Tumbleren er ofte slipt eller gravert, men klokken kan også være helt glatt. Glassveggene er rettlinjete og godset er gjerne tykkere enn på stettglass. Det var nødvendig med tykk klokke når en skulle slipe eller gravere. Klokken går ned i foten, og fot og klokke går i ett uten noe skarpt skille. Tumbleren er vanligvis under 10 cm høy. Den ble laget fra 1700-tallet av.</p><p> Her sees fragment av to tumblere. Glasset til venstre har slipte ”tommelfingermerker”. Fragmentet er ca. 4,0 cm høyt (BRM 0/3131/1). Glasset til høyre har et gravert mønster. Fragmentet er ca. 4,5 cm høyt (BRM 0/3131/2).</p><p> Begge glassene er funnet i den nordlige delen av Bryggen. </p></div> '
	history_image_text = ''
	history_image = '<img src="/media/glass/tumbler_3.jpg" border="none" title="Tumbler - (BRM 0/3131/1 og BRM 0/3131/2) og rekonstruksjon"  />'
	return render_to_response('tumbler.html', locals())

def HistoryNyglassmoteBalusterstett (request):
	history_title = 'Balusterstett'
	history_content = '<div id="about_glass_baluster"><p>Glass med balusterstett er et klart drikkeglass. Typen finnes i mange varianter, men det er karakterisk at stetten likner en søyle. Stetten er slipt og kan være dekorert med en luftboble inni selve stetten. Glassene er veldig lik dagens slipte vinglass i krystall. </p><p>Stettglasset her er av schlesisk form, inspirert av barokkens arkitektur (B 6583). Det har fire profiler slipt inn i stetten og ingen luftblære. Det er en av mange varianter av glass med balusterstett, som kom i produksjon på 1600-tallet. Stettglass av schlesisk form var en av de mer populære formene på Bryggen og i Vinkjelleren.</p><p> Glasset på bildet er funnet i Vinkjelleren. Fragmentet er ca. 11 cm høyt.</p> </div>'
	history_image_text = ''
	history_image = '<img src="/media/glass/balusterstett_2.jpg" border="none" title="Glass med balusterstett - (B 6583) og rekonstruksjon"  />'
	return render_to_response('balusterstett.html', locals())

def HistoryNyglassmotePokal (request):
	history_title = 'Pokal'
	history_content2 = '<div id="about_glass_pokal"><p>Pokalen er i prinsippet et høyt og kraftig baluseterstettglass. Stetten på en pokal skal støtte en tung klokke og ofte også et lokk. </p><p>Pokalen ble laget som felles drikkeskål, som skulle sendes rundt bordet ved festlige anledninger. Fellesskålskikken forsvant i Europa utover 1700-tallet, men holdt seg lenger i Norge. Nøstetangen, Norges første glassverk (1741-1777), sendte en av sine første pokaler til hoffet i København. Den pokalen var 60 cm høy. </p><p>Pokalene var mer prangende enn de vanlige vinglassene. Vi har bare skår av et fåtall pokaler fra utgravningene i den nordlige delen av Bryggen. </p><p>Pokalen på bildet minner om et slipt balusterstettglass, men er større og kraftigere. Fragmentet er ca. 13,5 cm høyt, og fra den nordlige delen av Bryggen. Denne pokalen er sannsynligvis ikke norskprodusert (BRM 0/13054). </p></div> '
	history_image_text = ''
	history_image = '<img src="/media/glass/pokal_2.jpg" border="none" title="Pokal - (BRM 0/13054) og rekonstruksjon"  />'
	return render_to_response('pokal.html', locals())

def HistoryNyglassmoteBlaattbegerhvitdekor (request):
	history_title = 'Blått begerglass med hvit dekor '
	history_content = '<div id="about_glass_blaatt"><p>Blått begerglass med påmalt mønster i emaljefarge. Av engelske og tyske paralleller ser vi at disse begrene kan være svært farge- og detaljrike i det påmalte motivet. Eksemplaret fra den nordlige delen av Bryggen (BRM 0/220) har nok vært  enklere. Emaljefargen er i dag gullig, som på rekonstruksjonstegningen, men kan gjerne ha vært hvit opprinnelig.</p><p>Bunnskåret er ca. 2,5 cm høyt. </p><p>Begertypen ble laget fra sent på 1500-tallet og opp gjennom 1600-tallet.</p></div> '
	history_image_text = ''
	history_image = '<img src="/media/glass/blaatthvit_2.jpg" border="none" title="Blått beger med hvit dekor - (BRM 0/13054) og rekonstruksjon"  />'
	return render_to_response('blaattbegerhvitdekor.html', locals())

def HistoryNyglassmoteOpak (request):
	history_title = 'Opak hvitt glass'
	history_content = '<div id="about_glass_opak"><p>Det opak-hvite glasset er en imitasjon av kinesisk porselen, som var dyrere enn glass. Man begynte å imitere porselen på 1500-tallet i Venezia. Imitasjonen nådde sitt høydepunkt i Europa på 1700-tallet.</p><p>Her ser vi bunnen av ett opak hvitt beger eller av en kopp. På tegningen ser vi hvordan begeret kan ha vært formet. Det har muligens hatt påmalt dekor, kanskje et landskapsmotiv. </p><p>Fragmentet er 0,8 cm høyt. Det er funnet i den nordlige delen av Bryggen. Rekonstruksjonstegningen viser et beger, men skåret kan også stamme fra en kopp. </p></div> '
	history_image_text = ''
	history_image = '<img src="/media/glass/opak_2.jpg" border="none" title="Opak - (BRM 0/32282) og rekonstruksjon"  />'
	return render_to_response('opak.html', locals())
	
def HistoryReferanser (request):
	history_title = 'Videre lesing og referanser'
	history_content = '<p>Blumgartner, Erwin og Krueger, Ingeborg 1988. Phönix aus Sand und Asche. Glas des Mittelalters. Tyskland.</p><p>Haggrén, Georg 1999. Skål! Glassskärvor från medeltiden. Glaskärl och deras ägere i det medeltida Nordeuropa. Aboa Vetus & Ars Nova. Turku. ISBN 951-97648-3-6</p><p>Haggrén, Georg  and Hedvika Sedlácková 2007. Ribbed beakers with applied glass threads in Europe. Památky archaeologické XCVIII, 2007. S. 185-250. </p><p>Henkes, Harold E. 1994. Glas zonder glans. Glass without Gloss. Rotterdam Papers 9. Nederland.</p><p>Høie, Kristine 2006. Drikkeglass fra brygge-utgravningen fra 1170-1702. Upublisert hovedfagsoppgave i arkeologi. Universitetet i Bergen våren 2006.</p></p>'
	history_image_text = ''
	history_image = ''
	return render_to_response('lesningogreferanser.html', locals())

def om (request):   
    om_title = 'Om utstillingen'
    om_content = '<p>Glassene som presenteres i denne utstillingen er fra Middelaldersamlingen, De kulturhistoriske samlinger, Unversitetsmuseet i Bergen, Universitetet i Bergen. </p><p>Glassutstillingen har vært et pilotprosjekt for Bergen Museum, som ønsket å utforske potensialet i nettbasert forskningsformidling av avhandlingsarbeid med empiriske basis i materiale fra museets samlinger. Tanken var at noen arkeologiske funn egner seg spesielt godt for formidling gjennom nettutstillinger. Det gjelder gjenstander som er svært fragmenterte og umiddelbart unnselige – som for eksempel glassbiter. Denne type funn kommer til sin rett på foto, gjerne i forstørrelse, slik at man kan få med seg viktige detaljer. </p><p>Glass fra middelalder og nyere tid er et tema som hittil har vært lite utforsket innen norsk arkeologi. Kristine Høies hovedoppgave i arkeologi ”Drikkeglass fra brygge-utgravningen fra 1170–1702” fra Arkeologisk institutt (I dag AHKR) Universitetet i Bergen (2006) har gjort det mulig å gi bildet av arkeologiske glass som presenteres her. </p><p>Utstillingen er laget ved De kulturhistoriske samlinger, Bergen Museum UiB i samarbeid med Institutt for informasjons- og medievitenskap UiB. Universitetsfondet har gitt støtte til Kristine Høies engasjement i forbindelse med prosjektet.</p><p><b>Bidragsytere</b></p><p>Gitte Hansen, førsteamanuensis, Middelaldersamlingen, De kulturhistoriske samlinger Bergen Museum: prosjektleder, redaktør.</p><p>Kristine Høie, Cand. Philol, arkeolog: tekstgrunnlag og tilrettelegging av glassfunnene for utstilling på nett.</p><p>Georg Haggrén, dosent, Universitetet i Helsingfors: Ekstern glassekspert.</p><p>Svein Skare, fotograf, Bergen Museum: Foto.</p><p>Ellinor Hoff, tegner, De kulturhistoriske samlinger, Bergen Museum: Rekonstruksjonstegning, akvarell.</p><p>Tanja Flåan, masterstudent, Institutt for informasjons- og medievitenskap: Webdesign og produksjon.</p><p>Dag Elgesem, professor, Institutt for informasjons- og medievitenskap: Veileder for Tanja Flåan.</p><p>Csaba Veres, førsteamanuensis, Institutt for informasjons- og medievitenskap: tekniskkonsulent, Django.</p>'
    return render_to_response('om.html', locals())
	
def kontakt(request):   
    kontakt_title = 'Kontakt'
    kontakt_content = '<p>Unversitetsmuseet i Bergen, e-post: post@um.uib.no</p>'
    return render_to_response('kontakt.html', locals())
