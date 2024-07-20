library verilog;
use verilog.vl_types.all;
entity pratica2 is
    port(
        clock           : in     vl_logic;
        ir              : in     vl_logic_vector(8 downto 0);
        din             : in     vl_logic_vector(15 downto 0);
        run             : in     vl_logic;
        resetn          : in     vl_logic;
        q               : out    vl_logic_vector(15 downto 0);
        r0              : out    vl_logic_vector(15 downto 0);
        r1              : out    vl_logic_vector(15 downto 0);
        r2              : out    vl_logic_vector(15 downto 0);
        r3              : out    vl_logic_vector(15 downto 0);
        r4              : out    vl_logic_vector(15 downto 0);
        r5              : out    vl_logic_vector(15 downto 0);
        r6              : out    vl_logic_vector(15 downto 0);
        r7              : out    vl_logic_vector(15 downto 0);
        A               : out    vl_logic_vector(15 downto 0);
        G               : out    vl_logic_vector(15 downto 0);
        r0_out          : out    vl_logic;
        r1_out          : out    vl_logic;
        r2_out          : out    vl_logic;
        r3_out          : out    vl_logic;
        r4_out          : out    vl_logic;
        r5_out          : out    vl_logic;
        r6_out          : out    vl_logic;
        r7_out          : out    vl_logic;
        g_out           : out    vl_logic;
        dinout          : out    vl_logic
    );
end pratica2;
