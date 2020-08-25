# Orthogonal Matching Pursuit

A *Greedy Algorithm* that aims to find the sparsest solution (i.e., one with the fewest non-zero entries) to
<img src="https://latex.codecogs.com/svg.latex?\inline&space;A\mathbf{x}=\mathbf{y}" title="A\mathbf{x}=\mathbf{y}" />,
where the full row rank matrix <img src="https://latex.codecogs.com/svg.latex?\inline&space;A&space;\in&space;\mathbb{R}^{m&space;\times&space;n}" title="A \in \mathbb{R}^{m \times n}" />
with <img src="https://latex.codecogs.com/svg.latex?\inline&space;m&space;<&space;n" title="m < n" /> generates an underdetermined system.
The optimization problem is described as:

<img src="https://latex.codecogs.com/svg.latex?\min_{\mathbf{x}}&space;\left&space;\|&space;\mathbf{x}&space;\right&space;\|_{0}&space;\quad&space;\textrm{s.t.}&space;\quad&space;A\mathbf{x}=\mathbf{y}" title="\large \center \min_{\mathbf{x}} \left \| \mathbf{x} \right \|_{0} \quad \textrm{s.t.} \quad A\mathbf{x}=\mathbf{y}" />

OMP works by first finding the support:

<img src="https://latex.codecogs.com/svg.latex?\inline&space;S:supp(\mathbf{x})=\{&space;i:x(i)\neq&space;0&space;\}" title="S:supp(x)=\{ i:x(i)\neq 0 \}" />

of the solution, and then solving the least squares problem:

<img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}_{S}&space;=&space;A_{S}^{\dag}\mathbf{y}" title="\mathbf{x}_{S} = A_{S}^{\dag}\mathbf{y}" />
corresponding to the support set.

### MATLAB function:
```matlab
x = OMP(A, y, tolerance)
```

## Performance Guarantee
OMP is guaranteed to provide the exact solution (zero tolerance) if this solution exists, and satisfies:

<img src="https://latex.codecogs.com/svg.latex?\|\mathbf{x}\|_{0}<&space;\frac{1}{2}\left&space;(&space;1&plus;\frac{1}{\mu(A)}&space;\right&space;)" title="\|x\|_{0}< \frac{1}{2}\left ( 1+\frac{1}{\mu(A)} \right )" />

where the mutual coherence <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mu(A)" title="\mu(A)" /> measures
the dependence between different columns of the system matrix, and is defined as:

<img src="https://latex.codecogs.com/svg.latex?\mu(A)=\underset{\underset{i\neq&space;j}{1\leq&space;i,j&space;\leq&space;n}}{max}&space;\frac{\mathbf{a}_{i}^{T}&space;\mathbf{a}_{j}}{\|\mathbf{a}_{i}\|_2&space;\|\mathbf{a}_{j}\|_2}" title="\mu(A)=\underset{\underset{i\neq j}{1\leq i,j \leq n}}{max} \frac{\mathbf{a}_{i}^{T} \mathbf{a}_{j}}{\|\mathbf{a}_{i}\|_2 \|\mathbf{a}_{j}\|_2}" />

### Reference:
Bruckstein, Alfred M., David L. Donoho, and Michael Elad.
["From sparse solutions of systems of equations to sparse modeling of signals and images."](http://www.geintra-uah.org/system/files/review_paper_siam_review.pdf)
*SIAM review* 51.1 (2009): 34-81.
