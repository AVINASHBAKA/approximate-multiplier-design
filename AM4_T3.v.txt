// AM4_T3
// -------------------------
module AM4_T3 (a,b,y);
    input  [3:0] a;
    input  [3:0] b;
    output [7:0] y;
    wire pp00=a[0]&b[0]; wire pp01=a[0]&b[1]; wire pp02=a[0]&b[2]; wire pp03=a[0]&b[3];
    wire pp10=a[1]&b[0]; wire pp11=a[1]&b[1]; wire pp12=a[1]&b[2]; wire pp13=a[1]&b[3];
    wire pp20=a[2]&b[0]; wire pp21=a[2]&b[1]; wire pp22=a[2]&b[2]; wire pp23=a[2]&b[3];
    wire pp30=a[3]&b[0]; wire pp31=a[3]&b[1]; wire pp32=a[3]&b[2]; wire pp33=a[3]&b[3];
    assign y[0]=pp00; 
assign y[1]=pp01|pp10; 
assign y[2]=pp02|pp11|pp20; 
assign y[3]=pp03|pp12|pp21|pp30;
    wire [2:0] A={pp33,pp23,pp13|pp22};
    wire [2:0] B={1'b0,pp32,pp31};
    wire [3:0] SUM=A+B;
    assign y[4]=SUM[0]; 
assign y[5]=SUM[1]; 
assign y[6]=SUM[2]; 
assign y[7]=SUM[3];
endmodule
