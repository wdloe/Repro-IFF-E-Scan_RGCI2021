function radPat_out = radpat_Main1090(rec_front, rec_side, active_array)

 % Intervals with elevation angles beam data:
 int1 = 1:1801;
 int2 = 2001:3801;
 int3 = 4001:5801;

 % Front array active:
 if active_array == 3

   % Loading the right .mat file according to beam steering:
   if rec_front == 0
     main = load('front1090_main_0.mat');
   elseif rec_front == 15
     main = load('front1090_main_15.mat');
   elseif rec_front == 45
     main = load('front1090_main_35.mat');
   elseif rec_front == 55
     main = load('front1090_main_55.mat');
   elseif rec_front == -10
     main = load('front1090_main_neg10.mat');
   elseif rec_front == -35
     main = load('front1090_main_neg35.mat');
   else
     main = load('front1090_main_neg55.mat');
   end
   radPat_out = [main.front_data_main2(int1)';...
   main.front_data_main3(int3)'; main.front_data_main3(int2)'; main.front_data_main3(int1)';...
   main.front_data_main4(int3)'; main.front_data_main4(int2)'; main.front_data_main4(int1)';...
   main.front_data_main5(int3)'; main.front_data_main5(int2)'; main.front_data_main5(int1)';...
   main.front_data_main6(int3)'; main.front_data_main6(int2)'; main.front_data_main6(int1)';...
   main.front_data_main7(int3)'; main.front_data_main7(int2)'];

 % Side array active:
 elseif active_array == 1

   % Loading the right .mat file according to beam steering:
   if rec_side == 0
     main = load('side1090_main_0.mat');
   elseif rec_side == -10
     main = load('side1090_main_neg10.mat');
   elseif rec_side == -20
     main = load('side1090_main_neg20.mat');
   elseif rec_side == -30
     main = load('side1090_main_neg30.mat');
   elseif rec_side == -50
     main = load('side1090_main_neg50.mat');
   else
     main = load('side1090_main_10.mat');
   end

   radPat_out = [main.side_data_main2(int1)';...
   main.side_data_main3(int3)'; main.side_data_main3(int2)'; main.side_data_main3(int1)';...
   main.side_data_main4(int3)'; main.side_data_main4(int2)'; main.side_data_main4(int1)';...
   main.side_data_main5(int3)'; main.side_data_main5(int2)'; main.side_data_main5(int1)';...
   main.side_data_main6(int3)'; main.side_data_main6(int2)'; main.side_data_main6(int1)';...
   main.side_data_main7(int3)'; main.side_data_main7(int2)'];

% Other side array active:
 else

 % Loading the right .mat file according to beam steering and
 % flips it to achieve other side pattern:
   if rec_side == 0
     main = load('side1090_main_0.mat');
   elseif rec_side == -10
     main = load('side1090_main_neg10.mat');
   elseif rec_side == -20
     main = load('side1090_main_neg20.mat');
   elseif rec_side == -30
     main = load('side1090_main_neg30.mat');
   elseif rec_side == -50
     main = load('side1090_main_neg50.mat');
   else
     main = load('side1090_main_10.mat');
   end

   radPat = [main.side_data_main2(int1)';...
   main.side_data_main3(int3)'; main.side_data_main3(int2)'; main.side_data_main3(int1)';...
   main.side_data_main4(int3)'; main.side_data_main4(int2)'; main.side_data_main4(int1)';...
   main.side_data_main5(int3)'; main.side_data_main5(int2)'; main.side_data_main5(int1)';...
   main.side_data_main6(int3)'; main.side_data_main6(int2)'; main.side_data_main6(int1)';...
   main.side_data_main7(int3)'; main.side_data_main7(int2)'];
   radPat_out = fliplr(radPat);
 end
end