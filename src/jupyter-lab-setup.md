# Setting up R and Jupyter Lab

## Steps 

These steps are completed in your Terminal.

1. Install Python 3. There are many ways to do this. If you are on MacOS, I recommend first installing the [HomeBrew](https://brew.sh/) package manager then installing Python3: `brew install python3`.

2. Install Jupyter Lab ([instructions](https://jupyterlab.readthedocs.io/en/stable/getting_started/installation.html))

3. In R, install the *IRkernel* package and the kernel to the current R installation:

```R
install.packages('IRkernel')
IRkernel::installspec()
```

(Extra: If you also want to use Jupyter Lab in [VS Code](https://code.visualstudio.com/) you need to also install `languageserver`).

4. Launch Jupyter Lab and select R notebook. To launch Jupyter Lab type `jupyter lab` into your terminal.
