FROM dddlab/base-rstudio:v20200403-24905f8-94fdd01b492f
 
LABEL maintainer="Patrick Windmiller <windmiller@pstat.ucsb.edu>"

USER $NB_USER

RUN R -e "install.packages(c('WDI', 'faraway', 'boot', 'car', 'pscl', 'vcd', 'stargazer', 'effsize'), repos = 'http://cran.us.r-project.org')"
