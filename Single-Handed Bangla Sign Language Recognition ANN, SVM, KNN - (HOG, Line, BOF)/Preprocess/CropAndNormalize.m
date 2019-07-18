%%
clear all;
close all;
clc;

%%
im=imread('1.jpg');

%%
im=im';


%%
val=1;
for i=1:size(im,1)
    for j=1:size(im,2)
        if(im(i,j)==1);
            x=i;
            xx=i+200;
            val=0;
            if xx>257
                xx=255;
            end
        end
    end
    if val==0
        break;
    end
end

%%
temp=size(im,2);
for i=1:size(im,1)
    for j=1:size(im,2)
        if(im(i,j)==1 && temp>j);
            y=j;
            yy=j+200;
            if yy>257
                yy=255;
            end
            temp=j;
        end
    end
end

%%
new_im=zeros(255,255);
row=58;
col=58;
for i=x:xx
    for j=y:yy
        new_im(row,col)=im(i,j);
        col=col+1;
    end
    row=row+1;
    col=1;
end

%%
new=new_im';
new = new - min(new(:)) ;
new = new / max(new(:)) ;
imshow(new);