`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2017 05:14:50 AM
// Design Name: 
// Module Name: MIPS
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MIPS(input clock,  
        output [15:0]reg1Data,
        output [15:0]reg2Data,
        output wire [15:0]monitorData,
        output wire [15:0]monitorData2,
        output wire [15:0]monitorData3);

    wire [2:0]ALUOp;
    wire MUX1, MUX2, MUX3, RegWrite;
    wire Branch, MemRead, MemWrite;
    wire [15:0]reg1Data, reg2Data;
    wire [15:0]mem2Data;
    wire [15:0]aluRes;
    wire [15:0]signExtOut;
    wire [15:0]MUX1out, MUX2out, MUX3out;
    wire [15:0]PCout, NextPC;
    
    wire zero, BranchSel;
    wire [15:0]MemData;
    wire [15:0]PC_2, PC_Branch;

    assign BranchSel = ~zero & Branch;

    assign monitorData = aluRes;
    assign monitorData2 = MemData;
    assign monitorData3 = PCout;

    reg res;
    initial begin
        res = 1;
        #50
        res = 0;
    end

  //PCff                    (        clk,    reset,    [15:0]in,   [15:0]out);
    PCff            PC      (.clk(clock), .reset(res), .in(NextPC), .out(PCout));

  //InstMemory              (address,MemData);
    InstMemory      im      (.address(PCout), .MemData(MemData));
    
  //control                 (OpCode,Mux1,Mux2,Mux3,Branch,MemRead,MemWrite,RegWrite,[2:0]ALUOp);
    control         c1      (.OpCode(MemData[15:12]),.Mux1(MUX1),.Mux2(MUX2),.Mux3(MUX3),.Branch(Branch),
                                .MemRead(MemRead),.MemWrite(MemWrite),.RegWrite(RegWrite),.ALUOp(ALUOp));

  //TwotoOne_Mux            (         [15:0]in0,          [15:0]in1,        sel,     [15:0]out);
    TwotoOne_Mux    m1      (.in0(MemData[3:0]), .in1(MemData[7:4]), .sel(MUX1), .out(MUX1out));
    TwotoOne_Mux    m2      (      .in0(aluRes),     .in1(mem2Data), .sel(MUX2), .out(MUX2out));
    TwotoOne_Mux    m3      (  .in0(signExtOut),     .in1(reg2Data), .sel(MUX3), .out(MUX3out));
    TwotoOne_Mux    mB      (        .in0(PC_2),    .in1(PC_Branch), .sel(BranchSel), .out(NextPC));

  //signExt4to16            (         [3:0] in,       [15:0] out);
    signExt4to16    ext16   (.in(MemData[3:0]), .out(signExtOut));
    
  //reg_file            (     [15:0]A,     [15:0] B,  [15:0] C,           [3:0] Aaddr,     [3:0] Baddr,          [3:0] Caddr, Load,    Clear, clk);
    reg_file    rf      (.A(reg1Data), .B(reg2Data), .C(MUX2out), .Aaddr(MemData[11:8]), .Baddr(MemData[7:4]), .Caddr(MUX1out), 
                            .Load(RegWrite), .Clear(1), .clk(clock));
  
  //alu                 (    [15:0] X,            [15:0] Y,      [15:0] out,     Cin,    Cout,    lt,        eq,    gt,    V,          opcod);
    alu         alu1    (.X(reg1Data),         .Y(MUX3out),    .out(aluRes), .Cin(0), .Cout(), .lt(), .eq(zero), .gt(), .V(),  .opcod(ALUOp));
    alu         PCadder (   .X(PCout),               .Y(2),      .out(PC_2), .Cin(0), .Cout(), .lt(),     .eq(), .gt(), .V(), .opcod(3'b000));
    alu          Badder (    .X(PC_2), .Y(signExtOut), .out(PC_Branch), .Cin(0), .Cout(), .lt(),     .eq(), .gt(), .V(), .opcod(3'b001));
    //change here if you want shift signExtOut << 1
 
  //memory64KB          (clk,            [15:0]address,      [15:0]inData,           memRead,            memWrite,      [15:0]data);
    memory64KB  mem2    (.clk(clock), .address(aluRes), .inData(reg2Data), .memRead(MemRead), .memWrite(MemWrite), .data(mem2Data));



endmodule
