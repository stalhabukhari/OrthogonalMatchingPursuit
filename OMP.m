%% Orthogonal Matching Pursuit
% Written by: Syed Talha Bukhari

function [x] = OMP(A, y, eps)
disp('OMP Initiated')
K               = 0;
x               = zeros(size(A, 2), 1);
res             = y - A*x;
S               = find(x~=0);
E_fn            = @(res, col) norm(res)^2 - ((transpose(col)*res)^2)/(norm(col)^2);
all_cols        = 1:size(A, 2);
error           = norm(res);
min_cols_list   = [];

while error > eps,
    K           = K+1;

    % Sweep:
    sweep_array = setdiff(all_cols, S);
    E_array     = [];
    for ind = 1:length(sweep_array),
        E_i     = E_fn(res, A(:, sweep_array(ind)));
        E_array = [E_array, E_i];
    end
    min_E       = min(E_array);
    min_E_ind   = find(E_array==min_E, 1);
    min_col     = sweep_array(min_E_ind);
    min_cols_list = [min_cols_list, min_col];

    % Update Support @k:
    S           = union(S, min_col);

    % Update x @k:
    A_S         = A(:, S);
    A_S_dag     = inv(transpose(A_S)*A_S)*transpose(A_S); % left Pseudo-inverse
    x_S         = A_S_dag*y;                           % Least Squares Solution
    x           = zeros(size(A, 2), 1);
    x(S)        = x_S;

    % Update res @k:
    res         = y - A_S*x_S;
    error       = norm(res);
end

disp('Sparsity of OMP Result:')
disp(length(find(x~=0)))
disp('Iterations taken:')
disp(K)
end
