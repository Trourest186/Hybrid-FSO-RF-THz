function q = size_distribution(V)
% V: visibility range
if V > 50
    q = 1.6;
else
    if V>6
        q = 1.3;
    else
        if V >1
            q = 0.16*V+0.34;
        else
            if V > 0.5
                q = V-0.5;
            else
                q = 0;
            end
        end
    end
end
end

