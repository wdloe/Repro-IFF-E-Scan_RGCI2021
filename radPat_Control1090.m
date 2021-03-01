function radPat_out = radPat_Control1090(rec_front, rec_side,...
active_array)

  % Intervals with beam data:
  % int1 contains data for the biggest elevation angle from the sheet.
  % int2 contains data for the middle elevation angle from the sheet.
  % int3 contains data for the smallest elevation angle from the sheet.
  int1 = 1:1801;
  int2 = 2001:3801;
  int3 = 4001:5801;

  % Side array acrive
  if active_array == 1

    % % Loading the right .mat file according to beam steering: x
    if rec_side == 0
      cont = load('side1090_cont_0.mat');
    elseif rec_side == -10
      cont = load('side1090_cont_neg10.mat');
    elseif rec_side == -20
      cont = load('side1090_cont_neg20.mat');
    elseif rec_side == -30
      cont = load('side1090_cont_neg30.mat');
    elseif rec_side == -50
      cont = load('side1090_cont_neg50.mat');
    else
      cont = load('side1090_cont_10.mat');
    end

    radPat_out = [cont.side_data_cont2(int1)';...
    cont.side_data_cont3(int3)'; cont.side_data_cont3(int2)'; cont.side_data_cont3(int1)';...
    cont.side_data_cont4(int3)'; cont.side_data_cont4(int2)'; cont.side_data_cont4(int1)';...
    cont.side_data_cont5(int3)'; cont.side_data_cont5(int2)'; cont.side_data_cont5(int1)';...
    cont.side_data_cont6(int3)'; cont.side_data_cont6(int2)'; cont.side_data_cont6(int1)';...
    cont.side_data_cont7(int3)'; cont.side_data_cont7(int2)'];

  % Front array active
  elseif active_array == 3

  % % Loading the right .mat file according to beam steering:
    if rec_front == 0
      cont = load('front1090_cont_0.mat');
    elseif rec_front == 15
      cont = load('front1090_cont_15.mat');
    elseif rec_front == 35
      cont = load('front1090_cont_35.mat');
    elseif rec_front == 55
      cont = load('front1090_cont_55.mat');
    elseif rec_front == -15
      cont = load('front1090_cont_neg15.mat');
    elseif rec_front == -35
      cont = load('front1090_cont_neg35.mat');
    else
      cont = load('front1090_cont_neg55.mat');
    end
    
    radPat_out = [cont.front_data_cont2(int1)';...
    cont.front_data_cont3(int3)'; cont.front_data_cont3(int2)'; cont.front_data_cont3(int1)';...
    cont.front_data_cont4(int3)'; cont.front_data_cont4(int2)'; cont.front_data_cont4(int1)';...
    cont.front_data_cont5(int3)'; cont.front_data_cont5(int2)'; cont.front_data_cont5(int1)';...
    cont.front_data_cont6(int3)'; cont.front_data_cont6(int2)'; cont.front_data_cont6(int1)';...
    cont.front_data_cont7(int3)'; cont.front_data_cont7(int2)'];
    
  % Other side array active:
  else

   % Loading the right .mat file according to beam steering and
   % flips it to achoeve other side pattern:
   if rec_side == 0
    cont = load('side1090_cont_0.mat');
   elseif rec_side == -10
    cont = load('side1090_cont_neg10.mat');
   elseif rec_side == -20
    cont = load('side1090_cont_neg20.mat');
   elseif rec_side == -30
    cont = load('side1090_cont_neg30.mat');
   elseif rec_side == -50
    cont = load('side1090_cont_neg50.mat');
   else
    cont = load('side1090_cont_10.mat');
   end
   radPat = [cont.side_data_cont2(int1)';...
   cont.side_data_cont3(int3)'; cont.side_data_cont3(int2)'; cont.side_data_cont3(int1)';...
   cont.side_data_cont4(int3)'; cont.side_data_cont4(int2)'; cont.side_data_cont4(int1)';...
   cont.side_data_cont5(int3)'; cont.side_data_cont5(int2)'; cont.side_data_cont5(int1)';...
   cont.side_data_cont6(int3)'; cont.side_data_cont6(int2)'; cont.side_data_cont6(int1)';...
   cont.side_data_cont7(int3)'; cont.side_data_cont7(int2)'];
   radPat_out = fliplr(radPat);
  end
end
