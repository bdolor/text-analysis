# Text Analysis in a box

Text Analysis is a community maintained Jupyter Docker Stack image

## Local Development (Choose either conda or pip)
### Conda
- `conda create --name text-analysis anaconda`
- `conda activate text-analysis`
- `conda install --file requirements-conda.txt`

### Pip 
- `python -m venv ./venv`
- `source venv/bin/activate`
- `pip install --upgrade pip setuptools`
- `pip install -r requirements-pip.txt`

### Docker (build an image and launch a notebook)
- `docker build -t bdolor/text-analysis:2.0.0 .`
- `docker volume create nb_data`
- `docker run --rm -v $PWD/data:/source -v nb_data:/dest -w /source alpine cp /source/dataset_numeric.pickle /dest`
- `docker run -v nb_data:/data -p 8888:8888 bdolor/text-analysis:2.0.0`
