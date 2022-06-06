# Set up tabula python

1. Install Java. 

    - From Oracle: <https://www.java.com/en/>

    - On MacOS with [Homebrew](https://brew.sh/) in the Terminal: `brew install java`. *Note*: you might need to follow the instructions to `symlink` the installed Java version.

2. Install Python

    - From Python.org: <https://www.python.org/downloads/>

    - On MacOS with [Homebrew](https://brew.sh/) in the Terminal: `brew install python3`

    - Note where Python is installed with `which python3`. You will need this for step 4.

3. Install Tabula

    - In the Terminal: `pip3 install tabula-py`

4. In R, install the *reticulate* package. This package allows you to call Python functions from R.

    - `xfun::pkg_attach2("reticulate")`

    - `use_python("DIRECTORY OF PYTHON INSTALLATION FROM STEP 2")`

For an example of how to use tabula with reticulate in R, see the *tabula-reticulate-example.R*.