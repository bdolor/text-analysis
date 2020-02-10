FROM jupyter/tensorflow-notebook

# Add RUN statements to install packages as the $NB_USER defined in the base images.

# Add a "USER root" statement followed by RUN statements to install system packages using apt-get,
# change file permissions, etc.

# If you do switch to root, always be sure to add a "USER $NB_USER" command at the end of the
# file to ensure the image runs as a unprivileged user by default.

RUN rmdir /home/$NB_USER/work

USER $NB_UID

RUN pip install --upgrade --quiet tensorflow==2.1.0 tensorflow-probability

USER root

COPY ./src/*.ipynb /home/$NB_USER/

EXPOSE 8888

VOLUME /data

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID