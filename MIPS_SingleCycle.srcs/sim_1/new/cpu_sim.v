module cpu_sim;

    /*
    reg [15:0]in0 = 0; 
    reg [15:0]in1 = 0;
    reg select = 0;
    wire [15:0]cout;
    */
    
    reg [3:0]Aaddr = 0, Baddr = 0, Caddr = 0;
    reg [15:0]cdata = 0;
    reg Load = 0, Clear = 0, clk = 0;
    wire [15:0]aout, bout;
    
    
    //TwotoOne_Mux dut (in0, in1, select, cout);
    reg_file rf_dut (aout, bout, cdata, Aaddr, Baddr, Caddr, Load, Clear, clk);

initial
    begin
        clk = 0;
        Clear = 0;
        Load = 0;
        Caddr = 13;
        cdata = 56;
        #50;
        clk = 1;
        Clear = 0;
        Load = 1;
        #50
        clk = 0;
        Aaddr = 13;
        #50
        clk = 1;
    end
endmodule