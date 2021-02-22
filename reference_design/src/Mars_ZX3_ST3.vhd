---------------------------------------------------------------------------------------------------
-- Copyright (c) 2021 by Enclustra GmbH, Switzerland.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this hardware, software, firmware, and associated documentation files (the
-- "Product"), to deal in the Product without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute,
-- sublicense, and/or sell copies of the Product, and to permit persons to whom the
-- Product is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Product.
--
-- THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
-- PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-- HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-- OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- libraries
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------------------------------------------------------------------
-- entity declaration
---------------------------------------------------------------------------------------------------
entity Mars_ZX3_ST3 is
  
  port (
    -- PS MIO Pins
    FIXED_IO_mio                   : inout  std_logic_vector(53 downto 0);
    FIXED_IO_ddr_vrn               : inout  std_logic;
    FIXED_IO_ddr_vrp               : inout  std_logic;
    FIXED_IO_ps_srstb              : inout  std_logic;
    FIXED_IO_ps_clk                : inout  std_logic;
    FIXED_IO_ps_porb               : inout  std_logic;
    DDR_cas_n                      : inout  std_logic;
    DDR_cke                        : inout  std_logic;
    DDR_ck_n                       : inout  std_logic;
    DDR_ck_p                       : inout  std_logic;
    DDR_cs_n                       : inout  std_logic;
    DDR_reset_n                    : inout  std_logic;
    DDR_odt                        : inout  std_logic;
    DDR_ras_n                      : inout  std_logic;
    DDR_we_n                       : inout  std_logic;
    DDR_ba                         : inout  std_logic_vector(2 downto 0);
    DDR_addr                       : inout  std_logic_vector(14 downto 0);
    DDR_dm                         : inout  std_logic_vector(3 downto 0);
    DDR_dq                         : inout  std_logic_vector(31 downto 0);
    DDR_dqs_n                      : inout  std_logic_vector(3 downto 0);
    DDR_dqs_p                      : inout  std_logic_vector(3 downto 0);
    
    -- Anios_0
    IO0_D0_P                       : inout   std_logic;
    IO0_D1_N                       : inout   std_logic;
    IO0_D2_P                       : inout   std_logic;
    IO0_D3_N                       : inout   std_logic;
    IO0_D4_P                       : inout   std_logic;
    IO0_D5_N                       : inout   std_logic;
    IO0_D6_P                       : inout   std_logic;
    IO0_D7_N                       : inout   std_logic;
    IO0_D8_P                       : inout   std_logic;
    IO0_D9_N                       : inout   std_logic;
    IO0_D10_P                      : inout   std_logic;
    IO0_D11_N                      : inout   std_logic;
    IO0_D12_P                      : inout   std_logic;
    IO0_D13_N                      : inout   std_logic;
    IO0_D14_P                      : inout   std_logic;
    IO0_D15_N                      : inout   std_logic;
    IO0_D16_P                      : inout   std_logic;
    IO0_D17_N                      : inout   std_logic;
    IO0_D18_P                      : inout   std_logic;
    IO0_D19_N                      : inout   std_logic;
    IO0_D20_P                      : inout   std_logic;
    IO0_D21_N                      : inout   std_logic;
    IO0_D22_P                      : inout   std_logic;
    IO0_D23_N                      : inout   std_logic;
    IO0_CLK_N                      : inout   std_logic;
    IO0_CLK_P                      : inout   std_logic;
    
    -- Anios_1
    IO1_D0_P                       : inout   std_logic;
    IO1_D1_N                       : inout   std_logic;
    IO1_D2_P                       : inout   std_logic;
    IO1_D3_N                       : inout   std_logic;
    IO1_D4_P                       : inout   std_logic;
    IO1_D5_N                       : inout   std_logic;
    IO1_D6_P                       : inout   std_logic;
    IO1_D7_N                       : inout   std_logic;
    IO1_D8_P                       : inout   std_logic;
    IO1_D9_N                       : inout   std_logic;
    IO1_D10_P                      : inout   std_logic;
    IO1_D11_N                      : inout   std_logic;
    IO1_D12_P                      : inout   std_logic;
    IO1_D13_N                      : inout   std_logic;
    IO1_D14_P                      : inout   std_logic;
    IO1_D15_N                      : inout   std_logic;
    IO1_D16_P                      : inout   std_logic;
    IO1_D17_N                      : inout   std_logic;
    IO1_D18_P                      : inout   std_logic;
    IO1_D19_N                      : inout   std_logic;
    IO1_D20_P                      : inout   std_logic;
    IO1_D21_N                      : inout   std_logic;
    IO1_D22_P                      : inout   std_logic;
    IO1_D23_N                      : inout   std_logic;
    IO1_CLK_N                      : inout   std_logic;
    IO1_CLK_P                      : inout   std_logic;
    
    -- DDR3
    DDR3_VSEL                      : inout   std_logic;
    
    -- DP
    DP_HPD                         : in      std_logic;
    DP_AUX_IN                      : in      std_logic;
    DP_AUX_OE                      : out     std_logic;
    DP_AUX_OUT                     : out     std_logic;
    DP_LANE0_N                     : inout   std_logic;
    DP_LANE0_P                     : inout   std_logic;
    DP_LANE1_N                     : inout   std_logic;
    DP_LANE1_P                     : inout   std_logic;
    
    -- HDMI
    HDMI_CEC                       : inout   std_logic;
    HDMI_HPD                       : inout   std_logic;
    HDMI_D0_N                      : inout   std_logic;
    HDMI_D0_P                      : inout   std_logic;
    HDMI_D1_N                      : inout   std_logic;
    HDMI_D1_P                      : inout   std_logic;
    HDMI_D2_N                      : inout   std_logic;
    HDMI_D2_P                      : inout   std_logic;
    HDMI_CLK_N                     : inout   std_logic;
    HDMI_CLK_P                     : inout   std_logic;
    
    -- I2C_PL
    I2C_INT_N                      : in      std_logic;
    Rev4                           : in      std_logic;
    Rev5                           : in      std_logic;
    I2C_SCL                        : inout   std_logic;
    I2C_SDA                        : inout   std_logic;
    
    -- IO_2
    IO2_D0_P                       : inout   std_logic;
    IO2_D1_N                       : inout   std_logic;
    IO2_D2_P                       : inout   std_logic;
    IO2_D3_N                       : inout   std_logic;
    IO2_D4_P                       : inout   std_logic;
    IO2_D5_N                       : inout   std_logic;
    IO2_D6_P                       : inout   std_logic;
    IO2_D7_N                       : inout   std_logic;
    
    -- IO_3
    IO3_D0_P                       : inout   std_logic;
    IO3_D1_N                       : inout   std_logic;
    IO3_D2_P                       : inout   std_logic;
    IO3_D3_N                       : inout   std_logic;
    
    -- LED
    LED0_N                         : out     std_logic;
    LED1_N                         : out     std_logic;
    LED2_N                         : out     std_logic;
    LED3_N                         : out     std_logic;
    
    -- MIPI
    MIPI_D0_N                      : inout   std_logic;
    MIPI_D0_P                      : inout   std_logic;
    MIPI_D1_N                      : inout   std_logic;
    MIPI_D1_P                      : inout   std_logic;
    MIPI_CLK_N                     : inout   std_logic;
    MIPI_CLK_P                     : inout   std_logic;
    
    -- PL_Gig_Ethernet
    ETH_LED2_N                     : inout   std_logic;
    ETH_MDC                        : out     std_logic;
    ETH_RXCLK                      : in      std_logic;
    ETH_TXCLK                      : out     std_logic;
    ETH_MDIO                       : inout   std_logic;
    ETH_RESET_N                    : out     std_logic;
    ETH_RXCTL                      : in      std_logic;
    ETH_TXCTL                      : out     std_logic;
    ETH_RXD                        : in      std_logic_vector(3 downto 0);
    ETH_TXD                        : out     std_logic_vector(3 downto 0);
    
    -- ST3_I2C
    I2C_SCL_FPGA                   : inout   std_logic;
    I2C_SDA_FPGA                   : inout   std_logic;
    
    -- USB
    USB_RST_N                      : inout   std_logic;
    
    -- USB3
    USBH_SSRX_N                    : inout   std_logic;
    USBH_SSRX_P                    : inout   std_logic;
    USBH_SSTX_N                    : inout   std_logic;
    USBH_SSTX_P                    : inout   std_logic;
    
    -- User_Osc
    OSC_N                          : in      std_logic;
    OSC_P                          : in      std_logic
  );
