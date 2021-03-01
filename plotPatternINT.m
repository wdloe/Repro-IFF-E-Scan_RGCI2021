function plotPatternINT(INT_tx_pattern_main, INT_tx_pattern_control)

  % Azimuth angles vector:
  az_ang = (-180:0.2:180);

  % Elevation angles vector:
  ele_ang = -35:5:35;

  % Plotting beam patterns leaving interrogator in 3D:
  figure(1);
  colormap parula;
  subplot(2,1,1)
  surf(az_ang, ele_ang, INT_tx_pattern_main, 'LineStyle', 'none')
  title('Main beam from TRU')
  xlabel('Azimuth angle, degrees')
  ylabel('Elevation angle, degrees')
  zlabel('Magnitude, dB')

  subplot(2,1,2)
  surf(az_ang, ele_ang, INT_tx_pattern_control, 'LineStyle', 'none')
  title('Control beam from TRU')
  xlabel('Azimuth angle, degrees')
  ylabel('Elevation angle, degrees')
  zlabel('Magnitude, dB')

end