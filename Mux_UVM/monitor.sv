class mux_monitor extends uvm_monitor;

   `uvm_component_utils(mux_monitor)

   virtual mux_if vif;

   uvm_analysis_port #(mux_transaction) mon_ap;

   function new(string name,
                uvm_component parent);

      super.new(name,parent);

      mon_ap = new("mon_ap", this);

   endfunction

   function void build_phase(uvm_phase phase);

      super.build_phase(phase);

      if(!uvm_config_db #(virtual mux_if)::get(this,"","vif",vif))
         `uvm_fatal("MON","Virtual Interface not found")

   endfunction

   task run_phase(uvm_phase phase);

      mux_transaction tr;

      forever begin

         tr = mux_transaction::type_id::create("tr");

         #1;

         tr.a = vif.a;
         tr.b = vif.b;
         tr.sel = vif.sel;
         tr.actual_y = vif.y;

         mon_ap.write(tr);

      end

   endtask

endclass