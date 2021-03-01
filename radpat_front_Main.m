function radPat_Front = radpat_front_Main(steerAngle)

  % Elevation angle intervals with beam data:
  int1 = 1:1801;
  int2 = 2001:3801;
  int3 = 4001:5801;

  % Loading the right.mat file according to beam steering:
  if steerAngle == 0
    main = load('front1030_main_0.mat');
  elseif steerAngle == 15
    main = load('front030_main_15.mat');
  elseif steerAngle == 33.75
    main = load('front1030_main_35.mat');
  elseif steerAngle == 50.62
    main = load('front1030_main_55.mat');
  elseif steerAngle == -11.25
    main = load('front1030_main_neg15.mat');
  elseif steerAngle == -33.75
    main = load('front1030_main_neg35.mat');
  else
    main = load('front1030_main_neg50.mat');
  end
  radPat_Front = [main.front_data_main2(int1)'; main.front_data_main3(int3)';...
                  main.front_data_main3(int2)'; main.front_data_main3(int1)';...
                  main.front_data_main4(int3)'; main.front_data_main4(int2)';...
                  main.front_data_main4(int1)'; main.front_data_main5(int3)';...
                  main.front_data_main5(int2)'; main.front_data_main5(int1)';...
                  main.front_data_main6(int3)'; main.front_data_main6(int2)';...
                  main.front_data_main6(int1)'; main.front_data_main7(int3)';...
                  main.front_data_main7(int2)'];
end