end Mars_ZX3_ST3;

architecture rtl of Mars_ZX3_ST3 is

  ---------------------------------------------------------------------------------------------------
  -- component declarations
  ---------------------------------------------------------------------------------------------------
  component Mars_ZX3 is
    port (
      Clk50               : out    std_logic;
      Rst_N               : out    std_logic;
      I2C_INT             : in     std_logic;
      FIXED_IO_mio        : inout  std_logic_vector(53 downto 0);
      FIXED_IO_ddr_vrn    : inout  std_logic;
      FIXED_IO_ddr_vrp    : inout  std_logic;
      FIXED_IO_ps_srstb   : inout  std_logic;
      FIXED_IO_ps_clk     : inout  std_logic;
      FIXED_IO_ps_porb    : inout  std_logic;
      DDR_cas_n           : inout  std_logic;
      DDR_cke             : inout  std_logic;
      DDR_ck_n            : inout  std_logic;
      DDR_ck_p            : inout  std_logic;
      DDR_cs_n            : inout  std_logic;
      DDR_reset_n         : inout  std_logic;
      DDR_odt             : inout  std_logic;
      DDR_ras_n           : inout  std_logic;
      DDR_we_n            : inout  std_logic;
      DDR_ba              : inout  std_logic_vector(2 downto 0);
      DDR_addr            : inout  std_logic_vector(14 downto 0);
      DDR_dm              : inout  std_logic_vector(3 downto 0);
      DDR_dq              : inout  std_logic_vector(31 downto 0);
      DDR_dqs_n           : inout  std_logic_vector(3 downto 0);
      DDR_dqs_p           : inout  std_logic_vector(3 downto 0);
      IIC_0_sda_i         : in     std_logic;
      IIC_0_sda_o         : out    std_logic;
      IIC_0_sda_t         : out    std_logic;
      IIC_0_scl_i         : in     std_logic;
      IIC_0_scl_o         : out    std_logic;
      IIC_0_scl_t         : out    std_logic;
      LED_N               : out    std_logic_vector(3 downto 0);
      IIC_1_sda_i         : in     std_logic;
      IIC_1_sda_o         : out    std_logic;
      IIC_1_sda_t         : out    std_logic;
      IIC_1_scl_i         : in     std_logic;
      IIC_1_scl_o         : out    std_logic;
      IIC_1_scl_t         : out    std_logic
    );
    
  end component Mars_ZX3;

  ---------------------------------------------------------------------------------------------------
  -- signal declarations
  ---------------------------------------------------------------------------------------------------
  signal Clk50            : std_logic;
  signal Rst_N            : std_logic;
  signal I2C_INT          : std_logic;
  signal IIC_0_sda_i      : std_logic;
  signal IIC_0_sda_o      : std_logic;
  signal IIC_0_sda_t      : std_logic;
  signal IIC_0_scl_i      : std_logic;
  signal IIC_0_scl_o      : std_logic;
  signal IIC_0_scl_t      : std_logic;
  signal LED_N            : std_logic_vector(3 downto 0);
  signal IIC_1_sda_i      : std_logic;
  signal IIC_1_sda_o      : std_logic;
  signal IIC_1_sda_t      : std_logic;
  signal IIC_1_scl_i      : std_logic;
  signal IIC_1_scl_o      : std_logic;
  signal IIC_1_scl_t      : std_logic;
  signal LedCount         : unsigned(23 downto 0);

