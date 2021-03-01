function Thermal_noise = thermalNoise_INT(Bandwidth,T_INT)

  k = physconst('Boltzmann');

  % Celsius to Kelvin:
  T_Kelvin = T_INT + 273.15;

  % Thermal noise in dB:
  Thermal_noise = 10*log10(k*T_Kelvin)+10*log10(Bandwidth);

end