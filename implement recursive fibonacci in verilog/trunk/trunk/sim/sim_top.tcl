	alias clc ".main clear"
	
	clc
	exec vlib work
	vmap work work
	
	set TB					fibTB
	set hdl_path			"../src/hdl"
	set inc_path			"../src/inc"
	
	set run_time			"20 us"
#	set run_time			"-all"

#============================ Add verilog files  ===============================
# Pleas add other module here	
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/fibTopLevel.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/fibController.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/fibDataPath.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/comparator.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/accumulatr.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/C1.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/S2.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/multiplexer.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/subtractor.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/STACK.v
	vlog 	+acc -incr -source  +incdir+$inc_path +define+SIM 	./tb/$TB.v

	onerror {break}

#================================ simulation ====================================

	vsim	-voptargs=+acc -debugDB $TB


#======================= adding signals to wave window ==========================


	add wave -dec -group 	 	{TB}				sim:/$TB/*
	add wave -dec -group 	 	{top}				sim:/$TB/uut/*	
	add wave -dec -group -r		{all}				sim:/$TB/*

#=========================== Configure wave signals =============================
	
	configure wave -signalnamewidth 2
    

#====================================== run =====================================

	run $run_time 