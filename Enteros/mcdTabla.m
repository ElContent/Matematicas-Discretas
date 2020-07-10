function mcdTabla(A,B)
if A>=B
    M = A;
    m = B;
elseif A<B
    M = B;
    m = A;
end

inc = 1;
while M > 0
    Dd(inc) = M;
    if inc == 1
        Co(inc) = 0;
    else
        Co(inc) = fix(m/M);
    end
    
    if inc > 1
        Re(inc - 1) = m - M*Co(inc);
    end
    
    t = M;
    M = rem(m, M);
    m = t;
    inc = inc + 1;
    
end
Re(inc - 1) = 0;

tabla(1, :) = Co;
tabla(2, :) = Dd;
tabla(3, :) = Re;

disp(tabla);
fprintf("\tEl MCD es: %d \n", m);
end

