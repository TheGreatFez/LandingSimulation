function [ Factorial_output ] = StephsFunc( Factorial_input )
%STEPHSFUNC Summary of this function goes here
%   Detailed explanation goes here
Factorial_output = 1;

for i=1:Factorial_input
    Factorial_output = Factorial_output*i;
end

end

