# dur
My Debian User Archive projects

- [ccl](https://dur.hunterwittenborn.com/packages/ccl/)
- [clasp-cl-git](https://dur.hunterwittenborn.com/packages/clasp-cl-git/) and [llvm13](https://dur.hunterwittenborn.com/packages/llvm13/)
- [cmucl](https://dur.hunterwittenborn.com/packages/cmucl/)

## Installing CLASP

First download the debian packages [llvm13][] and [clasp][]. Then install using `apt-get`.
```
apt-get install ./llvm13_13.0.0.r383356.972b6a3a3471-1_amd64.deb ./clasp-cl-git_0.4.2.r4461.g0f3d3b238-1_amd64.deb
```
If you want JupyterLab then install [miniconda][] and do the following.
```
conda install -c conda-forge jupyterlab jupyter_console
jupyter-labextension install cytoscape-clj ipysheet kekule-clj ngl-clj resizable-box-clj @jupyter-widgets/jupyterlab-manager  jupyterlab_templates
```

## Installing CLASP and CANDO

If you want JupyterLab then install [miniconda][] and do the following.
```
conda install -c conda-forge jupyterlab jupyter_console
jupyter-labextension install cytoscape-clj ipysheet kekule-clj ngl-clj resizable-box-clj @jupyter-widgets/jupyterlab-manager  jupyterlab_templates
```

[cando]: https://github.com/yitzchak/dur/releases/download/clasp-cl-git_0.4.2.r4461.g0f3d3b238-1/cando-git_0.4.2.r4461.g0f3d3b238-1_amd64.deb
[clasp]: https://github.com/yitzchak/dur/releases/download/clasp-cl-git_0.4.2.r4461.g0f3d3b238-1/clasp-cl-git_0.4.2.r4461.g0f3d3b238-1_amd64.deb
[llvm13]: https://github.com/yitzchak/dur/releases/download/llvm13_13.0.0.r383356.972b6a3a3471/llvm13_13.0.0.r383356.972b6a3a3471-1_amd64.deb
[miniconda]: https://docs.conda.io/en/latest/miniconda.html
