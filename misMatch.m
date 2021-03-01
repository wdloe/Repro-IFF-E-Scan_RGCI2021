function ML= misMatch(VSWR);

  % Mismatch loss in dB:
  ML = -10*log10(1-((VSWR-1)/(VSWR+1))^2);

end