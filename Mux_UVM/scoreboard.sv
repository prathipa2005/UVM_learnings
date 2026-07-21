class mux_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(mux_scoreboard)

    uvm_analysis_imp #(mux_transaction,
                       mux_scoreboard) sb_imp;

    function new(string name,
                 uvm_component parent);

        super.new(name,parent);

        sb_imp = new("sb_imp",this);

    endfunction


    function void write(mux_transaction tr);

        if(tr.sel)
            tr.expected_y = tr.b;
        else
            tr.expected_y = tr.a;

        if(tr.expected_y == tr.actual_y)

            `uvm_info("SCOREBOARD",
                      $sformatf("PASS : a=%0d b=%0d sel=%0d expected=%0d actual=%0d",
                      tr.a,tr.b,tr.sel,tr.expected_y,tr.actual_y),
                      UVM_LOW)

        else

            `uvm_error("SCOREBOARD",
                       $sformatf("FAIL : a=%0d b=%0d sel=%0d expected=%0d actual=%0d",
                       tr.a,tr.b,tr.sel,tr.expected_y,tr.actual_y))

    endfunction

endclass