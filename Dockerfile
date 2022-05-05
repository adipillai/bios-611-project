FROM rocker/verse 
MAINTAINER Adi Pillai <adi.pillai@gmail.com>
RUN R -e "install.packages('tidyverse')"
RUN R -e "install.packages('shiny')"
RUN R -e "install.packages('corrplot')"
RUN R -e "install.packages('rmarkdown')"
RUN R -e "install.packages('markdown')"
RUN R -e "install.packages('tinytex'); tinytex::install_tinytex(dir='/opt/tinytex')"
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y python3-pip
RUN pip3 install tensorflow pandas plotnine
