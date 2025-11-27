This is a Django app that implements "[Drikkeglass på Bryggen i Bergen
1300-1700](http://glass.app.uib.no)", a web-exhibition by Bergen Museum, University of Bergen.
The original author of this code is Tanja Flåan.

Announced in <https://www.uib.no/infomedia/40150/nettutstilling-om-drikkeglass>.

Described in <https://www.uib.no/universitetsmuseet/65342/drikkeglass-fra-bryggen>.

## Instructions to get it up running

Install a python with virtualenv.  If you don't already have it you can
consider installing ActivePython, <http://www.activestate.com/ActivePython/>.

Set up your own Python and activate it:

    $ virtualenv mypy
    $ source mypy/bin/activate

Install Django and other required modules:

    $ pip install -r requirements.txt

Check that the application works:

    $ cd mysite
    $ ./manage.py runserver

You should now be able to vist the app at <http://localhost:8000>.

The htdocs/ directory is a static copy of the pages reachable from the
homepage.  This is what's published under <http://glass.app.uib.no>.

To refresh the htdocs/ HTML from the Django app start the development
server as described above and then run:

    $ cd htdocs
    $ ./static-site-update

NOTE: Please don't edit files under htdocs/ directly.  Update the Django app
and then run ./static-site-update instead.  Changes done directly to the
htdocs/ directory will be overwritten.

## Hosting på AWS

Denne applikasjonen er for tiden hostet av AWS.

For å administrere, logg på AWS-konto `805684185987` (app-prod) som `ita-developer`

I AWS ligger innholdet av htdocs/ katalogen i S3-bucketen `glass.app.uib.no` i region eu-west-1.
For å få til SSL er det satt opp en CloudFront distribusjon, som plukker opp sertifikatet
fra ACM i region us-east-1, og som bruker webserveren til S3 som backend.  CloudFront kan ikke
kobles til S3 direkte fordi vi trenger 'index.html'-støtten som webserveren til S3 tilbyr.
