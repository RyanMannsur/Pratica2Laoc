library verilog;
use verilog.vl_types.all;
entity registrador is
    port(
        clock           : in     vl_logic;
        wren            : in     vl_logic;
        buswire         : in     vl_logic_vector(15 downto 0);
        valor_anterior  : in     vl_logic_vector(15 downto 0);
        data_out        : out    vl_logic_vector(15 downto 0)
    );
end registrador;
