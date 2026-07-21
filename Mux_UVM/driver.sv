class mux_driver extends uvm_driver #(mux_transaction);

    `uvm_component_utils(mux_driver)

    virtual mux_if vif;

    mux_transaction tr;

    function new(string name,
                 uvm_component parent);

        super.new(name,parent);

    endfunction


    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        if(!uvm_config_db #(virtual mux_if)::get(this,"","vif",vif))
            `uvm_fatal("DRV","Unable to access Interface")

    endfunction


    task run_phase(uvm_phase phase);

        forever

        begin

            seq_item_port.get_next_item(tr);

            vif.a   <= tr.a;
            vif.b   <= tr.b;
            vif.sel <= tr.sel;

            @(posedge vif.clk);

            seq_item_port.item_done();

        end

    endtask

endclass