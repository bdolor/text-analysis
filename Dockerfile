FROM jupyter/datascience-notebook

# Add RUN statements to install packages as the $NB_USER defined in the base images.

# Add a "USER root" statement followed by RUN statements to install system packages using apt-get,
# change file permissions, etc.

# If you do switch to root, always be sure to add a "USER $NB_USER" command at the end of the
# file to ensure the image runs as a unprivileged user by default.

RUN rmdir /home/$NB_USER/work

COPY ./src/text-analysis_START_HERE.ipynb /home/$NB_USER/
COPY ./src/survey.csv /home/$NB_USER/

USER $NB_UID

RUN conda install --quiet --yes nltk=3.4.*

RUN python -m nltk.downloader stopwords -d /home/$NB_USER/nltk_data/ && \
    python -m nltk.downloader wordnet -d /home/$NB_USER/nltk_data/ &&\
    python -m nltk.downloader sentiwordnet -d /home/$NB_USER/nltk_data/ && \
    python -m nltk.downloader averaged_perceptron_tagger -d /home/$NB_USER/nltk_data/ && \
    python -m nltk.downloader punkt -d /home/$NB_USER/nltk_data/

USER root

RUN rm /home/$NB_USER/nltk_data/corpora/*.zip

EXPOSE 8888

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID