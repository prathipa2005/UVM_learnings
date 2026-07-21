class mux_env extends uvm_env;

    `uvm_component_utils(mux_env)

    mux_agent agent;

    mux_scoreboard sb;

    function new(string name,
                 uvm_component parent);

        super.new(name,parent);

    endfunction


    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        agent = mux_agent::type_id::create("agent",this);

        sb = mux_scoreboard::type_id::create("sb",this);

    endfunction


    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);

        agent.mon.mon_ap.connect(sb.sb_imp);

    endfunction

endclass