library verilog;
use verilog.vl_types.all;
entity pratica2 is
    port(
        clock           : in     vl_logic;
        ir              : in     vl_logic_vector(8 downto 0);
        din             : in     vl_logic_vector(15 downto 0);
        run             : in     vl_logic;
        resetn          : in     vl_logic;
        q               : out    vl_logic_vector(15 downto 0)
    );
end pratica2;
