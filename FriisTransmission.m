function [Friis_Main1030, Friis_Control1030, Friis_Main1090, ...
  Friis_Control1090] = FriisTransmission(f_1090, f_1030,coor_TX, coor_RX, G_TX_Main, G_TX_Control,...
  P_TX_INT, G_RX_XPDR, G_TX_XPDR, P_TX_XPDR, G_RX_main,G_RX_control)

  %c = physconst('LightSpeed');
  c = 3e8;

  % Wavelength calculations for different frequencies:
  lambda_inter = 20*log10(c/f_1030);
  lambda_transp = 20*log10(c/f_1090);

  % Distance to target:
  d = coor_RX(1)-coor_TX(1);

  % Frii's transmission formula calculated in dB for uplink:
  Friis_Main1030 = (P_TX_INT + G_TX_Main + G_RX_XPDR + lambda_inter)-(10*log10((4*pi*d)^2));
  Friis_Control1030 = (P_TX_INT + G_TX_Control + G_RX_XPDR +lambda_inter)-(10*log10((4*pi*d)^2));

  % Frii's transmission formula calculated in dB for downlink:
  Friis_Main1090 = (P_TX_XPDR + G_TX_XPDR + G_RX_main + lambda_transp) -(10*log10((4*pi*d)^2));
  Friis_Control1090 = (P_TX_XPDR + G_TX_XPDR + G_RX_control + lambda_transp)-(10*log10((4*pi*d)^2));

end