function X1 = hamiltonian_euler(X0, h)
    X1 = euler_imp(@hamiltonian, h, X0);
end
