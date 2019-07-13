# Text Analysis in a box

Text Analysis is a community maintained Jupyter Docker Stack image

## Local Development
### Conda package manager and virtual env
- `conda create --name text-analysis anaconda`
- `conda activate text-analysis`
- `conda install --file requirements.txt`

### Docker (build an image and launch a notebook)
- `docker build -t docker/text-analysis:1.0.0 .`
- `docker run -p 8888:8888 docker/text-analysis:1.0.0`