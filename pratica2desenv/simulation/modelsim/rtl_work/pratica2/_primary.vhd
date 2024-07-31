library verilog;
use verilog.vl_types.all;
entity pratica2 is
    port(
        clock           : in     vl_logic;
        din             : in     vl_logic_vector(15 downto 0);
        run             : in     vl_logic;
        resetn          : in     vl_logic;
        saida           : out    vl_logic_vector(15 downto 0);
        r0t             : out    vl_logic_vector(15 downto 0);
        r1t             : out    vl_logic_vector(15 downto 0);
        r2t             : out    vl_logic_vector(15 downto 0);
        r3t             : out    vl_logic_vector(15 downto 0);
        r7t             : out    vl_logic_vector(15 downto 0);
        irt             : out    vl_logic_vector(9 downto 0);
        sp              : out    vl_logic_vector(15 downto 0)
    );
end pratica2;
