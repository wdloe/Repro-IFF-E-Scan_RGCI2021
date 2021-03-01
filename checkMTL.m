function [beam_angles_front,beam_angles_side] = checkMTL(MTL, G_RX_INT_main, G_RX_INT_control, active_main, active_control)

  % Prepearing matrices for storing detection levels:
  beam_angles_front = zeros(15,1801);
  beam_angles_side = zeros(15,900);

  % Parameter name change:
  main = G_RX_INT_main;
  control = G_RX_INT_control;

  % Index values describes different situations as follows:
  % 1 = The value of the beam at the angle is too weak to trigger interrogator.
  % 2 = Control level is higher than Main level. Interrogator will not be triggered.
  % 3 = Main level is higher than Control level. Interrogator will be triggered.

  % For front array:
  if active_main == 2 && active_control == 2

    beam_levels = main > control;
    below_MTL = main < MTL;

    for i = 1:15
      for j = 1:length(beam_levels(i,:))
        if beam_levels(i,j) == 1
          beam_angles_front(i,j) = 3;
        else
          beam_angles_front(i,j) = 2;
        end
        for j = 1:length(below_MTL(i,:))
          if below_MTL(i,j) == 1
            beam_angles_front(i,j) = 1;
          end
        end
      end
    end

  % For side array:
  elseif active_main == 1 && active_control == 1

    beam_levels = main(1:15,length(main)/2+1:end) > control(1:15,length(control)/2+1:end);
    below_MTL = main(1:15,length(main)/2+1:end) < MTL;

    for i = 1:15
      for j = 1:length(beam_levels(i,:))
        if beam_levels(i,j) == 1
          beam_angles_side(i,j) = 3;
        else
          beam_angles_side(i,j) = 2;
        end
       end
      end
      for i = 1:15
       for j = 1:length(below_MTL(i,:))
        if below_MTL(i,j) == 1
          beam_angles_side(i,j) = 1;
       end
      end
     end

    % For other side array:
    else

      beam_levels = main(1:15,1:length(main)/2) > control(1:15,1:length(control)/2);
      below_MTL = main(1:15,1:length(main)/2) < MTL;

      for i = 1:15
        for j = 1:length(beam_levels(i,:))
          if beam_levels(i,j) == 1
            beam_angles_side(i,j) = 3;
          else
            beam_angles_side(i,j) = 2;
          end
        end
      end
      for i = 1:15
        for j = 1:length(below_MTL(i,:))
          if below_MTL(i,j) == 1
            beam_angles_side(i,j) = 1;
          end
        end
      end
   end
end