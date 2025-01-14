
// Code your design here

module spi (input clk, newd, rst, input [11:0] din,
        output reg cs, mosi, sclk);
  
  typedef enum bit [1:0] {idle= 2'b00 , enable= 2'b01 , send= 2'b10 , comp= 2'b11  } state_type;
  
  state_type state = idle;
  
  int countc = 0;
  int count = 0;
  
  // generation of sclk
  
  always @ (posedge clk)
    begin
      if(rst == 1'b1)
        begin
          countc <= 0;
          sclk <= 0;
        end
      else 
        begin
          if(countc < 10) 
            begin
            countc <= countc + 1;
            end
          else 
            begin
            countc <= 0;
          	sclk <= ~ sclk;
            end
      	end
    end
  
  // after the generation of sclk we have to write the logic for state machine and implement using SPI
  
  reg [11:0] temp;
  
  always @ (posedge sclk)
    begin
      if(rst == 1'b1)
        begin
          cs = 1'b1;
          mosi = 1'b0;
        end
      else 
        begin
          case (state)
            idle:
            	begin
                  if(newd == 1'b1)  
                    begin
                      state <= send;
                      temp <= din;
                      cs <= 1'b0;
                    end
                  else 
                    begin
                      state <= idle;
                      temp <= 8'h00;
                    end
            	end
            send: 
              	begin
                  if(count < 11)
                    begin
                      mosi <= temp[count];   //because the data size is 12 count will go upto 12 and mosi will store the data from 0 to 11
                      count <= count + 1;
                    end
                  else 
                    begin
                      	count <= 0;
               			state <= idle;
               			cs <= 1'b1;
               			mosi <= 1'b0;
                    end
              	end
            default :
            state <= idle;
          endcase
        end  
    end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
