# Tutorial `numpy` for ML@LPC

This repository hosts the material of a tutorial to `numpy` in the context of a working group at [Laboratoire de Physique de Clermont](http://clrwww.in2p3.fr/) related to machine learning and its application in (high energy) physics. This tutorial is split into three parts, trying go from first principles to current (known) limitations for High Energy Physics (HEP). A [PDF document](documentation/NumpyIntroduction_MLatLPC.pdf) containing the notes of this tutorial is also available in this repository. All notebooks can be ran in a browser using both [mybinder](https://mybinder.org/) (issue of dead kernel though) and [google Colaboratory](https://colab.research.google.com/notebooks/welcome.ipynb) (requires a google account):

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/MLatCezeaux/intro_numpy/master)
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MLatCezeaux/intro_numpy)


## 1. Introduction to `numpy`

This first part, detailed in [this notebook](section1/NumpyIntroduction.ipynb), motivates the use of `numpy` inside python and, also, why it is interesting to use python! The basic `numpy` object, `numpy.array`, is introduced emphasizing differences with usual python lists. Then the three key concepts on which `numpy` is based are presented (broadcasting, indexing/slicing, vectorization) and simple examples are given to illustrate each of them (in particular, how to get ride of *loops*). Finally, a quick tour of two important tools interfaced with `numpy` is given, namely `pandas` (*database-like* objet) and `matplotlib` (plotting package). A [notebook with exercises](section1/NumpyIntroExercise.ipynb)  is proposed to quickly practice these concepts using a electric pulse analysis.


## 2. Typical use cases in high energy physics

This second part, detailed in [this notebook](section2/GenericNumpyForHEP.ipynb), presents few typical standard computations in HEP based on multi-dimensional data using `numpy`. The playground here is a sample of 1 million random "observations", each made of ten 3D vectors (r0, ..., r9) with ri=(x,y,z). One can think of ten positions in space or ten RGB colors. First, the concept presented in the introduction are used with this `ndarray`, and then more complex computations are discussed such as. A [notebook with exercices](section2/GenericNumpyForHEP_exercise.ipynb) to practice these concepts is also available. Typical computations include:
  + combinatorics over the collection of 10 ri's
  + distances between all (ri, rj) pairs
  + distribution of |ri|^2 for only few selected r among the 10 ri ( with a criteria to be defined)
  + compute an arbitrary function of ri over just a few selected point among the 10.


## 3. Limitations and possibles workarounds

This third part, detailed in [this notebook](section3/CollisionAnalysis.ipynb), presents a realistic study of
collider data using the concept presented in the two first sections. In particular, the notion of jagged array
is introduced and the associated limitation in numpy is mitigated using a [module of numpy utils for HEP](np_utils.py). Few concreted cases are treated (such as computing invariant masses, finding the closest jet of the less isolated lepton) in order to illustrate how to use numpy for realistic event-by-event computation without explicit for loops. 