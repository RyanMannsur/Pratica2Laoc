library verilog;
use verilog.vl_types.all;
entity mux is
    port(
        din             : in     vl_logic_vector(15 downto 0);
        r0              : in     vl_logic_vector(15 downto 0);
        r1              : in     vl_logic_vector(15 downto 0);
        r2              : in     vl_logic_vector(15 downto 0);
        r3              : in     vl_logic_vector(15 downto 0);
        r4              : in     vl_logic_vector(15 downto 0);
        r5              : in     vl_logic_vector(15 downto 0);
        r6              : in     vl_logic_vector(15 downto 0);
        r7              : in     vl_logic_vector(15 downto 0);
        dout            : in     vl_logic_vector(15 downto 0);
        r0_out          : in     vl_logic;
        r1_out          : in     vl_logic;
        r2_out          : in     vl_logic;
        r3_out          : in     vl_logic;
        r4_out          : in     vl_logic;
        r5_out          : in     vl_logic;
        r6_out          : in     vl_logic;
        r7_out          : in     vl_logic;
        G               : in     vl_logic_vector(15 downto 0);
        g_out           : in     vl_logic;
        dinout          : in     vl_logic;
        dout_out        : in     vl_logic;
        buswires        : out    vl_logic_vector(15 downto 0)
    );
end mux;
