function [Solution,BasicVar,Status]=basicsimplex(A,b,c,BasicVar0)
%% Matlab function that implement the basic simplex algorithm to solve a linear programming problem    
    verbose = false;
    
    %% Basic Preprocessing - Define variables, check conditions etc.
    [m,n] = size(A);
    B = BasicVar0;
    N = setdiff(1:n, B);
    if any(b < 0)
        error('vector b should have non-negative entries.')
    end
    
    if any(any(A(:,B) ~= eye(m)))
        error('BasicVar0 do not define a natural basis on R^m.')
    end
    
    %% simplex setup
    tab = zeros(m+1, n+1);
    tab(1:m,1:n) = A;
    tab(m+1,N) = c(N)' - c(B)'*A(:,N);
    tab(1:m,end) = b(:);
    tab(m+1,n+1) = -c(B)'*b;

    %% algorithm 
    increment = true;
    Status = true;
    while increment
        if verbose
            fprintf('***********************\n');
            fprintf('Current tableau \n');
            disp(tab);
        end
 
        if any(tab(end,1:n)<0)%check if there is negative cost coeff.
        [~,index] = min(tab(end,1:n)); 
            % check if corresponding column is unbounded
            if all(tab(1:m,index)<=0)
                Solution = [];
                BasicVar = [];
                Status = false;
                error('Problem is not bounded. All entries <= 0 in column %d',index);           
            else
                pivot = 0;
                min_found = inf;
                for i = 1:m
                    if tab(i,index)>0
                        tmp = tab(i,end)/tab(i,index);
                        if tmp < min_found
                            min_found = tmp;
                            pivot = i;
                        end
                    end
                end
                if verbose
                    fprintf('pivot row is %d\n',pivot);
                end
            %normalize
            tab(pivot,:) = tab(pivot,:)/tab(pivot,index);
                % Make all entries in index column zero.
                for i=1:m+1
                    if i ~= pivot
                         tab(i,:)=tab(i,:)-sign(tab(i,index))*abs(tab(i,index))*tab(pivot,:);
                    end
                end
            end
            if verbose  %print current basic feasible solution
                fprintf('current basic feasible solution is\n');
                [curr_x, ~] = current_x();
                disp(curr_x);
            end
        else
            increment = false;
        end
    end
 
    %internal function, finds current basis vector
    function [curr_x, bv] = current_x()
         curr_x = zeros(n,1);
         bv = [];
         for j=1:n
             if length(find(tab(:,j)==0)) == m
                 idx = tab(:,j) == 1;
                 try
                     curr_x(j) = tab(idx,end);
                 catch ME
                    continue
                 end
                 bv = [bv,j];
             end
         end
    end
    [curr_x, bv] = current_x();
    Solution = curr_x;
    BasicVar = bv;
end
    