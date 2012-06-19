function [spi_rst, spi_clk, spi_cs, spi_mosi] = spi_ctrl(clk_in)
  persistent counter, counter = xl_state(0, {xlUnsigned, 1, 0});
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
      switch (counter)
          case 0
              spi_rst = 0;
              spi_cs = 1;
              spi_mosi = 1;
          case 1
              spi_rst = 0;
              spi_cs = 1;
              spi_mosi = 1;
 
          otherwise
              spi_rst = 1;
              spi_cs = 1;
			  spi_mosi = 1;
              % debug
           
        %      prog_done = 1;
      end
  else
  	  spi_rst = spi_rst;
	  spi_cs = spi_cs;
	  spi_mosi = spi_mosi;
     
  end
  