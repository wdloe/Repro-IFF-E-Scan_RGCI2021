function [punch_angles_front, punch_angles_side] = trigSLS(lim, MTL,...
active_main, active_control, P1, P2)

  coder.extrinsic('imagesc');

  % Preparing matrices for storing punchthrough and detection angles:
  punch_angles_front = zeros(15,1801);
  punch_angles_side = zeros(15,900);

  % Checking sidelobe levels and MTL for main and control beam at
  % XPDR:

  % Index values describes different situations as follows:
  % 1 = The value of the beam at the angle is too weak to trigger XPDR.
  % 2 = SLS is guaranteed to be in action, XPDR will not be triggered.
  % 3 = SLS uncertainty area, XPDR might be triggered.
  % 4 = Punch through, XPDR will be triggered.

  % For front array:
  if active_main == 3 && active_control == 3
    lobe_punch = P1 > P2+lim;
    lobe_grey = P1 > P2 & P1 < P2+lim;
    below_MTL = P1 < MTL;
    for i = 1:15
      for j = 1:length(lobe_punch(i,:))
        if lobe_punch(i,j) == 1
          punch_angles_front(i,j) = 4;
        else
          punch_angles_front(i,j) = 2;
        end
      end
      for j = 1:length(lobe_grey(i,:))
        if lobe_grey(i,j) == 1
          punch_angles_front(i,j) = 3;
        end
      end
      for j = 1:length(below_MTL(i,:))
        if below_MTL(i,j) == 1
          punch_angles_front(i,j) = 1;
        end
      end
    end

  % For side array:
  elseif active_main == 1 && active_control == 1


  % For side array:
  else
    lobe_punch = P1(1:15,length(P1)/2+1:end) > P2(1:15,length(P1)/2+1:end)+lim;
    lobe_grey = P1(1:15,length(P1)/2+1:end) > P2(1:15,length(P1)/2+1:end) & ...
            P1(1:15,length(P1)/2+1:end) < P2(1:15,length(P1)/2+1:end)+lim;
    below_MTL = P1(1:15,length(P1)/2+1:end) < MTL;
    for i = 1:15
      for j = 1:length(lobe_punch(i,:))
        if lobe_punch(i,j) == 1
          punch_angles_side(i,j) = 4;
        else
          punch_angles_side(i,j) = 2;
        end
      end
      for j = 1:length(lobe_grey(i,:))
        if lobe_grey(i,j) == 1
          punch_angles_side(i,j) = 3;
        end
      end
      for j = 1:length(below_MTL(i,:))
        if below_MTL(i,j) == 1
          punch_angles_front(i,j) = 1;
        end
      end
    end
  end
end