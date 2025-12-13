# CaΣoS-Example package

This repository contains tutorials, examples and implementations from paper or textbooks. The purpose is to provide an easy on-boarding with the CaΣoS  toolbox, a nonlinear optimization-oriented sum-of-squares toolbox based on the symbolic framework of CasADi.

### Installation
- For the pre-computation step we make use of
  CaΣoS [1] v1.0.0-rc. The used version can be found
  in the repository. After cloning this repository, get the submodule
  CaΣoS with
  ```
  git clone https://github.com/iFR-ACSO/TAC25-Inf-MPC.git TAC-Inf-MPC
  cd TAC-Inf-MPC
  git submodule update --init --recursive
  ```


### Quick links

- [Getting started](https://github.com/ifr-acso/casos/wiki#getting-started)
- Available [conic solvers](https://github.com/ifr-acso/casos/wiki#conic-solvers)
- Convex and nonconvex [sum-of-squares optimization](https://github.com/ifr-acso/casos/wiki/sum%E2%80%90of%E2%80%90squares-optimization)
- Supported [vector, matrix, and polynomial cones](https://github.com/ifr-acso/casos/wiki/cones)
- Some [practical tipps](https://github.com/ifr-acso/casos/wiki/practical-sos-guide) to sum-of-squares
- [Transitioning](https://github.com/ifr-acso/casos/wiki/transitioning-from-other-toolboxes) from other toolboxes
- Example [code snippets](https://github.com/ifr-acso/casos/wiki/numerical-examples)

### Cite us

If you use CaΣoS, please cite us:

> T. Cunis and J. Olucak, ‘CaΣoS: A nonlinear sum-of-squares optimization suite’, in _2025 American Control Conference_, (Boulder, CO), pp. 1659–1666, 2025 doi: [10.23919/ACC63710.2025.11107794](https://doi.org/10.23919/ACC63710.2025.11107794).

<details>

<summary>Bibtex entry</summary>

```bibtex
@inproceedings{Cunis2025acc,
	author = {Cunis, Torbjørn and Olucak, Jan},
	title = {{CaΣoS}: {A} nonlinear sum-of-squares optimization suite},
	booktitle = {2025 American Control Conference},
	address = {Boulder, CO},
	year = {2025},
	pages = {1659--1666},
	doi = {10.23919/ACC63710.2025.11107794},
}
```

</details>

----

![casos](https://github.com/iFR-ACSO/casos/assets/14878869/ec1bd5f4-0fe5-41d4-abe6-518f1afb74ff)

### Folder Structure

```text
Getting Started/
├── CBF_CLF_QP         # CBF-CLF synthesis and simulation

```

### Citation
Please cite the paper as 
```
@misc{olucak2025safebydesignapproximatenonlinearmodel,
      title={Safe-by-Design: Approximate Nonlinear Model Predictive Control with Real Time Feasibility}, 
      author={Jan Olucak and Arthur Castello B. de Oliveira and Torbjørn Cunis},
      year={2025},
      eprint={2509.22422},
      archivePrefix={arXiv},
      primaryClass={math.OC},
      url={https://arxiv.org/abs/2509.22422}, 
}
```
