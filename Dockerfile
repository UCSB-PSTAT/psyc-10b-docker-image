FROM ucsb/r-base:v20210120.1

LABEL maintainer="Patrick Windmiller <windmiller@pstat.ucsb.edu>"

USER root

#-- RSTAN
#-- install rstan reqs
RUN R -e "install.packages(c('inline','gridExtra','loo'))"
#-- install rstan
RUN R -e "dotR <- file.path(Sys.getenv('HOME'), '.R'); if(!file.exists(dotR)){ dir.create(dotR) }; Makevars <- file.path(dotR, 'Makevars'); if (!file.exists(Makevars)){  file.create(Makevars) }; cat('\nCXX14FLAGS=-O3 -fPIC -Wno-unused-variable -Wno-unused-function', 'CXX14 = g++ -std=c++1y -fPIC', file = Makevars, sep = '\n', append = TRUE)"
RUN R -e "install.packages(c('ggplot2','StanHeaders'))"
RUN R -e "packageurl <- 'http://cran.r-project.org/src/contrib/Archive/rstan/rstan_2.19.3.tar.gz'; install.packages(packageurl, repos = NULL, type = 'source')"

#-- ggplot2 extensions
RUN R -e "install.packages(c('GGally','ggridges','viridis'))"

#-- Misc utilities for psy 10b Summer Sessions A
RUN R -e "install.packages(c('ggplot2','lsr','effsize','dplyr','tidyr','psych','data.table'))"

#-- Install effectsize package Requested by Vinne Wu 6-30-2021 (summer sessions A requirement)
RUN R -e "install.packages(c('effectsize'))"

#-- Install R Kernel for Jupyter (summer sessions A requirement)
RUN R -e "install.packages(c('IRkernel'))"


USER $NB_USER

RUN R -e "IRkernel::installspec()"
