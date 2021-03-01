function active_array_main = activeArray(front_array, side_array, ref)

  % Setting a constant depending on which antenna array is active.
  if ref == front_array
    active_array_main = 3;  
  elseif ref == side_array
    active_array_main = 2;
  else
    active_array_main = 1;
  end
end