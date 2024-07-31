library verilog;
use verilog.vl_types.all;
entity controle is
    generic(
        MV              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        MVI             : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        ADD             : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        SUB             : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        LD              : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        ST              : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        MVNZ            : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        SLT             : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        CMP             : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        PUSH            : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1);
        POP             : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi0);
        T0              : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        T1              : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        T2              : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        T3              : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        T4              : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        T5              : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1)
    );
    port(
        clock           : in     vl_logic;
        ir              : in     vl_logic_vector(9 downto 0);
        run             : in     vl_logic;
        resetn          : in     vl_logic;
        G               : in     vl_logic_vector(15 downto 0);
        r0_in           : out    vl_logic;
        r1_in           : out    vl_logic;
        r2_in           : out    vl_logic;
        r3_in           : out    vl_logic;
        r4_in           : out    vl_logic;
        r5_in           : out    vl_logic;
        r6_in           : out    vl_logic;
        add_sub         : out    vl_logic;
        dinout          : out    vl_logic;
        g_out           : out    vl_logic;
        r7_in           : out    vl_logic;
        r0_out          : out    vl_logic;
        r1_out          : out    vl_logic;
        r2_out          : out    vl_logic;
        r3_out          : out    vl_logic;
        r4_out          : out    vl_logic;
        r5_out          : out    vl_logic;
        r6_out          : out    vl_logic;
        r7_out          : out    vl_logic;
        a_in            : out    vl_logic;
        g_in            : out    vl_logic;
        soma            : out    vl_logic;
        zero            : out    vl_logic;
        maior_menor     : out    vl_logic;
        comparacao      : out    vl_logic;
        addr_in         : out    vl_logic;
        dout_in         : out    vl_logic;
        wren            : out    vl_logic;
        memoria_ler     : out    vl_logic;
        q_out           : out    vl_logic;
        dout_out        : out    vl_logic;
        done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of MV : constant is 1;
    attribute mti_svvh_generic_type of MVI : constant is 1;
    attribute mti_svvh_generic_type of ADD : constant is 1;
    attribute mti_svvh_generic_type of SUB : constant is 1;
    attribute mti_svvh_generic_type of LD : constant is 1;
    attribute mti_svvh_generic_type of ST : constant is 1;
    attribute mti_svvh_generic_type of MVNZ : constant is 1;
    attribute mti_svvh_generic_type of SLT : constant is 1;
    attribute mti_svvh_generic_type of CMP : constant is 1;
    attribute mti_svvh_generic_type of PUSH : constant is 1;
    attribute mti_svvh_generic_type of POP : constant is 1;
    attribute mti_svvh_generic_type of T0 : constant is 1;
    attribute mti_svvh_generic_type of T1 : constant is 1;
    attribute mti_svvh_generic_type of T2 : constant is 1;
    attribute mti_svvh_generic_type of T3 : constant is 1;
    attribute mti_svvh_generic_type of T4 : constant is 1;
    attribute mti_svvh_generic_type of T5 : constant is 1;
end controle;
