module cpu_sim;

/*
    //Mux Sim
    reg [15:0]in0 = 0; 
    reg [15:0]in1 = 0;
    reg select = 0;
    wire [15:0]cout;
    
    TwotoOne_Mux dut (in0, in1, select, cout);
*/
 
/*
//Register file sim  
    reg [3:0]Aaddr = 0, Baddr = 0, Caddr = 0;
    reg [15:0]cdata = 0;
    reg Load = 0, Clear = 0, clk = 0;
    wire [15:0]aout, bout;
    
    reg_file rf_dut (aout, bout, cdata, Aaddr, Baddr, Caddr, Load, Clear, clk);

initial
    begin
        clk = 0;
        Clear = 0;
        Load = 0;
        Aaddr = 13;
        Caddr = 13;
        cdata = 36;
        #50
        Clear = 1;
        #50;
        clk = 1;
        #50
        Load = 1;        
        clk = 0;
        #50
        clk = 1;
    end
*/

/*
    //ALU module sim
    reg [15:0]X = 0;
    reg [15:0]Y = 0;
    reg [2:0]opcod = 0;
    reg Cin = 0;
    wire[15:0] out;
    wire Cout, lt, eq, gt, V;

    alu alu_df (X, Y, out, Cin, Cout, lt, eq, gt, V, opcod);
    
initial begin
    opcod = 3'b000;
    X = 32000;
    Y = 768;
    #20
    opcod = 3'b001;
    X = -32000;
    Y = 768;
    #20
    opcod = 3'b010;
    X = 16'hFFFF;
    Y = 16'hABCD;
    #20
    opcod = 3'b011;
    X = 16'hF0F0;
    Y = 16'h0F0F;
    #20
    opcod = 3'b100;
    X = 15;
    Y = 20;
    #20 
    X = 20;
    Y = 15;
    #20
    opcod = 3'b101;
    X = 15;
    Y = 15;
    #20
    X = 30;
    
end
*/

/*
    //sign ext simulation module
    reg [3:0]in;
    wire [15:0]out;
    signExt4to16 SE_DUT (in, out);
    
initial begin
   in = 4'b1010;
   #20
   in = 4'b0110; 
    
end
*/

/*
    //memory mod simulation
    reg clk, memRead, memWrite;
    reg [15:0] address;
    reg [15:0] inData;
    wire [15:0] data;
    memory64KB mem_dut (clk, address, inData, memRead, memWrite, data);

initial begin
    clk = 1;
    memRead = 0;
    memWrite = 1;
    address = 16'h0000;
    inData = 32450;
    #10
    clk = 0;
    #10
    clk = 1;
    #5
    memRead = 1;
    memWrite = 0;
    //address = 16'h0011;
    #10
    clk = 0;
end
*/

/*
    //control simulation
    reg [3:0]OpCode;
    wire Mux1,Mux2,Mux3,Branch;
    wire MemRead,MemWrite,RegWrite;
    wire [2:0]ALUOp;
    control ctr (OpCode,Mux1,Mux2,Mux3,Branch,MemRead,MemWrite,RegWrite,ALUOp);

initial begin
    OpCode = 0;
    #20
    OpCode = 1;
    #20
    OpCode = 2;
    #20
    OpCode = 3;
    #20
    OpCode = 4;
    #20
    OpCode = 5;
    #20
    OpCode = 6;
    #20
    OpCode = 7;               
end
*/


/*
    //D flip flop simulation
    reg clk, reset;
    reg [15:0]in;
    wire [15:0]out;
    PCff    PCff_dut    (clk, reset, in, out);

initial begin
    clk = 0;
    reset = 1;
    #50 clk = 1;
    #5 reset = 0;
    #5 in = 5;
    #5 clk = 1;
    #10 clk = 0;
    #5 in = 10;
    #10 clk = 1;
end
*/

/*
    reg [15:0] address;
    wire [15:0] MemData;
    InstMemory im_dut (address,MemData);

initial begin
    address = 16'h0000;
    #50
    address = 16'h0001;
    #50
    address = 16'h0002;
end
*/

/*
    //MIPS simulation
    reg clock;
    reg [15:0]inst;
    wire [15:0]reg1Data;
    wire [15:0]reg2Data;
    wire [15:0]aluRes;
    MIPS    MIPS_dut    (clock, inst, reg1Data, reg2Data, aluRes);

initial begin
//    clock = 1;
//    #5
//    inst = 16'h21A4;
//    #45
//    clock = 0;
    
//    #50
    clock = 1;
    #5
    inst = 16'hA174;
    #45
    clock = 0;

    #50
    clock = 1;
    #5
    inst = 16'h8104;
    #45
    clock = 0;
    
    #50
    clock = 1;
    #5
    inst = 16'h2601;
    #45
    clock = 0;
end
*/


    //MIPS simulation 2
    reg clock;
    wire [15:0]reg1Data;
    wire [15:0]reg2Data;
    wire [15:0]aluRes;
    wire [15:0]memData;
    wire [15:0]PCout;
    MIPS    MIPS_dut    (clock, reg1Data, reg2Data, aluRes, memData, PCout);

initial begin
    clock = 1;
    #50
    clock = 0;
    
    #50
    clock = 1;
    #50
    clock = 0;
    
    #50
    clock = 1;
    #50 
    clock = 0;
    
    #50 
    clock = 1;
    #50 
    clock = 0;
    
    #50 
    clock = 1;
    #50 
    clock = 0;
    
    #50 
    clock = 1;
    #50 
    clock = 0;
    
    #50 
    clock = 1;
    #50 
    clock = 0;
    
    #50 
    clock = 1;
    #50 
    clock = 0;

    #50 
    clock = 1;
    #50 
    clock = 0;

    #50 
    clock = 1;
    #50 
    clock = 0;
end

endmodule
