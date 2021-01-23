always @(*) begin
    if(active) begin
        // active properties here
        _active_io_out_:    assert (io_out[16:14] == buf_io_out[16:14]);
        _active_wbs_ack_o_: assert (wbs_ack_o     == buf_wbs_ack_o);
        _active_wbs_dat_o_: assert (wbs_dat_o     == buf_wbs_dat_o);
    end
    if(!active) begin
        // inactive properties here
        _inactive_io_out_:    assert (io_out[16:14] == 3'b000);
        _inactive_wbs_ack_o_: assert (wbs_ack_o     == 1'b0);
        _inactive_wbs_dat_o_: assert (wbs_dat_o     == {38{1'b0}});
    end

    // For now these are not used and so are driven to zero in wrapper.
    _active_io_oeb_:      assert (io_oeb      == {38{1'b0}});
    _active_la_data_out_: assert (la_data_out == {38{1'b0}});

    // proof a point :-)
    _assertX_ : assert (1'bX); // always passes
end
