class mux_agent extends uvm_agent;

    `uvm_component_utils(mux_agent)

    mux_driver drv;

    mux_monitor mon;

    mux_sequencer seqr;

    function new(string name,
                 uvm_component parent);

        super.new(name,parent);

    endfunction


    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        drv  = mux_driver::type_id::create("drv",this);

        mon  = mux_monitor::type_id::create("mon",this);

        seqr = mux_sequencer::type_id::create("seqr",this);

    endfunction


    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);

        drv.seq_item_port.connect(seqr.seq_item_export);

    endfunction

endclass