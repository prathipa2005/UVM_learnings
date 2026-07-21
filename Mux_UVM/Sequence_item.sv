class mux_transaction extends uvm_sequence_item;

    rand bit a;
    rand bit b;
    rand bit sel;

    bit actual_y;
    bit expected_y;

    `uvm_object_utils_begin(mux_transaction)

        `uvm_field_int(a,UVM_ALL_ON)
        `uvm_field_int(b,UVM_ALL_ON)
        `uvm_field_int(sel,UVM_ALL_ON)
        `uvm_field_int(actual_y,UVM_ALL_ON)
        `uvm_field_int(expected_y,UVM_ALL_ON)

    `uvm_object_utils_end

    function new(string name="mux_transaction");

        super.new(name);

    endfunction

endclass