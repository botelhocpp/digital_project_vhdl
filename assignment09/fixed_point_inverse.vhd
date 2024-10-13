LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY PROJECT;
USE PROJECT.DEFS.ALL;

ENTITY fixed_point_inverse IS
    PORT (
        input_value : IN byte;
        output_value : OUT byte
    );
END fixed_point_inverse;

ARCHITECTURE rtl OF fixed_point_inverse IS
    SIGNAL value : INTEGER;
    SIGNAL inverse_value : INTEGER;
BEGIN
    value <= TO_INTEGER(sbyte(input_value));
    inverse_value <= 16/value WHEN (value /= 0) ELSE 0;
    output_value <= byte(TO_SIGNED(inverse_value, 8));
END rtl;