begin
  
  ---------------------------------------------------------------------------------------------------
  -- processor system instance
  ---------------------------------------------------------------------------------------------------
  Mars_ZX3_i: component Mars_ZX3
    port map (
      Clk50                => Clk50,
      Rst_N                => Rst_N,
      I2C_INT              => I2C_INT,
      FIXED_IO_mio         => FIXED_IO_mio,
      FIXED_IO_ddr_vrn     => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp     => FIXED_IO_ddr_vrp,
      FIXED_IO_ps_srstb    => FIXED_IO_ps_srstb,
      FIXED_IO_ps_clk      => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb     => FIXED_IO_ps_porb,
      DDR_cas_n            => DDR_cas_n,
      DDR_cke              => DDR_cke,
      DDR_ck_n             => DDR_ck_n,
      DDR_ck_p             => DDR_ck_p,
      DDR_cs_n             => DDR_cs_n,
      DDR_reset_n          => DDR_reset_n,
      DDR_odt              => DDR_odt,
      DDR_ras_n            => DDR_ras_n,
      DDR_we_n             => DDR_we_n,
      DDR_ba               => DDR_ba,
      DDR_addr             => DDR_addr,
      DDR_dm               => DDR_dm,
      DDR_dq               => DDR_dq,
      DDR_dqs_n            => DDR_dqs_n,
      DDR_dqs_p            => DDR_dqs_p,
      IIC_0_sda_i          => IIC_0_sda_i,
      IIC_0_sda_o          => IIC_0_sda_o,
      IIC_0_sda_t          => IIC_0_sda_t,
      IIC_0_scl_i          => IIC_0_scl_i,
      IIC_0_scl_o          => IIC_0_scl_o,
      IIC_0_scl_t          => IIC_0_scl_t,
      LED_N                => LED_N,
      IIC_1_sda_i          => IIC_1_sda_i,
      IIC_1_sda_o          => IIC_1_sda_o,
      IIC_1_sda_t          => IIC_1_sda_t,
      IIC_1_scl_i          => IIC_1_scl_i,
      IIC_1_scl_o          => IIC_1_scl_o,
      IIC_1_scl_t          => IIC_1_scl_t
    );
  
  DDR3_VSEL <= '0';
  I2C_SDA  <= IIC_0_sda_o when IIC_0_sda_t = '0' else 'Z';
  IIC_0_sda_i <= I2C_SDA;
  I2C_SCL <= IIC_0_scl_o when IIC_0_scl_t = '0' else 'Z';
  IIC_0_scl_i <= I2C_SCL;
  I2C_INT <= not I2C_INT_N when Rev5 = '0' else I2C_INT_N;
  process (Clk50)
  begin
    if rising_edge (Clk50) then
      if Rst_N = '0' then
        LedCount    <= (others => '0');
      else
        LedCount    <= LedCount + 1;
      end if;
    end if;
  end process;
  LED0_N <= '0' when LedCount(LedCount'high) = '0' else 'Z';
  LED1_N <= '0' when LED_N(0) = '0' else 'Z';
  LED2_N <= '0' when LED_N(1) = '0' else 'Z';
  LED3_N <= '0' when LED_N(2) = '0' else 'Z';
  I2C_SDA_FPGA  <= IIC_1_sda_o when IIC_1_sda_t = '0' else 'Z';
  IIC_1_sda_i <= I2C_SDA_FPGA;
  I2C_SCL_FPGA <= IIC_1_scl_o when IIC_1_scl_t = '0' else 'Z';
  IIC_1_scl_i <= I2C_SCL_FPGA;

end rtl;
