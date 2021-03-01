function plotDetection(beam_angles_front, beam_angles_side,active_main,...
active_control, punch_angles_front, punch_angles_side)

 coder.extrinsic('imagesc');
 coder.extrinsic('colorbar');

 % Setting limits for colormap plot, XPDR:
 lowerlimit_XPDR = 1;
 upperlimit_XPDR = 4;

 % Setting limits for colormap plot, INT:
 lowerlimit_INT = 1;
 upperlimit_INT = 3;

 % Setting limits for colormap plot, full link connection:
 lowerlimit_full = 0;
 upperlimit_full = 2;
 
 % For front array:
 if active_main == 2 && active_control == 2

  % Setting plot axes:
    xtick = -180:0.2:180;
    ytick = -35:5:35;

    % Plotting punchthrough and SLS for front array at XPDR:
    figure(3)
    subplot(2,1,1)
    imagesc(xtick,ytick,punch_angles_front);
    set(gca, 'YDir', 'normal');
    colormap(hot);
    caxis('manual');
    caxis([lowerlimit_XPDR upperlimit_XPDR]);
    colorbar
    title('Punchthrough and SLS angles front array, XPDR')
    xlabel('Azimuth angle')
    ylabel('Eleveation angle')

    % Plotting detection levels for front array at interrogator:
    subplot(2,1,2)
    imagesc(xtick,ytick,beam_angles_front);
    set(gca, 'YDir', 'normal');
    colormap(hot);
    caxis('manual');
    caxis([lowerlimit_INT upperlimit_INT]);
    colorbar
    title('Detection angles front array, INT')
    xlabel('Azimuth angle')
    ylabel('Eleveation angle')

   % Storing all punchthrough angles in a matrix. Multiplying by
   % factor 2 for later colormap plot.
    full_punch = 2*(punch_angles_front == 4 & beam_angles_front ==3);

   % Storing all grey-area angles in a matrix.
    full_grey = punch_angles_front == 3 & beam_angles_front ==3;

   % Adding the matrices together to achieve full link image:
    full_link = full_punch + full_grey;

   % Plotting full link angles for front array:
    figure(4);
    imagesc(xtick,ytick,full_link);
    set(gca, 'YDir', 'normal');
    colormap(hot);
    caxis('manual');
    caxis([lowerlimit_full upperlimit_full]);
    colorbar
    title('Full link connection, front array')
    xlabel('Azimuth angle')
    ylabel('Eleveation angle')

   % For side array:
  elseif active_main == 1 && active_control == 1
    xtick = 0:0.2:180;
    ytick = -35:5:35;

    figure(3)
    subplot(2,1,1);
    imagesc(xtick, ytick, punch_angles_side)
    set(gca, 'YDir', 'normal');
    colormap(hot);
    caxis('manual');
    caxis([lowerlimit_XPDR upperlimit_XPDR]);
    colorbar
    title('Punchthrough and SLS angles side array, XPDR');
    xlabel('Azimuth angle');
    ylabel('Eleveation angle');

    subplot(2,1,2);
    imagesc(xtick, ytick, beam_angles_side)
    set(gca, 'YDir', 'normal');
    colormap(hot);
    caxis('manual');
    caxis([lowerlimit_INT upperlimit_INT]);
    colorbar
    title('Detection angles side array, INT');
    xlabel('Azimuth angle');
    ylabel('Eleveation angle');

   % Storing all punchthrough angles in a matrix. Multiplying by
   % factor 2 for later colormap plot.
    full_punch = 2*(punch_angles_side == 4 & beam_angles_side ==3);

    % Storing all grey-area angles in a matrix.
    full_grey = punch_angles_side == 3 & beam_angles_side ==3;

    % Adding the matrices together to achieve full link image:
    full_link = full_punch + full_grey;

    % Plotting full link angles for front array:
    figure(4);
    imagesc(xtick,ytick,full_link);
    set(gca, 'YDir', 'normal');
    colormap(hot);
    caxis('manual');
    caxis([lowerlimit_full upperlimit_full]);
    colorbar
    title('Full link connection, side array')
    xlabel('Azimuth angle')
    ylabel('Eleveation angle')

    % For switched side array:
  else
    % Setting plot axes:
    xtick = -180:0.2:0;
    ytick = -35:5:35;

    figure(3)
    subplot(2,1,1);
    imagesc(xtick, ytick, punch_angles_side)
    set(gca, 'YDir', 'normal');
    colormap(hot);
    caxis([lowerlimit_XPDR upperlimit_XPDR]);
    caxis('manual');
    colorbar
    title('Punchthrough and SLS angles side array, XPDR');
    xlabel('Azimuth angle');
    ylabel('Eleveation angle');

    subplot(2,1,2);
    imagesc(xtick, ytick, beam_angles_side)
    set(gca, 'YDir', 'normal');
    colormap(hot);
    caxis('manual')
    caxis([lowerlimit_INT upperlimit_INT]);
    colorbar
    title('Detection angles side array, INT');
    xlabel('Azimuth angle');
    ylabel('Eleveation angle');

    % Storing all punchthrough angles in a matrix. Multiplying by
    % factor 2 for later colormap plot.
    full_punch = 2*(punch_anglesfront == 4 & beam_angles_front ==3);

    % Storing all grey-area angles in a matrix.
    full_grey = punch_anglesfront == 3 & beam_angles_front ==3;

    % Adding the matrices together to achieve full link image:
    full_link = full_punch + full_grey;
 
    % Plotting full link angles for front array:
    imagesc(xtick,ytick,full_link);
    set(gca, 'YDir', 'normal');
    colormap(hot);
    caxis('manual');
    caxis([lowerlimit_full upperlimit_full]);
    colorbar
    title('Full link connection, other side array')
    xlabel('Azimuth angle')
    ylabel('Eleveation angle')
  end
end