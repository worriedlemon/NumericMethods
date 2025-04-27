function X1 = hamiltonian_euler_exp(X0, h)
    X1 = euler_exp(@hamiltonian, h, X0);
end
