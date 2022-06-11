# Set up tabula python

1. Install Java. 

    - From Oracle: <https://www.java.com/en/>

    - On MacOS with [Homebrew](https://brew.sh/) in the Terminal: `brew install java`. *Note*: you might need to follow the instructions to `symlink` the installed Java version.

2. Install Python

    - From Python.org: <https://www.python.org/downloads/>

    - On MacOS with [Homebrew](https://brew.sh/) in the Terminal: `brew install python3`

    - On Windows, in the Terminal (Powershell) type `python3`. This will direct you to the Microsoft Store to install Python3. 

    - Note the file path to Python with `which python3`. On Windows, use the Search to find Python3, right click to open in location to see the file path. You will need this for step 4.

3. Install Tabula

    - In the Terminal: `pip3 install tabula-py`

4. In R, install the *reticulate* package. This package allows you to call Python functions from R.

    - `xfun::pkg_attach2("reticulate")`

    - `use_python("DIRECTORY OF PYTHON INSTALLATION FROM STEP 2")`

For an example of how to use tabula with reticulate in R, see the *tabula-reticulate-example.R*.
