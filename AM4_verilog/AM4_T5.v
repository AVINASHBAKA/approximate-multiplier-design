// AM4_T5
// -------------------------
module AM4_T5 (a,b,y);
    input  [3:0] a;
    input  [3:0] b;
    output [7:0] y;
    wire pp00=a[0]&b[0]; wire pp01=a[0]&b[1]; wire pp02=a[0]&b[2]; wire pp03=a[0]&b[3];
    wire pp10=a[1]&b[0]; wire pp11=a[1]&b[1]; wire pp12=a[1]&b[2]; wire pp13=a[1]&b[3];
    wire pp20=a[2]&b[0]; wire pp21=a[2]&b[1]; wire pp22=a[2]&b[2]; wire pp23=a[2]&b[3];
    wire pp30=a[3]&b[0]; wire pp31=a[3]&b[1]; wire pp32=a[3]&b[2]; wire pp33=a[3]&b[3];
    assign y[0]=pp00; assign y[1]=pp01|pp10; assign y[2]=pp02|pp11|pp20;
    wire sum3,carry3; fa fa_c3(pp03,pp12,pp21,sum3,carry3);
    wire col3_rowB=carry3|pp30; assign y[3]=sum3;
    wire sum4,carry4; ha ha_c4(pp13|pp22,pp31,sum4,carry4);
    wire [2:0] RA={pp33,pp23|carry3,sum4};
    wire [2:0] RB={1'b0,pp32,col3_rowB};
    wire [3:0] SUM3=RA+RB;
    assign y[4]=SUM3[0]; 
assign y[5]=SUM3[1]; 
assign y[6]=SUM3[2]; 
assign y[7]=SUM3[3];
endmodule
