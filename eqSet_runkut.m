function [X, Y1, Y2] = eqSet_runkut( f1, f2, y1_0, y2_0, a, b, n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    % wsp. dla wzoru [3/8] 
    C = [1/6 1/3 1/3 1/6];
    B = [0 0 0; 1/2 0 0; 0 1/2 0; 0 0 1];

    % parametry metody
    r = 4;
    h = (b-a)/n;
    
    % inicjalizacja wektorów wynikowych
    Y1(1:n) = 0;
    Y2(1:n) = 0;
    X(1:n) = 0;
    
    %pocz¹tkowe wartoœci
    Y1(1) = y1_0;
    Y2(1) = y2_0;
    X(1) = a;
    K(1:r,2) = 0;
    
    for i = 1:n
        
        %obliczenie wartoœci wartorów K
        for j = 1:r
            s1 = 0;
            s2(1:2) = 0;
            
            %obliczenie 3 sum wewn¹trz wyznaczania parametrów K
            for l = 1:j-1
                s1 = s1 + B(j, l);
                s2(1) = s2(1) + B(j, l) * K(l,1);
                s2(2) = s2(2) + B(j, l) * K(l,2);
            end 
            
             K(j, 1) = f1( X(i) +  h * s1, Y1(i) +  h * s2(1), Y2(i) +  h * s2(2));
             K(j, 2) = f2( X(i) +  h * s1, Y1(i) +  h * s2(1), Y2(i) +  h * s2(2));
        end
        
        %wyznaczenie sum do obliczenia Y(i+1)
        s(1:2)= 0;
        for j = 1:r
            s(1) = s(1) + C(j) * K(j,1);
            s(2) = s(2) + C(j) * K(j,2);
        end 
        
        %obliczenie kolejnej wartoœci
        X(i+1) = a + i*h;
        Y1(i+1) = Y1(i) +  h * s(1);
        Y2(i+1) = Y2(i) +  h * s(2);
    end
end

