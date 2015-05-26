function convergence=Diff(omagePast,omage)

convergence=0;
convergence=convergence+norm((omagePast-omage),'fro');
disp(strcat('--------convergence:',num2str(convergence)));

end