# Tutorial `numpy` for ML@LPC

This repository hosts the material of a tutorial to `numpy` in the context of a working group at [Laboratoire de Physique de Clermont](http://clrwww.in2p3.fr/) related to machine learning and its application in (high energy) physics. This tutorial is split into three parts, trying go from first principles to current (known) limitations for High Energy Physics (HEP).


## 1. Introduction to `numpy`

This first part, detailed in [this notebook](notebook_section1), motivates the use of `numpy` inside python and, also, why it is interesting to use python! The basic `numpy` object, `numpy.array`, is introduced emphasizing differences with usual python lists. Then the three key concepts on which `numpy` is based are presented (broadcasting, indexing/slicing, vectorization) and simple examples are given to illustrate each of them (in particular, how to get ride of *loops*). Finally, a quick tour of two important tools interfaced with `numpy` is given, namely `pandas` (*database-like* objet) and `matplotlib` (plotting package).


## 2. Typical use cases in high energy physics

This second part, detailed in the notebook [GenericNumpyForHEP.ipynb](GenericNumpyForHEP.ipynb), presents few typical standard computations in HEP based on multi-dimensional data using `numpy`. The playground here is a sample of 1.5 million random "observations", each made of ten 3D vectors $(r_{0}, ..., r_{9})$ with $r_{i}=(x,y,z)$. One can think of ten positions in space or ten light RGB colors. First, the concept presented in the introduction are used with this `ndarray`, and then more complex computations are discussed such as:
   + distances between all $(r_{i}, r{j})$ pairs
   + distribution of $|r_{i}|^2$ for only few selected $r$ among the 10 $r_{i}$ (defined)
   + 


## 3. Limitations and possibles workarounds
