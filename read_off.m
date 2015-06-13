function [ verts,faces,adjacency ] = read_off( filename )
%READ_OFF Summary of this function goes here
%   Detailed explanation goes here

fid = fopen(filename,'r');
if( fid==-1 )
    error('Can''t open the file.');
end

str = fgets(fid);   % -1 if eof
if ~strcmp(str(1:3), 'OFF')
    error('The file is not a valid OFF one.');    
end

str = fgets(fid);
[a,str] = strtok(str); nvert = str2double(a);
[a,str] = strtok(str); nface = str2double(a);



[A,cnt] = fscanf(fid,'%f %f %f', 3*nvert);
if cnt~=3*nvert
    warning('Problem in reading vertices.');
end
A = reshape(A, 3, cnt/3);
verts = A';
% read Face 1  1088 480 1022
[A,cnt] = fscanf(fid,'%d %d %d %d\n', 4*nface);
if cnt~=4*nface
    warning('Problem in reading faces.');
end
A = reshape(A, 4, cnt/4);
faces = A(2:4,:)+1;
faces = faces';

adjacency = sparse(faces,faces(:,[2 3 1]),...
    1,nvert,nvert);
adjacency = spfun(@(x) 1, adjacency+adjacency');



fclose(fid);

end

