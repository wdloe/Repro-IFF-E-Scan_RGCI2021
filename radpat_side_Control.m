function radPat_Side = radpat_side_Control(steerAngle)

  % Elevation angle intervals with beam data:
  int1 = 1:1801;
  int2 = 2001:3801;
  int3 = 4001:5801;

 % Loading the right.mat file according to beam steering:
   if steerAngle == 0
     cont = load('side1030_cont_0.mat');
   elseif steerAngle == -10
     cont = load('side1030_cont_neg10.mat');
   elseif steerAngle == -20
     cont = load('side1030_cont_neg20.mat');
   elseif steerAngle == -50
     cont = load('side1030_cont_neg50.mat');
   else
     cont = load('side1030_cont_10.mat');
   end
   radPat_Side = [cont.side_data_cont2(int1)';...
                  cont.side_data_cont3(int3)'; cont.side_data_cont3(int2)'; cont.side_data_cont3(int1)';...
                  cont.side_data_cont4(int3)'; cont.side_data_cont4(int2)'; cont.side_data_cont4(int1)';...
                  cont.side_data_cont5(int3)'; cont.side_data_cont5(int2)'; cont.side_data_cont5(int1)';...
                  cont.side_data_cont6(int3)'; cont.side_data_cont6(int2)'; cont.side_data_cont6(int1)';...
                  cont.side_data_cont7(int3)'; cont.side_data_cont7(int2)'];
end