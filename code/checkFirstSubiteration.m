function output_int = checkFirstSubiteration(K, i, j)


P1 = K(i,j);
P2 = K(i-1,j);
P3 = K(i-1,j+1);
P4 = K(i,j+1);
P5 = K(i+1,j+1);
P6 = K(i+1,j);
P7 = K(i+1,j-1);
P8 = K(i,j-1);
P9 = K(i-1,j-1);

% We compute A.

A = 0;
if (P2 == 0) && (P3 == 1)
    A = A+1;
end
if (P3 == 0) && (P4 == 1)
    A = A+1;
end
if (P4 == 0) && (P5 == 1)
    A = A+1;
end
if (P5 == 0) && (P6 == 1)
    A = A+1;
end
if (P6 == 0) && (P7 == 1)
    A = A+1;
end
if (P7 == 0) && (P8 == 1)
    A = A+1;
end
if (P8 == 0) && (P9 == 1)
    A = A+1;
end
if (P9 == 0) && (P2 == 1)
     A = A+1;
end


% We compute B.
B = P2 + P3 + P4 + P5 + P6 + P7 + P8 + P9;

    if (2 <= B) && (B <= 6) && (P2*P4*P6 == 0) && (P4*P6*P8 == 0) && (A == 1) && (P1 == 1)
        output_int = 1; % Conditions satisfied
    else
        output_int = 0;
    end
   
end

