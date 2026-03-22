# Orthogonal Matching Pursuit

A *Greedy Algorithm* that aims to find the sparsest solution (i.e., one with the fewest non-zero entries) to $A\mathbf{x}=\mathbf{y}$, where the full row rank matrix $A \in \mathbb{R}^{m \times n}$ with $m < n$ generates an underdetermined system.
The optimization problem is described as:

$$\min_{\mathbf{x}} \lVert \mathbf{x} \rVert_{0} \quad \rm{s.t.} \quad A\mathbf{x}=\mathbf{y}$$

OMP works by first finding the support:

$$S:\rm{supp}(\mathbf{x})=\{ i : \mathbf{x}[i]\neq 0 \}$$

of the solution, and then solving the least squares problem:

$$\mathbf{x}_{S} = A_{S}^{\dagger}\mathbf{y}$$

corresponding to the support set.

### MATLAB function:

```matlab
x = OMP(A, y, tolerance)
```

## Performance Guarantee

OMP is guaranteed to provide the exact solution (zero tolerance) if this solution exists, and satisfies:

$$\lVert\mathbf{x}\rVert_{0}< \frac{1}{2} \left( 1+\frac{1}{\mu(A)} \right)$$

where the mutual coherence $\mu(A)$ measures
the dependence between different columns of the system matrix, and is defined as:

$$\mu(A)=\underset{\underset{i\neq j}{1\leq i,j \leq n}}{\max} \frac{\mathbf{a}_{i}^{T} \mathbf{a}_{j}}{\lVert\mathbf{a}_{i}\rVert_2 \lVert\mathbf{a}_{j}\rVert_2}$$

### Reference:

Bruckstein, Alfred M., David L. Donoho, and Michael Elad.
["From sparse solutions of systems of equations to sparse modeling of signals and images."](http://www.geintra-uah.org/system/files/review_paper_siam_review.pdf)
*SIAM review* 51.1 (2009): 34-81.
