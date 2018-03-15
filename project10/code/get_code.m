function [chain,chain_Diff]=get_code(I)
    chain = []; 
    chain_Diff = []; 
    count = 0;
    [start_x,start_y] = get_start(I);    
    bx = start_x;
    by = start_y; 
    cx = start_x;
    cy = start_y - 1; 
    [b1x,b1y,~,~]=get_next(I,bx,by,cx,cy); 

    while 1
        [bx,by,cx,cy,di] = get_next(I,bx,by,cx,cy);
        count = count+1;
        chain = [chain,di];  
        if count>=2
            tmp = chain(count)-chain(count-1);
            if tmp<0 
                tmp=tmp+8;
            end
            chain_Diff = [chain_Diff,tmp];  
        end
        if bx==start_x && by==start_y
            [b2x,b2y,~,~]=get_next(I,bx,by,cx,cy);
            if b2x==b1x && b2y==b1y
                break;
            end
        end        
    end

    tmp = chain(1)-chain(count);
    if tmp < 0 
        tmp = tmp+8;
    end
    chain_Diff = [chain_Diff,tmp];
end
