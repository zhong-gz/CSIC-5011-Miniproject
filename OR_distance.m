function [D] = OR_distance(data,label)
% data  - the original data - N*D matrix, where N is the number of data
%                             and D is the dimension of data.
% label - the label of data - N*1 vector, where N is the number of data.
% D     - the distance of data - N*N matrix, where N is the number of data
%                                and D(i,j) is the distance between i th
%                                and j th data.

    N = length(label);
    %compute distance matrix D
    for i = 1:N
        parfor j = 1:N
            D(i,j) = norm(data(i,:) - data(j,:))*(abs(label(i)-label(j))+1);
        end
    end

end