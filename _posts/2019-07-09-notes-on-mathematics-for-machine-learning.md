---
date: '2019-07-09'
latex: True
layout: post
tags:
- Machine Learning
- Math
title: 'Notes on “Mathematics for Machine Learning”'
---

I’ve started taking more MOOCs again over the past 18 months, but
haven’t been able to get in the habit of taking consistent notes. Today
I started a new one on Coursera, [Mathematics of Machine
Learning](https://www.coursera.org/specializations/mathematics-machine-learning)
offered by Imperial College London, which is a tad outside of my typical
wheelhouse of code-centric ML courses. This seemed like a good
opportunity to try to build the habit up.

Course \#1: Linear Algebra
==========================

Vectors
-------

Vector-on-vector addition and subtraction is straightforward, as are
scalar-on-vector operations. In general, we’re doing pairwise operations
(i.e., combining components in one vector with elements at the same
position in the other).

$$
\begin{bmatrix} 1 \\ 1 \end{bmatrix} + \begin{bmatrix} 1 \\ 0 \end{bmatrix} = \begin{bmatrix} 2 \\ 1 \end{bmatrix}
$$

Thank you, years of R, pandas, numpy, etc. for making these basic ones
second nature. ✌

The size, length, or magnitude of a vector is denoted as
$$\vert \mathbf{s} \vert$$ and can be calculated using the Pythagorean
theorem: we should take the square root of the sum of the squares of the
components.

$$
\mathbf{s} = \begin{bmatrix} 1 \\ 3 \\ 4 \\ 2 \end{bmatrix} \quad
|\mathbf{s}| = \sqrt{1^2 + 3^2 + 4^2 + 2^2} = \sqrt{30}
$$

Dot products are similar with about the same definition, just without
the square root:

$$
\mathbf{a} \cdot \mathbf{b} = a_1 b_1 + a_2 b_2 + \cdots + a_n b_n
$$

It’s important to remember that both of these operations return scalar
values.

Scalar projects are the size of the “shadow” of a vector onto another
vector, if we imagine the sun shining down perpendicular to the second
vector. Vector projections *are* that shadow vector. As the names imply,
scalar projects are scalars and vector projections are vectors.

![](../assets/vector-projection-1.svg)
<p class="caption">
<b>Fig. 1: </b>Vector s projected onto another vector r
</p>
The scalar projection of $$s$$ onto $$r$$ is calculated as
$$\frac{\mathbf{r} \cdot \mathbf{s}}{\vert \mathbf{r} \vert}$$ while the
vector projection is calculated as
$$\mathbf{r} \frac{\mathbf{r} \cdot \mathbf{s}}{\mathbf{r}^2}$$.

$$
\mathbf{s} = \begin{bmatrix} 10 \\ 5 \\ -6 \end{bmatrix} \quad
\mathbf{r} = \begin{bmatrix} 3 \\ -4 \\ 0 \end{bmatrix} \\
\text{Scalar Projection} = \frac{\mathbf{r} \cdot \mathbf{s}}{\vert \mathbf{r} \vert} = \frac{10}{5} = 2 \\
\text{Vector Projection} = \mathbf{r} \frac{\mathbf{r} \cdot \mathbf{s}}{\mathbf{r}^2} = \begin{bmatrix} 3 \\ -4 \\ 0 \end{bmatrix} \frac{10}{25} = \begin{bmatrix} \frac{6}{5} \\ -\frac{8}{5} \\ 0 \end{bmatrix}
$$

We can tell if two vectors are orthogonal if their dot product is zero.

Basis vectors are the “reference points” we use to describe other
vectors. They can be unit vectors or something else, but they should be
orthogonal. We can calculate new points for a vector under new basis
vectors by calculating the vector’s projection on each basis vector.

To recalculate $$\mathbf{v} = \begin{bmatrix} 10 \\ -5 \end{bmatrix}$$
using basis vectors
$$\mathbf{b}_1 = \begin{bmatrix} 3 \\ 4 \end{bmatrix}$$ and
$$\mathbf{b}_2 = \begin{bmatrix} 4 \\ -3 \end{bmatrix}$$:

$$
\mathbf{v}_{\mathbf{b}_1}' = \frac{\mathbf{b}_1 \cdot \mathbf{v}}{\mathbf{b}_1^2} = \frac{30 - 20}{9 + 16} = \frac{2}{5} \\
\mathbf{v}_{\mathbf{b}_2}' = \frac{\mathbf{b}_2 \cdot \mathbf{v}}{\mathbf{b}_2^2} = \frac{40 + 15}{16 + 9} = \frac{11}{5} \\
\mathbf{v}' = \begin{bmatrix} \frac{2}{5} \\ \frac{11}{5} \end{bmatrix}
$$

Course \#2: Multivariate Calculus
=================================

Course \#3: PCA
===============
