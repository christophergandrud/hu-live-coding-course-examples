# Set up tabula python

1. Install Java. 

    - From Oracle: <https://www.java.com/en/>

    - On MacOS with [Homebrew](https://brew.sh/) in the Terminal: `brew install java`. *Note*: you might need to follow the instructions to `symlink` the installed Java version.

2. Install Python

    - From Python.org: <https://www.python.org/downloads/>

    - On MacOS with [Homebrew](https://brew.sh/) in the Terminal: `brew install python3`

3. Install Tabula

    - In the Terminal: `pip3 install tabula-py`

4. In R, install the *reticulate* package

    - xfun::pkg_attach2("reticulate")

    - The first time you import a Python library, reticulate will ask if you want to install miniconda. Select `Y`.