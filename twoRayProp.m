function [Two_ray_main1030, Two_ray_control1030,Two_ray_main1090,...
Two_ray_control1090] = twoRayProp(coor_TX, coor_RX, G_TX_main,...
G_TX_control, P_TX_INT, G_RX_XPDR, G_TX_XPDR, P_TX_XPDR, G_RX_main,...
G_RX_control)

  % Height of transmitter/interrogator over reflective surface with coordinates [0,0]:
  h_tx = coor_TX(2);

  % Height of receiver/target over reflective surface with coordinates [0,0]:
  h_rx = coor_RX(2);

  % Distance between interrogating and target aircraft:
  dist = coor_RX(1)-coor_TX(1);

  % Two-ray propagation calculations in dB-scale for uplink:
  Two_ray_main1030 = P_TX_INT + G_TX_main + G_TX_control + G_RX_XPDR + ...
    10*log10(h_tx*h_rx) - 40*log10(dist);
  Two_ray_control1030 = P_TX_INT + G_TX_main + G_TX_control + G_RX_XPDR + ...
    10*log10(h_tx*h_rx) - 40*log10(dist);

  % Two-ray propagation calculations in dB-scale for dwpnlink:
  Two_ray_main1090 = P_TX_XPDR + G_RX_main + G_TX_XPDR + 10*log10(h_tx*...
    h_rx) - 40*log10(dist);
  Two_ray_control1090 = P_TX_XPDR + G_RX_control + G_TX_XPDR + 10*log10(...
    h_tx*h_rx) - 40*log10(dist);

end
