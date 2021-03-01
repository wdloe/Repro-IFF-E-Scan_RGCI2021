function radPat_Side = radPat_side_Main(steerAngle)

  % Elevation angle intervals with azimuth beam datapoints:
  int1 = 1:1801;
  int2 = 2001:3801;
  int3 = 4001:5801;


  % Loading the right.mat file according to beam steering:
  if steerAngle == 0
    main = load('side1030_main_0.mat');
  elseif steerAngle == -10
    main = load('side1030_main_neg10.mat');
  elseif steerAngle == -20
    main = load('side1030_main_neg20.mat');
  elseif steerAngle == -50
    main = load('side1030_main_neg50.mat');
  else
    main = load('side1030_main_10.mat');
  end

  % Creating beam data matrix:
  radPat_Side = [main.side_data_main2(int1)';...
                main.side_data_main3(int3)'; main.side_data_main3(int2)'; main.side_data_main3(int1)';...
                main.side_data_main4(int3)'; main.side_data_main4(int2)'; main.side_data_main4(int1)';...
                main.side_data_main5(int3)'; main.side_data_main5(int2)'; main.side_data_main5(int1)';...
                main.side_data_main7(int3)'; main.side_data_main7(int2)'];
end