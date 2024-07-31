library verilog;
use verilog.vl_types.all;
entity addSub is
    port(
        add_sub         : in     vl_logic;
        soma            : in     vl_logic;
        maior_menor     : in     vl_logic;
        comparacao      : in     vl_logic;
        rx              : in     vl_logic_vector(15 downto 0);
        ry              : in     vl_logic_vector(15 downto 0);
        data_out        : out    vl_logic_vector(15 downto 0)
    );
end addSub;
