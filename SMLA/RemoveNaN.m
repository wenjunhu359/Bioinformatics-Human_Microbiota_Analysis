
function Input = RemoveNaN(Input) % Remove the NaN columns from the matrix
Input(:,any(isnan(Input))) = [];
end