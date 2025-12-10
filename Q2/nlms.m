function [output,error ] = nlms(Desired,Echoed,SystemOrder)
    N = length(Desired);
    b = fir1(SystemOrder-1,0.5);
    d = filter(b,1,Echoed);
    WeightsArray = zeros (SystemOrder, 1);
    
    for n = SystemOrder : N 
	    u = Echoed(n:-1:n-SystemOrder+1) ;
        OutputSignal(n)= WeightsArray' * u;
        ErrorSignal(n) = d(n) - OutputSignal(n);
        mu = 0.5/(1 + u' * u);
        WeightsArray = WeightsArray + mu * u * ErrorSignal(n);
    end 
    
    for n = SystemOrder : N 
	    u = Desired(n:-1:n-SystemOrder+1);
        OutputSignal(n)= WeightsArray' * u;
        ErrorSignal(n) = d(n) - OutputSignal(n);
    end
    
    output = OutputSignal;
    error = ErrorSignal;
end