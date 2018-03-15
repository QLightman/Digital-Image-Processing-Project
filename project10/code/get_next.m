function [bx,by,cx,cy,di] = get_next(img_binary,bx_i,by_i,cx_i,cy_i)

dx=[0,-1,-1,-1, 0, 1,1,1,   0,-1,-1,-1, 0, 1,1,1];
dy=[1, 1, 0,-1,-1,-1,0,1,   1, 1, 0,-1,-1,-1,0,1];

bx = bx_i; by=by_i; cx=cx_i; cy=cy_i; di=0;
[M, N] = size(img_binary);

for i=1:8
    if bx+dx(i)==cx && by+dy(i)==cy 
        for j=i+1:i+8
            tx=bx+dx(j); ty=by+dy(j);
            if tx>=1 && tx<=M && ty>=1 && ty<=N                    
                if img_binary(tx,ty)==255 
                    bx=tx; by=ty;
                    di = j; 
                    if di>8 
                        di=di-8; 
                    end
                    break;                       
                end              
            end
            cx=tx; cy=ty;
        end            
        break;
    end
end
    
end