function plotPatternXPDR(XPDR_rx_pattern_main, XPDR_rx_pattern_control)

  % Azimuth angles, degrees:
  az_ang = (-180:0.2:180);

  % Elevation angles, degrees:
  ele_ang = -35:5:35;

  % Plotting beam patterns arriving at transponder in 3D:
  figure(2)
  subplot(2,1,1)
  surf(az_ang, ele_ang, XPDR_rx_pattern_main, 'LineStyle', 'none')
  title('Main beam at target')
  xlabel('Azimuth angle')
  ylabel('Elevation angle')
  zlabel('Magnitude')
  colormap('parula');

  subplot(2,1,2)
  surf(az_ang, ele_ang, XPDR_rx_pattern_control, 'LineStyle', 'none')
  title('Control beam at target')
  xlabel('Azimuth angle')
  ylabel('Elevation angle')
  zlabel('Magnitude')
end
