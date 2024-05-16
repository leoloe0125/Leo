module fixed_point_operation(
    input [15:0]din_a,din_b,
    input [1:0]op,
    output reg [15:0]dout);
    
    parameter sign  =15;
    parameter INT   =14;
    parameter float =7;
    parameter add = 0;
    parameter sub = 1;
    parameter mul = 2'b10;

    //a
    wire din_a_sign;
    wire [INT-(float+1):0]din_a_int;
    wire [float:0]din_a_float;
    wire [float+1:0]din_a_float_ext;//ext

    assign din_a_sign = din_a[sign];
    assign din_a_int[INT-(float+1):0] = din_a[INT:float+1];
    assign din_a_float[float:0] = din_a[float:0];
    assign din_a_float_ext[float+1:0] = {1'b1,din_a_float};

    //b
    wire din_b_sign;
    wire [INT-(float+1):0]din_b_int ;
    wire [float:0]din_b_float;
    wire [float+1:0]din_b_float_ext;//ext
    assign din_b_sign = din_b[sign];
    assign din_b_int[INT-(float+1):0] = din_b[INT:float+1];
    assign din_b_float[float:0] = din_b[float:0];
    assign din_b_float_ext[float+1:0]={1'b1,din_b_float};//ext

    //int
    wire [INT-(float+1)+1:0]din_int_plus;
    wire [INT-(float+1)+1:0]din_int_sub,din_int_change_sub;
    wire [(INT-(float+1)+1)*2:0]din_int_mul;
    assign din_int_plus[INT-(float+1)+1:0] = din_a_int+din_b_int;
    assign din_int_sub[INT-(float+1)+1:0] = din_a_int-din_b_int;
    assign din_int_change_sub[INT-(float+1)+1:0] = din_b_int-din_a_int;
    assign din_int_mul[(INT-(float+1)+1)*2:0] = din_a_int*din_b_int;

    //float
    wire [float+1:0]din_float_plus;
    wire [float+1:0]din_float_sub,din_int_change_add;
    wire [float*2+1:0]din_float_mul;
    assign din_float_plus[float+1:0] = din_a_float+din_b_float;
    assign din_float_sub[float+1:0] = din_a_float-din_b_float;
    assign din_float_change_sub[INT-(float+1)+1:0] = din_b_float-din_a_float;
    assign din_float_mul[float*2+1:0] = din_a_float*din_b_float;


    always@(*)begin
        case(op)
            add:if(~(din_a_sign^din_b_sign))
                    dout[sign] = din_a_sign;
                else if(~din_a_sign&&din_b_sign)
                    if(din_a_int>din_b_int)
                            dout[sign] = 0;
                    else if(din_a_int==din_b_int)
                        if(din_a_float>din_b_float)
                            dout[sign] = 0;
                        else if(din_a_float==din_b_float)
                            dout[sign] = 0;
                        else
                            dout[sign] = 1;
                    else dout[sign] = 1;
                else if(din_a_sign&&~din_b_sign)
                    if(din_a_int>din_b_int)
                            dout[sign] = 1;
                    else if(din_a_int==din_b_int)
                        if(din_a_float>din_b_float)
                            dout[sign] = 1;
                        else if(din_a_float==din_b_float)
                            dout[sign] = 0;
                        else
                            dout[sign] = 0;
                    else dout[sign] = 0;
            sub:if(din_a_int>din_b_int)
                    dout[sign] = 0;
                else if(din_a_int==din_b_int)
                    if(din_a_float>din_b_float)
                        dout[sign] = 0;
                    else if(din_a_float==din_b_float)
                        dout[sign] = 0;
                    else
                        dout[sign] = 1;
                else dout[sign] = 1;
            mul: dout[sign] = din_a_sign^din_b_sign;
        endcase
    end
            

    always@(*)begin
        case(op)
            add:begin
                if(~(din_a_sign^din_b_sign))begin //0+0=0 1+1=1
                    if(din_float_plus[INT-(float+1)+1]) begin//carry
                        dout[INT:float+1] =din_int_plus+1;
                        dout[float:0] =din_float_plus[(float+1):1];
                    end
                    else begin
                        dout[INT:float+1] =din_int_plus;
                        dout[float:0] =din_float_plus[(float):0];
                    end
                end

                else if(~din_a_sign&&din_b_sign)begin//0+1=0-0
                    if(din_a_int>din_b_int)
                        if(din_a_float>=din_b_float)begin
                            dout[INT:float+1] =din_int_sub;
                            dout[float:0] =din_float_sub;
                        end
                        else begin//borrow
                            dout[INT:float+1] =din_int_sub-1;
                            dout[float:0] =din_a_float_ext-din_b_float;
                        end
                    else if(din_a_int==din_b_int)
                        if(din_a_float>=din_b_float)begin
                            dout[INT:float+1] =din_int_sub;
                            dout[float:0] =din_float_sub;
                        end
                        else begin//borrow
                            dout[INT:float+1] =din_int_change_sub;
                            dout[float:0] =din_float_change_sub;
                        end
                    else begin//exchange
                        if(din_a_float>=din_b_float)begin
                            dout[INT:float+1] =din_int_change_sub;
                            dout[float:0] =din_float_change_sub;
                        end
                        else begin//小數?��??
                            dout[INT:float+1] =din_int_change_sub-1;
                            dout[float:0] =din_b_float_ext-din_a_float;
                        end
                    end
                end
            end
            sub:begin
                if(~din_a_sign&&~din_b_sign) //�?-�?
                    if(din_a_int>din_b_int)
                        if(din_a_float>=din_b_float)begin
                            dout[INT:float+1] =din_int_sub;
                            dout[float:0] =din_float_sub;
                        end
                        else begin//borrow
                            dout[INT:float+1] =din_int_sub-1;
                            dout[float:0] =din_a_float_ext-din_b_float;
                        end
                    else if(din_a_int==din_b_int)
                        if(din_a_float>=din_b_float)begin
                            dout[INT:float+1] =din_int_sub;
                            dout[float:0] =din_float_sub;
                        end
                        else begin//borrow
                            dout[INT:float+1] =din_int_change_sub;
                            dout[float:0] =din_float_change_sub;
                        end
                    else begin//exchange
                        if(din_a_float>=din_b_float)begin
                            dout[INT:float+1] =din_int_change_sub;
                            dout[float:0] =din_float_change_sub;
                        end
                        else begin//小數?��??
                            dout[INT:float+1] =din_int_change_sub-1;
                            dout[float:0] =din_b_float_ext-din_a_float;
                        end
                    end
                else if(din_a_sign&&din_b_sign)//�?-�?=-(�?-�?)
                    if(din_a_int>din_b_int)
                        if(din_a_float>=din_b_float)begin
                            dout[INT:float+1] =din_int_sub;
                            dout[float:0] =din_float_sub;
                        end
                        else begin//borrow
                            dout[INT:float+1] =din_int_sub-1;
                            dout[float:0] =din_a_float_ext-din_b_float;
                        end
                    else if(din_a_int==din_b_int)
                        if(din_a_float>=din_b_float)begin
                            dout[INT:float+1] =din_int_sub;
                            dout[float:0] =din_float_sub;
                        end
                        else begin//borrow
                            dout[INT:float+1] =din_int_change_sub;
                            dout[float:0] =din_float_change_sub;
                        end
                    else begin//exchange
                        if(din_a_float>=din_b_float)begin
                            dout[INT:float+1] =din_int_change_sub;
                            dout[float:0] =din_float_change_sub;
                        end
                        else begin//小數?��??
                            dout[INT:float+1] =din_int_change_sub-1;
                            dout[float:0] =din_b_float_ext-din_a_float;
                        end
                    end
                else begin//�?-�?=�?+�? and �?-�?=-(�?+�?)
                    dout[INT:float+1] =din_int_plus;   
                    dout[float:0] =din_float_plus;
                end   
            end
            mul:begin
                dout[INT:float+1] = din_int_mul[(INT-(float+1)+1)*2:INT-(float+1)+1];
                dout[float:0] =din_float_mul[float*2+1:float+1];
            end
        endcase
    end
endmodule