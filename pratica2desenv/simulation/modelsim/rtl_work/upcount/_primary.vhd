library verilog;
use verilog.vl_types.all;
entity upcount is
    port(
        Clear           : in     vl_logic;
        Clock           : in     vl_logic;
        Q_anterior      : in     vl_logic_vector(15 downto 0);
        valor           : in     vl_logic_vector(15 downto 0);
        wren            : in     vl_logic;
        Enable          : in     vl_logic;
        Q               : out    vl_logic_vector(15 downto 0)
    );
end upcount;
