`timescale 1ns/1ps

import uvm_pkg::*;
import mux_pkg::*;

module tb_top;

    logic clk;

    always #5 clk = ~clk;

    mux_if vif(clk);

    mux2x1 dut(
        .a(vif.a),
        .b(vif.b),
        .sel(vif.sel),
        .y(vif.y)
    );

    initial
    begin

        clk = 0;

        uvm_config_db #(virtual mux_if)::set(
            null,
            "*",
            "vif",
            vif
        );

        run_test("mux_test");

    end

endmodule