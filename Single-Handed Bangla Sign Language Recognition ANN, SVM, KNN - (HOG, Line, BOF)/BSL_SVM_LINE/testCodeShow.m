disp('Testing..........')

load ('ref_feature.mat');
P=ref_feature;

load trainModel;
Predicate=svm.predict(trainModel,ref_feature);
disp(Predicate);

fid = fopen('output.txt','a');
  
if (Predicate==1)
    fwrite(fid, unicode2native(char(hex2dec('0985')),'UTF-8'));
fclose(fid);
elseif (Predicate==2)
    fwrite(fid, unicode2native(char(hex2dec('0986')),'UTF-8'));
fclose(fid);     
elseif (Predicate==3)
    fwrite(fid, unicode2native(char(hex2dec('0987')),'UTF-8'));
fclose(fid);     
elseif (Predicate==4)
    fwrite(fid, unicode2native(char(hex2dec('0989')),'UTF-8'));
fclose(fid);     
elseif (Predicate==5)
    fwrite(fid, unicode2native(char(hex2dec('09B0')),'UTF-8'));
fclose(fid);     
elseif (Predicate==6)
    fwrite(fid, unicode2native(char(hex2dec('098F')),'UTF-8'));
fclose(fid);     
elseif (Predicate==7)
    fwrite(fid, unicode2native(char(hex2dec('0990')),'UTF-8'));
fclose(fid);     
elseif (Predicate==8)
    fwrite(fid, unicode2native(char(hex2dec('0993')),'UTF-8'));
fclose(fid);     
elseif (Predicate==9)
    fwrite(fid, unicode2native(char(hex2dec('0994')),'UTF-8'));
fclose(fid);     
elseif (Predicate==10)
    fwrite(fid, unicode2native(char(hex2dec('0995')),'UTF-8'));
fclose(fid);     
elseif (Predicate==11)
    fwrite(fid, unicode2native(char(hex2dec('0996')),'UTF-8'));
fclose(fid);     
elseif (Predicate==12)
    fwrite(fid, unicode2native(char(hex2dec('0997')),'UTF-8'));
fclose(fid);     
elseif (Predicate==13)
    fwrite(fid, unicode2native(char(hex2dec('0998')),'UTF-8'));
fclose(fid);     
elseif (Predicate==14)
    fwrite(fid, unicode2native(char(hex2dec('0999')),'UTF-8'));
fclose(fid);     
elseif (Predicate==15)
    fwrite(fid, unicode2native(char(hex2dec('099A')),'UTF-8'));
fclose(fid);     
elseif (Predicate==16)
    fwrite(fid, unicode2native(char(hex2dec('099B')),'UTF-8'));
fclose(fid);     
elseif (Predicate==17)
    fwrite(fid, unicode2native(char(hex2dec('099C')),'UTF-8'));
fclose(fid);     
elseif (Predicate==18)
    fwrite(fid, unicode2native(char(hex2dec('099D')),'UTF-8'));
fclose(fid);     
elseif (Predicate==19)
    fwrite(fid, unicode2native(char(hex2dec('099E')),'UTF-8'));
fclose(fid);     
elseif (Predicate==20)
    fwrite(fid, unicode2native(char(hex2dec('099F')),'UTF-8'));
fclose(fid);     
elseif (Predicate==21)
    fwrite(fid, unicode2native(char(hex2dec('09A0')),'UTF-8'));
fclose(fid);     
elseif (Predicate==22)
    fwrite(fid, unicode2native(char(hex2dec('09A1')),'UTF-8'));
fclose(fid);     
elseif (Predicate==23)
    fwrite(fid, unicode2native(char(hex2dec('09A2')),'UTF-8'));
fclose(fid);     
elseif (Predicate==24)
    fwrite(fid, unicode2native(char(hex2dec('09A3')),'UTF-8'));
fclose(fid);     
elseif (Predicate==25)
    fwrite(fid, unicode2native(char(hex2dec('09A4')),'UTF-8'));
fclose(fid);     
elseif (Predicate==26)
    fwrite(fid, unicode2native(char(hex2dec('09A5')),'UTF-8'));
fclose(fid);     
elseif (Predicate==27)
    fwrite(fid, unicode2native(char(hex2dec('09A6')),'UTF-8'));
fclose(fid);     
elseif (Predicate==28)
    fwrite(fid, unicode2native(char(hex2dec('09A7')),'UTF-8'));
fclose(fid);     
elseif (Predicate==29)
    fwrite(fid, unicode2native(char(hex2dec('09AA')),'UTF-8'));
fclose(fid);     
elseif (Predicate==30)
    fwrite(fid, unicode2native(char(hex2dec('09AB')),'UTF-8'));
fclose(fid);     
elseif (Predicate==31)
    fwrite(fid, unicode2native(char(hex2dec('09AC')),'UTF-8'));
fclose(fid);     
elseif (Predicate==32)
    fwrite(fid, unicode2native(char(hex2dec('09AE')),'UTF-8'));
fclose(fid);     
elseif (Predicate==33)
    fwrite(fid, unicode2native(char(hex2dec('09B2')),'UTF-8'));
fclose(fid);     
elseif (Predicate==34)
    fwrite(fid, unicode2native(char(hex2dec('09B6')),'UTF-8'));
fclose(fid);     
elseif (Predicate==35)
    fwrite(fid, unicode2native(char(hex2dec('09B9')),'UTF-8'));
fclose(fid);     
else
    disp(' not Found');
clear
end
 
 
 