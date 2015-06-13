function [  ] = visualize_func( v,f,v_func,f_func )
%VISUALIZE_FUNC Summary of this function goes here
%   Detailed explanation goes here
 fv.Vertices=v;
 fv.Faces=f;
 fv.FaceVertexCData=f_func;
 if isempty(f_func) % only v_func
     patch(fv,... %'Marker','o',... 'MarkerFaceColor','flat',...
     'CData',v_func,...  %'EdgeColor','interp',...
     'FaceColor','interp');
    return;
 elseif isempty(v_func) % only f_func
     patch(fv,'FaceColor','flat');
 else % both functions
     patch(fv,'Marker','o',...
     'MarkerFaceColor','flat',...
     'CData',v_func,...
     'EdgeColor','interp',...
     'FaceColor','flat');
 end
end