FROM kernsuite/base:4
RUN docker-apt-install python-setuptools python-numpy python-scipy python-astropy python-astro-kittens python-astlib python-pip
ADD . /code
RUN pip install /code
RUN /usr/local/bin/tigger-convert /code/test/3C147-HI6.refmodel.lsm.html /tmp/output.txt
RUN /usr/local/bin/tigger-make-brick /code/test/3C147-HI6.refmodel.lsm.html /code/test/bla.fits
RUN /usr/local/bin/tigger-tag /code/test/3C147-HI6.refmodel.lsm.html gijs
RUN /usr/local/bin/tigger-restore -f /code/test/bla.fits /code/test/3C147-HI6.refmodel.lsm.html
RUN echo "the next command should not print 1"
RUN wc -l /tmp/output.txt
