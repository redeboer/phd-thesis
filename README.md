<div align="center">

[![10.13154/294-13854](https://img.shields.io/badge/DOI-10.13154%2F294--13854-informational)](https://doi.org/10.13154/294-13854)
[![LicenseL Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0)
[![Github Pages](https://img.shields.io/badge/GitHub%20Pages-121013?logo=github)](https://redeboer.github.io/phd-thesis)

# Aligning Baryons

### High-performance computations with symbolic, spin-aligned amplitude models for hadron spectroscopy

<!-- cspell:disable-next-line -->

_Dissertation zur Erlangung des Grades eines Doktors der Naturwissenschaften an der Fakultät für Physik und Astronomie der Ruhr-Universität Bochum_

</div>

> Amplitude analysis is a key technique in hadron physics, linking experimental observables to the underlying dynamics of scattering and decay processes. This thesis pursues two complementary aims: to advance the computational workflow for formulating and evaluating amplitude models and to apply these methods to baryonic decays in experimental data.
>
> On the computational side, the work introduces a novel approach in which amplitude models are first expressed symbolically in a Computer Algebra System and then automatically translated into array-oriented code for highly parallelised numerical evaluation. Implemented in the widely used dynamic language Python, this approach lowers the barrier for model development and integrates naturally with modern scientific software ecosystems. In addition to accelerating computations, the workflow produces self-documenting amplitude models that make analysis steps transparent and reproducible.
>
> On the physics side, the work establishes a consistent formulation of amplitude models for three-body decays involving final states with spin, particularly baryons, using the Dalitz-plot decomposition method. The approach is validated in two case studies. First, a polarimetry analysis of the decay $\varLambda_c \to p K^- \pi^+$, based on LHCb results, demonstrates numerical correctness to floating-point precision when benchmarked against implementations in \cxx and Julia, while enabling efficient uncertainty propagation through large-scale parallelised parameter sampling. Second, an amplitude analysis of $J/\psi \to \bar{p} K^0_S \varSigma^+$ with BESIII data shows that spin-aligned amplitude models provide an improved description of the data compared to earlier analyses that neglected spin-induced interference between topologically distinct decay chains.
>
> The results demonstrate that symbolic, spin-aligned amplitude models achieve both reliable computational performance and correct descriptions of baryonic decay data, while the self-documenting workflow ensures that the models used can be transparently inspected and reproduced.

## Installation

This project is installed and built with [Quarto](https://quarto.org). The environment is defined with [`uv`](https://docs.astral.sh/uv)

```shell
uv sync
source .venv/bin/activate
```

and common tasks and checks are run through [Poe the Poet](https://poethepoet.natn.io)

```shell
uv tool install poethepoet --python=3.13
```

```shell
poe
```

For example, to build the documentation and view a live preview while editing, run the `doclive` task:

```shell
poe doclive
```

> [!NOTE]
> On some platforms ([WSL](https://learn.microsoft.com/en-us/windows/wsl) in particular), you may need to install Chrome in the local environment after creating it with `uv sync`. You can do this [with the command](https://pypi.org/project/kaleido/1.1.0):
>
> ```shell
> kaleido_get_chrome
> ```
