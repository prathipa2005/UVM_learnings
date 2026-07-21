class mux_sequence extends uvm_sequence #(mux_transaction);

    `uvm_object_utils(mux_sequence)

    mux_transaction tr;

    function new(string name="mux_sequence");

        super.new(name);

    endfunction

    task body();

        repeat(10)

        begin

            tr = mux_transaction::type_id::create("tr");

            start_item(tr);

            assert(tr.randomize());

            finish_item(tr);

        end

    endtask

endclass