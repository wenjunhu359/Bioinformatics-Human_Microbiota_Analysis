function GeoVideo()

writerObj = VideoWriter('3plot');
writerObj.Quality=100;
writerObj.FrameRate=15;
open(writerObj);

DIR='C:\Users\wenjun\Desktop\image';

srcFiles1 = dir(strcat(DIR,'\SALIVA_A\*.jpg'));
srcFiles2 = dir(strcat(DIR,'\STOOL_A\*.jpg'));
srcFiles3 = dir(strcat(DIR,'\STOOL_B\*.jpg'));
for i=1:length(srcFiles1)
img1=imread(strcat(DIR,'\SALIVA_A\',srcFiles1(i).name));
img2=imread(strcat(DIR,'\STOOL_A\',srcFiles2(i).name));
img3=imread(strcat(DIR,'\STOOL_B\',srcFiles3(i).name));
 subplot(2,2,1), subimage(img1);hold on
 subplot(2,2,2), subimage(img2);hold on
 subplot(2,2,3), subimage(img3);hold on
 frame = getframe(gcf); 
 writeVideo(writerObj,frame);
 hold off
 hold off
 hold off
 close figure 1
end
close(writerObj);


end