function [spi_rst, spi_clk, spi_cs, spi_mosi] = spi_ctrl(clk_in)
  persistent counter, counter = xl_state(0, {xlUnsigned, 8, 0});
  persistent prog_done, prog_done = xl_state(0, {xlUnsigned, 1, 0});
  persistent spi_rst_reg, spi_rst_reg = xl_state(0, {xlUnsigned, 1, 0});
  persistent spi_clk_reg, spi_clk_reg = xl_state(0, {xlUnsigned, 1, 0});
  persistent spi_cs_reg, spi_cs_reg = xl_state(0, {xlUnsigned, 1, 0});
  persistent spi_mosi_reg, spi_mosi_reg = xl_state(0, {xlUnsigned, 1, 0});
  spi_clk = spi_clk_reg;
  spi_rst = spi_rst_reg;
  spi_cs = spi_cs_reg;
  spi_mosi = spi_mosi_reg;
  if ((clk_in == 0) && (spi_clk_reg == 0))
      spi_clk_reg = 1;
  elseif ((clk_in == 0) && (spi_clk_reg == 1))
      counter = counter + 1;
	  spi_clk_reg = 0;
  elseif ((clk_in == 2) && (spi_clk == 0) && (prog_done == 0))

      % output bit 15 to 0 as 0000 0011 0100 1000

      switch double(counter)
          case 0
              spi_rst_reg = 0;
              spi_cs_reg = 1;
              spi_mosi_reg = 1;
          case 1
              spi_rst_reg = 0;
              spi_cs_reg = 1;
              spi_mosi_reg = 1;
          case 2
              spi_rst_reg = 0;
              spi_cs_reg = 1;
              spi_mosi_reg = 1;
          case 3
              spi_rst_reg = 0;
              spi_cs_reg = 1;
              spi_mosi_reg = 1;
          case 4
              spi_rst_reg = 0;
              spi_cs_reg = 1;
              spi_mosi_reg = 1;
          case 5
              spi_rst_reg = 0;
              spi_cs_reg = 1;
              spi_mosi_reg = 1;
          case 6
              spi_rst_reg = 0;
              spi_cs_reg = 1;
              spi_mosi_reg = 1;
          case 7
              spi_rst_reg = 0;
              spi_cs_reg = 1;
              spi_mosi_reg = 1;
          case 8
              spi_rst_reg = 0;
              spi_cs_reg = 1;
              spi_mosi_reg = 1;
          case 9
              spi_rst_reg = 0;
              spi_cs_reg = 1;
              spi_mosi_reg = 1;
          case 10
              spi_rst_reg = 0;
              spi_cs_reg = 1;
              spi_mosi_reg = 1;
          case 11
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 1;
          case 12
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 13
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 14
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 15
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 16
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 17
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 18
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 1;
          case 19
              spi_rst_reg = 1;
              spi_cs_reg = 1;
              spi_mosi_reg = 0;
          case 20
              spi_rst_reg = 1;
              spi_cs_reg = 1;
              spi_mosi_reg = 0;
          case 21
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 22
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 23
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 24
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 25
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 26
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 27
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 1;
          case 28
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 1;
          case 29
              spi_rst_reg = 1;
              spi_cs_reg = 1;
              spi_mosi_reg = 0;
          case 30
              spi_rst_reg = 1;
              spi_cs_reg = 1;
              spi_mosi_reg = 0;
          case 31
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 32
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 1;
          case 33
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 34 % specify the gray/binary
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 35 % specify the dmux
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 1;
          case 36
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 37
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 38
              spi_rst_reg = 1;
              spi_cs_reg = 0;
              spi_mosi_reg = 0;
          case 39
              spi_rst_reg = 1;
              spi_cs_reg = 1;
			  spi_mosi_reg = 1;
              prog_done = 1;
          otherwise
              spi_rst_reg = 1;
              spi_cs_reg = 1;
			  spi_mosi_reg = 1;
              % debug
           
              prog_done = 1;
      end
  else
  	  spi_rst = spi_rst;
	  spi_cs = spi_cs;
	  spi_mosi = spi_mosi;
     
  end
  