; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 12m 31s; total estimated time: 19m 11s
; total layer number: 82
; total filament length [mm] : 487.32
; total filament volume [cm^3] : 1172.15
; total filament weight [g] : 1.48
; filament_density: 1.26
; filament_diameter: 1.75
; max_z_height: 9.96
; filament: 1
; support_material_on_wipe_tower: 0
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; additional_fan_full_speed_layer = 0
; alternate_extra_wall = 0
; ams_filament_load_time_ams = 0
; ams_filament_load_time_ams_lite = 0
; ams_filament_load_time_n3f_s = 0
; ams_filament_unload_time_ams = 0
; ams_filament_unload_time_ams_lite = 0
; ams_filament_unload_time_n3f_s = 0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 0
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_heat_soak_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.7,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 8
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = ;===== A1mini 20251031 =====\nG392 S0\nM1007 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X180 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nM620.10 A0 F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60} L[flush_length] H[nozzle_diameter] T{flush_temperatures[next_extruder]}\n\nG1 Y90 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[flush_temperatures[next_extruder]]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E5 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S7\n  G1 X0 F18000\n  G1 X-13.5 F3000\n  G1 X0 F18000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_additional_fan_first_x_layers = 1
; close_fan_the_first_x_layers = 1
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10
; cooling_slowdown_logic = uniform_cooling
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; counterbore_hole_bridging = none
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_ams_type = -1
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL A1M"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1M
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = bottom_shell_layers;enable_support;initial_layer_print_height;inner_wall_speed;layer_height;outer_wall_acceleration;outer_wall_line_width;outer_wall_speed;resolution;seam_position;skeleton_infill_density;skin_infill_density;sparse_infill_density;top_shell_layers;top_shell_thickness;top_surface_acceleration;top_surface_line_width;top_surface_pattern;top_surface_speed;wall_loops;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_filament_dynamic_map = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_mixed_color_sublayer = 0
; enable_order_independent_overlap_carving = 0
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 1
; enable_support = 1
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 180
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = Standard#1
; extruder_nozzle_stats_new = Standard#1
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 80
; fan_direction = undefine
; fan_max_speed = 80
; fan_min_speed = 60
; farthest_point_timelapse = 0
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_bridge_speed = 25
; filament_change_length = 5
; filament_change_length_nc = 10
; filament_colour = #FFFFFF
; filament_colour_type = 0
; filament_cooling_before_tower = 0
; filament_cost = 19.99
; filament_density = 1.26
; filament_dev_ams_drying_ams_limitations = 1;0
; filament_dev_ams_drying_heat_distortion_temperature = 45
; filament_dev_ams_drying_temperature = 45,45,45,45
; filament_dev_ams_drying_time = 12,12,12,12
; filament_dev_chamber_drying_bed_temperature = 70
; filament_dev_chamber_drying_time = 12
; filament_dev_drying_cooling_temperature = 45
; filament_dev_drying_softening_temperature = 50
; filament_diameter = 1.75
; filament_enable_overhang_speed = 1
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_compatibility = 0
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_temp_fast = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFA00
; filament_is_mixed = 0
; filament_is_support = 0
; filament_long_retractions_when_cut = 1
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 21
; filament_metal_stickiness = None
; filament_minimal_purge_on_wipe_tower = 15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_curve = ""
; filament_mixed_gradient_per_part = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_multi_colour = #FFFFFF
; filament_notes = 
; filament_nozzle_map = 0
; filament_overhang_1_4_speed = 0
; filament_overhang_2_4_speed = 50
; filament_overhang_3_4_speed = 30
; filament_overhang_4_4_speed = 10
; filament_overhang_totally_speed = 10
; filament_pre_cooling_temperature = 0
; filament_pre_cooling_temperature_nc = 0
; filament_preheat_temperature_delta = 0
; filament_prime_volume = 45
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_retraction_distances_when_cut = 18
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Bambu PLA Basic @BBL A1M"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10
; filament_tower_interface_pre_extrusion_length = 0
; filament_tower_interface_print_temp = -1
; filament_tower_interface_purge_volume = 20
; filament_tower_ironing_area = 4
; filament_type = PLA
; filament_velocity_adaptation_factor = 1
; filament_vendor = "Bambu Lab"
; filament_volume_map = 0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; first_x_layer_part_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_multiplier_fast = 1.2
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_first_layer = 0
; fuzzy_skin_mode = displacement
; fuzzy_skin_noise_type = classic
; fuzzy_skin_octaves = 4
; fuzzy_skin_persistence = 0.5
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_scale = 1
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; group_algo_with_time = 0
; has_filament_switcher = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 156x152,180x152,180x180,156x180
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; host_type = octoprint
; hot_plate_temp = 60
; hot_plate_temp_initial_layer = 60
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 13.8
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;;
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.24
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 80
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_fan_speed = -1
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.12
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_bed_mass_Y = 0
; machine_end_gcode = ;===== date: 20260513 =====================\n;turn off nozzle clog detect\nG392 S0\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG90\nG1 Z{max_layer_z + 0.4} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != \"by object\"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X181 F12000\nT255\nG1 X0 F18000\nG1 X-13.0 F3000\nG1 X0 F18000 ; wipe\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 180}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z180 F600\n    G1 Z180\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-13 Y180 F3600\n\nG91\nG1 Z-1 F600\nG90\nM83\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M100 E42 F20 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C46 D10 M100 E46 F10 N100\nM1006 A44 B20 L100 C39 D20 M100 E48 F20 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C39 D10 M100 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C39 D10 M100 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B10 L100 C0 D10 M100 E48 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B20 L100 C41 D20 M100 E49 F20 N100\nM1006 A0 B20 L100 C0 D20 M100 E0 F20 N100\nM1006 A0 B20 L100 C37 D20 M100 E37 F20 N100\nM1006 W\n;=====printer finish  sound=========\nM400 S1\nM18 X Y Z\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 28
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 1500,1500
; machine_max_force_Y = 0
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 5,5
; machine_max_printed_mass = 0
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: A1 mini =========================\n;===== date: 20260513 ==================\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S170\nM140 S[bed_temperature_initial_layer_single]\nG392 S0 ;turn off clog detect\nM9833.2\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B0 L100 C37 D10 M100 E37 F10 N100\nM1006 A0 B0 L100 C41 D10 M100 E41 F10 N100\nM1006 A0 B0 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A43 B10 L100 C39 D10 M100 E46 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C39 D10 M100 E43 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C41 D10 M100 E41 F10 N100\nM1006 A0 B0 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B0 L100 C49 D10 M100 E49 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B10 L100 C39 D10 M100 E48 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C39 D10 M100 E44 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A43 B10 L100 C39 D10 M100 E46 F10 N100\nM1006 W\nM18\n;=====avoid end stop =================\nG91\nG380 S2 Z30 F1200\nG380 S3 Z-20 F1200\nG1 Z5 F1200\nG90\n\n;===== reset machine status =================\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.7 Y0.9 Z0.5 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM83\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\n;===== prepare print temperature and material ==========\nM400\nM18\nM109 S100 H170\nM104 S170\nM400\nM17\nM400\nG28 X\n\nM211 X0 Y0 Z0 ;turn off soft endstop ; turn off soft endstop to prevent protential logic problem\n\nM975 S1 ; turn on\n\nG1 X0.0 F30000\nG1 X-13.5 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    G392 S0 ;turn on clog detect\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M104 S220\n{else}\n    M104 S250\n{endif}\n    M400\n    T[initial_no_support_extruder]\n    G1 X-13.5 F3000\n    M400\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T220\n    M109 S220 ;set nozzle to common flush temp\n{else}\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n{endif}\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M104 S220\n{else}\n    M104 S{flush_temperatures[initial_no_support_extruder]}\n{endif}\n    G92 E0\n    G1 E50 F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n    M400\n    M106 P1 S178\n    G92 E0\n    G1 E5 F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20} ; drop nozzle temp, make filament shink a bit\n    M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}\n    G92 E0\n    G1 E-0.5 F300\n\n    G1 X0 F30000\n    G1 X-13.5 F3000\n    G1 X0 F30000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X0 F30000\n    G1 X-13.5 F3000\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}\n    G392 S0 ;turn off clog detect\nM621 S[initial_no_support_extruder]A\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== mech mode fast check============================\nM1002 gcode_claim_action : 3\nG0 X25 Y175 F20000 ; find a soft place to home\n;M104 S0\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S170\n\n; build plate detect\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  M400\nM623\n\nG1 Z5 F3000\nG1 X90 Y-1 F30000\nM400 P200\nM970.3 Q1 A7 K0 O2\nM974 Q1 S2 P0\n\nG1 X90 Y0 Z5 F30000\nM400 P200\nM970 Q0 A10 B50 C90 H15 K0 M20 O3\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X-1 Y10\nG28 X ; re-home XY\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\n\nM104 S170 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nM104 S140\nG0 X90 Y-4 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X91 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X92 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X93 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X94 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X95 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X96 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X97 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X98 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\nG1 X25 Y175 F30000.1 ;Brush material\nG1 Z0.2 F30000.1\nG1 Y185\nG91\nG1 X-30 F30000\nG1 Y-2\nG1 X27\nG1 Y1.5\nG1 X-28\nG1 Y-2\nG1 X30\nG1 Y1.5\nG1 X-30\nG90\nM83\n\nG1 Z5 F3000\nG0 X50 Y175 F20000 ; find a soft place to home\nG28 Z P0 T300; home z with low precision, permit 300deg temperature\nG29.2 S0 ; turn off ABL\n\nG0 X85 Y185 F10000 ;move to exposed steel surface and stop the nozzle\nG0 Z-1.01 F10000\nG91\n\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z5 F30000\nG1 X25 Y175 F30000.1 ;Brush material\nG1 Z0.2 F30000.1\nG1 Y185\nG91\nG1 X-30 F30000\nG1 Y-2\nG1 X27\nG1 Y1.5\nG1 X-28\nG1 Y-2\nG1 X30\nG1 Y1.5\nG1 X-30\nG90\nM83\n\nG1 Z5\nG0 X55 Y175 F20000 ; find a soft place to home\nG28 Z P0 T300; home z with low precision, permit 300deg temperature\nG29.2 S0 ; turn off ABL\n\nG1 Z10\nG1 X85 Y185\nG1 Z-1.01\nG1 X95\nG1 X90\n\nM211 R; pop softend status\n\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== wait heatbed  ====================\nM1002 gcode_claim_action:54\nM104 S0\nM190 S[bed_temperature_initial_layer_single];set bed temp\nM109 S140\n\nG1 Z5 F3000\nG29.2 S1\nG1 X10 Y10 F20000\n\n;===== bed leveling ==================================\n;M1002 set_flag g29_before_print_flag=1\nM1002 judge_flag g29_before_print_flag\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28 T145\n\nM623\n\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\n\nG1 X-13.5 Y0 Z10 F10000\nG1 E1.2 F500\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S{nozzle_temperature[initial_extruder]}\nM400\n\nM412 S1 ;    ===turn on  filament runout detection===\nM400 P10\n\nG392 S0 ;turn on clog detect\n\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    M1002 gcode_claim_action : 8\n    \n    M400\n    M900 K0.0 L1000.0 M1.0\n    G90\n    M83\n    G0 X68 Y-4 F30000\n    G0 Z0.3 F18000 ;Move to start position\n    M400\n    G0 X88 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X93 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X98 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X103 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X108 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X113 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 Y0 Z0 F20000\n    M400\n    \n    G1 X-13.5 Y0 Z10 F10000\n    M400\n    \n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n    M106 P1 S178\n    M400 S7\n    G1 X0 F18000\n    G1 X-13.5 F3000\n    G1 X0 F18000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X-13.5 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S178\n        M400 S7\n        G1 X0 F18000\n        G1 X-13.5 F3000\n        G1 X0 F18000 ;wipe and shake\n        G1 X-13.5 F3000\n        G1 X0 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-13.5 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X0 F18000\n    G1 X-13.5 F3000\n    G1 X0 F18000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X-13.5 F3000\n    M400\n    M106 P1 S0\n\nM623 ; end of \"draw extrinsic para cali paint\"\n\n;===== extrude cali test ===============================\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\nG90\nM83\nG0 X68 Y-2.5 F30000\nG0 Z0.3 F18000 ;Move to start position\nG0 X88 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\nG0 X93 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X98 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 X103 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X108 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 X113 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X115 Z0 F20000\nG0 Z5\nM400\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\n\nM400 ; wait all motion done before implement the emprical L parameters\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type==\"Textured PEI Plate\"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\nM1007 S1\n\n\n\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 34
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; monotonic_travel_into_wall = 0%
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.76
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 1000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.4
; outer_wall_speed = 40
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 2
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab A1 mini 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_in_clockwise = 0
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL A1M
; printable_area = 0x0,180x0,180x180,0x180
; printable_height = 180
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1 mini
; printer_notes = 
; printer_settings_id = Bambu Lab A1 mini 0.4 nozzle
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3
; resolution = 0.005
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 179
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = back
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 40%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 40%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; skirt_per_object = 1
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 6
; slow_down_min_speed = 20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 40%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_fast_purge_mode = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_ironing_direction = 0
; support_ironing_flow = 10%
; support_ironing_inset = 0
; support_ironing_pattern = zig-zag
; support_ironing_spacing = 0.15
; support_ironing_speed = 30
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 65
; textured_plate_temp_initial_layer = 65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != \"by object\"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X187 Y178 F20000\n      G39 S1 X187 Y178\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n\n\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 9
; top_shell_thickness = 1.08
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 800
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.4
; top_surface_pattern = monotonic
; top_surface_speed = 35
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_short_distance_acceleration = 250
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle";"Bambu Lab X2D 0.4 nozzle";"Bambu Lab A2L 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 4
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 139.978
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R19
M201 X20000 Y20000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z5.00 E3.00
M106 S0
; FEATURE: Custom
;===== machine: A1 mini =========================
;===== date: 20260513 ==================

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PLA
M104 S170
M140 S65
G392 S0 ;turn off clog detect
M9833.2
;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B0 L100 C37 D10 M100 E37 F10 N100
M1006 A0 B0 L100 C41 D10 M100 E41 F10 N100
M1006 A0 B0 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A43 B10 L100 C39 D10 M100 E46 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C39 D10 M100 E43 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C41 D10 M100 E41 F10 N100
M1006 A0 B0 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B0 L100 C49 D10 M100 E49 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B10 L100 C39 D10 M100 E48 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C39 D10 M100 E44 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A43 B10 L100 C39 D10 M100 E46 F10 N100
M1006 W
M18
;=====avoid end stop =================
G91
G380 S2 Z30 F1200
G380 S3 Z-20 F1200
G1 Z5 F1200
G90

;===== reset machine status =================
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.7 Y0.9 Z0.5 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M83
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

;===== prepare print temperature and material ==========
M400
M18
M109 S100 H170
M104 S170
M400
M17
M400
G28 X

M211 X0 Y0 Z0 ;turn off soft endstop ; turn off soft endstop to prevent protential logic problem

M975 S1 ; turn on

G1 X0.0 F30000
G1 X-13.5 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    G392 S0 ;turn on clog detect
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S220

    M104 S220

    M400
    T0
    G1 X-13.5 F3000
    M400

    M620.1 E F523.843 T220
    M109 S220 ;set nozzle to common flush temp

    M106 P1 S0
    G92 E0
M73 P2 R18
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA

    M104 S220

    G92 E0
    G1 E50 F523.843
    M400
    M106 P1 S178
    G92 E0
M73 P3 R18
    G1 E5 F523.843
    M109 S200 ; drop nozzle temp, make filament shink a bit
    M104 S180
    G92 E0
M73 P4 R18
    G1 E-0.5 F300

    G1 X0 F30000
    G1 X-13.5 F3000
    G1 X0 F30000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X0 F30000
    G1 X-13.5 F3000
    M109 S180
    G392 S0 ;turn off clog detect
M621 S0A

M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== mech mode fast check============================
M1002 gcode_claim_action : 3
G0 X25 Y175 F20000 ; find a soft place to home
;M104 S0
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S170

; build plate detect
M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  M400
M623

G1 Z5 F3000
G1 X90 Y-1 F30000
M400 P200
M970.3 Q1 A7 K0 O2
M974 Q1 S2 P0

G1 X90 Y0 Z5 F30000
M400 P200
M970 Q0 A10 B50 C90 H15 K0 M20 O3
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X-1 Y10
G28 X ; re-home XY

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1

M104 S170 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

M83
G1 E-1 F500
G90
M83

M109 S170
M104 S140
G0 X90 Y-4 F30000
G380 S3 Z-5 F1200
M73 P27 R13
G1 Z2 F1200
G1 X91 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X92 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X93 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X94 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X95 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X96 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X97 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X98 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
G1 X25 Y175 F30000.1 ;Brush material
G1 Z0.2 F30000.1
G1 Y185
G91
G1 X-30 F30000
G1 Y-2
G1 X27
G1 Y1.5
G1 X-28
G1 Y-2
G1 X30
G1 Y1.5
G1 X-30
G90
M83

G1 Z5 F3000
G0 X50 Y175 F20000 ; find a soft place to home
G28 Z P0 T300; home z with low precision, permit 300deg temperature
G29.2 S0 ; turn off ABL

G0 X85 Y185 F10000 ;move to exposed steel surface and stop the nozzle
G0 Z-1.01 F10000
G91

G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
G1 Z5 F30000
G1 X25 Y175 F30000.1 ;Brush material
G1 Z0.2 F30000.1
G1 Y185
G91
G1 X-30 F30000
G1 Y-2
G1 X27
G1 Y1.5
G1 X-28
G1 Y-2
G1 X30
G1 Y1.5
G1 X-30
G90
M83

G1 Z5
G0 X55 Y175 F20000 ; find a soft place to home
G28 Z P0 T300; home z with low precision, permit 300deg temperature
G29.2 S0 ; turn off ABL

G1 Z10
G1 X85 Y185
G1 Z-1.01
G1 X95
G1 X90

M211 R; pop softend status

M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== wait heatbed  ====================
M1002 gcode_claim_action:54
M104 S0
M190 S65;set bed temp
M109 S140

G1 Z5 F3000
G29.2 S1
G1 X10 Y10 F20000

;===== bed leveling ==================================
;M1002 set_flag g29_before_print_flag=1
M1002 judge_flag g29_before_print_flag
M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X80 Y80 I24.0002 J20
    M400
    M500 ; save cali data
M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28 T145

M623

;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression
;===== nozzle load line ===============================
M975 S1
G90
M83
T1000

G1 X-13.5 Y0 Z10 F10000
G1 E1.2 F500
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M400

M412 S1 ;    ===turn on  filament runout detection===
M400 P10

G392 S0 ;turn on clog detect

M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PLA
;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag
M622 J1
    M1002 gcode_claim_action : 8
    
    M400
    M900 K0.0 L1000.0 M1.0
    G90
    M83
    G0 X68 Y-4 F30000
    G0 Z0.3 F18000 ;Move to start position
    M400
    G0 X88 E10  F107.783
    G0 X93 E.3742  F179.639
    G0 X98 E.3742  F718.556
    G0 X103 E.3742  F179.639
    G0 X108 E.3742  F718.556
    G0 X113 E.3742  F179.639
    G0 Y0 Z0 F20000
    M400
    
    G1 X-13.5 Y0 Z10 F10000
    M400
    
    G1 E10 F44.9097
    M983 F0.748496 A0.3 H0.4; cali dynamic extrusion compensation
    M106 P1 S178
    M400 S7
    G1 X0 F18000
    G1 X-13.5 F3000
    G1 X0 F18000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X-13.5 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F0.748496 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S178
        M400 S7
        G1 X0 F18000
M73 P28 R13
        G1 X-13.5 F3000
        G1 X0 F18000 ;wipe and shake
        G1 X-13.5 F3000
        G1 X0 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
    G1 X-13.5 F3000
    M400
    M984 A0.1 E1 S1 F0.748496 H0.4
    M106 P1 S178
    M400 S7
    G1 X0 F18000
M73 P29 R13
    G1 X-13.5 F3000
M73 P30 R13
    G1 X0 F18000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X-13.5 F3000
    M400
    M106 P1 S0

M623 ; end of "draw extrinsic para cali paint"

;===== extrude cali test ===============================
M104 S220
G90
M83
G0 X68 Y-2.5 F30000
G0 Z0.3 F18000 ;Move to start position
G0 X88 E10  F107.783
G0 X93 E.3742  F179.639
G0 X98 E.3742  F718.556
G0 X103 E.3742  F179.639
G0 X108 E.3742  F718.556
G0 X113 E.3742  F179.639
G0 X115 Z0 F20000
G0 Z5
M400

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0

M400 ; wait all motion done before implement the emprical L parameters

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
M1007 S1



; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S200


;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.24
; LAYER_HEIGHT: 0.24
G1 E-.8 F1800
; layer num/total_layer_count: 1/82
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 12
G1 X91.64 Y82.158 F42000
M204 S6000
G1 Z.4
M73 P31 R13
G1 Z.24
M73 P32 R13
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X93.495 Y82.643 I-.453 J5.52 E.08453
G3 X98.277 Y83.359 I1.709 J4.908 E.22054
G3 X102.667 Y91.95 I.064 J5.384 E.52442
M73 P32 R12
G3 X95.888 Y97.192 I-4.344 J1.386 E.48856
G3 X91.852 Y97.115 I-1.942 J-3.972 E.18383
G3 X87.111 Y96.337 I-1.606 J-5.056 E.21869
G3 X83.45 Y94.73 I-.257 J-4.386 E.18202
M73 P33 R12
G1 X83.45 Y83.698 E.48384
G3 X88.982 Y82.624 I3.633 J3.93 E.26029
G1 X89.113 Y82.554 E.0065
G3 X91.573 Y82.155 I2.133 J5.359 E.11016
M204 S6000
G1 X102.956 Y91.107 F42000
G1 F3000
M204 S500
G1 X102.956 Y86.848 E.18678
G2 X102.458 Y85.938 I-2.754 J.916 E.04576
G1 X102.458 Y91.552 E.24623
G1 X102.221 Y91.877 E.01763
G3 X101.96 Y95.349 I-3.955 J1.448 E.15743
M73 P34 R12
G1 X101.96 Y85.316 E.44003
G2 X101.461 Y84.84 I-1.555 J1.131 E.03037
G1 X101.461 Y96.062 E.49214
G3 X100.963 Y96.549 I-1.435 J-.969 E.03078
G1 X100.963 Y84.51 E.52799
G2 X100.465 Y84.24 I-.991 J1.235 E.02499
G1 X100.465 Y96.916 E.55588
G1 X99.966 Y97.16 E.02435
G1 X99.966 Y84.027 E.57599
G2 X99.468 Y83.899 I-.6 J1.306 E.02268
G1 X99.468 Y97.334 E.58919
G1 X98.97 Y97.463 E.02258
G1 X98.97 Y83.795 E.59943
G1 X98.471 Y83.772 E.02188
G1 X98.471 Y97.491 E.60165
G3 X97.973 Y97.488 I-.242 J-1.214 E.02201
G1 X97.973 Y83.643 E.6072
G2 X97.475 Y83.328 I-1.117 J1.219 E.02598
G1 X97.475 Y97.412 E.61765
G3 X96.976 Y97.27 I.095 J-1.283 E.02287
G1 X96.976 Y83.115 E.62078
G2 X96.478 Y82.949 I-.707 J1.292 E.02316
G1 X96.478 Y97.084 E.6199
G1 X95.98 Y96.774 E.02575
G1 X95.98 Y82.836 E.61128
G2 X95.482 Y82.788 I-.381 J1.351 E.02207
G1 X95.482 Y96.942 E.62074
G3 X94.983 Y97.087 I-.601 J-1.142 E.02291
G1 X94.983 Y82.765 E.62807
G2 X94.485 Y82.827 I-.08 J1.405 E.02214
G1 X94.485 Y97.192 E.63003
G1 X93.987 Y97.218 E.02188
G1 X93.987 Y82.909 E.62755
G1 X93.488 Y83.07 E.02297
M73 P35 R12
G1 X93.488 Y97.189 E.61922
G1 X92.99 Y97.113 E.02211
G1 X92.99 Y82.866 E.62483
G2 X92.492 Y82.709 I-.682 J1.296 E.02304
G1 X92.492 Y96.944 E.62431
G3 X91.993 Y96.727 I.281 J-1.322 E.02401
G1 X91.993 Y82.595 E.61978
G2 X91.495 Y82.555 I-.527 J3.508 E.02194
G1 X91.495 Y96.782 E.62394
G1 X90.997 Y96.896 E.02242
G1 X90.997 Y82.535 E.62984
G1 X90.498 Y82.601 E.02205
G1 X90.498 Y96.932 E.62849
G3 X90 Y96.949 I-.297 J-1.365 E.02199
G1 X90 Y82.692 E.62529
G1 X89.502 Y82.853 E.02297
G1 X89.502 Y96.882 E.61527
G3 X89.003 Y96.789 I.009 J-1.42 E.02236
G1 X89.002 Y83.072 E.60157
G2 X88.505 Y82.877 I-.783 J1.272 E.02354
G1 X88.505 Y96.627 E.60299
G3 X88.007 Y96.405 I.363 J-1.483 E.02406
G1 X88.007 Y82.764 E.59821
G2 X87.508 Y82.693 I-.445 J1.337 E.0222
G1 X87.508 Y96.137 E.58959
G3 X87.243 Y95.927 I.444 J-.834 E.01491
G1 X87.01 Y95.938 E.01023
G1 X87.01 Y82.671 E.58185
G2 X86.512 Y82.712 I-.137 J1.393 E.02205
G1 X86.512 Y95.923 E.57938
G1 X86.013 Y95.846 E.02211
G1 X86.013 Y82.78 E.57302
G2 X85.515 Y82.937 I.185 J1.452 E.02305
G1 X85.515 Y95.688 E.5592
G3 X85.017 Y95.481 I.256 J-1.317 E.02383
G1 X85.017 Y83.129 E.54171
G1 X84.518 Y83.397 E.02483
G1 X84.518 Y95.169 E.51627
G3 X84.02 Y94.734 I.811 J-1.431 E.02921
G1 X84.02 Y83.501 E.49265
; WIPE_START
; WIPE_END
G1 E-.8 F1800
M204 S6000
G1 X82.953 Y91.058 Z.64 F42000
G1 X81.853 Y98.853 Z.64
G1 Z.24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X81.147 Y98.853 E.03096
G1 X81.147 Y81.147 E.77652
G1 X81.853 Y81.147 E.03096
G1 X81.853 Y98.793 E.77389
M204 S6000
G1 X82.302 Y99.302 F42000
G1 F3000
M204 S500
G1 X80.698 Y99.302 E.0703
G1 X80.698 Y80.698 E.81586
G1 X82.302 Y80.698 E.0703
G1 X82.302 Y99.242 E.81323
M204 S6000
G1 X82.75 Y99.75 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X80.25 Y99.75 E.10964
G1 X80.25 Y80.25 E.85519
G1 X82.75 Y80.25 E.10964
G1 X82.75 Y99.69 E.85256
; WIPE_START
G1 X80.751 Y99.738 E-.76
; WIPE_END
M73 P36 R12
G1 E-.04 F1800
M204 S6000
G17
G3 Z.64 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.64
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.629 F42000
G1 Z.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.309064
G1 F3000
M204 S500
G1 X81.5 Y81.371 E.43464
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3000
G1 X81.5 Y83.371 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/82
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 12
M204 S10000
G17
G3 Z.64 I-1.056 J.606 P1  F42000
G1 X85.189 Y89.803 Z.64
G1 Z.36
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F3119
M204 S6000
G1 X86.82 Y89.803 E.03143
M204 S10000
G1 X91.159 Y84.527 F42000
G1 F3119
M204 S6000
G3 X92.873 Y85.157 I.098 J2.379 E.03613
G1 X93.657 Y85.17 E.01512
G3 X97.057 Y85.528 I1.417 J2.861 E.06954
G1 X97.624 Y85.833 E.01242
G3 X101.002 Y90.034 I.756 J2.85 E.13107
G3 X100.1 Y91.137 I-6.946 J-4.76 E.02749
G1 X100.036 Y91.954 E.01581
G3 X100.459 Y93.775 I-1.912 J1.403 E.03703
G3 X96.524 Y94.618 I-2.16 J-.476 E.09741
G1 X96.007 Y94.547 E.01006
G1 X95.357 Y94.722 E.01298
G3 X92.533 Y94.721 I-1.412 J-1.719 E.05897
G1 X91.826 Y94.54 E.01407
G3 X87.986 Y93.978 I-1.559 J-2.745 E.08056
G3 X86.384 Y93.892 I.262 J-19.885 E.03093
G3 X85.1 Y90.729 I.569 J-2.074 E.07602
G1 X85.208 Y90.369 E.00725
G1 X85.051 Y89.64 E.01437
G3 X88.637 Y85.119 I2.032 J-2.071 E.16391
G1 X89.404 Y85.11 E.01478
G3 X91.1 Y84.525 I1.988 J3.006 E.03494
M204 S10000
G1 X91.673 Y84.131 F42000
G1 F3119
M204 S6000
G3 X93.021 Y84.74 I-.62 J3.168 E.02877
G1 X93.562 Y84.749 E.01044
G3 X97.268 Y85.165 I1.508 J3.276 E.07555
G1 X97.703 Y85.399 E.00952
G3 X101.234 Y90.463 I.696 J3.278 E.1513
G3 X100.508 Y91.311 I-35.366 J-29.582 E.02151
G1 X100.465 Y91.861 E.01064
G3 X96.333 Y95.016 I-2.151 J1.465 E.15218
G2 X95.34 Y95.266 I-.216 J1.241 E.02033
G3 X92.366 Y95.112 I-1.377 J-2.215 E.0611
G1 X91.86 Y94.982 E.01007
G3 X87.826 Y94.388 I-1.603 J-3.106 E.0839
G3 X86.278 Y94.301 I.013 J-14.048 E.02991
G3 X84.704 Y90.585 I.674 J-2.476 E.08948
G1 X84.775 Y90.351 E.00471
G1 X84.664 Y89.835 E.01019
G3 X88.761 Y84.697 I2.423 J-2.27 E.18257
G1 X89.297 Y84.692 E.01032
G3 X91.614 Y84.128 I1.928 J2.884 E.04693
; WIPE_START
G1 F9000
G1 X92.269 Y84.295 E-.25694
G1 X93.021 Y84.74 E-.33197
G1 X93.471 Y84.747 E-.17108
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.947 J-.765 P1  F42000
G1 X81.977 Y98.977 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3119
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F3119
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.76
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F3119
M204 S6000
G1 X81.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 0.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/82
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z.76 I-1.074 J.572 P1  F42000
G1 X84.999 Y89.803 Z.76
G1 Z.48
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F3088
M204 S6000
G1 X86.235 Y89.803 E.02381
M204 S10000
G1 X91.116 Y84.647 F42000
G1 F3088
M204 S6000
G3 X92.961 Y85.309 I-.259 J3.62 E.03824
G1 X93.701 Y85.331 E.01428
G3 X96.884 Y85.647 I1.324 J2.848 E.06468
G1 X97.478 Y85.863 E.01218
G3 X101.279 Y88.724 I.851 J2.826 E.10666
G3 X99.975 Y91.218 I-3.528 J-.256 E.0558
M73 P37 R12
G1 X100.009 Y92.09 E.01682
G3 X96.501 Y94.521 I-1.737 J1.239 E.13034
G1 X95.603 Y94.434 E.01739
G3 X92.535 Y94.635 I-1.647 J-1.622 E.06483
G1 X91.797 Y94.497 E.01448
G3 X88.037 Y93.992 I-1.556 J-2.662 E.07877
G1 X87.343 Y93.905 E.01348
G3 X85.087 Y90.791 I-.427 J-2.065 E.0933
G1 X85.835 Y89.713 E.0253
G1 X84.987 Y89.487 E.01692
G2 X84.546 Y88.557 I-5.123 J1.861 E.01987
G3 X88.663 Y85.151 I2.603 J-1.045 E.1364
G1 X89.406 Y85.144 E.01433
G3 X91.057 Y84.643 I1.752 J2.801 E.03365
M204 S10000
G1 X91.186 Y84.231 F42000
G1 F3088
M204 S6000
G3 X93.086 Y84.892 I-.281 J3.865 E.03924
G1 X93.613 Y84.908 E.01016
G3 X97.063 Y85.265 I1.407 J3.251 E.06986
G1 X97.524 Y85.433 E.00946
G3 X101.7 Y88.752 I.824 J3.249 E.11891
G3 X100.403 Y91.402 I-3.969 J-.301 E.05825
G1 X100.425 Y91.972 E.011
G3 X96.3 Y94.923 I-2.139 J1.369 E.1487
G1 X95.722 Y94.867 E.01119
G3 X92.369 Y95.031 I-1.771 J-1.854 E.07055
G1 X91.848 Y94.934 E.01022
G3 X87.868 Y94.394 I-1.616 J-3.026 E.0827
G2 X86.766 Y94.368 I-.635 J3.504 E.02133
G3 X84.731 Y90.566 I.167 J-2.535 E.09925
G1 X85.149 Y89.965 E.01412
G1 X84.64 Y89.829 E.01016
G2 X84.15 Y88.702 I-4.293 J1.196 E.02377
G3 X88.778 Y84.73 I2.998 J-1.189 E.15408
G1 X89.306 Y84.725 E.01017
G3 X91.127 Y84.226 I1.724 J2.725 E.03692
; WIPE_START
G1 F9000
G1 X91.597 Y84.269 E-.17957
G1 X92.128 Y84.408 E-.20867
G1 X92.671 Y84.635 E-.22342
G1 X93.003 Y84.841 E-.14834
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.96 J-.748 P1  F42000
G1 X81.977 Y98.977 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3088
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F3088
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.88
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X187 Y178 F20000
      G39 S1 X187 Y178
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 Z0.880
G1 X81.5 Y98.764 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F3088
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/82
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z.88 I-.181 J1.203 P1  F42000
G1 X91.515 Y84.741 Z.88
G1 Z.6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X92.996 Y85.348 I-.343 J2.945 E.03124
G1 X93.718 Y85.453 E.01407
M73 P37 R11
G3 X96.967 Y85.892 I1.284 J2.739 E.06678
G3 X98.75 Y85.796 I1.603 J13.187 E.03445
G3 X100.004 Y91.197 I-.523 J2.967 E.13568
G1 X99.849 Y92.05 E.01672
G3 X96.946 Y94.863 I-1.578 J1.275 E.11584
G1 X96.401 Y94.265 E.01559
G1 X95.438 Y94.361 E.01867
G3 X92.424 Y94.422 I-1.537 J-1.426 E.06485
G1 X91.675 Y94.449 E.01444
G3 X88.122 Y93.958 I-1.455 J-2.572 E.07428
G1 X87.427 Y93.873 E.0135
G3 X85.339 Y90.439 I-.498 J-2.049 E.10265
G1 X85.386 Y89.966 E.00917
G1 X85.186 Y89.321 E.01301
G3 X86.841 Y84.817 I2.115 J-1.779 E.11204
G3 X88.697 Y85.27 I.339 J2.64 E.03767
G1 X89.437 Y85.233 E.01429
G3 X91.457 Y84.73 I1.866 J3.185 E.04068
M106 S201.45
M106 S255
M204 S10000
G1 X92.125 Y84.427 F42000
G1 F9000
M204 S6000
G3 X93.163 Y84.948 I-.796 J2.878 E.02254
G2 X94.211 Y84.848 I.424 J-1.098 E.02103
G3 X97.103 Y85.463 I.822 J3.243 E.05903
G3 X98.809 Y85.379 I1.402 J11.088 E.03295
G3 X100.391 Y91.416 I-.584 J3.379 E.15115
G1 X100.289 Y91.975 E.01096
G3 X96.233 Y94.704 I-2.025 J1.37 E.14828
G1 X95.634 Y94.764 E.01161
G3 X92.299 Y94.847 I-1.713 J-1.762 E.07069
G2 X91.235 Y95.098 I-.212 J1.48 E.02156
G3 X87.954 Y94.36 I-1.025 J-3.106 E.06808
G2 X86.735 Y94.354 I-.638 J5.697 E.02355
G3 X84.932 Y90.289 I.189 J-2.516 E.10491
G2 X84.724 Y89.425 I-1.296 J-.145 E.01748
G3 X86.787 Y84.398 I2.582 J-1.877 E.12528
G3 X88.803 Y84.844 I.391 J3.01 E.0406
G2 X89.869 Y84.55 I.197 J-1.367 E.02193
G3 X92.067 Y84.416 I1.33 J3.727 E.04302
M106 S201.45
; WIPE_START
G1 X92.565 Y84.584 E-.19978
G1 X93.163 Y84.948 E-.26611
G1 X93.681 Y85.024 E-.19883
G1 X93.919 Y84.945 E-.09528
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I-.927 J-.789 P1  F42000
G1 X81.977 Y98.977 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1955
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1955
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
M73 P38 R11
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1955
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1 F4000
            G39.3 S1
            G0 Z1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1955
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 0.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/82
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1 I-.181 J1.203 P1  F42000
G1 X91.467 Y84.739 Z1
G1 Z.72
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X91.467 Y84.739 E.00001
G3 X93.133 Y85.461 I-.267 J2.897 E.0356
G1 X93.393 Y85.401 E.00514
G1 X93.86 Y85.538 E.00939
G3 X97.133 Y86.086 I1.276 J2.428 E.0687
G1 X97.597 Y85.871 E.00985
G3 X98.743 Y85.865 I.748 J30.845 E.02209
G3 X99.971 Y91.23 I-.527 J2.944 E.13474
G1 X99.827 Y91.71 E.00965
G1 X99.908 Y92.389 E.01318
G3 X96.668 Y94.427 I-1.651 J.969 E.11368
G1 X96.38 Y94.156 E.00762
G1 X95.443 Y94.182 E.01807
G3 X92.6 Y94.405 I-1.525 J-1.212 E.06166
G2 X91.005 Y94.63 I-.515 J2.112 E.03181
G3 X88.211 Y93.959 I-.768 J-2.953 E.05766
G1 X87.543 Y93.834 E.0131
G3 X85.643 Y90.14 I-.611 J-2.021 E.1131
G1 X85.374 Y89.324 E.01656
G3 X85.819 Y85.318 I2.178 J-1.786 E.08658
G3 X88.677 Y85.35 I1.406 J2.136 E.05848
G1 X89.443 Y85.36 E.01476
G3 X91.408 Y84.732 I1.854 J2.416 E.04055
M106 S201.45
M106 S255
M204 S10000
G1 X91.513 Y84.321 F42000
G1 F9000
M204 S6000
G3 X93.237 Y85.006 I-.305 J3.28 E.03624
G1 X93.405 Y84.967 E.00333
G1 X93.844 Y85.096 E.00881
G3 X97.191 Y85.596 I1.3 J2.749 E.06919
G3 X97.84 Y85.467 I.442 J.527 E.01329
G3 X100.339 Y91.466 I.444 J3.336 E.16972
G2 X100.391 Y92.38 I1.191 J.391 E.01806
G3 X96.37 Y94.722 I-2.127 J.97 E.13263
G1 X96.219 Y94.581 E.00398
G1 X95.627 Y94.597 E.01142
G3 X92.415 Y94.794 I-1.71 J-1.604 E.06836
G2 X91.13 Y95.033 I-.332 J1.786 E.02577
G3 X88.046 Y94.356 I-.887 J-3.32 E.06324
G2 X87.002 Y94.341 I-.556 J2.482 E.02026
G3 X85.168 Y90.041 I-.093 J-2.502 E.11628
G2 X84.743 Y89.137 I-1.834 J.311 E.01949
G3 X85.581 Y84.969 I2.791 J-1.607 E.0895
G3 X88.793 Y84.931 I1.635 J2.472 E.06543
G1 X89.328 Y84.938 E.0103
G3 X91.454 Y84.315 I1.959 J2.745 E.04353
M106 S201.45
; WIPE_START
G1 X92.002 Y84.397 E-.21061
G1 X92.54 Y84.579 E-.21555
G1 X93.237 Y85.006 E-.31066
G1 X93.296 Y84.992 E-.02319
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.12 I-.946 J-.766 P1  F42000
G1 X81.977 Y98.977 Z1.12
G1 Z.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1953
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1953
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1953
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.12
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.12 F4000
            G39.3 S1
            G0 Z1.12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1953
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/82
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.12 I-.183 J1.203 P1  F42000
G1 X91.433 Y84.745 Z1.12
G1 Z.84
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X92.943 Y85.311 I-.263 J3 E.03145
G1 X93.313 Y85.504 E.00805
G1 X94.024 Y85.518 E.01372
G3 X96.963 Y85.95 I1.174 J2.225 E.06124
G2 X98.733 Y85.916 I-4.372 J-272.917 E.03413
G3 X100.123 Y91.101 I-.46 J2.902 E.13046
G1 X99.83 Y91.351 E.00742
G1 X99.677 Y92.212 E.01686
G3 X96.606 Y94.175 I-1.44 J1.13 E.1177
G1 X96.122 Y93.976 E.01009
G1 X95.34 Y94.14 E.01542
G3 X92.457 Y94.152 I-1.446 J-1.255 E.0629
G1 X91.641 Y94.217 E.01578
G3 X88.24 Y93.802 I-1.458 J-2.195 E.0719
M73 P39 R11
G2 X87.147 Y93.902 I-.264 J3.141 E.02127
G3 X85.227 Y90.623 I-.219 J-2.073 E.09213
G1 X85.708 Y90.087 E.01389
G1 X85.51 Y89.253 E.01653
G3 X85.779 Y85.501 I2.205 J-1.727 E.07948
G3 X88.474 Y85.318 I1.485 J1.933 E.05518
G2 X89.356 Y85.426 I.67 J-1.809 E.01729
G3 X91.374 Y84.739 I1.972 J2.48 E.04192
M106 S201.45
M204 S10000
G1 X91.493 Y84.329 F42000
G1 F2473
M204 S6000
G3 X93.42 Y85.086 I-.406 J3.863 E.0404
G2 X94.445 Y84.894 I.152 J-2.019 E.02033
G3 X97.116 Y85.535 I.701 J2.965 E.05492
G3 X98.79 Y85.499 I2.212 J62.98 E.03228
G3 X100.409 Y91.409 I-.51 J3.316 E.14888
G1 X100.217 Y91.572 E.00485
G1 X100.118 Y92.133 E.01098
G3 X96.346 Y94.522 I-1.868 J1.223 E.1365
G1 X96.082 Y94.413 E.00549
G1 X95.547 Y94.526 E.01054
G3 X92.325 Y94.584 I-1.64 J-1.61 E.06883
G1 X91.777 Y94.627 E.01061
G3 X88.084 Y94.228 I-1.591 J-2.558 E.07714
G3 X86.669 Y94.326 I-3.524 J-40.42 E.02735
G3 X85.249 Y89.97 I.267 J-2.497 E.11122
G2 X84.815 Y88.903 I-2.567 J.423 E.02238
G3 X85.763 Y84.996 I2.809 J-1.387 E.08415
G3 X88.741 Y84.962 I1.518 J2.494 E.06024
G1 X89.252 Y84.998 E.00986
G3 X91.434 Y84.323 I2 J2.598 E.04498
; WIPE_START
G1 F9000
G1 X91.971 Y84.387 E-.20566
G1 X92.51 Y84.573 E-.21671
G1 X93.284 Y85.01 E-.33763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.24 I-.946 J-.766 P1  F42000
G1 X81.977 Y98.977 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2473
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F2473
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.24 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.24
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.24 F4000
            G39.3 S1
            G0 Z1.24 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2473
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 0.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/82
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.24 I-.184 J1.203 P1  F42000
G1 X91.396 Y84.751 Z1.24
G1 Z.96
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X93.131 Y85.487 I-.167 J2.807 E.03706
G1 X93.935 Y85.559 E.01556
G3 X96.903 Y85.902 I1.252 J2.181 E.06167
G1 X97.617 Y86.01 E.01392
G3 X100.305 Y90.904 I.733 J2.783 E.14712
G3 X99.774 Y91.351 I-1.665 J-1.441 E.01345
G1 X99.564 Y92.241 E.01762
G3 X96.603 Y93.854 I-1.319 J1.103 E.11724
G2 X95.437 Y93.901 I-.465 J2.93 E.02264
G3 X93.229 Y94.57 I-1.539 J-1.102 E.04782
G3 X92.481 Y94.007 I.965 J-2.06 E.01818
G1 X91.64 Y94.1 E.0163
G3 X88.449 Y93.875 I-1.456 J-2.085 E.06668
G2 X87.121 Y93.892 I-.642 J1.717 E.02621
G3 X85.234 Y90.653 I-.188 J-2.059 E.09044
G1 X85.725 Y90.093 E.01436
G1 X85.689 Y89.247 E.01632
G3 X85.85 Y85.606 I2.184 J-1.727 E.07658
G3 X88.145 Y85.247 I1.443 J1.71 E.04708
G1 X88.832 Y85.605 E.01493
G2 X90.509 Y84.846 I-39.957 J-90.426 E.03549
G3 X91.337 Y84.744 I.736 J2.591 E.01614
M106 S201.45
M204 S10000
G1 X91.461 Y84.336 F42000
G1 F2469
M204 S6000
G3 X93.31 Y85.081 I-.185 J3.121 E.03911
G1 X93.857 Y85.131 E.01058
G3 X97.077 Y85.503 I1.334 J2.58 E.06631
G1 X97.592 Y85.582 E.01004
G3 X100.605 Y91.198 I.739 J3.22 E.16609
G3 X100.146 Y91.601 I-1.492 J-1.236 E.01182
G1 X100.012 Y92.17 E.01126
G3 X96.327 Y94.254 I-1.759 J1.189 E.13513
G2 X95.626 Y94.301 I-.233 J1.77 E.01363
G3 X92.339 Y94.445 I-1.706 J-1.347 E.07195
G1 X91.781 Y94.507 E.01081
G3 X88.26 Y94.27 I-1.601 J-2.488 E.07288
G2 X87.164 Y94.312 I-.493 J1.43 E.02163
G3 X85.298 Y89.942 I-.221 J-2.489 E.12096
G1 X85.274 Y89.381 E.01083
G3 X85.577 Y85.285 I2.581 J-1.868 E.08604
G3 X88.857 Y85.145 I1.735 J2.151 E.06775
G3 X90.396 Y84.439 I35.532 J75.486 E.03263
G3 X91.402 Y84.329 I.88 J3.385 E.01959
; WIPE_START
G1 F9000
G1 X91.943 Y84.392 E-.20705
G1 X92.483 Y84.569 E-.21591
G1 X92.98 Y84.832 E-.2135
G1 X93.239 Y85.028 E-.12354
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.36 I-.947 J-.765 P1  F42000
G1 X81.977 Y98.977 Z1.36
G1 Z.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2469
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F2469
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.36 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.36
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
M73 P40 R11
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.36 F4000
            G39.3 S1
            G0 Z1.36 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2469
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 1.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/82
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.36 I-.186 J1.203 P1  F42000
G1 X91.369 Y84.758 Z1.36
G1 Z1.08
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X93.229 Y85.591 I-.098 J2.712 E.04028
G1 X94.023 Y85.505 E.0154
G3 X96.882 Y85.887 I1.161 J2.198 E.05931
G1 X97.577 Y86.033 E.0137
G3 X100.267 Y90.926 I.751 J2.773 E.14757
G3 X99.542 Y91.492 I-2.187 J-2.053 E.01781
G1 X99.544 Y92.409 E.01766
G3 X96.694 Y93.843 I-1.311 J.945 E.1077
G2 X95.269 Y93.932 I-.649 J1.057 E.0293
G3 X92.71 Y94.078 I-1.342 J-1.017 E.05617
G1 X92.268 Y93.94 E.00891
G1 X91.583 Y94.028 E.01333
G3 X88.437 Y93.769 I-1.411 J-2.103 E.06569
G1 X87.705 Y93.703 E.01416
G3 X85.797 Y90.133 I-.777 J-1.88 E.11538
G1 X85.831 Y89.231 E.0174
G3 X86.138 Y85.529 I2.037 J-1.695 E.07935
G3 X88.085 Y85.316 I1.211 J2.061 E.0389
G1 X88.894 Y85.724 E.01747
G1 X90.041 Y85.035 E.02579
G3 X91.31 Y84.752 I1.471 J3.607 E.02518
M106 S201.45
M106 S255
M204 S10000
G1 X91.429 Y84.342 F42000
G1 F9000
M204 S6000
G3 X93.372 Y85.153 I-.116 J3.009 E.04145
G2 X94.684 Y84.843 I-.781 J-6.233 E.02605
G3 X97.068 Y85.497 I.48 J2.92 E.04915
G1 X97.573 Y85.603 E.00997
G3 X100.567 Y91.22 I.757 J3.203 E.16658
G3 X99.962 Y91.707 I-1.871 J-1.705 E.01503
G1 X99.964 Y92.287 E.01119
G3 X96.378 Y94.16 I-1.721 J1.074 E.12884
G2 X95.967 Y94.072 I-.324 J.506 E.00828
G2 X95.133 Y94.63 I.445 J1.565 E.01967
G3 X92.494 Y94.451 I-1.21 J-1.695 E.05525
G2 X91.459 Y94.595 I-.37 J1.133 E.02085
G3 X88.288 Y94.178 I-1.27 J-2.612 E.0653
G1 X87.766 Y94.13 E.0101
G3 X85.384 Y89.935 I-.839 J-2.297 E.13244
G1 X85.406 Y89.354 E.0112
G3 X85.911 Y85.176 I2.434 J-1.826 E.08959
G3 X88.877 Y85.245 I1.428 J2.403 E.06028
G3 X90.985 Y84.341 I2.729 J3.453 E.04474
G3 X91.371 Y84.336 I.308 J9.392 E.00743
M106 S201.45
; WIPE_START
G1 X92.149 Y84.453 E-.29912
G1 X92.456 Y84.564 E-.12427
G1 X92.962 Y84.836 E-.21831
G1 X93.209 Y85.027 E-.1183
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.48 I-.948 J-.763 P1  F42000
G1 X81.977 Y98.977 Z1.48
G1 Z1.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1948
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1948
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1948
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.48 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.48
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.48 F4000
            G39.3 S1
            G0 Z1.48 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z1.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1948
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/82
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.48 I-.311 J1.177 P1  F42000
G1 X89.528 Y85.358 Z1.48
G1 Z1.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X89.537 Y85.357 E.00017
G3 X91.357 Y84.771 I1.725 J2.24 E.03759
G1 X91.411 Y84.355 E.0081
G3 X93.315 Y85.13 I-.152 J3.098 E.04038
G1 X93.871 Y85.133 E.01072
G3 X96.978 Y85.418 I1.337 J2.506 E.06368
G1 X97.435 Y85.655 E.00992
G3 X100.765 Y90.992 I.885 J3.155 E.1625
G3 X99.908 Y91.718 I-2.87 J-2.518 E.02174
G1 X99.921 Y92.302 E.01125
G3 X96.758 Y92.085 I-1.66 J1.035 E.16567
G1 X96.492 Y91.56 E.01134
G3 X95.74 Y90.804 I1.755 J-2.5 E.02065
G3 X94.258 Y90.6 I2.396 J-22.827 E.02884
G3 X93.476 Y90.203 I1.171 J-3.278 E.01695
G1 X92.821 Y90.178 E.01264
G1 X92.734 Y90.734 E.01086
G2 X93.903 Y91.052 I.797 J-.624 E.02502
G3 X92.414 Y94.205 I.04 J1.947 E.15257
G2 X91.342 Y94.544 I-.169 J1.328 E.02237
G3 X88.311 Y94.052 I-1.13 J-2.616 E.06251
G2 X87.092 Y94.245 I.477 J6.925 E.02382
G3 X85.273 Y90.065 I-.183 J-2.406 E.11503
G1 X85.334 Y89.055 E.01951
G3 X85.333 Y85.959 I2.195 J-1.549 E.06361
M73 P41 R11
G3 X88.616 Y85.193 I2.031 J1.285 E.07203
G3 X89.405 Y84.946 I.751 J1.015 E.01622
G3 X91.353 Y84.347 I1.905 J2.731 E.03992
M106 S201.45
; WIPE_START
G1 X91.873 Y84.415 E-.19944
G1 X92.436 Y84.575 E-.22231
G1 X92.937 Y84.836 E-.21478
G1 X93.193 Y85.036 E-.12347
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I-.948 J-.763 P1  F42000
G1 X81.977 Y98.977 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1852
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1852
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1852
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.6 F4000
            G39.3 S1
            G0 Z1.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1852
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/82
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.6 I-.342 J1.168 P1  F42000
G1 X89.36 Y85.539 Z1.6
G1 Z1.32
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X91.164 Y84.801 I1.927 J2.135 E.03833
G1 X91.17 Y84.381 E.0081
G3 X93.43 Y85.244 I.081 J3.176 E.04783
G3 X95.207 Y84.808 I2.43 J6.069 E.03539
G3 X97.173 Y85.601 I-.114 J3.114 E.04168
G2 X98.602 Y85.56 I.182 J-18.569 E.02757
G3 X100.877 Y90.809 I-.268 J3.234 E.13498
G3 X100.099 Y91.565 I-2.255 J-1.541 E.02104
G1 X99.952 Y91.789 E.00518
G1 X99.94 Y92.329 E.01041
G3 X96.748 Y92.28 I-1.612 J1.001 E.15666
G2 X96.254 Y91.351 I-1.18 J.031 E.02102
G2 X95.359 Y90.623 I-2.164 J1.748 E.02241
G3 X93.36 Y89.98 I-.246 J-2.662 E.04158
G2 X92.643 Y90.339 I.761 J2.418 E.01552
G1 X92.667 Y90.92 E.01121
G2 X93.868 Y91.156 I.811 J-.954 E.02465
G3 X92.339 Y94.039 I.093 J1.896 E.15425
G1 X91.761 Y94.189 E.01152
G3 X88.399 Y93.973 I-1.547 J-2.185 E.07023
G2 X87.055 Y94.212 I.861 J8.735 E.02634
G3 X85.577 Y89.869 I-.134 J-2.378 E.11925
G1 X85.54 Y89.278 E.01141
G3 X85.341 Y86.064 I2.24 J-1.751 E.06599
G3 X86.253 Y85.218 I5.562 J5.086 E.024
G3 X88.661 Y85.309 I1.121 J2.25 E.04843
G1 X89.182 Y85.154 E.01048
G3 X91.111 Y84.38 I2.096 J2.434 E.04079
M106 S201.45
; WIPE_START
G1 X91.836 Y84.426 E-.2762
G1 X92.4 Y84.591 E-.22321
G1 X92.918 Y84.841 E-.21852
G1 X93.005 Y84.909 E-.04207
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.72 I-.958 J-.751 P1  F42000
G1 X81.977 Y98.977 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1852
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1852
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1852
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.72
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.72 F4000
            G39.3 S1
            G0 Z1.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1852
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 1.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/82
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.72 I-.335 J1.17 P1  F42000
G1 X89.453 Y85.516 Z1.72
G1 Z1.44
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X91.274 Y84.828 I1.8 J2.011 E.03839
G1 X91.28 Y84.408 E.0081
G3 X93.231 Y85.108 I-.005 J3.084 E.04074
G1 X93.764 Y85.218 E.01049
G3 X97.162 Y85.617 I1.433 J2.461 E.07074
G2 X98.659 Y85.587 I.462 J-14.71 E.02887
G3 X100.891 Y90.742 I-.342 J3.209 E.13137
G3 X99.715 Y91.758 I-2.528 J-1.738 E.03028
G3 X100.189 Y92.938 I-19.505 J8.518 E.02452
G3 X96.787 Y92.304 I-1.831 J.379 E.14123
G1 X96.791 Y92.027 E.00534
G1 X96.558 Y91.563 E.01002
G3 X95.819 Y90.838 I2.872 J-3.67 E.01999
M73 P42 R11
G1 X95.375 Y90.573 E.00998
G3 X93.539 Y90.064 I-.162 J-2.978 E.03736
G2 X92.562 Y90.347 I-.253 J.955 E.0206
G2 X92.674 Y91.167 I1.436 J.222 E.01618
G1 X93.24 Y91.375 E.01162
G3 X92.3 Y93.93 I.728 J1.718 E.16723
G1 X91.713 Y94.109 E.01184
G3 X88.457 Y93.84 I-1.468 J-2.061 E.06845
G3 X87.024 Y94.177 I-9.161 J-35.693 E.02839
G3 X85.536 Y89.962 I-.129 J-2.324 E.11551
G1 X85.675 Y89.337 E.01235
G3 X85.687 Y85.754 I2.078 J-1.784 E.07527
G3 X87.187 Y85.043 I2.057 J2.402 E.03238
G3 X88.486 Y85.322 I.118 J2.611 E.02589
G1 X89.023 Y85.335 E.01035
G3 X91.221 Y84.407 I2.267 J2.304 E.04711
M106 S201.45
; WIPE_START
G1 X91.8 Y84.437 E-.22025
G1 X92.368 Y84.608 E-.22522
G1 X92.889 Y84.86 E-.21988
G1 X93.09 Y85.006 E-.09465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.84 I-.952 J-.758 P1  F42000
G1 X81.977 Y98.977 Z1.84
G1 Z1.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1852
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1852
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1852
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.84
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.84 F4000
            G39.3 S1
            G0 Z1.84 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z1.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1852
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 1.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/82
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.84 I-.328 J1.172 P1  F42000
G1 X89.54 Y85.482 Z1.84
G1 Z1.56
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X91.385 Y84.856 I1.724 J2.047 E.03844
G1 X91.391 Y84.436 E.0081
G3 X93.234 Y85.158 I-.113 J3.001 E.03889
G1 X93.786 Y85.216 E.0107
G3 X97.059 Y85.55 I1.397 J2.51 E.0675
G1 X97.556 Y85.722 E.01014
G3 X100.905 Y90.676 I.797 J3.071 E.15045
G3 X99.903 Y91.746 I-47.532 J-43.517 E.02827
G1 X99.896 Y92.299 E.01065
G3 X96.789 Y92.336 I-1.541 J1.026 E.15317
G1 X96.841 Y92.087 E.0049
G1 X96.63 Y91.584 E.01051
G3 X95.746 Y90.676 I2.249 J-3.075 E.02456
G3 X94.213 Y90.378 I8.492 J-47.795 E.03009
G3 X93.4 Y89.91 I1.442 J-3.445 E.01813
G2 X92.539 Y90.322 I.751 J2.68 E.0185
G1 X92.49 Y90.891 E.01101
G2 X92.857 Y91.311 I.419 J.004 E.01178
G2 X94.018 Y91.237 I.135 J-7.066 E.02244
G3 X92.384 Y94.026 I-.03 J1.855 E.14911
G2 X91.49 Y94.142 I-.28 J1.347 E.01771
M73 P42 R10
G3 X88.579 Y93.788 I-1.21 J-2.2 E.06037
G1 X88.036 Y93.824 E.01049
G3 X85.575 Y93.753 I-1.169 J-2.146 E.04972
G3 X84.569 Y91.64 I1.602 J-2.059 E.04678
G3 X85.806 Y89.784 I2.969 J.637 E.04402
G1 X85.675 Y89.19 E.01172
G3 X86.094 Y85.527 I1.882 J-1.64 E.07994
G3 X88.066 Y85.243 I1.316 J2.152 E.03947
G2 X89.235 Y85.191 I.504 J-1.818 E.02295
G3 X91.332 Y84.435 I2.062 J2.436 E.04388
M106 S201.45
; WIPE_START
G1 X92.33 Y84.623 E-.38603
G1 X92.856 Y84.881 E-.2225
G1 X93.177 Y85.117 E-.15147
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.96 I-.947 J-.765 P1  F42000
G1 X81.977 Y98.977 Z1.96
G1 Z1.56
M73 P43 R10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1851
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1851
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1851
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.96 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.96
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.96 F4000
            G39.3 S1
            G0 Z1.96 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z1.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1851
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 1.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/82
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.96 I-.32 J1.174 P1  F42000
G1 X89.625 Y85.451 Z1.96
G1 Z1.68
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X91.463 Y84.888 I1.64 J2.074 E.03792
G1 X91.529 Y84.473 E.0081
G3 X93.279 Y85.246 I-.245 J2.921 E.03755
G1 X93.834 Y85.215 E.01072
G3 X97.058 Y85.574 I1.359 J2.454 E.06667
G1 X97.543 Y85.769 E.01008
G3 X100.853 Y90.691 I.784 J3.047 E.14928
G3 X99.887 Y91.594 I-3.058 J-2.305 E.02561
G1 X99.787 Y92.18 E.01147
G3 X96.935 Y92.167 I-1.431 J1.136 E.15826
G1 X96.74 Y91.609 E.0114
G3 X95.876 Y90.792 I1.642 J-2.605 E.02307
G1 X95.43 Y90.512 E.01015
G3 X93.591 Y90.042 I-.144 J-3.268 E.03712
G1 X93.066 Y89.963 E.01022
G1 X92.541 Y90.282 E.01184
G1 X92.412 Y90.856 E.01134
G3 X92.603 Y91.368 I-1.242 J.753 E.01061
G1 X93.215 Y91.425 E.01185
G3 X92.396 Y94.01 I.769 J1.666 E.16338
G1 X92.144 Y93.889 E.00539
G1 X91.609 Y93.94 E.01035
G3 X88.642 Y93.689 I-1.326 J-1.984 E.06198
G1 X88.083 Y93.716 E.01079
G3 X85.659 Y93.749 I-1.237 J-1.82 E.04948
G3 X84.653 Y92.547 I1.876 J-2.593 E.03054
G3 X85.449 Y90.151 I2.062 J-.645 E.05196
G2 X85.81 Y89.734 I-.439 J-.744 E.01082
G1 X85.756 Y89.176 E.01079
G3 X86.232 Y85.49 I1.821 J-1.639 E.08133
G3 X88.458 Y85.52 I1.083 J2.211 E.04452
G1 X89.012 Y85.453 E.01077
G3 X91.471 Y84.464 I2.328 J2.236 E.05264
M106 S201.45
; WIPE_START
G1 X92.028 Y84.553 E-.21432
G1 X92.559 Y84.75 E-.21539
G1 X93.275 Y85.243 E-.33029
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.08 I-.94 J-.773 P1  F42000
G1 X81.977 Y98.977 Z2.08
G1 Z1.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1852
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1852
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1852
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.08
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.08 F4000
            G39.3 S1
            G0 Z2.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z1.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1852
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/82
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.08 I-.327 J1.172 P1  F42000
G1 X89.616 Y85.502 Z2.08
G1 Z1.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X90.013 Y85.231 E.00926
G3 X91.455 Y84.93 I1.212 J2.194 E.02882
G1 X91.508 Y84.513 E.0081
G3 X93.176 Y85.213 I-.455 J3.42 E.03528
G1 X93.712 Y85.317 E.01052
G3 X97.182 Y85.711 I1.485 J2.398 E.0726
G2 X98.335 Y85.693 I.505 J-4.652 E.02227
G3 X100.891 Y90.551 I-.002 J3.103 E.12986
G3 X99.932 Y91.534 I-3.58 J-2.533 E.02659
G2 X99.762 Y92.201 I1.008 J.613 E.01348
G3 X96.765 Y92.456 I-1.414 J1.123 E.15018
G1 X97.094 Y91.99 E.011
G2 X96.156 Y91.105 I-4.797 J4.143 E.0249
G1 X95.675 Y90.456 E.01557
G1 X95.336 Y90.575 E.00693
G1 X95.203 Y90.504 E.0029
G3 X93.665 Y90.057 I.055 J-3.056 E.03123
G1 X93.437 Y89.966 E.00473
G1 X92.919 Y90.013 E.01003
G1 X92.761 Y90.112 E.0036
G1 X92.672 Y90.726 E.01196
G2 X92.745 Y91.176 I.236 J.193 E.00995
G1 X93.269 Y91.404 E.01101
G3 X92.355 Y93.904 I.7 J1.673 E.16208
G1 X91.782 Y93.814 E.01119
M73 P44 R10
G3 X91.351 Y94.058 I-2.412 J-3.752 E.00954
G3 X88.629 Y93.687 I-1.086 J-2.208 E.0562
G1 X88.09 Y93.632 E.01043
G3 X86.106 Y93.933 I-1.289 J-1.81 E.04013
G3 X84.878 Y93.02 I1.855 J-3.775 E.02967
G3 X85.609 Y90.1 I1.655 J-1.137 E.06559
G1 X85.901 Y89.891 E.00692
G2 X85.5 Y88.767 I-1.473 J-.108 E.02369
G3 X86.558 Y85.406 I2.04 J-1.205 E.07658
G3 X88.384 Y85.588 I.663 J2.603 E.03608
G1 X88.94 Y85.581 E.01073
G3 X91.45 Y84.506 I2.302 J1.906 E.05465
M106 S201.45
; WIPE_START
G1 X92 Y84.596 E-.21215
G1 X92.529 Y84.788 E-.21359
G1 X93.176 Y85.213 E-.29432
G1 X93.279 Y85.233 E-.03994
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I-.94 J-.773 P1  F42000
G1 X81.977 Y98.977 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1851
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1851
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1851
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.2 F4000
            G39.3 S1
            G0 Z2.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1851
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 1.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/82
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.2 I-.337 J1.169 P1  F42000
G1 X89.598 Y85.573 Z2.2
G1 Z1.92
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X91.43 Y84.979 I1.686 J2.079 E.03797
G1 X91.483 Y84.563 E.0081
G3 X93.236 Y85.31 I-.386 J3.338 E.03725
G2 X94.148 Y85.134 I.284 J-.978 E.01859
G3 X97.035 Y85.639 I1.034 J2.595 E.05947
G1 X97.504 Y85.861 E.01001
G3 X100.879 Y90.48 I.84 J2.929 E.14318
G3 X99.688 Y91.616 I-2.65 J-1.586 E.0321
G1 X99.725 Y92.213 E.01153
G3 X97.038 Y92.143 I-1.374 J1.104 E.15448
G1 X96.834 Y91.581 E.01152
G3 X95.868 Y90.658 I1.894 J-2.95 E.02591
G1 X95.375 Y90.458 E.01027
G3 X93.62 Y89.991 I-.221 J-2.701 E.03569
G2 X92.494 Y90.213 I-.352 J1.184 E.02301
G1 X92.351 Y90.78 E.01129
G3 X92.559 Y91.269 I-1.421 J.895 E.01028
G2 X93.766 Y91.325 I.664 J-1.289 E.02401
G3 X92.395 Y93.863 I.215 J1.755 E.14914
G2 X91.731 Y93.829 I-.453 J2.342 E.01285
G3 X91.386 Y94.026 I-2.107 J-3.298 E.00766
G3 X88.499 Y93.553 I-1.118 J-2.224 E.06027
G2 X87.648 Y93.828 I-.095 J1.16 E.01769
G3 X85.932 Y93.786 I-.82 J-1.583 E.03453
G3 X85.471 Y90.16 I.559 J-1.913 E.08914
G1 X86.098 Y89.879 E.01325
G1 X85.991 Y89.23 E.01268
G3 X86.971 Y85.382 I1.447 J-1.68 E.09483
G3 X88.465 Y85.741 I.088 J2.914 E.02997
G2 X89.358 Y85.219 I-.053 J-1.116 E.02075
G3 X91.424 Y84.555 I1.95 J2.524 E.04268
M106 S201.45
; WIPE_START
G1 X91.97 Y84.64 E-.20972
G1 X92.491 Y84.824 E-.20982
G1 X92.781 Y84.965 E-.12262
G1 X93.236 Y85.31 E-.21724
G1 X93.238 Y85.31 E-.00059
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.32 I-.939 J-.774 P1  F42000
G1 X81.977 Y98.977 Z2.32
G1 Z1.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1852
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1852
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1852
M204 S1000
G1 X80.2 Y99.8 E.04757
M73 P45 R10
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.32 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.32
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.32 F4000
            G39.3 S1
            G0 Z2.32 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z1.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1852
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 2.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/82
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.32 I-.35 J1.166 P1  F42000
G1 X89.59 Y85.662 Z2.32
G1 Z2.04
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X91.405 Y85.029 I1.728 J2.04 E.03789
G1 X91.458 Y84.613 E.0081
G3 X93.255 Y85.367 I-.367 J3.391 E.03809
G2 X94.303 Y85.122 I.119 J-1.852 E.02105
G3 X97.047 Y85.698 I.872 J2.671 E.05659
G1 X97.513 Y85.911 E.00988
G3 X100.865 Y90.411 I.811 J2.894 E.1395
G3 X99.74 Y91.546 I-3.076 J-1.927 E.03106
G2 X99.888 Y92.505 I1.195 J.306 E.01923
G3 X97.1 Y92.131 I-1.527 J.807 E.14587
G1 X96.89 Y91.57 E.01155
G3 X95.939 Y90.693 I2.828 J-4.018 E.02501
G1 X95.493 Y90.415 E.01013
G3 X93.602 Y89.909 I-.242 J-2.881 E.03849
G1 X93.059 Y89.803 E.01068
G1 X92.468 Y90.162 E.01332
G2 X92.537 Y91.269 I1.28 J.476 E.02201
G1 X92.748 Y91.435 E.00518
G1 X93.267 Y91.51 E.0101
G3 X92.419 Y93.813 I.716 J1.571 E.15642
G2 X91.273 Y94.059 I-.29 J1.444 E.02324
G3 X88.445 Y93.488 I-1.014 J-2.266 E.05933
G2 X87.147 Y93.983 I3.177 J10.284 E.02679
G3 X85.462 Y93.578 I.334 J-5.096 E.03357
G3 X85.905 Y89.963 I1.031 J-1.708 E.08843
G1 X86.067 Y89.744 E.00526
G1 X86.001 Y89.159 E.01134
G3 X86.648 Y85.564 I1.352 J-1.613 E.0853
G3 X87.681 Y85.545 I.535 J1.054 E.0206
G3 X88.396 Y85.802 I-.159 J1.568 E.0148
G1 X88.942 Y85.718 E.01064
G3 X91.4 Y84.605 I2.347 J1.915 E.0539
M106 S201.45
M204 S10000
G1 X87.434 Y89.269 F42000
G1 F1911
M204 S6000
G1 X87.753 Y89.125 E.00676
G1 X87.926 Y89.507 E.0081
G1 X88.559 Y89.221 E.01339
G1 X88.745 Y89.516 E.00673
G1 X89.119 Y89.474 E.00724
G1 X89.236 Y89.776 E.00624
G1 X88.689 Y90.172 E.01302
G1 X88.034 Y90.209 E.01265
G1 X87.872 Y89.532 E.01341
; WIPE_START
G1 F9000
G1 X88.559 Y89.221 E-.28641
G1 X88.745 Y89.516 E-.13269
G1 X89.119 Y89.474 E-.14278
G1 X89.236 Y89.776 E-.12301
G1 X89.076 Y89.892 E-.0751
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.44 I-.959 J-.749 P1  F42000
G1 X81.977 Y98.977 Z2.44
G1 Z2.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1911
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1911
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1911
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.44 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.44
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.44 F4000
            G39.3 S1
            G0 Z2.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z2.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1911
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 2.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/82
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.44 I-.36 J1.162 P1  F42000
G1 X89.589 Y85.741 Z2.44
G1 Z2.16
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X91.384 Y85.08 I1.677 J1.784 E.03789
G1 X91.438 Y84.663 E.0081
G3 X93.347 Y85.545 I-.242 J3.031 E.0414
G3 X94.982 Y85.021 I2.846 J6.065 E.03318
G3 X97.061 Y85.749 I.143 J2.926 E.04353
G1 X97.529 Y85.978 E.01004
G3 X100.845 Y90.346 I.801 J2.835 E.13593
G3 X99.507 Y91.634 I-3.122 J-1.906 E.03619
G1 X99.618 Y92.227 E.01162
G3 X97.079 Y92.237 I-1.265 J1.092 E.14676
G1 X97.095 Y91.953 E.0055
G1 X96.848 Y91.479 E.0103
G3 X95.996 Y90.697 I1.982 J-3.012 E.02238
G3 X95.402 Y90.362 I.09 J-.854 E.01352
G3 X93.548 Y89.831 I-.184 J-2.861 E.03792
G1 X93.015 Y89.768 E.01034
G1 X92.444 Y90.11 E.01284
G2 X92.313 Y90.79 I1.61 J.661 E.01344
G3 X92.578 Y91.449 I-1.431 J.959 E.01379
G2 X93.719 Y91.431 I.549 J-1.357 E.02258
G3 X92.448 Y93.77 I.26 J1.655 E.14368
G2 X91.455 Y93.961 I-.276 J1.246 E.02005
G3 X88.504 Y93.523 I-1.173 J-2.254 E.06145
G2 X87.487 Y93.839 I-.168 J1.254 E.02119
G3 X85.431 Y93.566 I-.572 J-3.563 E.04055
G3 X86.135 Y89.914 I1.075 J-1.686 E.09203
G2 X85.77 Y88.884 I-1.196 J-.156 E.02187
G3 X86.123 Y85.954 I1.44 J-1.313 E.06453
G3 X88.059 Y85.757 I1.095 J1.148 E.04039
G1 X88.41 Y85.917 E.00743
G1 X88.957 Y85.804 E.01077
G3 X91.379 Y84.656 I2.338 J1.802 E.05362
M106 S201.45
M204 S10000
G1 X87.896 Y89.007 F42000
G1 F1912
M204 S6000
G3 X88.35 Y88.804 I.43 J.354 E.00993
M73 P46 R10
G1 X88.392 Y89.222 E.0081
G1 X89 Y89.161 E.01179
G1 X89.101 Y89.885 E.01409
G3 X87.954 Y90.191 I-.803 J-.71 E.02425
G1 X87.934 Y89.479 E.01373
G1 X88.333 Y89.228 E.00909
; WIPE_START
G1 F9000
G1 X89 Y89.161 E-.25483
G1 X89.101 Y89.885 E-.27787
G1 X88.616 Y90.236 E-.22731
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.56 I-.969 J-.736 P1  F42000
G1 X81.977 Y98.977 Z2.56
G1 Z2.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1912
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1912
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1912
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.56 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.56
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.56 F4000
            G39.3 S1
            G0 Z2.56 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z2.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1912
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/82
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.56 I-.372 J1.159 P1  F42000
G1 X89.581 Y85.829 Z2.56
G1 Z2.28
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X91.356 Y85.131 I1.726 J1.784 E.03774
G1 X91.415 Y84.715 E.0081
G3 X93.14 Y85.459 I-.148 J2.714 E.03698
G1 X93.691 Y85.544 E.01075
G3 X97.066 Y85.821 I1.521 J2.157 E.07085
G1 X97.531 Y86.057 E.01005
G3 X100.802 Y90.278 I.805 J2.754 E.13228
G3 X99.521 Y91.556 I-2.889 J-1.614 E.03533
G1 X99.48 Y92.153 E.01153
G3 X97.415 Y91.996 I-1.127 J1.162 E.1527
G2 X96.396 Y91.071 I-3.306 J2.616 E.02665
G2 X95.611 Y90.291 I-3.395 J2.634 E.0214
G3 X93.136 Y89.357 I-.457 J-2.536 E.05353
G1 X93.042 Y89.889 E.01042
G2 X92.296 Y90.272 I-.129 J.666 E.01742
G1 X92.293 Y90.812 E.01041
G1 X92.45 Y91.068 E.00578
G1 X93.25 Y91.267 E.01589
G1 X93.608 Y91.489 E.00812
G3 X92.483 Y93.702 I.368 J1.579 E.1419
G1 X91.883 Y93.61 E.0117
G3 X88.537 Y93.52 I-1.626 J-1.811 E.07115
G1 X87.986 Y93.515 E.01062
G3 X86.785 Y93.834 I-1.456 J-3.058 E.0241
G3 X86.997 Y89.956 I-.292 J-1.961 E.13552
G3 X88.058 Y90.3 I.194 J1.208 E.0223
G1 X88.636 Y90.269 E.01116
G3 X89.017 Y89.99 I18.34 J24.725 E.0091
G2 X89.084 Y89.365 I-.818 J-.404 E.01237
G1 X88.843 Y89.23 E.00533
G1 X88.308 Y89.214 E.01032
G3 X85.352 Y87.074 I-1.044 J-1.67 E.08998
G3 X87.893 Y85.69 I2.066 J.769 E.06084
G2 X88.975 Y85.881 I.673 J-.657 E.02261
G3 X91.356 Y84.707 I2.375 J1.815 E.05302
M106 S201.45
; WIPE_START
G1 X91.87 Y84.779 E-.19724
G1 X92.369 Y84.946 E-.19972
G1 X92.829 Y85.203 E-.20055
G1 X93.14 Y85.459 E-.1531
G1 X93.164 Y85.463 E-.00939
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.68 I-.937 J-.776 P1  F42000
G1 X81.977 Y98.977 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1869
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1869
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1869
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.68 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.68
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.68 F4000
            G39.3 S1
            G0 Z2.68 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1869
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/82
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.68 I-.386 J1.154 P1  F42000
G1 X89.572 Y85.938 Z2.68
G1 Z2.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X91.346 Y85.207 I1.653 J1.495 E.03822
G1 X91.365 Y84.788 E.0081
G3 X93.187 Y85.593 I-.235 J2.995 E.03912
G1 X93.745 Y85.567 E.01078
M73 P47 R10
G3 X97.011 Y85.874 I1.444 J2.17 E.0684
G1 X97.473 Y86.145 E.01032
G3 X100.761 Y90.204 I.88 J2.648 E.13026
G3 X99.385 Y91.528 I-2.623 J-1.348 E.03749
G2 X99.434 Y92.206 I2.352 J.169 E.01314
G3 X97.493 Y92.029 I-1.078 J1.099 E.14583
G1 X97.131 Y91.504 E.01231
G3 X95.875 Y90.279 I1.438 J-2.731 E.03428
G3 X93.735 Y89.837 I-.355 J-3.678 E.04275
G1 X93.54 Y89.673 E.00492
G1 X92.97 Y89.629 E.01101
G2 X92.251 Y90.173 I2.48 J4.027 E.01742
G1 X92.2 Y90.729 E.01076
G3 X92.524 Y91.462 I-1.825 J1.245 E.01554
G1 X92.68 Y91.649 E.00469
G1 X93.232 Y91.735 E.01075
G3 X92.537 Y93.652 I.74 J1.352 E.14374
G1 X91.986 Y93.847 E.01127
G1 X91.581 Y93.786 E.0079
G3 X88.607 Y93.547 I-1.332 J-2.049 E.06187
G2 X87.572 Y93.574 I-.482 J1.35 E.02042
G3 X85.577 Y93.621 I-1.051 J-2.232 E.03959
G3 X87.326 Y90.09 I.908 J-1.749 E.11791
G3 X88.084 Y90.353 I-.43 J2.456 E.01553
G1 X88.63 Y90.321 E.01053
G3 X89.124 Y89.97 I1.698 J1.867 E.01172
G2 X89.183 Y89.312 I-2.255 J-.534 E.01279
G2 X88.863 Y89.074 I-.293 J.061 E.00841
G1 X88.354 Y89.076 E.0098
G3 X85.285 Y87.613 I-1.097 J-1.649 E.07877
G3 X88.241 Y85.957 I2.024 J.147 E.07727
G1 X88.544 Y86.252 E.00816
G2 X89.411 Y85.488 I-1.244 J-2.284 E.02245
G3 X91.306 Y84.785 I1.822 J2.005 E.03994
M106 S201.45
; WIPE_START
G1 X91.816 Y84.846 E-.19484
G1 X92.307 Y85 E-.19569
G1 X92.762 Y85.246 E-.19662
G1 X93.115 Y85.534 E-.17285
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-.937 J-.776 P1  F42000
G1 X81.977 Y98.977 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1868
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1868
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1868
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.8 F4000
            G39.3 S1
            G0 Z2.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1868
M204 S6000
G1 X81.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 2.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/82
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.8 I-.406 J1.147 P1  F42000
G1 X89.547 Y86.081 Z2.8
G1 Z2.52
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X91.29 Y85.287 I1.689 J1.397 E.03822
G1 X91.31 Y84.867 E.0081
G3 X93.126 Y85.632 I-.15 J2.892 E.03875
G1 X93.678 Y85.692 E.0107
G3 X97.125 Y86.093 I1.509 J2.051 E.07361
G1 X97.656 Y86.166 E.01032
G3 X100.322 Y86.924 I.746 J2.446 E.05648
G3 X99.392 Y91.442 I-2.243 J1.894 E.10231
G1 X99.242 Y91.666 E.0052
G1 X99.323 Y92.233 E.01104
G3 X99.835 Y93.656 I-1.176 J1.227 E.03021
G3 X99.435 Y94.325 I-7.363 J-3.953 E.01504
G3 X97.485 Y92.147 I-1.056 J-1.016 E.09296
G2 X96.786 Y91.22 I-1.138 J.13 E.02347
G3 X96.061 Y90.43 I1.878 J-2.455 E.02078
G1 X95.584 Y90.176 E.01041
G3 X93.564 Y89.647 I-.342 J-2.816 E.04122
G1 X93.339 Y89.576 E.00455
G2 X92.219 Y90.082 I-.085 J1.304 E.02464
G2 X92.302 Y90.973 I1.176 J.341 E.01767
G3 X92.49 Y91.674 I-1.665 J.824 E.01408
G2 X93.671 Y91.666 I.584 J-.952 E.02398
G3 X92.615 Y93.581 I.309 J1.419 E.12819
G2 X91.777 Y93.6 I-.401 J.831 E.01678
G3 X88.526 Y93.395 I-1.518 J-1.799 E.06935
G1 X87.984 Y93.237 E.01087
G3 X86.23 Y93.814 I-1.737 J-2.327 E.03621
G3 X87.663 Y90.315 I.259 J-1.937 E.13757
G3 X88.125 Y90.574 I-1.73 J3.624 E.01022
G2 X89.274 Y89.78 I-.51 J-1.966 E.02748
G1 X89.233 Y89.225 E.01072
G1 X89.016 Y88.968 E.00649
G1 X88.442 Y88.884 E.01118
G3 X85.311 Y87.46 I-1.232 J-1.446 E.08293
G3 X88.596 Y86.362 I1.938 J.336 E.08164
G3 X89.823 Y85.277 I70.191 J78.164 E.03156
G3 X91.251 Y84.864 I1.524 J2.596 E.02895
M106 S201.45
; WIPE_START
G1 X91.753 Y84.912 E-.19164
G1 X92.24 Y85.054 E-.19263
G1 X92.692 Y85.287 E-.19357
G1 X93.067 Y85.586 E-.18216
; WIPE_END
M73 P47 R9
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.92 I-.762 J-.949 P1  F42000
M73 P48 R9
G1 X81.977 Y94.485 Z2.92
G1 Z2.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2138
M204 S6000
G1 X81.023 Y94.485 E.01977
G1 X81.023 Y85.515 E.18606
G1 X81.977 Y85.515 E.01977
G1 X81.977 Y94.425 E.18481
M204 S10000
G1 X82.401 Y94.909 F42000
G1 F2138
M204 S6000
G1 X80.599 Y94.909 E.03737
G1 X80.599 Y85.091 E.20366
G1 X82.401 Y85.091 E.03737
G1 X82.401 Y94.849 E.20241
; WIPE_START
G1 F4800
G1 X80.599 Y94.909 E-.68496
G1 X80.599 Y94.712 E-.07505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.401 Y99.401 Z2.92 F42000
G1 Z2.52
G1 E.8 F1800
G1 F2138
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y99.091 E.00643
G1 X82.401 Y99.091 E.03737
G1 X82.401 Y99.341 E.00518
; WIPE_START
G1 F4800
G1 X80.599 Y99.401 E-.68496
G1 X80.599 Y99.203 E-.07505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.347 Y91.608 Z2.92 F42000
G1 X82.401 Y80.909 Z2.92
G1 Z2.52
G1 E.8 F1800
G1 F2138
M204 S6000
G1 X80.599 Y80.909 E.03737
G1 X80.599 Y80.599 E.00643
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y80.849 E.00518
; WIPE_START
G1 F4800
G1 X80.599 Y80.909 E-.68496
G1 X80.599 Y80.712 E-.07504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.473 Y88.294 Z2.92 F42000
G1 X82.8 Y99.8 Z2.92
G1 Z2.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2138
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.92 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.92
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.92 F4000
            G39.3 S1
            G0 Z2.92 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.844 Y98.922 F42000
G1 Z2.52
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.426182
G1 F2100
M204 S800
G1 X82.487 Y98.278 E.01782
G1 X82.487 Y97.712 E.01109
G1 X81.446 Y98.753 E.02884
G1 X80.879 Y98.753 E.01109
G1 X82.487 Y97.145 E.04452
G1 X82.487 Y96.579 E.01109
G1 X80.513 Y98.554 E.05467
G1 X80.513 Y97.987 E.01109
G1 X82.487 Y96.013 E.05467
G1 X82.487 Y95.446 E.01109
G1 X80.513 Y97.421 E.05467
G1 X80.513 Y96.855 E.01109
G1 X82.121 Y95.247 E.04452
G1 X81.554 Y95.247 E.01109
G1 X80.513 Y96.288 E.02884
G1 X80.513 Y95.722 E.01109
G1 X81.156 Y95.079 E.01782
M204 S10000
G1 X81.5 Y94.273 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2138
M204 S6000
G1 X81.5 Y85.727 E.22094
; WIPE_START
G1 F15000
G1 X81.5 Y87.727 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.656 Y84.109 Z2.92 F42000
G1 Z2.52
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.426182
G1 F2100
M204 S800
G1 X82.012 Y84.753 E.01782
G1 X81.446 Y84.753 E.01109
G1 X82.487 Y83.712 E.02884
G1 X82.487 Y83.145 E.01109
G1 X80.879 Y84.753 E.04452
G1 X80.513 Y84.753 E.00718
G1 X80.513 Y84.554 E.00391
G1 X82.487 Y82.579 E.05467
G1 X82.487 Y82.013 E.01109
G1 X80.513 Y83.987 E.05467
G1 X80.513 Y83.421 E.01109
G1 X82.487 Y81.446 E.05467
G1 X82.487 Y81.247 E.0039
G1 X82.121 Y81.247 E.00718
G1 X80.513 Y82.855 E.04452
G1 X80.513 Y82.288 E.01109
G1 X81.554 Y81.247 E.02884
G1 X80.988 Y81.247 E.01109
G1 X80.344 Y81.891 E.01782
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 2.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2100
M204 S6000
G1 X80.988 Y81.247 E-.3459
G1 X81.554 Y81.247 E-.21519
G1 X81.184 Y81.617 E-.19891
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/82
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.92 I-.588 J1.065 P1  F42000
G1 X89.512 Y86.214 Z2.92
G1 Z2.64
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X89.546 Y86.2 E.00071
G3 X91.235 Y85.366 I1.728 J1.373 E.03751
G1 X91.255 Y84.946 E.0081
G3 X93.214 Y85.747 I-.149 J3.163 E.04159
G1 X93.753 Y85.726 E.0104
G3 X97.115 Y86.175 I1.437 J2.053 E.07182
G2 X98.603 Y85.996 I.493 J-2.17 E.02946
G3 X99.706 Y86.536 I-1.25 J3.951 E.02375
G3 X100.202 Y90.755 I-1.57 J2.324 E.09292
G3 X99.059 Y91.517 I-2.281 J-2.183 E.02669
G2 X99.409 Y92.481 I1.402 J.036 E.02024
G3 X99.914 Y93.479 I-3.379 J2.335 E.02162
G3 X99.551 Y93.975 I-.674 J-.112 E.01229
G3 X97.768 Y92.091 I-1.197 J-.653 E.09901
G1 X97.456 Y91.489 E.01308
G3 X96.09 Y90.329 I.886 J-2.428 E.03528
G1 X95.598 Y90.105 E.01042
G3 X93.398 Y89.535 I-.457 J-2.766 E.04509
G1 X92.827 Y89.53 E.01101
G3 X92.196 Y89.905 I-1.718 J-2.17 E.0142
G2 X92.051 Y90.642 I1.186 J.616 E.01468
G3 X92.462 Y91.78 I-1.949 J1.347 E.02357
G1 X92.701 Y91.91 E.00525
G1 X93.235 Y91.942 E.01031
G3 X95.345 Y93.378 I.731 J1.195 E.06191
G3 X92.799 Y93.818 I-1.377 J-.382 E.06221
G2 X92.414 Y93.343 I-.546 J.049 E.01251
G1 X91.86 Y93.435 E.01083
G3 X88.422 Y93.225 I-1.624 J-1.664 E.07476
G1 X87.828 Y93.228 E.01145
G3 X87.992 Y90.654 I-1.34 J-1.377 E.17819
G2 X89.027 Y90.115 I-.173 J-1.595 E.02304
G2 X89.388 Y89.722 I-.038 J-.397 E.01126
G1 X89.309 Y89.188 E.01041
G2 X88.885 Y88.813 I-.642 J.299 E.01121
G1 X88.365 Y88.809 E.01002
G3 X85.321 Y87.517 I-1.203 J-1.399 E.07905
G3 X88.247 Y86.23 I1.91 J.373 E.07229
G1 X88.723 Y86.037 E.00991
G1 X88.832 Y86.042 E.0021
G2 X89.564 Y85.574 I-.17 J-1.072 E.01722
G3 X91.196 Y84.943 I1.731 J2.051 E.03436
M106 S201.45
; WIPE_START
G1 X91.691 Y84.978 E-.1886
G1 X92.172 Y85.107 E-.18931
G1 X92.627 Y85.333 E-.19322
G1 X93.033 Y85.619 E-.18887
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.04 I.428 J-1.139 P1  F42000
G1 X81.977 Y81.461 Z3.04
G1 Z2.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1794
M204 S6000
G1 X81.023 Y81.461 E.01977
G1 X81.023 Y81.023 E.00908
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y81.401 E.00784
M204 S10000
G1 X82.401 Y81.886 F42000
G1 F1794
M204 S6000
G1 X80.599 Y81.886 E.03737
G1 X80.599 Y80.599 E.02668
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y81.826 E.02544
M204 S250
G1 X82.8 Y82.285 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1794
M204 S1000
G1 X80.2 Y82.285 E.04757
G1 X80.2 Y80.2 E.03815
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y82.225 E.03705
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y82.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.478 Y89.873 Z3.04 F42000
G1 X81.977 Y95.461 Z3.04
G1 Z2.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1794
M204 S6000
G1 X81.023 Y95.461 E.01977
G1 X81.023 Y84.539 E.22657
G1 X81.977 Y84.539 E.01977
G1 X81.977 Y95.401 E.22532
M204 S10000
G1 X82.401 Y95.886 F42000
G1 F1794
M204 S6000
M73 P49 R9
G1 X80.599 Y95.886 E.03737
G1 X80.599 Y84.114 E.24417
G1 X82.401 Y84.114 E.03737
G1 X82.401 Y95.826 E.24292
M204 S250
G1 X82.8 Y96.285 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1794
M204 S1000
G1 X80.2 Y96.285 E.04757
G1 X80.2 Y83.715 E.23
G1 X82.8 Y83.715 E.04757
G1 X82.8 Y96.225 E.2289
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y96.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.04 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.04
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.04 F4000
            G39.3 S1
            G0 Z3.04 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y95.249 F42000
G1 Z2.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1794
M204 S6000
G1 X81.5 Y84.751 E.27143
; WIPE_START
G1 F15000
G1 X81.5 Y86.751 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.797 Y94.377 Z3.04 F42000
G1 X81.977 Y98.977 Z3.04
G1 Z2.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1794
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y98.539 E.00908
G1 X81.977 Y98.539 E.01977
G1 X81.977 Y98.917 E.00784
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1794
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y98.114 E.02668
G1 X82.401 Y98.114 E.03737
G1 X82.401 Y99.341 E.02544
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1794
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y97.715 E.03815
G1 X82.8 Y97.715 E.04757
G1 X82.8 Y99.74 E.03705
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/82
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.04 I.608 J1.054 P1  F42000
G1 X93.384 Y92.529 Z3.04
G1 Z2.76
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X94.04 Y92.269 I.773 J.992 E.0138
G1 X94.113 Y91.856 E.0081
G3 X94.922 Y92.282 I-.205 J1.369 E.01796
G3 X95.306 Y92.799 I-.136 J.502 E.01338
G3 X94.972 Y93.845 I-1.024 J.25 E.02226
G3 X93.287 Y94.102 I-.98 J-.767 E.03622
G3 X92.709 Y93.5 I-.086 J-.496 E.01897
G3 X94.055 Y91.845 I1.351 J-.276 E.04701
M106 S201.45
M106 S255
; WIPE_START
G1 X94.602 Y92.013 E-.21765
G1 X94.922 Y92.282 E-.15879
G1 X95.221 Y92.436 E-.12798
G1 X95.306 Y92.799 E-.14145
G1 X95.356 Y93.095 E-.11413
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.16 I.175 J1.204 P1  F42000
G1 X97.791 Y92.742 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X98.479 Y92.518 I.584 J.626 E.01441
G1 X98.558 Y92.106 E.0081
G3 X99.531 Y92.913 I-.233 J1.27 E.02545
G3 X99.911 Y93.649 I-.222 J.581 E.01748
G3 X99.399 Y94.011 I-.707 J-.456 E.01239
G3 X97.065 Y93.083 I-1.049 J-.761 E.06601
G3 X97.441 Y92.474 I.431 J-.155 E.01584
G3 X98.5 Y92.095 I1.057 J1.28 E.02213
M106 S201.45
M106 S255
; WIPE_START
G1 X98.845 Y92.184 E-.13559
G1 X99.15 Y92.368 E-.1353
G1 X99.415 Y92.663 E-.15076
G1 X99.531 Y92.913 E-.10439
G1 X99.822 Y93.143 E-.14121
G1 X99.923 Y93.319 E-.07695
G1 X99.922 Y93.36 E-.01579
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.16 I.677 J-1.011 P1  F42000
G1 X89.526 Y86.405 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.153 Y85.447 I1.783 J1.169 E.03771
G1 X91.17 Y85.028 E.0081
G3 X93.023 Y85.773 I.048 J2.556 E.03954
G1 X93.283 Y85.866 E.00534
G1 X93.799 Y85.79 E.01006
G3 X97.044 Y86.195 I1.408 J1.916 E.06948
G1 X97.535 Y86.381 E.01012
G1 X98.255 Y86.227 E.0142
G1 X98.25 Y86.103 E.0024
G3 X99.095 Y86.259 I.364 J.39 E.01923
G3 X100.313 Y87.177 I-2.416 J4.473 E.02951
G3 X98.294 Y91.546 I-2.186 J1.64 E.11344
G3 X96.12 Y90.207 I.061 J-2.532 E.05157
G1 X95.598 Y90.036 E.0106
G3 X93.954 Y89.906 I-.459 J-4.656 E.03195
G3 X93.186 Y89.211 I.729 J-1.577 E.02028
G3 X91.962 Y89.891 I-2.828 J-3.646 E.02709
G1 X91.883 Y90.515 E.01211
G3 X88.769 Y93.505 I-1.646 J1.403 E.12601
G2 X88.274 Y93.172 I-.983 J.926 E.01159
G1 X87.741 Y93.254 E.01039
G3 X87.881 Y90.618 I-1.269 J-1.389 E.17141
G2 X88.926 Y90.25 I.105 J-1.368 E.02198
G3 X89.374 Y90.009 I1.044 J1.401 E.00984
G1 X89.468 Y89.7 E.00623
G1 X89.332 Y89.189 E.01019
G3 X89.029 Y88.759 I.846 J-.92 E.01023
G1 X88.743 Y88.648 E.0059
G1 X88.21 Y88.762 E.01051
G3 X85.305 Y87.595 I-1.108 J-1.44 E.07271
G3 X88.414 Y86.573 I1.807 J.259 E.07819
G2 X89.291 Y85.992 I-.159 J-1.192 E.02098
G3 X91.111 Y85.025 I2.072 J1.703 E.04078
M106 S201.45
; WIPE_START
G1 X91.633 Y85.046 E-.19863
G1 X92.139 Y85.186 E-.1992
G1 X92.591 Y85.418 E-.19309
G1 X92.934 Y85.7 E-.16908
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.16 I.441 J-1.134 P1  F42000
G1 X82.401 Y81.601 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1813
M204 S6000
G1 X80.599 Y81.601 E.03737
G1 X80.599 Y80.599 E.02078
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y81.541 E.01953
M204 S250
G1 X82.8 Y82 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1813
M204 S1000
G1 X80.2 Y82 E.04757
G1 X80.2 Y80.2 E.03294
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.94 E.03184
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y81.986 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.16
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.16 F4000
            G39.3 S1
            G0 Z3.16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.811 Y81.1 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.603202
G1 F1813
M204 S6000
G1 X82.189 Y81.1 E.03888
; WIPE_START
G1 F15000
G1 X80.811 Y81.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.441 Y88.707 Z3.16 F42000
G1 X81.977 Y95.177 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1813
M204 S6000
G1 X81.023 Y95.177 E.01977
G1 X81.023 Y84.823 E.21475
G1 X81.977 Y84.823 E.01977
G1 X81.977 Y95.117 E.21351
M204 S10000
G1 X82.401 Y95.601 F42000
G1 F1813
M204 S6000
G1 X80.599 Y95.601 E.03737
G1 X80.599 Y84.399 E.23235
G1 X82.401 Y84.399 E.03737
G1 X82.401 Y95.541 E.23111
M204 S250
G1 X82.8 Y96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1813
M204 S1000
G1 X80.2 Y96 E.04757
G1 X80.2 Y84 E.21958
G1 X82.8 Y84 E.04757
G1 X82.8 Y95.94 E.21848
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y95.986 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.965 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1813
M204 S6000
G1 X81.5 Y85.035 E.25671
; WIPE_START
G1 F15000
G1 X81.5 Y87.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.055 Y94.648 Z3.16 F42000
G1 X82.401 Y99.401 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1813
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y98.399 E.02078
G1 X82.401 Y98.399 E.03737
G1 X82.401 Y99.341 E.01953
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1813
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98 E.03294
G1 X82.8 Y98 E.04757
G1 X82.8 Y99.74 E.03184
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.189 Y98.9 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.603202
G1 F1813
M204 S6000
G1 X80.811 Y98.9 E.03888
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 2.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.189 Y98.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/82
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.16 I.59 J1.064 P1  F42000
G1 X93.457 Y92.651 Z3.16
G1 Z2.88
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X93.458 Y92.65 E.00002
G3 X94.081 Y92.405 I.576 J.55 E.01331
G1 X94.155 Y91.992 E.0081
G3 X94.766 Y92.279 I-.389 J1.618 E.01311
G3 X95.291 Y92.898 I.127 J.424 E.01978
G3 X94.879 Y93.882 I-1.14 J.101 E.02141
G3 X93.383 Y94.062 I-.927 J-1.402 E.0301
G3 X92.742 Y93.436 I-.246 J-.389 E.02375
G3 X92.95 Y92.673 I.798 J-.193 E.01592
G3 X94.097 Y91.981 I1.07 J.479 E.02747
M106 S201.45
M106 S255
; WIPE_START
G1 X94.432 Y92.068 E-.13177
G1 X94.766 Y92.279 E-.15004
G1 X94.987 Y92.259 E-.08452
M73 P50 R9
G1 X95.247 Y92.381 E-.10928
G1 X95.316 Y92.531 E-.06255
G1 X95.291 Y92.898 E-.13968
G1 X95.282 Y93.114 E-.08216
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.28 I.107 J1.212 P1  F42000
G1 X97.634 Y92.907 Z3.28
G1 Z2.88
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X97.742 Y92.926 E.00211
G3 X98.458 Y92.638 I.671 J.633 E.01536
G1 X98.581 Y92.236 E.0081
G3 X99.357 Y92.856 I-.206 J1.054 E.01991
G3 X99.99 Y93.5 I-.301 J.93 E.01808
G3 X99.493 Y93.958 I-.718 J-.281 E.01349
G3 X98.524 Y94.435 I-2.244 J-3.337 E.02088
G3 X97.355 Y93.855 I-.086 J-1.296 E.02635
G3 X97.031 Y92.998 I1.691 J-1.129 E.01782
G3 X97.646 Y92.482 I.385 J-.166 E.02066
G3 X98.524 Y92.217 I.765 J.948 E.01814
M106 S201.45
M106 S255
; WIPE_START
G1 X98.847 Y92.324 E-.12907
G1 X99.088 Y92.487 E-.11062
G1 X99.357 Y92.856 E-.17352
G1 X99.862 Y93.182 E-.22853
G1 X99.978 Y93.471 E-.11826
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.28 I.678 J-1.011 P1  F42000
G1 X89.581 Y86.498 Z3.28
G1 Z2.88
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.198 Y85.549 I1.665 J.985 E.03773
G1 X91.225 Y85.13 E.0081
G3 X93.02 Y85.922 I-.043 J2.527 E.03884
G2 X94.045 Y85.714 I.296 J-1.168 E.02085
G3 X96.987 Y86.286 I1.126 J2.06 E.06266
G1 X97.488 Y86.514 E.01062
G2 X98.193 Y86.213 I-.607 J-2.394 E.01484
G3 X99.004 Y86.166 I.414 J.134 E.02016
G2 X100.069 Y87.064 I4.394 J-4.136 E.02692
G3 X100.273 Y90.373 I-1.934 J1.78 E.06915
G3 X96.12 Y90.021 I-1.984 J-1.271 E.0986
G1 X95.562 Y89.96 E.01081
G3 X93.976 Y89.918 I-.635 J-6.104 E.03067
G3 X93.136 Y89.089 I.815 J-1.665 E.02315
G3 X91.865 Y89.815 I-2.24 J-2.449 E.02845
G1 X91.753 Y90.463 E.01268
G3 X89.39 Y93.828 I-1.516 J1.447 E.11104
G3 X88.459 Y93.093 I.894 J-2.092 E.02313
G1 X87.859 Y93.103 E.01157
G3 X87.835 Y90.605 I-1.374 J-1.236 E.17096
G2 X88.736 Y90.481 I.339 J-.87 E.0183
G3 X89.57 Y89.99 I1.735 J1.997 E.01877
G1 X89.525 Y89.337 E.01262
G3 X88.863 Y88.412 I1.087 J-1.477 E.0223
G1 X88.239 Y88.558 E.01237
G3 X85.251 Y87.593 I-1.224 J-1.318 E.07357
G3 X85.999 Y86.495 I1.691 J.349 E.02628
G3 X88.381 Y86.729 I1.067 J1.376 E.05084
G2 X89.061 Y86.536 I.071 J-1.045 E.0139
G3 X91.166 Y85.126 I2.211 J1.026 E.05135
M106 S201.45
; WIPE_START
G1 X91.67 Y85.166 E-.19207
G1 X92.157 Y85.311 E-.19299
G1 X92.6 Y85.554 E-.19203
G1 X92.962 Y85.871 E-.1829
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.28 I.474 J-1.121 P1  F42000
G1 X82.401 Y81.408 Z3.28
G1 Z2.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1688
M204 S6000
G1 X80.599 Y81.408 E.03737
G1 X80.599 Y80.599 E.01678
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y81.348 E.01553
M204 S250
G1 X82.8 Y81.807 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1688
M204 S1000
G1 X80.2 Y81.807 E.04757
G1 X80.2 Y80.2 E.02941
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.747 E.02831
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y81.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.28 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.28
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.28 F4000
            G39.3 S1
            G0 Z3.28 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.811 Y81.004 F42000
G1 Z2.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410392
G1 F1688
M204 S6000
G1 X82.189 Y81.004 E.0259
; WIPE_START
G1 F15000
G1 X80.811 Y81.004 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.445 Y88.61 Z3.28 F42000
G1 X81.977 Y94.984 Z3.28
G1 Z2.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1688
M204 S6000
G1 X81.023 Y94.984 E.01977
G1 X81.023 Y85.016 E.20676
G1 X81.977 Y85.016 E.01977
G1 X81.977 Y94.924 E.20551
M204 S10000
G1 X82.401 Y95.408 F42000
G1 F1688
M204 S6000
G1 X80.599 Y95.408 E.03737
G1 X80.599 Y84.592 E.22436
G1 X82.401 Y84.592 E.03737
G1 X82.401 Y95.348 E.22311
M204 S250
G1 X82.8 Y95.807 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1688
M204 S1000
G1 X80.2 Y95.807 E.04757
G1 X80.2 Y84.193 E.21252
G1 X82.8 Y84.193 E.04757
G1 X82.8 Y95.747 E.21143
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y95.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.772 Z3.28 F42000
G1 Z2.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1688
M204 S6000
G1 X81.5 Y85.228 E.24674
; WIPE_START
G1 F15000
G1 X81.5 Y87.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.063 Y94.84 Z3.28 F42000
G1 X82.401 Y99.401 Z3.28
G1 Z2.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1688
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y98.592 E.01678
G1 X82.401 Y98.592 E.03737
G1 X82.401 Y99.341 E.01553
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1688
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.193 E.02941
G1 X82.8 Y98.193 E.04757
G1 X82.8 Y99.74 E.02831
M204 S10000
G1 X82.189 Y98.996 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.410392
G1 F1688
M204 S6000
G1 X80.811 Y98.996 E.0259
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.189 Y98.996 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/82
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.28 I.578 J1.071 P1  F42000
G1 X93.362 Y92.962 Z3.28
G1 Z3
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G2 X93.474 Y92.763 I-1.192 J-.807 E.00442
G2 X93.88 Y92.566 I-1.852 J-4.337 E.00869
G1 X94.059 Y92.564 E.00345
G1 X94.177 Y92.161 E.0081
G2 X95.177 Y92.257 I1.28 J-8.075 E.01938
G3 X95.248 Y92.977 I-.386 J.402 E.01519
G3 X95.007 Y93.645 I-.906 J.05 E.01406
G3 X94.437 Y94.065 I-.465 J-.034 E.0155
G2 X93.401 Y94.028 I-.712 J5.377 E.02001
G3 X92.721 Y94.016 I-.333 J-.381 E.01437
G3 X92.78 Y93.42 I1.009 J-.202 E.01171
G3 X93.115 Y92.536 I1.323 J-.003 E.01863
G3 X94.12 Y92.143 I.943 J.93 E.02143
M106 S201.45
M106 S255
; WIPE_START
G1 X94.383 Y92.224 E-.10443
G1 X95.177 Y92.257 E-.30197
G1 X95.336 Y92.459 E-.0979
G1 X95.344 Y92.667 E-.0789
G1 X95.248 Y92.977 E-.12349
G1 X95.24 Y93.117 E-.05331
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I.038 J1.216 P1  F42000
G1 X97.522 Y93.045 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X97.431 Y92.862 E.00396
G2 X98.307 Y92.813 I.328 J-1.994 E.01706
G1 X98.316 Y92.393 E.0081
G3 X99.408 Y92.957 I-.195 J1.714 E.02422
G3 X100.029 Y93.51 I-.095 J.732 E.01703
G3 X99.42 Y93.929 I-.59 J-.206 E.01524
G2 X98.546 Y94.253 I1.295 J4.831 E.018
G3 X97.149 Y93.239 I-.164 J-1.244 E.0367
G3 X97.068 Y92.493 I.468 J-.428 E.01546
G3 X97.886 Y92.491 I.413 J1.25 E.01603
G1 X98.257 Y92.391 E.0074
M106 S201.45
M106 S255
; WIPE_START
G1 X98.555 Y92.408 E-.11353
G1 X98.834 Y92.517 E-.11352
G1 X99.408 Y92.957 E-.27502
G1 X99.74 Y93.087 E-.13546
G1 X99.905 Y93.224 E-.08153
G1 X99.948 Y93.322 E-.04094
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I.664 J-1.02 P1  F42000
G1 X89.627 Y86.607 Z3.4
M73 P51 R9
G1 Z3
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.247 Y85.662 I1.617 J.91 E.03791
G1 X91.274 Y85.243 E.0081
G3 X93.119 Y86.197 I-.031 J2.322 E.0415
G2 X94.109 Y85.797 I.066 J-1.264 E.02125
G3 X96.947 Y86.4 I1.07 J1.946 E.06094
G1 X97.313 Y86.928 E.0124
G1 X97.525 Y86.413 E.01073
G2 X98.472 Y85.885 I-.304 J-1.659 E.02128
G3 X99.136 Y86.465 I-.047 J.724 E.01828
G2 X99.653 Y86.823 I1.079 J-1.006 E.01221
G1 X99.841 Y86.947 E.00432
G3 X98.45 Y91.349 I-1.753 J1.867 E.11084
G3 X96.223 Y89.977 I-.162 J-2.229 E.05386
G1 X95.671 Y89.827 E.01103
G3 X94.243 Y89.976 I-1.384 J-6.338 E.02773
G3 X93.223 Y89.191 I.387 J-1.557 E.02552
G1 X92.632 Y89.315 E.01165
G3 X91.773 Y89.721 I-1.658 J-2.4 E.0184
G1 X91.669 Y89.927 E.00445
G1 X91.711 Y90.517 E.01141
G3 X92.214 Y91.171 I-3.818 J3.459 E.01592
G3 X92.236 Y92.351 I-6.881 J.717 E.02277
G3 X88.359 Y92.869 I-2.044 J-.529 E.09643
G2 X87.419 Y93.409 I.757 J2.405 E.02106
G3 X88.056 Y91.007 I-.937 J-1.534 E.16478
G2 X88.877 Y90.426 I-.564 J-1.666 E.01967
G3 X89.514 Y90.096 I.999 J1.148 E.01395
G1 X89.592 Y89.734 E.00714
G1 X89.43 Y89.228 E.01023
G3 X88.975 Y87.56 I.886 J-1.138 E.03575
G3 X91.215 Y85.239 I2.254 J-.066 E.06928
M106 S201.45
; WIPE_START
G1 X91.709 Y85.286 E-.18847
G1 X92.332 Y85.513 E-.25203
G1 X92.719 Y85.775 E-.17738
G1 X92.976 Y86.046 E-.14211
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I-.157 J-1.207 P1  F42000
G1 X86.212 Y86.924 Z3.4
G1 Z3
G1 E.8 F1800
G1 F1808
M204 S6000
G3 X87.005 Y86.661 I.945 J1.522 E.01625
G1 X87.02 Y86.241 E.0081
G3 X86.971 Y88.95 I.101 J1.357 E.08724
G3 X85.248 Y87.888 I.117 J-2.117 E.04067
G3 X85.775 Y86.734 I.934 J-.27 E.02663
G3 X86.961 Y86.239 I1.331 J1.52 E.02522
; WIPE_START
G1 F9000
G1 X87.549 Y86.306 E-.22492
G1 X87.889 Y86.457 E-.14125
G1 X88.112 Y86.651 E-.11239
G1 X88.236 Y86.775 E-.06647
G1 X88.441 Y87.166 E-.16794
G1 X88.459 Y87.289 E-.04703
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I.858 J-.863 P1  F42000
G1 X82.401 Y81.26 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1808
M204 S6000
G1 X80.599 Y81.26 E.03737
G1 X80.599 Y80.599 E.0137
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y81.2 E.01245
M204 S250
G1 X82.8 Y81.659 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1808
M204 S1000
G1 X80.2 Y81.659 E.04757
G1 X80.2 Y80.2 E.02669
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.599 E.02559
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y81.645 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.4 F4000
            G39.3 S1
            G0 Z3.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.811 Y80.929 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.261812
G1 F1808
M204 S6000
G1 X82.189 Y80.929 E.0159
; WIPE_START
G1 F15000
G1 X80.811 Y80.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.449 Y88.535 Z3.4 F42000
G1 X81.977 Y94.835 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1808
M204 S6000
G1 X81.023 Y94.835 E.01977
G1 X81.023 Y85.165 E.20059
G1 X81.977 Y85.165 E.01977
G1 X81.977 Y94.775 E.19935
M204 S10000
G1 X82.401 Y95.26 F42000
G1 F1808
M204 S6000
G1 X80.599 Y95.26 E.03737
G1 X80.599 Y84.74 E.21819
G1 X82.401 Y84.74 E.03737
G1 X82.401 Y95.2 E.21695
M204 S250
G1 X82.8 Y95.659 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1808
M204 S1000
G1 X80.2 Y95.659 E.04757
G1 X80.2 Y84.341 E.20709
G1 X82.8 Y84.341 E.04757
G1 X82.8 Y95.599 E.20599
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y95.645 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.623 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1808
M204 S6000
G1 X81.5 Y85.377 E.23906
; WIPE_START
G1 F15000
G1 X81.5 Y87.377 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.07 Y94.988 Z3.4 F42000
G1 X82.401 Y99.401 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1808
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y98.74 E.0137
G1 X82.401 Y98.74 E.03737
G1 X82.401 Y99.341 E.01245
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1808
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.341 E.02669
G1 X82.8 Y98.341 E.04757
G1 X82.8 Y99.74 E.02559
M204 S10000
G1 X82.189 Y99.071 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.261812
G1 F1808
M204 S6000
G1 X80.811 Y99.071 E.0159
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.189 Y99.071 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/82
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.4 I1.152 J.391 P1  F42000
G1 X86.306 Y86.929 Z3.4
G1 Z3.12
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F1766
M204 S6000
G1 X86.311 Y86.927 E.0001
G3 X87.096 Y86.765 I.669 J1.254 E.01568
G1 X87.111 Y86.345 E.0081
G3 X87.053 Y88.851 I-.037 J1.253 E.07561
G3 X85.194 Y87.882 I-.134 J-2.011 E.04249
G3 X85.948 Y86.641 I.977 J-.256 E.03123
G3 X87.052 Y86.343 I1.078 J1.795 E.02233
; WIPE_START
G1 F9000
G1 X87.729 Y86.525 E-.26638
G1 X88.071 Y86.813 E-.16981
G1 X88.281 Y87.183 E-.16165
G1 X88.347 Y87.591 E-.15725
G1 X88.345 Y87.604 E-.00491
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.52 I.655 J1.026 P1  F42000
G1 X89.697 Y86.741 Z3.52
G1 Z3.12
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.296 Y85.775 I1.689 J.988 E.03756
G1 X91.323 Y85.356 E.0081
G3 X92.984 Y86.192 I-.12 J2.307 E.03689
G1 X93.232 Y86.296 E.00518
G2 X94.174 Y85.88 I0 J-1.275 E.02044
G3 X97.012 Y86.656 I1.02 J1.848 E.06276
G1 X97.565 Y86.745 E.01078
G3 X97.952 Y86.639 I.53 J1.183 E.00776
G3 X98.439 Y85.849 I3.441 J1.575 E.01794
G3 X99.074 Y86.547 I-.052 J.686 E.02005
G2 X99.729 Y86.869 I.777 J-.753 E.01435
G3 X100.189 Y87.611 I-.511 J.829 E.01745
G3 X98.413 Y91.239 I-2.066 J1.238 E.09235
G3 X96.284 Y89.881 I-.178 J-2.069 E.05234
G1 X95.751 Y89.7 E.01085
G2 X94.963 Y89.938 I2.411 J9.443 E.01587
G3 X93.261 Y89.212 I-.354 J-1.527 E.03814
G1 X92.666 Y89.144 E.01155
G3 X91.281 Y89.673 I-1.516 J-1.89 E.02904
G1 X91.406 Y90.373 E.0137
G3 X92.254 Y91.103 I-5.637 J7.399 E.02158
G3 X92.157 Y91.539 I-.687 J.076 E.00876
G3 X89.183 Y93.573 I-1.933 J.365 E.08777
G3 X88.528 Y92.979 I1.103 J-1.872 E.01717
G2 X87.796 Y93.006 I-.324 J1.141 E.01436
G3 X85.957 Y93.521 I-1.303 J-1.113 E.03905
G3 X85.101 Y92.938 I.181 J-1.184 E.02063
G3 X87.961 Y90.944 I1.387 J-1.058 E.1085
G1 X88.574 Y90.86 E.01192
G3 X89.704 Y90.112 I1.636 J1.245 E.02662
G2 X89.28 Y89.062 I-1.239 J-.11 E.02267
G3 X89.1 Y87.367 I.973 J-.961 E.03547
G3 X91.264 Y85.352 I2.223 J.217 E.0623
M106 S201.45
M106 S255
; WIPE_START
G1 X91.748 Y85.406 E-.18496
G1 X92.198 Y85.564 E-.18139
G1 X92.608 Y85.819 E-.18337
G1 X92.984 Y86.192 E-.20124
G1 X93.006 Y86.201 E-.00904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.52 I-1.2 J.202 P1  F42000
G1 X94.117 Y92.794 Z3.52
G1 Z3.12
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X94.86 Y92.727 E.01437
G1 X95.146 Y92.209 E.01141
G1 X95.199 Y92.215 E.00103
G3 X95.293 Y92.814 I-.31 J.356 E.01268
G2 X95.073 Y93.457 I3.486 J1.557 E.01312
G3 X94.739 Y94.088 I-12.358 J-6.12 E.01377
G3 X94.348 Y94.034 I-.158 J-.296 E.00814
G2 X93.529 Y93.886 I-.535 J.625 E.01681
G3 X92.726 Y94.122 I-.556 J-.41 E.01733
G3 X92.867 Y93.33 I.711 J-.282 E.01633
G3 X93.049 Y92.763 I.709 J-.084 E.01183
G3 X93.421 Y92.305 I.422 J-.038 E.01259
G2 X95.087 Y92.202 I.658 J-2.909 E.03262
M106 S201.45
M106 S255
; WIPE_START
G1 X95.199 Y92.215 E-.04272
G1 X95.356 Y92.389 E-.08887
G1 X95.293 Y92.814 E-.16309
G1 X95.168 Y93.035 E-.09669
G1 X95.073 Y93.457 E-.16418
G1 X94.821 Y93.933 E-.20445
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.52 I.087 J1.214 P1  F42000
G1 X97.96 Y93.707 Z3.52
G1 Z3.12
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X97.674 Y93.358 I-.888 J.436 E.00877
G2 X97.502 Y92.925 I-.593 J-.015 E.00922
G1 X97.218 Y92.416 E.01125
G3 X97.813 Y92.608 I.004 J1.003 E.01226
G2 X98.581 Y92.601 I.223 J-16.761 E.01481
G2 X99.434 Y93.028 I1.495 J-1.917 E.01851
G3 X100.069 Y93.521 I-.029 J.694 E.01652
G3 X99.516 Y93.87 I-.517 J-.205 E.0135
G3 X98.885 Y93.902 I-.542 J-4.485 E.01218
G3 X97.819 Y94.147 I-1.007 J-1.943 E.02131
G2 X97.329 Y93.606 I-19.85 J17.484 E.01407
G2 X96.968 Y92.831 I-2.912 J.883 E.01653
G3 X97.159 Y92.414 I.224 J-.15 E.01056
M106 S201.45
; WIPE_START
G1 X97.423 Y92.438 E-.10098
G1 X97.813 Y92.608 E-.16157
G1 X98.581 Y92.601 E-.29196
G1 X98.796 Y92.71 E-.09147
G1 X98.97 Y92.888 E-.09498
G1 X99.018 Y92.903 E-.01904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.52 I.703 J-.993 P1  F42000
G1 X82.401 Y81.14 Z3.52
G1 Z3.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1766
M204 S6000
G1 X80.599 Y81.14 E.03737
G1 X80.599 Y80.599 E.01121
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y81.08 E.00997
M204 S250
G1 X82.8 Y81.539 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1766
M204 S1000
G1 X80.2 Y81.539 E.04757
G1 X80.2 Y80.2 E.0245
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.479 E.0234
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y81.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.52 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.52
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.52 F4000
            G39.3 S1
            G0 Z3.52 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.811 Y80.869 F42000
G1 Z3.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.141932
G1 F1766
M204 S6000
G1 X82.189 Y80.869 E.00782
; WIPE_START
G1 F15000
G1 X80.811 Y80.869 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.451 Y88.475 Z3.52 F42000
G1 X81.977 Y94.715 Z3.52
G1 Z3.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1766
M204 S6000
G1 X81.023 Y94.715 E.01977
G1 X81.023 Y85.285 E.19562
G1 X81.977 Y85.285 E.01977
G1 X81.977 Y94.655 E.19437
M204 S10000
G1 X82.401 Y95.14 F42000
G1 F1766
M204 S6000
G1 X80.599 Y95.14 E.03737
G1 X80.599 Y84.86 E.21322
G1 X82.401 Y84.86 E.03737
G1 X82.401 Y95.08 E.21197
M204 S250
G1 X82.8 Y95.539 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1766
M204 S1000
G1 X80.2 Y95.539 E.04757
M73 P52 R9
G1 X80.2 Y84.461 E.2027
G1 X82.8 Y84.461 E.04757
G1 X82.8 Y95.479 E.2016
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y95.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.503 Z3.52 F42000
G1 Z3.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1766
M204 S6000
G1 X81.5 Y85.497 E.23286
; WIPE_START
G1 F15000
G1 X81.5 Y87.497 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.076 Y95.107 Z3.52 F42000
G1 X82.401 Y99.401 Z3.52
G1 Z3.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1766
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y98.86 E.01121
G1 X82.401 Y98.86 E.03737
G1 X82.401 Y99.341 E.00997
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1766
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.461 E.0245
G1 X82.8 Y98.461 E.04757
G1 X82.8 Y99.74 E.0234
M204 S10000
G1 X82.189 Y99.131 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.141932
G1 F1766
M204 S6000
G1 X80.811 Y99.131 E.00782
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.189 Y99.131 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/82
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.52 I.925 J.791 P1  F42000
G1 X88.848 Y91.337 Z3.52
G1 Z3.24
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.319 Y90.528 I1.452 J.899 E.03383
G1 X90.34 Y90.109 E.0081
G3 X91.621 Y90.691 I-.081 J1.877 E.02779
G1 X92.066 Y90.919 E.00964
G3 X92.291 Y91.179 I.049 J.185 E.00824
G3 X92.068 Y91.59 I-.9 J-.222 E.00912
G3 X89.343 Y93.568 I-1.863 J.299 E.08017
G3 X88.531 Y92.837 I1.163 J-2.109 E.02123
G2 X87.784 Y92.896 I-.282 J1.19 E.01469
G3 X86.28 Y93.525 I-1.314 J-1.032 E.03281
G3 X85.092 Y92.789 I-.301 J-.842 E.03092
G3 X86.333 Y90.161 I1.464 J-.916 E.0666
G3 X87.257 Y90.392 I-.275 J3.064 E.01843
G3 X87.985 Y91.099 I-1.145 J1.905 E.01974
G1 X88.593 Y90.976 E.01195
G3 X90.281 Y90.106 I1.651 J1.131 E.03815
M106 S201.45
M106 S255
; WIPE_START
G1 X90.706 Y90.158 E-.16245
G1 X91.104 Y90.306 E-.16154
G1 X91.621 Y90.691 E-.24493
G1 X92.066 Y90.919 E-.19001
G1 X92.069 Y90.919 E-.00107
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.64 I1.055 J-.606 P1  F42000
G1 X89.768 Y86.914 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.3 Y85.899 I1.503 J.605 E.03766
G1 X91.361 Y85.483 E.0081
G3 X93.035 Y86.561 I-.156 J2.08 E.03999
G1 X93.659 Y86.473 E.01216
G3 X96.484 Y86.214 I1.535 J1.205 E.06121
G3 X96.826 Y86.56 I-.05 J.392 E.01011
G1 X96.984 Y86.868 E.00667
G1 X97.567 Y86.896 E.01126
G3 X98.023 Y86.761 I.713 J1.564 E.0092
G1 X98.247 Y86.251 E.01073
G3 X98.524 Y85.776 I.355 J-.111 E.01191
G3 X98.952 Y86.342 I-.285 J.661 E.0143
G2 X99.808 Y86.92 I1.205 J-.861 E.02034
G3 X100.108 Y87.272 I-.107 J.395 E.00947
G3 X100.397 Y88.952 I-7.327 J2.125 E.03294
G3 X98.498 Y91.112 I-2.33 J-.134 E.05974
G3 X96.396 Y89.878 I-.239 J-2 E.05047
G2 X95.531 Y89.639 I-.741 J.995 E.01769
G3 X94.649 Y89.947 I-.666 J-.492 E.01912
G3 X93.246 Y89.099 I-.069 J-1.47 E.03351
G1 X92.655 Y89.006 E.01155
G3 X91.404 Y89.526 I-1.418 J-1.646 E.02655
G3 X88.843 Y87.979 I-.71 J-1.719 E.06703
G3 X89.257 Y87.205 I1.514 J.311 E.01717
G3 X91.303 Y85.475 I2.014 J.308 E.05635
M106 S201.45
M106 S255
; WIPE_START
G1 X91.762 Y85.545 E-.17656
G1 X92.195 Y85.719 E-.17733
G1 X92.574 Y85.982 E-.17517
G1 X92.952 Y86.457 E-.23093
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.64 I-.101 J-1.213 P1  F42000
G1 X86.237 Y87.016 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X86.968 Y86.874 I.707 J1.689 E.01444
G1 X87.049 Y86.462 E.0081
G1 X87.1 Y86.472 E.001
G3 X86.987 Y88.752 I-.09 J1.138 E.06783
G3 X85.29 Y88.149 I-.079 J-2.467 E.03554
G3 X86.168 Y86.602 I.819 J-.558 E.04256
G3 X86.991 Y86.451 I.766 J1.856 E.01624
; WIPE_START
G1 F9000
G1 X87.1 Y86.472 E-.04219
G1 X87.507 Y86.574 E-.15951
G1 X87.899 Y86.858 E-.18384
G1 X88.113 Y87.209 E-.15614
G1 X88.179 Y87.593 E-.1482
G1 X88.144 Y87.775 E-.07012
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.64 I-.81 J.908 P1  F42000
G1 X94.083 Y93.074 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X94.326 Y93.163 E.00499
G1 X94.748 Y92.764 E.0112
G1 X95.209 Y92.175 E.01441
G3 X95.38 Y92.298 I.023 J.148 E.00451
G3 X95.068 Y93.038 I-.964 J.029 E.01596
G3 X94.652 Y94.212 I-2.513 J-.229 E.02427
G3 X94.297 Y93.941 I-.055 J-.297 E.0097
G1 X93.789 Y93.706 E.01079
G2 X93.183 Y94.105 I.46 J1.359 E.01414
G3 X92.651 Y94.135 I-.283 J-.277 E.01128
G3 X92.966 Y93.313 I1.005 J-.086 E.01757
G3 X93.217 Y92.358 I46.546 J11.728 E.01903
G3 X93.478 Y92.285 I.16 J.069 E.00598
G2 X94.212 Y92.674 I.83 J-.678 E.01645
G1 X94.506 Y92.368 E.00818
G2 X95.149 Y92.175 I-.47 J-2.741 E.01299
M106 S201.45
M106 S255
; WIPE_START
G1 X95.341 Y92.213 E-.07423
G1 X95.38 Y92.298 E-.03562
G1 X95.308 Y92.704 E-.15645
G1 X95.068 Y93.038 E-.15639
G1 X94.879 Y93.871 E-.32461
G1 X94.861 Y93.899 E-.0127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.64 I.124 J1.211 P1  F42000
G1 X98.264 Y93.549 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.992 Y93.688 I-.434 J-.518 E.00594
G2 X97.775 Y93.303 I-.764 J.177 E.00862
G1 X97.244 Y92.405 E.02012
G3 X97.832 Y92.729 I-.468 J1.546 E.01305
G3 X98.436 Y92.887 I-1.502 J6.982 E.01203
G2 X99.648 Y93.136 I1.03 J-1.932 E.02419
G3 X100.098 Y93.615 I.002 J.449 E.0142
G3 X98.909 Y93.566 I-.568 J-.655 E.02529
G3 X97.931 Y94.227 I-4.119 J-5.033 E.02278
G3 X97.569 Y93.709 I.326 J-.614 E.01266
G2 X97.125 Y93.058 I-4.012 J2.256 E.01521
G3 X96.972 Y92.405 I.28 J-.41 E.01418
G3 X97.186 Y92.392 I.143 J.565 E.00417
M106 S201.45
; WIPE_START
G1 X97.548 Y92.516 E-.14525
G1 X97.832 Y92.729 E-.13513
G1 X97.999 Y92.729 E-.06317
G1 X98.269 Y92.872 E-.11612
G1 X98.436 Y92.887 E-.0638
G1 X98.734 Y93.054 E-.1301
G1 X99.013 Y93.079 E-.10643
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.64 I.714 J-.985 P1  F42000
G1 X82.401 Y81.041 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X80.599 Y81.041 E.03737
G1 X80.599 Y80.599 E.00916
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y80.981 E.00792
M204 S250
G1 X82.8 Y81.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1706
M204 S1000
G1 X80.2 Y81.44 E.04757
G1 X80.2 Y80.2 E.02269
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.38 E.02159
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y81.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.478 Y89.029 Z3.64 F42000
G1 X81.977 Y94.617 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X81.023 Y94.617 E.01977
G1 X81.023 Y85.383 E.19152
G1 X81.977 Y85.383 E.01977
G1 X81.977 Y94.557 E.19028
M204 S10000
G1 X82.401 Y95.041 F42000
G1 F1706
M204 S6000
G1 X80.599 Y95.041 E.03737
G1 X80.599 Y84.959 E.20912
G1 X82.401 Y84.959 E.03737
G1 X82.401 Y94.981 E.20788
M204 S250
G1 X82.8 Y95.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1706
M204 S1000
G1 X80.2 Y95.44 E.04757
G1 X80.2 Y84.56 E.19908
G1 X82.8 Y84.56 E.04757
G1 X82.8 Y95.38 E.19799
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y95.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.64 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.64
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.64 F4000
            G39.3 S1
            G0 Z3.64 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y94.405 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1706
M204 S6000
G1 X81.5 Y85.596 E.22775
; WIPE_START
G1 F15000
G1 X81.5 Y87.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.081 Y95.206 Z3.64 F42000
G1 X82.401 Y99.401 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y98.959 E.00916
G1 X82.401 Y98.959 E.03737
G1 X82.401 Y99.341 E.00792
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1706
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.56 E.02269
G1 X82.8 Y98.56 E.04757
G1 X82.8 Y99.74 E.02159
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/82
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.64 I1.062 J.595 P1  F42000
G1 X85.311 Y91.73 Z3.64
G1 Z3.36
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F2826
M204 S6000
G3 X85.845 Y90.863 I1.321 J.215 E.02013
G3 X86.313 Y90.542 I.583 J.349 E.01129
G1 X86.382 Y90.128 E.0081
G3 X87.882 Y91.096 I-.626 J2.616 E.03506
G2 X88.619 Y91.067 I.324 J-1.138 E.01445
G3 X90.196 Y90.208 I1.785 J1.402 E.03558
G1 X90.196 Y93.65 E.06634
G3 X88.545 Y92.69 I-.02 J-1.865 E.03864
G2 X87.545 Y93.056 I-.249 J.87 E.02194
G3 X86.49 Y93.457 I-1.139 J-1.408 E.02213
G3 X85.048 Y92.61 I-.524 J-.759 E.04035
G3 X85.502 Y90.611 I1.459 J-.72 E.04273
G3 X86.324 Y90.117 I.799 J.397 E.01954
; WIPE_START
G1 F9000
G1 X86.611 Y90.173 E-.11093
G1 X87.172 Y90.422 E-.23354
G1 X87.548 Y90.689 E-.17492
G1 X87.882 Y91.096 E-.20008
G1 X87.987 Y91.113 E-.04053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.76 I1.103 J-.514 P1  F42000
G1 X86.087 Y87.038 Z3.76
G1 Z3.36
G1 E.8 F1800
G1 F2826
M204 S6000
G2 X86.783 Y86.981 I.034 J-3.838 E.01348
G1 X86.819 Y86.562 E.0081
G3 X87.683 Y88.302 I.101 J1.035 E.04835
G3 X86.149 Y88.589 I-1.079 J-1.522 E.03105
G3 X85.092 Y87.292 I-.023 J-1.06 E.03714
G3 X86.332 Y86.623 I1.069 J.497 E.02912
G3 X86.755 Y86.559 I.584 J2.408 E.00825
; WIPE_START
G1 F9000
M73 P53 R9
G1 X87.29 Y86.646 E-.20619
G1 X87.498 Y86.759 E-.08978
G1 X87.696 Y86.895 E-.09106
G1 X87.926 Y87.228 E-.15415
G1 X87.996 Y87.596 E-.14201
G1 X87.955 Y87.793 E-.07681
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.76 I-.284 J1.183 P1  F42000
G1 X89.248 Y88.104 Z3.76
G1 Z3.36
G1 E.8 F1800
G1 F2826
M204 S6000
G3 X89.57 Y87.463 I.552 J-.124 E.01498
M73 P53 R8
G1 X89.776 Y87.14 E.00738
G1 X90.196 Y86.018 E.0231
G1 X90.196 Y89.545 E.06798
G3 X88.793 Y87.911 I.662 J-1.988 E.04358
G3 X89.255 Y87.176 I.91 J.059 E.01744
G3 X90.077 Y86.029 I4.391 J2.28 E.02729
G1 X90.196 Y85.959 E.00266
; WIPE_START
G1 F9000
G1 X90.196 Y87.959 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.76 I.99 J.708 P1  F42000
G1 X91.912 Y85.559 Z3.76
G1 Z3.36
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X90.603 Y86.868 E.03569
G1 X90.603 Y88.133 E.02438
G1 X92.571 Y86.165 E.05364
G2 X93.214 Y86.773 I2.151 J-1.631 E.01715
G1 X90.603 Y89.397 E.07136
G1 X90.603 Y89.651 E.00489
G2 X91.524 Y89.571 I.026 J-5.057 E.01786
G3 X92.022 Y89.243 I2.383 J3.068 E.0115
G1 X95.397 Y85.868 E.09201
G3 X96.308 Y86.221 I-.193 J1.846 E.01906
G1 X93.307 Y89.223 E.08182
G2 X93.998 Y89.796 I3.527 J-3.545 E.01733
G1 X94.097 Y89.697 E.00272
G1 X94.097 Y89.059 E.01229
G1 X94.559 Y88.597 E.01259
G1 X95.197 Y88.597 E.01229
G1 X96.976 Y86.818 E.04849
G1 X97.161 Y86.94 E.00427
G2 X97.995 Y86.892 I.344 J-1.297 E.01638
G2 X98.293 Y86.169 I-1.419 J-1.007 E.01519
G3 X98.491 Y85.711 I.32 J-.134 E.01074
G3 X98.852 Y86.206 I-.235 J.552 E.01241
G1 X96.461 Y88.597 E.06518
G1 X97.726 Y88.597 E.02438
G1 X99.423 Y86.901 E.04625
G3 X100.165 Y87.115 I.058 J1.19 E.01517
G3 X100.153 Y87.435 I-2.508 J.067 E.00617
G1 X98.813 Y88.775 E.03652
M106 S201.45
M106 S255
M204 S10000
G1 X98.476 Y89.424 F42000
; FEATURE: Support
G1 F2826
M204 S6000
G1 X99.717 Y89.424 E.02392
G1 X100.206 Y89.062 E.01174
G3 X96.966 Y90.53 I-1.982 J-.064 E.08508
G3 X96.455 Y89.582 I3.953 J-2.742 E.0208
G1 X95.905 Y89.395 E.01119
G2 X95.583 Y89.64 I-.037 J.286 E.00864
G3 X94.504 Y89.95 I-.744 J-.558 E.02323
G1 X94.504 Y89.228 E.01392
G1 X94.728 Y89.004 E.00609
G1 X100.219 Y89.004 E.10584
; WIPE_START
G1 F9000
G1 X100.108 Y89.595 E-.22844
G1 X99.891 Y90.055 E-.19316
G1 X99.61 Y90.434 E-.17952
G1 X99.273 Y90.683 E-.15888
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.76 I-1.204 J.176 P1  F42000
G1 X99.617 Y93.03 Z3.76
G1 Z3.36
G1 E.8 F1800
; FEATURE: Support interface
G1 F2826
M204 S6000
G1 X99.029 Y93.617 E.01601
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z3.76 I-.223 J-1.196 P1  F42000
G1 X97.476 Y93.906 Z3.76
G1 Z3.36
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.246 Y93.135 E.021
G2 X97.714 Y92.721 I-.811 J.493 E.0133
G1 X97.535 Y92.582 E.00436
G1 X97.003 Y93.114 E.0145
M106 S201.45
M106 S255
; WIPE_START
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z3.76 I-.552 J-1.084 P1  F42000
G1 X94.425 Y94.428 Z3.76
G1 Z3.36
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X94.793 Y94.059 E.01004
G2 X94.825 Y93.428 I-1.027 J-.369 E.01237
G3 X95.336 Y92.593 I4.596 J2.239 E.0189
G2 X95.396 Y92.192 I-.512 J-.281 E.00797
G1 X93.915 Y93.673 E.04036
G2 X93.302 Y93.95 I-.218 J.334 E.01544
G3 X92.688 Y94.264 I-.596 J-.408 E.01386
G3 X92.741 Y93.717 I.332 J-.244 E.0116
G3 X93.096 Y93.349 I1.128 J.732 E.00992
G1 X93.102 Y93.222 E.00245
G1 X93.838 Y92.485 E.02008
M106 S201.45
M106 S255
; WIPE_START
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z3.76 I-.305 J-1.178 P1  F42000
G1 X90.425 Y93.369 Z3.76
G1 Z3.36
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.063 Y91.731 E.04463
G3 X92.357 Y91.082 I2.235 J.623 E.01381
G2 X92.071 Y90.868 I-.202 J-.028 E.0084
G1 X91.747 Y90.782 E.00646
G1 X90.603 Y91.927 E.03119
G1 X90.603 Y90.662 E.02438
G1 X91.074 Y90.191 E.01284
M106 S201.45
; WIPE_START
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z3.76 I.887 J-.833 P1  F42000
G1 X82.401 Y80.959 Z3.76
G1 Z3.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2826
M204 S6000
G1 X80.599 Y80.959 E.03737
G1 X80.599 Y80.599 E.00745
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y80.899 E.00621
M204 S250
G1 X82.8 Y81.358 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.358 E.04757
G1 X80.2 Y80.2 E.02119
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.298 E.02009
; WIPE_START
M204 S6000
G1 X80.801 Y81.344 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.478 Y88.946 Z3.76 F42000
G1 X81.977 Y94.534 Z3.76
G1 Z3.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2826
M204 S6000
G1 X81.023 Y94.534 E.01977
G1 X81.023 Y85.466 E.18811
G1 X81.977 Y85.466 E.01977
G1 X81.977 Y94.474 E.18686
M204 S10000
G1 X82.401 Y94.959 F42000
G1 F2826
M204 S6000
G1 X80.599 Y94.959 E.03737
G1 X80.599 Y85.041 E.20571
G1 X82.401 Y85.041 E.03737
G1 X82.401 Y94.899 E.20446
M204 S250
G1 X82.8 Y95.358 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.358 E.04757
G1 X80.2 Y84.642 E.19607
G1 X82.8 Y84.642 E.04757
G1 X82.8 Y95.298 E.19497
; WIPE_START
M204 S6000
G1 X80.801 Y95.344 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.76 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.76
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.76 F4000
            G39.3 S1
            G0 Z3.76 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y94.322 F42000
G1 Z3.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2826
M204 S6000
G1 X81.5 Y85.678 E.22349
; WIPE_START
G1 F15000
G1 X81.5 Y87.678 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.085 Y95.288 Z3.76 F42000
G1 X82.401 Y99.401 Z3.76
G1 Z3.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2826
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y99.041 E.00745
G1 X82.401 Y99.041 E.03737
G1 X82.401 Y99.341 E.00621
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.642 E.02119
G1 X82.8 Y98.642 E.04757
G1 X82.8 Y99.74 E.02009
; CHANGE_LAYER
; Z_HEIGHT: 3.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/82
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.76 I1.055 J.606 P1  F42000
G1 X85.412 Y91.761 Z3.76
G1 Z3.48
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F3609
M204 S6000
G3 X85.779 Y91.041 I.995 J.054 E.01605
G3 X86.305 Y90.501 I.562 J.022 E.01592
G1 X86.374 Y90.086 E.0081
G1 X86.447 Y90.1 E.00144
G3 X87.072 Y90.492 I-.202 J1.016 E.01454
G3 X87.936 Y91.475 I-.638 J1.431 E.02601
G2 X88.647 Y91.239 I-.416 J-2.446 E.0145
G3 X90.196 Y90.329 I1.618 J.981 E.03608
G1 X90.196 Y93.54 E.0619
G3 X88.828 Y92.937 I-.054 J-1.73 E.0298
G3 X88.412 Y92.592 I.321 J-.811 E.01059
G1 X87.771 Y92.662 E.01241
G3 X86.649 Y93.356 I-1.377 J-.972 E.02613
G3 X85.066 Y92.368 I-.691 J-.655 E.0503
G3 X85.402 Y90.756 I1.814 J-.463 E.03286
G3 X86.316 Y90.075 I.924 J.286 E.02348
; WIPE_START
G1 F9000
G1 X86.447 Y90.1 E-.05086
G1 X86.877 Y90.283 E-.17744
G1 X87.072 Y90.492 E-.10885
G1 X87.461 Y90.717 E-.17077
G1 X87.745 Y91.053 E-.16712
G1 X87.837 Y91.257 E-.08495
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.88 I1.048 J-.619 P1  F42000
G1 X85.509 Y87.315 Z3.88
G1 Z3.48
G1 E.8 F1800
G1 F3609
M204 S6000
G3 X86.092 Y87.035 I.604 J.511 E.01283
G1 X86.166 Y86.621 E.00811
G3 X87.478 Y86.939 I.025 J2.757 E.02629
G3 X86.857 Y88.521 I-.624 J.667 E.04203
G3 X85.728 Y88.51 I-.517 J-5.111 E.02181
G3 X85.725 Y86.669 I.24 J-.921 E.04821
G1 X86.079 Y86.611 E.00692
; WIPE_START
G1 F9000
G1 X87.085 Y86.732 E-.38506
G1 X87.478 Y86.939 E-.16881
G1 X87.72 Y87.247 E-.14873
G1 X87.753 Y87.395 E-.05741
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.88 I-.553 J1.084 P1  F42000
G1 X89.224 Y88.145 Z3.88
G1 Z3.48
G1 E.8 F1800
G1 F3609
M204 S6000
G3 X89.419 Y87.514 I.478 J-.198 E.01381
G1 X89.775 Y87.288 E.00813
G1 X90.196 Y86.224 E.02205
G1 X90.196 Y89.48 E.06277
G3 X88.777 Y88.172 I.946 J-2.45 E.03809
M73 P54 R8
G3 X89.236 Y87.133 I.811 J-.263 E.02396
G2 X89.892 Y86.47 I-.332 J-.985 E.01865
G3 X90.196 Y86.165 I.766 J.46 E.00838
; WIPE_START
G1 F9000
G1 X90.196 Y88.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.88 I-1.186 J.273 P1  F42000
G1 X90.425 Y89.161 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Support interface
G1 F3609
M204 S6000
G1 X90.994 Y89.73 E.01551
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z3.88 I-1.2 J.2 P1  F42000
G1 X91.751 Y94.28 Z3.88
G1 Z3.48
G1 E.8 F1800
G1 F3609
M204 S6000
G1 X91.497 Y94.026 E.00693
G1 X91.497 Y93.024 E.01933
G3 X90.902 Y93.431 I-1.085 J-.946 E.01405
G1 X90.603 Y93.132 E.00815
G1 X90.603 Y91.867 E.02438
G1 X93.016 Y94.28 E.06578
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z3.88 I.822 J.897 P1  F42000
G1 X98.315 Y89.424 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Support
G1 F3609
M204 S6000
G1 X99.548 Y89.424 E.02377
G1 X100.038 Y89.062 E.01174
G3 X98.669 Y90.839 I-1.983 J-.111 E.04595
G3 X97.804 Y90.906 I-.519 J-1.082 E.01712
G3 X96.73 Y89.919 I-.115 J-.953 E.03195
G1 X96.592 Y89.521 E.0081
G2 X96.168 Y89.284 I-.667 J.694 E.00947
G1 X95.659 Y89.55 E.01106
G3 X94.504 Y89.983 I-.79 J-.351 E.02648
G1 X94.504 Y89.228 E.01456
G1 X94.728 Y89.004 E.00609
G1 X100.051 Y89.004 E.10261
; WIPE_START
G1 F9000
G1 X99.93 Y89.615 E-.23664
G1 X99.669 Y90.125 E-.21766
G1 X99.158 Y90.599 E-.26473
G1 X99.062 Y90.646 E-.04096
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.88 I1.179 J.301 P1  F42000
G1 X100.18 Y86.269 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Support interface
G1 F3609
M204 S6000
G1 X99.808 Y85.897 E.01015
G1 X98.543 Y85.897 E.02438
G1 X100.003 Y87.357 E.03979
G1 X100.003 Y87.703 E.00668
G1 X99.741 Y87.703 E.00505
G3 X100.067 Y88.597 I-2.202 J1.308 E.01845
G1 X99.979 Y88.597 E.00169
G1 X97.279 Y85.897 E.07361
G1 X96.014 Y85.897 E.02438
G1 X98.714 Y88.597 E.07361
G1 X97.45 Y88.597 E.02438
G1 X94.75 Y85.897 E.07361
G1 X93.485 Y85.897 E.02438
G1 X96.185 Y88.597 E.07361
G1 X94.92 Y88.597 E.02438
G1 X92.22 Y85.897 E.07361
G3 X91.405 Y85.789 I.033 J-3.389 E.0159
G2 X90.891 Y85.833 I-.17 J1.042 E.01003
G1 X94.107 Y89.049 E.08767
G1 X94.097 Y89.768 E.01386
G3 X93.203 Y89.002 I.854 J-1.902 E.023
G1 X93.203 Y89.409 E.00784
G1 X90.603 Y86.809 E.07088
G1 X90.603 Y88.074 E.02438
G1 X93.203 Y90.674 E.07088
G1 X93.203 Y91.938 E.02438
G1 X91.497 Y90.232 E.0465
G1 X91.497 Y90.823 E.01139
G2 X90.603 Y90.343 I-1.282 J1.313 E.01983
G1 X90.603 Y90.603 E.00502
G1 X94.103 Y94.103 E.09541
G1 X95.368 Y94.103 E.02438
G1 X93.562 Y92.297 E.04923
G1 X94.826 Y92.297 E.02438
G1 X96.632 Y94.103 E.04923
G1 X97.897 Y94.103 E.02438
G1 X96.091 Y92.297 E.04923
G1 X97.356 Y92.297 E.02438
G1 X99.162 Y94.103 E.04923
G1 X100.003 Y94.103 E.01622
G1 X100.003 Y93.68 E.00816
G1 X98.62 Y92.297 E.03769
G1 X99.885 Y92.297 E.02438
G1 X100.18 Y92.593 E.00806
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z3.88 I.669 J-1.017 P1  F42000
G1 X82.401 Y80.89 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3609
M204 S6000
G1 X80.599 Y80.89 E.03737
G1 X80.599 Y80.599 E.00604
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y80.83 E.00479
M204 S250
G1 X82.8 Y81.29 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.29 E.04757
G1 X80.2 Y80.2 E.01994
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.23 E.01884
; WIPE_START
M204 S6000
G1 X80.801 Y81.276 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.478 Y88.878 Z3.88 F42000
G1 X81.977 Y94.466 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3609
M204 S6000
G1 X81.023 Y94.466 E.01977
G1 X81.023 Y85.534 E.18527
G1 X81.977 Y85.534 E.01977
G1 X81.977 Y94.406 E.18403
M204 S10000
G1 X82.401 Y94.89 F42000
G1 F3609
M204 S6000
G1 X80.599 Y94.89 E.03737
G1 X80.599 Y85.11 E.20287
G1 X82.401 Y85.11 E.03737
G1 X82.401 Y94.83 E.20163
M204 S250
G1 X82.8 Y95.29 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.29 E.04757
G1 X80.2 Y84.71 E.19357
G1 X82.8 Y84.71 E.04757
G1 X82.8 Y95.23 E.19248
; WIPE_START
M204 S6000
G1 X80.801 Y95.276 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.88
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.88 F4000
            G39.3 S1
            G0 Z3.88 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y94.254 F42000
G1 Z3.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F3609
M204 S6000
G1 X81.5 Y85.746 E.21996
; WIPE_START
G1 F15000
G1 X81.5 Y87.746 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.088 Y95.356 Z3.88 F42000
G1 X82.401 Y99.401 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3609
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y99.11 E.00604
G1 X82.401 Y99.11 E.03737
G1 X82.401 Y99.341 E.00479
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.71 E.01994
G1 X82.8 Y98.71 E.04757
G1 X82.8 Y99.74 E.01884
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/82
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.88 I1.049 J.618 P1  F42000
G1 X85.512 Y91.786 Z3.88
G1 Z3.6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F3577
M204 S6000
G3 X85.742 Y91.199 I1.227 J.142 E.01229
G3 X86.296 Y90.461 I.683 J-.064 E.01949
G1 X86.365 Y90.047 E.0081
G3 X87.181 Y90.673 I-.076 J.944 E.02097
G3 X87.887 Y91.566 I-.958 J1.481 E.02233
G1 X88.519 Y91.509 E.01225
G2 X89.157 Y90.81 I-23.439 J-22.035 E.01823
G3 X90.196 Y90.46 I1.059 J1.428 E.02148
G1 X90.196 Y93.403 E.05671
G3 X89.08 Y93.039 I-.114 J-1.546 E.0232
G3 X88.333 Y92.415 I.134 J-.919 E.01976
G1 X87.693 Y92.605 E.01286
G3 X86.77 Y93.246 I-1.403 J-1.034 E.02206
G3 X85.056 Y92.416 I-.818 J-.496 E.05446
G2 X85.079 Y91.877 I-.478 J-.291 E.01084
G3 X85.341 Y91.055 I1.652 J.073 E.01682
G3 X86.307 Y90.036 I1.011 J-.009 E.02993
; WIPE_START
G1 F9000
G1 X86.596 Y90.091 E-.11191
G1 X86.863 Y90.24 E-.11616
G1 X87.083 Y90.475 E-.12229
G1 X87.181 Y90.673 E-.0842
G1 X87.64 Y91.079 E-.23273
G1 X87.75 Y91.297 E-.09272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.057 J-.603 P1  F42000
G1 X85.469 Y87.3 Z4
G1 Z3.6
G1 E.8 F1800
G1 F3577
M204 S6000
G3 X86.026 Y87.043 I.583 J.53 E.01214
G1 X86.107 Y86.629 E.00812
G3 X87.34 Y87.086 I-.26 J2.596 E.02563
G3 X87.05 Y88.316 I-.525 J.526 E.02915
G3 X86.64 Y88.426 I-.414 J-.729 E.00827
G3 X84.947 Y87.573 I-.556 J-1.002 E.04302
G3 X86.015 Y86.619 I1.05 J.1 E.03034
; WIPE_START
G1 F9000
G1 X86.377 Y86.659 E-.13859
G1 X86.895 Y86.833 E-.20778
G1 X87.34 Y87.086 E-.1944
G1 X87.502 Y87.281 E-.09639
G1 X87.579 Y87.595 E-.12284
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I-.115 J1.211 P1  F42000
G1 X89.129 Y87.743 Z4
G1 Z3.6
G1 E.8 F1800
G1 F3577
M204 S6000
G3 X89.68 Y87.437 I.422 J.111 E.01357
G1 X89.776 Y87.366 E.0023
G1 X90.196 Y86.483 E.01885
G1 X90.196 Y89.385 E.05594
G3 X88.922 Y88.567 I2.78 J-5.729 E.02925
G3 X88.88 Y87.298 I.96 J-.667 E.02587
G3 X89.539 Y87.018 I.664 J.649 E.01416
G1 X89.963 Y86.704 E.01018
G3 X90.196 Y86.424 I.763 J.395 E.00707
; WIPE_START
G1 F9000
G1 X90.196 Y88.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.055 J.607 P1  F42000
G1 X91.751 Y85.72 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Support interface
G1 F3577
M204 S6000
G1 X90.603 Y86.868 E.03131
G1 X90.603 Y88.133 E.02438
G1 X92.838 Y85.897 E.06095
G1 X94.103 Y85.897 E.02438
G1 X90.603 Y89.397 E.09542
G1 X90.603 Y89.489 E.00177
G2 X91.497 Y89.257 I.099 J-1.457 E.01812
G1 X91.497 Y89.768 E.00984
G1 X95.368 Y85.897 E.10552
G1 X96.632 Y85.897 E.02438
G1 X90.425 Y92.104 E.1692
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
G1 X90.425 Y90.839 Z4
G1 Z3.6
G1 E.8 F1800
G1 F3577
M204 S6000
G1 X90.886 Y90.379 E.01255
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z4 I-.017 J1.217 P1  F42000
G1 X93.38 Y90.413 Z4
G1 Z3.6
G1 E.8 F1800
G1 F3577
M204 S6000
G1 X90.603 Y93.191 E.07572
G1 X90.603 Y93.386 E.00375
G2 X91.497 Y92.849 I-.41 J-1.696 E.02042
G1 X91.497 Y93.562 E.01374
G1 X93.203 Y91.856 E.04651
G1 X93.203 Y92.297 E.00851
G1 X94.026 Y92.297 E.01587
G1 X92.22 Y94.103 E.04924
G1 X93.485 Y94.103 E.02438
G1 X95.291 Y92.297 E.04924
G1 X96.556 Y92.297 E.02438
G1 X94.749 Y94.103 E.04924
G1 X96.014 Y94.103 E.02438
G1 X97.82 Y92.297 E.04924
G1 X99.085 Y92.297 E.02438
G1 X97.279 Y94.103 E.04924
G1 X98.543 Y94.103 E.02438
G1 X100.003 Y92.643 E.03979
G1 X100.003 Y93.908 E.02438
G1 X99.631 Y94.28 E.01015
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z4 I1.156 J-.38 P1  F42000
G1 X98.036 Y89.424 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Support
G1 F3577
M204 S6000
G1 X99.354 Y89.424 E.0254
G1 X99.845 Y89.061 E.01178
G3 X99.099 Y90.431 I-1.767 J-.075 E.03113
G3 X97.792 Y90.919 I-.911 J-.446 E.02965
G3 X96.776 Y89.608 I-.171 J-.917 E.03938
G2 X96.514 Y89.071 I-.43 J-.123 E.01261
G1 X95.595 Y89.004 E.01777
G1 X95.901 Y89.457 E.01053
G2 X95.392 Y89.933 I.762 J1.324 E.01356
G3 X94.504 Y90.016 I-.512 J-.687 E.01807
G1 X94.504 Y89.228 E.0152
G1 X94.728 Y89.004 E.00609
G1 X99.861 Y89.004 E.09896
; WIPE_START
G1 F9000
G1 X99.783 Y89.473 E-.1806
G1 X99.615 Y89.88 E-.16731
G1 X99.514 Y90.046 E-.07385
G1 X99.099 Y90.431 E-.21504
G1 X98.951 Y90.68 E-.11026
G1 X98.925 Y90.702 E-.01293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.215 J-.07 P1  F42000
G1 X98.813 Y88.775 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Support interface
G1 F3577
M204 S6000
G1 X100.003 Y87.585 E.03244
G1 X100.003 Y86.32 E.02438
G1 X97.726 Y88.597 E.06207
G1 X96.461 Y88.597 E.02438
G1 X99.162 Y85.897 E.07361
G1 X97.897 Y85.897 E.02438
G1 X95.197 Y88.597 E.07361
G1 X94.559 Y88.597 E.01229
G1 X94.097 Y89.059 E.01259
M73 P55 R8
G1 X94.097 Y89.697 E.01229
G1 X93.965 Y89.829 E.00362
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z4 I.742 J-.964 P1  F42000
G1 X82.8 Y81.233 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.233 E.04757
G1 X80.2 Y80.2 E.01891
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.173 E.01781
; WIPE_START
M204 S6000
G1 X80.801 Y81.22 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4 F4000
            G39.3 S1
            G0 Z4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.4 Y80.717 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.659882
G1 F3577
M204 S6000
G1 X82.6 Y80.717 E.06823
; WIPE_START
G1 F15000
G1 X80.6 Y80.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.364 Y88.311 Z4 F42000
G1 X81.977 Y94.41 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3577
M204 S6000
G1 X81.023 Y94.41 E.01977
G1 X81.023 Y85.59 E.18294
G1 X81.977 Y85.59 E.01977
G1 X81.977 Y94.35 E.1817
M204 S10000
G1 X82.401 Y94.834 F42000
G1 F3577
M204 S6000
G1 X80.599 Y94.834 E.03737
G1 X80.599 Y85.166 E.20054
G1 X82.401 Y85.166 E.03737
G1 X82.401 Y94.774 E.1993
M204 S250
G1 X82.8 Y95.233 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.233 E.04757
G1 X80.2 Y84.767 E.19152
G1 X82.8 Y84.767 E.04757
G1 X82.8 Y95.173 E.19042
; WIPE_START
M204 S6000
G1 X80.801 Y95.22 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.198 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F3577
M204 S6000
G1 X81.5 Y85.802 E.21706
; WIPE_START
G1 F15000
G1 X81.5 Y87.802 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.322 Y95.39 Z4 F42000
G1 X82.8 Y99.8 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.767 E.01891
G1 X82.8 Y98.767 E.04757
G1 X82.8 Y99.74 E.01781
M204 S10000
G1 X82.6 Y99.283 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.659882
G1 F3577
M204 S6000
G1 X80.4 Y99.283 E.06823
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.283 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/82
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4 I1.127 J.46 P1  F42000
G1 X85.772 Y91.022 Z4
G1 Z3.72
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F2185
M204 S6000
G3 X86.336 Y90.428 I.568 J-.025 E.01761
G1 X86.351 Y90.009 E.0081
G3 X87.237 Y90.848 I-.125 J1.019 E.02519
G3 X86.839 Y93.108 I-.796 J1.025 E.05425
G3 X85.046 Y92.471 I-.901 J-.306 E.05811
G2 X85.215 Y91.597 I-1.664 J-.774 E.01734
G2 X85.345 Y90.984 I-.718 J-.473 E.01237
G3 X86.293 Y89.999 I.985 J-.001 E.02911
; WIPE_START
G1 F9000
G1 X86.585 Y90.054 E-.11299
G1 X86.849 Y90.2 E-.11468
G1 X87.067 Y90.43 E-.12031
G1 X87.237 Y90.848 E-.17157
G1 X87.499 Y91.106 E-.13994
G1 X87.622 Y91.34 E-.10051
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.12 I1.071 J-.578 P1  F42000
G1 X85.432 Y87.287 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F2185
M204 S6000
G3 X85.961 Y87.05 I.85 J1.184 E.01125
G1 X86.01 Y86.633 E.0081
G1 X86.049 Y86.637 E.00075
G3 X86.851 Y86.981 I-.071 J1.275 E.01717
G3 X86.803 Y88.253 I-.187 J.63 E.03345
G3 X84.902 Y87.569 I-.77 J-.843 E.04779
G3 X85.951 Y86.626 I1.03 J.091 E.02991
; WIPE_START
G1 F9000
G1 X86.049 Y86.637 E-.03733
G1 X86.308 Y86.667 E-.09904
G1 X86.637 Y86.803 E-.13566
G1 X86.851 Y86.981 E-.10546
G1 X87.005 Y87.049 E-.06394
G1 X87.263 Y87.31 E-.13957
G1 X87.345 Y87.601 E-.11483
G1 X87.303 Y87.764 E-.06416
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.12 I-1.048 J.618 P1  F42000
G1 X89.407 Y91.333 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F2185
M204 S6000
G3 X90.396 Y91.019 I.867 J1.016 E.02054
G1 X90.502 Y90.613 E.0081
G3 X91.29 Y91.069 I-.262 J1.362 E.01789
G1 X91.29 Y92.783 E.03304
G3 X89.321 Y93.06 I-1.159 J-1.101 E.04136
G3 X88.968 Y91.186 I-.107 J-.95 E.0552
G3 X90.444 Y90.599 I1.314 J1.155 E.03179
; WIPE_START
G1 F9000
G1 X90.815 Y90.702 E-.14615
G1 X91.101 Y90.875 E-.1271
G1 X91.29 Y91.069 E-.10302
G1 X91.29 Y92.079 E-.38372
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.12 I1.177 J-.311 P1  F42000
G1 X90.022 Y87.285 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F2185
M204 S6000
G1 X90.425 Y87.126 E.00834
G3 X90.87 Y86.722 I.99 J.644 E.01172
G1 X91.14 Y86.224 E.01092
G1 X91.29 Y86.225 E.0029
G1 X91.29 Y89.239 E.05811
G3 X90.092 Y89.218 I-.579 J-1.177 E.02398
G3 X89.534 Y88.946 I.283 J-1.288 E.01208
G3 X88.754 Y88.27 I.091 J-.893 E.0212
G3 X89.669 Y86.973 I.753 J-.44 E.03845
G1 X90.154 Y86.781 E.01004
G3 X91.081 Y86.224 I1.177 J.908 E.02134
; WIPE_START
G1 F9000
G1 X91.29 Y86.225 E-.07954
G1 X91.29 Y88.015 E-.68046
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.12 I-.102 J1.213 P1  F42000
G1 X95.044 Y88.33 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F2185
M204 S6000
G1 X95.844 Y88.33 E.01542
G1 X96.508 Y87.968 E.01457
G3 X96.042 Y88.724 I-1.408 J-.346 E.0174
G2 X95.743 Y89.489 I.911 J.798 E.01614
G3 X94.026 Y89.577 I-.875 J-.276 E.04291
G3 X93.586 Y87.91 I.545 J-1.036 E.03737
G1 X96.518 Y87.91 E.05651
; WIPE_START
G1 F9000
G1 X96.292 Y88.465 E-.22759
G1 X96.042 Y88.724 E-.13689
G1 X95.802 Y89.147 E-.18457
G1 X95.743 Y89.489 E-.13195
G1 X95.649 Y89.674 E-.079
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.12 I.566 J1.077 P1  F42000
G1 X98.207 Y88.33 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F2185
M204 S6000
G1 X99.092 Y88.33 E.01706
G1 X99.347 Y87.953 E.00876
G3 X99.618 Y89.144 I-1.296 J.922 E.02416
G3 X99.214 Y90.1 I-1.582 J-.105 E.02039
G3 X97.747 Y90.922 I-.998 J-.061 E.0385
G3 X96.902 Y89.376 I-.181 J-.905 E.04511
G3 X97.392 Y87.91 I2.65 J.071 E.03023
G1 X99.306 Y87.91 E.03691
; WIPE_START
G1 F9000
G1 X99.574 Y88.386 E-.20754
G1 X99.626 Y88.62 E-.09119
G1 X99.618 Y89.144 E-.19901
G1 X99.529 Y89.623 E-.18508
G1 X99.417 Y89.792 E-.07718
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.12 I.56 J-1.081 P1  F42000
G1 X82.8 Y81.188 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2185
M204 S1000
G1 X80.2 Y81.188 E.04757
G1 X80.2 Y80.2 E.01808
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.128 E.01698
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y81.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.12
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.12 F4000
            G39.3 S1
            G0 Z4.12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.4 Y80.694 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.614622
G1 F2185
M204 S6000
G1 X82.6 Y80.694 E.06336
; WIPE_START
G1 F15000
G1 X80.6 Y80.694 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.365 Y88.288 Z4.12 F42000
G1 X81.977 Y94.365 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2185
M204 S6000
G1 X81.023 Y94.365 E.01977
G1 X81.023 Y85.635 E.18107
G1 X81.977 Y85.635 E.01977
G1 X81.977 Y94.305 E.17982
M204 S10000
G1 X82.401 Y94.789 F42000
G1 F2185
M204 S6000
G1 X80.599 Y94.789 E.03737
G1 X80.599 Y85.211 E.19867
G1 X82.401 Y85.211 E.03737
G1 X82.401 Y94.729 E.19742
M204 S250
G1 X82.8 Y95.188 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2185
M204 S1000
G1 X80.2 Y95.188 E.04757
G1 X80.2 Y84.812 E.18986
G1 X82.8 Y84.812 E.04757
G1 X82.8 Y95.128 E.18876
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y95.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.153 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2185
M204 S6000
G1 X81.5 Y85.847 E.21472
; WIPE_START
G1 F15000
G1 X81.5 Y87.847 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.325 Y95.435 Z4.12 F42000
G1 X82.8 Y99.8 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2185
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.812 E.01808
G1 X82.8 Y98.812 E.04757
G1 X82.8 Y99.74 E.01698
M204 S10000
G1 X82.6 Y99.306 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.614622
G1 F2185
M204 S6000
G1 X80.4 Y99.306 E.06336
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.306 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/82
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.12 I1.123 J.469 P1  F42000
G1 X85.796 Y91.164 Z4.12
G1 Z3.84
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F2023
M204 S6000
G1 X85.795 Y91.162 E.00003
G3 X86.26 Y90.371 I.61 J-.174 E.01978
G1 X86.256 Y89.951 E.0081
G3 X87.05 Y90.388 I.052 J.845 E.01843
G3 X87.259 Y91.037 I-.989 J.676 E.01334
G3 X87.055 Y92.854 I-.835 J.826 E.04038
G3 X86.479 Y93.618 I-5.117 J-3.259 E.01845
G3 X85.038 Y92.526 I-.555 J-.764 E.04646
G3 X85.348 Y91.975 I1.122 J.268 E.01235
G3 X85.439 Y91.398 I1.455 J-.067 E.01133
G3 X86.197 Y89.95 I.942 J-.43 E.03633
; WIPE_START
G1 F9000
G1 X86.49 Y89.954 E-.1111
G1 X86.746 Y90.053 E-.10436
G1 X87.05 Y90.388 E-.17191
G1 X87.196 Y90.679 E-.12374
G1 X87.259 Y91.037 E-.13825
G1 X87.417 Y91.282 E-.11064
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.24 I1.086 J-.549 P1  F42000
G1 X85.395 Y87.281 Z4.24
G1 Z3.84
G1 E.8 F1800
G1 F2023
M204 S6000
G3 X85.899 Y87.056 I.82 J1.166 E.0107
G1 X85.948 Y86.639 E.0081
M73 P56 R8
G1 X85.992 Y86.645 E.00085
G3 X87.098 Y87.6 I-.034 J1.157 E.03048
G3 X84.86 Y87.564 I-1.116 J-.192 E.06185
G3 X85.89 Y86.632 I1.014 J.085 E.02947
; WIPE_START
G1 F9000
G1 X85.992 Y86.645 E-.0393
G1 X86.24 Y86.673 E-.09458
G1 X86.564 Y86.809 E-.13371
G1 X86.824 Y87.026 E-.12865
G1 X87.016 Y87.332 E-.13706
G1 X87.098 Y87.6 E-.10667
G1 X87.026 Y87.866 E-.10473
G1 X87.004 Y87.9 E-.01531
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.24 I-.967 J.739 P1  F42000
G1 X89.637 Y91.344 Z4.24
G1 Z3.84
G1 E.8 F1800
G1 F2023
M204 S6000
G3 X90.38 Y91.209 I.544 J.881 E.01492
G1 X90.423 Y90.791 E.0081
G3 X91.19 Y91.226 I-.223 J1.288 E.01735
G1 X91.19 Y92.646 E.02738
G3 X89.568 Y93.023 I-1.097 J-1.045 E.03398
G3 X88.363 Y91.535 I-.37 J-.932 E.04903
G3 X89.165 Y91.17 I.997 J1.129 E.01723
G3 X90.364 Y90.787 I1.05 J1.218 E.02493
; WIPE_START
G1 F9000
G1 X90.755 Y90.883 E-.15329
G1 X91.19 Y91.226 E-.21041
G1 X91.19 Y92.269 E-.3963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.24 I1.18 J-.298 P1  F42000
G1 X89.979 Y87.48 Z4.24
G1 Z3.84
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X90.051 Y87.501 E.00146
G1 X90.734 Y87.164 E.01468
G2 X91.19 Y86.526 I-1.376 J-1.464 E.01522
G1 X91.19 Y89.158 E.05074
G3 X89.763 Y88.969 I-.526 J-1.512 E.02878
G3 X88.735 Y88.286 I-.182 J-.841 E.02653
G3 X89.582 Y86.929 I.74 J-.481 E.0386
G1 X90.011 Y87.053 E.00862
G2 X90.831 Y86.56 I-1.73 J-3.805 E.01846
G3 X91.19 Y86.467 I.334 J.546 E.00726
M106 S201.45
; WIPE_START
G1 X91.19 Y88.467 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.24 I.013 J1.217 P1  F42000
G1 X94.703 Y88.43 Z4.24
G1 Z3.84
G1 E.8 F1800
G1 F2023
M204 S6000
G1 X95.459 Y88.43 E.01457
G1 X96.229 Y88.067 E.01642
G3 X95.838 Y88.634 I-1.259 J-.45 E.01343
G3 X95.608 Y89.798 I-2.621 J.087 E.02307
G3 X93.935 Y89.4 I-.745 J-.583 E.04162
G3 X93.644 Y88.01 I.634 J-.858 E.02996
G1 X96.244 Y88.01 E.05013
; WIPE_START
G1 F9000
G1 X96.093 Y88.343 E-.13912
G1 X95.838 Y88.634 E-.14689
G1 X95.745 Y89.529 E-.34177
G1 X95.608 Y89.798 E-.11485
G1 X95.576 Y89.831 E-.01737
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.24 I.613 J1.051 P1  F42000
G1 X97.978 Y88.43 Z4.24
G1 Z3.84
G1 E.8 F1800
G1 F2023
M204 S6000
G1 X98.813 Y88.43 E.0161
G1 X99.038 Y88.045 E.0086
G3 X99.348 Y89.027 I-.823 J.799 E.02057
G3 X99.245 Y89.625 I-1.137 J.112 E.01184
G3 X99.2 Y90.49 I-3.61 J.246 E.01675
G3 X97.768 Y90.908 I-.909 J-.454 E.03227
G3 X97.029 Y89.218 I-.244 J-.9 E.05116
G3 X97.373 Y88.469 I2.188 J.551 E.01598
G3 X97.717 Y88.01 I1.582 J.828 E.0111
G1 X98.991 Y88.01 E.02456
; WIPE_START
G1 F9000
G1 X99.272 Y88.36 E-.17052
G1 X99.367 Y88.67 E-.12321
G1 X99.348 Y89.027 E-.1358
G1 X99.366 Y89.292 E-.10105
G1 X99.245 Y89.625 E-.13444
G1 X99.232 Y89.874 E-.09498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.24 I.571 J-1.075 P1  F42000
G1 X82.8 Y81.153 Z4.24
G1 Z3.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2023
M204 S1000
G1 X80.2 Y81.153 E.04757
G1 X80.2 Y80.2 E.01743
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.093 E.01634
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y81.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.24 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.24
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.24 F4000
            G39.3 S1
            G0 Z4.24 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.4 Y80.676 F42000
G1 Z3.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.579292
G1 F2023
M204 S6000
G1 X82.6 Y80.676 E.05956
; WIPE_START
G1 F15000
G1 X80.6 Y80.676 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.366 Y88.27 Z4.24 F42000
G1 X81.977 Y94.329 Z4.24
G1 Z3.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2023
M204 S6000
G1 X81.023 Y94.329 E.01977
G1 X81.023 Y85.671 E.1796
G1 X81.977 Y85.671 E.01977
G1 X81.977 Y94.269 E.17836
M204 S10000
G1 X82.401 Y94.754 F42000
G1 F2023
M204 S6000
G1 X80.599 Y94.754 E.03737
G1 X80.599 Y85.246 E.1972
G1 X82.401 Y85.246 E.03737
G1 X82.401 Y94.694 E.19596
M204 S250
G1 X82.8 Y95.153 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2023
M204 S1000
G1 X80.2 Y95.153 E.04757
G1 X80.2 Y84.847 E.18857
G1 X82.8 Y84.847 E.04757
G1 X82.8 Y95.093 E.18747
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y95.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.117 Z4.24 F42000
G1 Z3.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2023
M204 S6000
G1 X81.5 Y85.883 E.21289
; WIPE_START
G1 F15000
G1 X81.5 Y87.883 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.328 Y95.47 Z4.24 F42000
G1 X82.8 Y99.8 Z4.24
G1 Z3.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2023
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.847 E.01743
G1 X82.8 Y98.847 E.04757
G1 X82.8 Y99.74 E.01634
M204 S10000
G1 X82.6 Y99.324 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.579292
G1 F2023
M204 S6000
G1 X80.4 Y99.324 E.05956
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.324 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/82
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
M106 S255
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.24 I1.125 J.465 P1  F42000
G1 X85.797 Y91.108 Z4.24
G1 Z3.96
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X86.299 Y90.313 I.529 J-.222 E.02124
G1 X86.305 Y89.893 E.0081
G3 X87.177 Y90.634 I.022 J.859 E.02414
G3 X87.202 Y91.239 I-1.005 J.345 E.01184
G3 X87.144 Y92.58 I-.722 J.64 E.0286
G1 X86.87 Y92.931 E.00858
G3 X85.187 Y93.497 I-.953 J-.047 E.04399
G3 X85.33 Y92.051 I1.019 J-.63 E.0301
G1 X85.529 Y91.553 E.01034
G3 X85.513 Y90.306 I1.028 J-.637 E.02526
G3 X86.239 Y89.892 I.991 J.894 E.01638
; WIPE_START
G1 X86.52 Y89.897 E-.10675
G1 X86.768 Y89.989 E-.10042
G1 X86.982 Y90.173 E-.10739
G1 X87.177 Y90.634 E-.19012
G1 X87.235 Y90.958 E-.12529
G1 X87.202 Y91.239 E-.10737
G1 X87.235 Y91.289 E-.02265
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.36 I1.081 J-.56 P1  F42000
G1 X85.26 Y87.476 Z4.36
G1 Z3.96
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.838 Y87.063 I.55 J.159 E.01478
G1 X85.889 Y86.646 E.0081
G1 X85.938 Y86.652 E.00095
G3 X86.751 Y88.153 I.052 J.943 E.0411
G3 X84.82 Y87.56 I-.829 J-.741 E.04884
G3 X85.83 Y86.639 I.998 J.079 E.02901
; WIPE_START
G1 X85.938 Y86.652 E-.04121
G1 X86.173 Y86.68 E-.08998
G1 X86.492 Y86.815 E-.13146
G1 X86.748 Y87.029 E-.1271
G1 X86.912 Y87.299 E-.11984
G1 X86.968 Y87.594 E-.11411
G1 X86.913 Y87.888 E-.11353
G1 X86.882 Y87.939 E-.02277
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.36 I-1.005 J.686 P1  F42000
G1 X89.398 Y91.629 Z4.36
G1 Z3.96
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X89.915 Y91.421 I-.186 J-1.211 E.01083
G2 X90.074 Y91.411 I.041 J-.619 E.00308
G1 X90.092 Y90.992 E.0081
G3 X91.09 Y91.481 I.135 J.987 E.02273
G1 X91.09 Y92.377 E.01727
G3 X90.205 Y92.915 I-1.017 J-.678 E.02061
G2 X89.44 Y93.131 I.249 J2.338 E.0154
G3 X88.313 Y92.596 I-.227 J-.977 E.02596
G3 X89.145 Y91.175 I.768 J-.504 E.03934
G2 X89.848 Y90.993 I.146 J-.883 E.01441
G1 X89.85 Y90.993 E.00005
G2 X90.033 Y90.989 I.085 J-.308 E.00358
; WIPE_START
G1 X90.465 Y91.008 E-.16442
G1 X90.728 Y91.106 E-.10657
G1 X90.948 Y91.277 E-.10584
G1 X91.09 Y91.481 E-.09451
G1 X91.09 Y92.241 E-.28866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.36 I1.181 J-.294 P1  F42000
G1 X89.913 Y87.505 Z4.36
G1 Z3.96
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X90.67 Y87.613 I.534 J-1.038 E.01502
G1 X91.09 Y86.944 E.01523
G1 X91.09 Y89.046 E.04051
G3 X90.265 Y89.029 I-.396 J-.842 E.01649
G2 X89.596 Y89.037 I-.326 J.736 E.01329
G1 X89.333 Y89 E.00511
G3 X88.72 Y88.305 I.314 J-.894 E.01866
G3 X89.859 Y86.98 I.705 J-.546 E.04707
G2 X90.655 Y87.192 I.629 J-.759 E.01637
M73 P57 R8
G3 X91.09 Y86.885 I.656 J.467 E.01047
M106 S198.9
M106 S255
; WIPE_START
G1 X91.09 Y88.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.36 I.118 J1.211 P1  F42000
G1 X94.72 Y88.53 Z4.36
G1 Z3.96
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X95.394 Y88.53 E.01298
G1 X95.858 Y88.16 E.01145
G1 X95.787 Y88.272 E.00256
G3 X95.61 Y89.834 I-2.295 J.53 E.03089
G3 X93.948 Y89.292 I-.736 J-.564 E.04401
G3 X93.723 Y88.11 I.618 J-.73 E.02508
G1 X95.89 Y88.11 E.04177
; WIPE_START
G1 X95.787 Y88.272 E-.07289
G1 X95.863 Y88.94 E-.25528
G1 X95.745 Y89.566 E-.24214
G1 X95.61 Y89.834 E-.11412
G1 X95.47 Y89.976 E-.07557
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.36 I.406 J1.147 P1  F42000
G1 X97.768 Y89.162 Z4.36
G1 Z3.96
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X98.349 Y88.59 I1.442 J.884 E.01588
G1 X98.421 Y88.175 E.00812
G3 X98.959 Y88.804 I-.123 J.649 E.01723
G3 X99.056 Y89.358 I-.768 J.421 E.01104
G3 X99.303 Y90.242 I-4.624 J1.768 E.01772
G3 X97.776 Y90.903 I-.965 J-.135 E.03843
G3 X97.267 Y89.1 I-.284 J-.893 E.05791
G3 X98.136 Y88.202 I2.718 J1.76 E.02425
G1 X98.364 Y88.161 E.00446
; WIPE_START
G1 X98.604 Y88.222 E-.09414
G1 X98.809 Y88.391 E-.10083
G1 X98.959 Y88.804 E-.16701
G1 X99.051 Y88.972 E-.07295
G1 X99.056 Y89.358 E-.14664
G1 X99.182 Y89.81 E-.17843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.36 I-.562 J-1.079 P1  F42000
G1 X92.099 Y93.501 Z4.36
G1 Z3.96
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
M204 S1000
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.501 E.01248
G1 X92.159 Y93.501 E.15021
M106 S198.9
M106 S255
M204 S250
G1 X91.7 Y93.9 F42000
G1 F600
M204 S1000
G1 X91.7 Y86.1 E.16179
G1 X99.8 Y86.1 E.16801
G1 X99.8 Y87.5 E.02904
G1 X93 Y87.5 E.14105
G1 X93 Y92.5 E.10371
G1 X99.8 Y92.5 E.14105
G1 X99.8 Y93.9 E.02904
G1 X91.76 Y93.9 E.16677
M106 S198.9
; WIPE_START
M204 S6000
G1 X91.745 Y91.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.36 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.36
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.36 F4000
            G39.3 S1
            G0 Z4.36 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X92.35 Y93.111 F42000
G1 Z3.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.122352
G1 F15000
M204 S6000
G1 X92.369 Y93.15 E.0002
; LINE_WIDTH: 0.160992
G1 X92.389 Y93.189 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y93.2 E.00014
G1 X99.189 Y93.2 E.05883
; WIPE_START
G1 X97.189 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.36 I1.162 J.363 P1  F42000
G1 X99.189 Y86.8 Z4.36
G1 Z3.96
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X92.4 Y86.8 E.05883
G1 X92.389 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y86.85 E.00029
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.00016
G1 X92.35 Y93.111 E.02355
; WIPE_START
G1 X92.35 Y91.111 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.36 I.879 J-.841 P1  F42000
G1 X82.8 Y81.127 Z4.36
G1 Z3.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.127 E.04757
G1 X80.2 Y80.2 E.01696
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.067 E.01586
M204 S10000
G1 X82.6 Y80.663 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.553212
G1 F15000
M204 S6000
G1 X80.4 Y80.663 E.05675
; WIPE_START
G1 X82.4 Y80.663 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.292 Z4.36 F42000
G1 X81.977 Y94.303 Z4.36
G1 Z3.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.023 Y94.303 E.01977
G1 X81.023 Y85.697 E.17852
G1 X81.977 Y85.697 E.01977
G1 X81.977 Y94.243 E.17727
M204 S10000
G1 X82.401 Y94.727 F42000
G1 F4800
M204 S6000
G1 X80.599 Y94.727 E.03737
G1 X80.599 Y85.273 E.19612
G1 X82.401 Y85.273 E.03737
G1 X82.401 Y94.667 E.19487
M204 S250
G1 X82.8 Y95.127 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.127 E.04757
G1 X80.2 Y84.873 E.18762
G1 X82.8 Y84.873 E.04757
G1 X82.8 Y95.067 E.18652
; WIPE_START
M204 S6000
G1 X80.801 Y95.113 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.091 Z4.36 F42000
G1 Z3.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y85.909 E.21155
; WIPE_START
G1 X81.5 Y87.909 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.329 Y95.496 Z4.36 F42000
G1 X82.8 Y99.8 Z4.36
G1 Z3.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.873 E.01696
G1 X82.8 Y98.873 E.04757
G1 X82.8 Y99.74 E.01586
M204 S10000
G1 X82.6 Y99.337 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.553222
G1 F15000
M204 S6000
G1 X80.4 Y99.337 E.05676
; CHANGE_LAYER
; Z_HEIGHT: 4.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.337 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/82
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
M106 S201.45
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.36 I1.134 J.442 P1  F42000
G1 X85.705 Y90.857 Z4.36
M73 P58 R8
G1 Z4.08
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F4710
M204 S6000
G3 X86.449 Y90.257 I.746 J.164 E.01991
G1 X86.568 Y89.854 E.0081
G3 X87.197 Y90.807 I-.225 J.832 E.02404
G3 X87.2 Y91.987 I-28.19 J.667 E.02276
G1 X87.152 Y92.195 E.00409
G1 X86.711 Y92.804 E.0145
G1 X86.897 Y92.823 E.0036
G3 X86.178 Y93.864 I-1.331 J-.15 E.0254
G3 X85.029 Y92.635 I-.249 J-.919 E.03977
G2 X85.553 Y91.55 I-9.148 J-5.094 E.02324
G3 X85.455 Y90.312 I.859 J-.691 E.02542
G3 X86.512 Y89.836 I1.088 J1.002 E.02295
; WIPE_START
G1 F9000
G1 X86.782 Y89.923 E-.10781
G1 X87 Y90.101 E-.107
G1 X87.152 Y90.365 E-.11597
G1 X87.197 Y90.807 E-.16859
G1 X87.198 Y91.493 E-.26063
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.48 I1.092 J-.538 P1  F42000
G1 X85.222 Y87.479 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F4710
M204 S6000
G3 X85.781 Y87.069 I.534 J.142 E.01445
G1 X85.832 Y86.652 E.0081
G1 X85.886 Y86.659 E.00105
G3 X86.676 Y88.144 I.037 J.933 E.04036
G3 X84.783 Y87.555 I-.813 J-.723 E.04805
G3 X85.773 Y86.645 I.981 J.073 E.02856
; WIPE_START
G1 F9000
G1 X85.886 Y86.659 E-.04311
G1 X86.109 Y86.686 E-.08524
G1 X86.421 Y86.82 E-.12901
G1 X86.673 Y87.032 E-.12529
G1 X86.834 Y87.299 E-.11851
G1 X86.89 Y87.591 E-.11291
G1 X86.837 Y87.874 E-.10928
G1 X86.788 Y87.956 E-.03665
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.48 I.072 J1.215 P1  F42000
G1 X88.961 Y87.828 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F4710
M204 S6000
G3 X89.417 Y87.265 I.388 J-.153 E.01695
G1 X89.518 Y86.857 E.0081
G3 X90.33 Y87.35 I-.215 J1.269 E.01876
G3 X91.09 Y87.508 I-.535 J4.484 E.01498
G1 X91.09 Y88.864 E.02612
G3 X90.349 Y88.872 I-.379 J-.709 E.01485
G2 X89.859 Y89.025 I-.13 J.444 E.01049
G3 X88.708 Y88.321 I-.285 J-.827 E.0297
G3 X89.461 Y86.842 I.691 J-.579 E.0406
; WIPE_START
G1 F9000
G1 X89.835 Y86.957 E-.14866
G1 X90.118 Y87.132 E-.12667
G1 X90.33 Y87.35 E-.11558
G1 X91.09 Y87.508 E-.29497
G1 X91.09 Y87.703 E-.07413
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.48 I-.292 J1.181 P1  F42000
G1 X94.433 Y88.53 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F4710
M204 S6000
G1 X95.044 Y88.53 E.01177
M73 P58 R7
G1 X95.349 Y88.159 E.00926
G2 X95.756 Y88.985 I4.486 J-1.697 E.01779
G3 X93.969 Y89.082 I-.879 J.308 E.06654
G3 X93.905 Y88.11 I.53 J-.523 E.02047
G1 X95.315 Y88.11 E.02717
; WIPE_START
G1 F9000
G1 X95.463 Y88.498 E-.15805
G1 X95.634 Y88.701 E-.10061
G1 X95.756 Y88.985 E-.11747
G1 X95.796 Y89.304 E-.12207
G1 X95.744 Y89.604 E-.11574
G1 X95.61 Y89.868 E-.11242
G1 X95.548 Y89.931 E-.03364
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.48 I.261 J1.189 P1  F42000
G1 X97.489 Y89.504 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F4710
M204 S6000
G3 X97.882 Y89.509 I.188 J.699 E.00767
G1 X98.1 Y89.28 E.00609
G1 X98.2 Y89.262 E.00196
G1 X98.345 Y88.84 E.0086
G1 X98.497 Y88.896 E.00313
G2 X98.905 Y89.386 I.598 J-.084 E.01294
G3 X99.299 Y90.549 I-.743 J.899 E.02492
G3 X97.783 Y90.898 I-.913 J-.5 E.03385
G3 X96.679 Y89.512 I-.326 J-.873 E.04511
G3 X97.711 Y89.079 I.89 J.677 E.02259
G1 X97.892 Y88.891 E.00503
G1 X98.289 Y88.82 E.00779
; WIPE_START
G1 F9000
G1 X98.497 Y88.896 E-.08422
G1 X98.632 Y89.199 E-.12597
G1 X98.905 Y89.386 E-.12588
G1 X99.173 Y89.703 E-.15757
G1 X99.311 Y89.982 E-.11847
G1 X99.354 Y90.267 E-.10925
G1 X99.334 Y90.366 E-.03863
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.48 I-.194 J-1.201 P1  F42000
G1 X88.535 Y92.106 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F4710
M204 S6000
G3 X89.064 Y91.587 I.415 J-.107 E.01727
G1 X89.139 Y91.174 E.0081
G3 X89.652 Y91.322 I-.089 J1.268 E.01038
G3 X90.928 Y91.878 I.407 J.809 E.0306
G3 X90.311 Y92.633 I-.73 J.033 E.02058
G2 X89.599 Y93.114 I2.151 J3.955 E.01659
G3 X88.422 Y92.733 I-.381 J-.83 E.02618
G3 X89.081 Y91.163 I.549 J-.693 E.04423
; WIPE_START
G1 F9000
G1 X89.652 Y91.322 E-.22543
G1 X90.115 Y91.218 E-.18036
G1 X90.6 Y91.374 E-.19361
G1 X90.86 Y91.648 E-.14352
G1 X90.873 Y91.691 E-.01708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.48 I-.253 J1.19 P1  F42000
G1 X99.401 Y93.501 Z4.48
G1 Z4.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4710
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.48 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.48
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.48 F4000
            G39.3 S1
            G0 Z4.48 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z4.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F4710
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.48 I.448 J-1.132 P1  F42000
G1 X82.8 Y81.11 Z4.48
G1 Z4.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.11 E.04757
G1 X80.2 Y80.2 E.01664
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.05 E.01555
M204 S10000
G1 X82.6 Y80.655 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.536142
G1 F4710
M204 S6000
G1 X80.4 Y80.655 E.05492
; WIPE_START
G1 F15000
G1 X82.4 Y80.655 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.284 Z4.48 F42000
G1 X81.977 Y94.286 Z4.48
G1 Z4.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4710
M204 S6000
G1 X81.023 Y94.286 E.01977
G1 X81.023 Y85.714 E.17781
G1 X81.977 Y85.714 E.01977
G1 X81.977 Y94.226 E.17657
M204 S10000
G1 X82.401 Y94.71 F42000
G1 F4710
M204 S6000
G1 X80.599 Y94.71 E.03737
G1 X80.599 Y85.29 E.19541
G1 X82.401 Y85.29 E.03737
G1 X82.401 Y94.65 E.19417
M204 S250
G1 X82.8 Y95.11 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.11 E.04757
G1 X80.2 Y84.89 E.18699
G1 X82.8 Y84.89 E.04757
G1 X82.8 Y95.05 E.18589
; WIPE_START
M204 S6000
G1 X80.801 Y95.096 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.074 Z4.48 F42000
G1 Z4.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4710
M204 S6000
G1 X81.5 Y85.926 E.21066
; WIPE_START
G1 F15000
G1 X81.5 Y87.926 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.513 Z4.48 F42000
G1 X82.8 Y99.8 Z4.48
G1 Z4.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.89 E.01664
G1 X82.8 Y98.89 E.04757
G1 X82.8 Y99.74 E.01555
M204 S10000
G1 X82.6 Y99.345 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.536142
G1 F4710
M204 S6000
G1 X80.4 Y99.345 E.05492
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.345 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/82
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.48 I1.137 J.433 P1  F42000
G1 X85.655 Y90.801 Z4.48
G1 Z4.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X86.193 Y90.26 I.78 J.238 E.01529
G3 X86.49 Y90.208 I.232 J.453 E.0059
G1 X86.604 Y89.803 E.0081
G3 X87.174 Y91.028 I-.249 J.861 E.02948
G3 X86.777 Y91.744 I-1.118 J-.151 E.01617
G1 X86.691 Y92.281 E.01048
G3 X85.805 Y93.951 I-.936 J.573 E.04388
G3 X85.396 Y92.079 I.244 J-1.034 E.04603
G2 X85.481 Y91.409 I-1.243 J-.499 E.01316
G3 X85.767 Y90.041 I.602 J-.588 E.03178
G3 X86.548 Y89.785 I.701 J.823 E.01625
M106 S201.45
; WIPE_START
G1 X86.818 Y89.873 E-.10796
G1 X87.034 Y90.05 E-.10617
G1 X87.181 Y90.303 E-.11099
G1 X87.241 Y90.617 E-.12152
G1 X87.174 Y91.028 E-.1582
G1 X87.045 Y91.415 E-.15515
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.1 J-.521 P1  F42000
G1 X85.177 Y87.475 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4428
M204 S6000
G3 X85.726 Y87.075 I.53 J.151 E.01412
G1 X85.778 Y86.658 E.0081
G1 X85.837 Y86.665 E.00114
G3 X85.726 Y88.49 I.026 J.917 E.05873
G3 X85.719 Y86.65 I-.044 J-.92 E.05732
; WIPE_START
G1 F9000
G1 X85.837 Y86.665 E-.04504
G1 X86.352 Y86.824 E-.20472
G1 X86.599 Y87.034 E-.12328
G1 X86.758 Y87.298 E-.1171
G1 X86.812 Y87.587 E-.1117
G1 X86.759 Y87.874 E-.11083
G1 X86.695 Y87.981 E-.04732
; WIPE_END
M73 P59 R7
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I.108 J1.212 P1  F42000
G1 X88.926 Y87.783 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4428
M204 S6000
G3 X89.337 Y87.222 I.423 J-.121 E.01546
G1 X89.395 Y86.806 E.0081
G3 X90.33 Y87.38 I-.182 J1.346 E.02178
G3 X91.001 Y88.13 I-.662 J1.266 E.01982
G1 X90.886 Y88.425 E.00611
G3 X89.795 Y89.083 I-7.735 J-11.598 E.02456
G3 X88.651 Y88.227 I-.164 J-.974 E.03079
G3 X89.336 Y86.797 I.726 J-.531 E.0374
; WIPE_START
G1 F9000
G1 X89.722 Y86.882 E-.14991
G1 X90.038 Y87.073 E-.14038
G1 X90.33 Y87.38 E-.16106
G1 X90.865 Y87.8 E-.2585
G1 X90.916 Y87.922 E-.05015
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I-1.041 J-.631 P1  F42000
G1 X88.44 Y92.007 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4428
M204 S6000
G3 X89.008 Y91.574 I.543 J.122 E.01497
G1 X89.082 Y91.16 E.0081
G3 X89.889 Y91.561 I-.192 J1.397 E.01767
G3 X90.416 Y92.038 I.071 J.452 E.0157
G2 X89.883 Y92.945 I4.04 J2.985 E.02032
G3 X88.427 Y92.755 I-.662 J-.602 E.0332
G3 X88.021 Y91.827 I.749 J-.88 E.0202
G3 X89.024 Y91.15 I.965 J.347 E.02495
; WIPE_START
G1 F9000
G1 X89.347 Y91.209 E-.12488
G1 X89.685 Y91.378 E-.1437
G1 X89.889 Y91.561 E-.10396
G1 X90.143 Y91.603 E-.09785
G1 X90.381 Y91.764 E-.10947
G1 X90.416 Y92.038 E-.10482
G1 X90.288 Y92.189 E-.07532
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I.723 J.979 P1  F42000
G1 X94.413 Y89.142 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4428
M204 S6000
G3 X94.71 Y88.563 I2.617 J.976 E.01258
G1 X94.823 Y88.15 E.00826
G3 X95.755 Y89.037 I-.699 J1.667 E.02536
G3 X93.972 Y89.302 I-.867 J.298 E.06199
G3 X94.506 Y88.172 I1.68 J.102 E.0247
G1 X94.77 Y88.124 E.00518
; WIPE_START
G1 F9000
G1 X95.431 Y88.518 E-.29236
G1 X95.631 Y88.752 E-.11706
G1 X95.755 Y89.037 E-.11814
G1 X95.792 Y89.343 E-.11697
G1 X95.741 Y89.638 E-.11409
G1 X95.739 Y89.642 E-.00139
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I-.244 J1.192 P1  F42000
G1 X96.929 Y89.885 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4428
M204 S6000
G3 X97.482 Y89.518 I.601 J.305 E.01339
G1 X97.509 Y89.099 E.0081
G3 X98.698 Y89.305 I-1.444 J11.863 E.02327
G3 X99.201 Y90.81 I-.335 J.949 E.03524
G3 X97.796 Y90.894 I-.754 J-.825 E.02933
G3 X96.453 Y90.278 I-.338 J-1.036 E.0313
G3 X97.45 Y89.095 I1.049 J-.128 E.03345
; WIPE_START
G1 F9000
G1 X98.357 Y89.199 E-.34705
G1 X98.698 Y89.305 E-.13543
G1 X98.999 Y89.492 E-.13493
G1 X99.226 Y89.737 E-.12662
G1 X99.245 Y89.774 E-.01597
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I-1.216 J.051 P1  F42000
G1 X99.401 Y93.501 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4428
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.6
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.6 F4000
            G39.3 S1
            G0 Z4.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F4428
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I.448 J-1.131 P1  F42000
G1 X82.8 Y81.101 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.101 E.04757
G1 X80.2 Y80.2 E.01649
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.041 E.01539
M204 S10000
G1 X82.6 Y80.651 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.527632
G1 F4428
M204 S6000
G1 X80.4 Y80.651 E.054
; WIPE_START
G1 F15000
G1 X82.4 Y80.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.279 Z4.6 F42000
G1 X81.977 Y94.278 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4428
M204 S6000
G1 X81.023 Y94.278 E.01977
G1 X81.023 Y85.722 E.17746
G1 X81.977 Y85.722 E.01977
G1 X81.977 Y94.218 E.17621
M204 S10000
G1 X82.401 Y94.702 F42000
G1 F4428
M204 S6000
G1 X80.599 Y94.702 E.03737
G1 X80.599 Y85.298 E.19506
G1 X82.401 Y85.298 E.03737
G1 X82.401 Y94.642 E.19381
M204 S250
G1 X82.8 Y95.101 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.101 E.04757
G1 X80.2 Y84.899 E.18668
G1 X82.8 Y84.899 E.04757
G1 X82.8 Y95.041 E.18558
; WIPE_START
M204 S6000
G1 X80.801 Y95.087 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.066 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4428
M204 S6000
G1 X81.5 Y85.934 E.21022
; WIPE_START
G1 F15000
G1 X81.5 Y87.934 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.522 Z4.6 F42000
G1 X82.8 Y99.8 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.899 E.01649
G1 X82.8 Y98.899 E.04757
G1 X82.8 Y99.74 E.01539
M204 S10000
G1 X82.6 Y99.349 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.527632
G1 F4428
M204 S6000
G1 X80.4 Y99.349 E.054
; CHANGE_LAYER
; Z_HEIGHT: 4.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.349 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/82
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.6 I1.14 J.425 P1  F42000
G1 X85.613 Y90.738 Z4.6
G1 Z4.32
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F4596
M204 S6000
G3 X86.526 Y90.159 I1.078 J.691 E.0215
G1 X86.657 Y89.76 E.0081
G3 X87.234 Y90.884 I-.259 J.844 E.02716
G3 X86.666 Y91.705 I-1.294 J-.289 E.01973
G1 X86.637 Y92.293 E.01134
G3 X85.811 Y93.991 I-.888 J.618 E.04425
G3 X85.35 Y92.195 I.208 J-1.011 E.0444
G1 X85.724 Y91.945 E.00867
G3 X85.182 Y90.976 I5.841 J-3.903 E.02141
G3 X85.754 Y90.021 I.931 J-.091 E.02298
G3 X86.586 Y89.737 I.777 J.914 E.01735
; WIPE_START
G1 F9000
G1 X86.853 Y89.826 E-.10704
G1 X87.068 Y90.002 E-.10529
G1 X87.212 Y90.251 E-.10948
G1 X87.271 Y90.559 E-.1191
G1 X87.234 Y90.884 E-.1245
G1 X87.032 Y91.355 E-.19459
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.72 I1.09 J-.541 P1  F42000
G1 X85.141 Y87.546 Z4.72
G1 Z4.32
G1 E.8 F1800
G1 F4596
M204 S6000
G3 X85.675 Y87.08 I.444 J-.031 E.01581
G1 X85.727 Y86.664 E.0081
G1 X85.791 Y86.672 E.00125
G3 X85.675 Y88.475 I.01 J.906 E.05749
G3 X85.01 Y86.827 I.023 J-.967 E.0434
G3 X85.668 Y86.656 I.693 J1.311 E.01323
; WIPE_START
G1 F9000
G1 X85.791 Y86.672 E-.04709
G1 X86.286 Y86.828 E-.19699
G1 X86.527 Y87.036 E-.12108
G1 X86.683 Y87.297 E-.11554
G1 X86.736 Y87.583 E-.11053
G1 X86.685 Y87.866 E-.10948
G1 X86.604 Y88 E-.05928
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.72 I.147 J1.208 P1  F42000
G1 X88.886 Y87.722 Z4.72
G1 Z4.32
G1 E.8 F1800
G1 F4596
M204 S6000
G3 X89.289 Y87.187 I.476 J-.06 E.01429
G1 X89.343 Y86.77 E.0081
G3 X90.472 Y87.808 I-.232 J1.386 E.03127
G1 X90.616 Y88.101 E.00629
G1 X90.482 Y88.377 E.00592
G3 X88.969 Y88.916 I-.918 J-.184 E.03721
G3 X88.675 Y88.251 I.761 J-.734 E.01429
G3 X89.285 Y86.761 I.698 J-.584 E.03808
; WIPE_START
G1 F9000
G1 X89.615 Y86.819 E-.12753
G1 X89.965 Y87.016 E-.15275
G1 X90.234 Y87.299 E-.14841
G1 X90.472 Y87.808 E-.21332
G1 X90.609 Y88.087 E-.118
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.72 I-1.06 J-.598 P1  F42000
G1 X88.378 Y92.037 Z4.72
G1 Z4.32
G1 E.8 F1800
G1 F4596
M204 S6000
G3 X88.966 Y91.562 I.482 J-.005 E.01676
G1 X89.033 Y91.148 E.0081
G3 X89.671 Y93.198 I-.085 J1.15 E.05318
G3 X88.328 Y92.662 I-.386 J-.984 E.03068
G3 X88.558 Y91.196 I.428 J-.684 E.03632
G1 X88.975 Y91.137 E.00811
; WIPE_START
G1 F9000
G1 X89.284 Y91.193 E-.11922
G1 X89.59 Y91.346 E-.1303
G1 X89.94 Y91.708 E-.19114
G1 X90.075 Y92.036 E-.13466
G1 X90.11 Y92.386 E-.13373
G1 X90.084 Y92.518 E-.05095
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.72 I.74 J.966 P1  F42000
G1 X94.432 Y89.184 Z4.72
G1 Z4.32
G1 E.8 F1800
G1 F4596
M204 S6000
G3 X94.875 Y88.782 I.476 J.079 E.01245
G1 X94.952 Y88.369 E.0081
G1 X95.021 Y88.384 E.00135
G3 X94.825 Y90.297 I-.204 J.946 E.05446
G3 X94.895 Y88.356 I.153 J-.966 E.05468
; WIPE_START
M73 P60 R7
G1 F9000
G1 X95.021 Y88.384 E-.04914
G1 X95.429 Y88.572 E-.17079
G1 X95.627 Y88.801 E-.115
G1 X95.75 Y89.08 E-.11586
G1 X95.787 Y89.38 E-.11474
G1 X95.734 Y89.68 E-.11578
G1 X95.636 Y89.862 E-.07869
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.72 I-.064 J1.215 P1  F42000
G1 X96.86 Y89.927 Z4.72
G1 Z4.32
G1 E.8 F1800
G1 F4596
M204 S6000
G3 X97.424 Y89.542 I.603 J.277 E.01383
G1 X97.456 Y89.123 E.0081
G2 X98.423 Y89.248 I1.147 J-5.091 E.01883
G3 X99.401 Y90.589 I-.118 J1.113 E.03605
G3 X97.799 Y90.883 I-.925 J-.528 E.03575
G3 X96.496 Y90.564 I-.387 J-1.24 E.02717
G3 X97.397 Y89.119 I.955 J-.409 E.0385
; WIPE_START
G1 F9000
G1 X97.723 Y89.142 E-.12444
G1 X98.001 Y89.244 E-.11242
G1 X98.423 Y89.248 E-.16053
G1 X98.76 Y89.349 E-.13373
G1 X99.056 Y89.53 E-.1318
G1 X99.233 Y89.715 E-.09708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.72 I-1.216 J.054 P1  F42000
G1 X99.401 Y93.501 Z4.72
G1 Z4.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4596
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.72
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.72 F4000
            G39.3 S1
            G0 Z4.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z4.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F4596
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.72 I.448 J-1.131 P1  F42000
G1 X82.8 Y81.1 Z4.72
G1 Z4.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
M204 S10000
G1 X82.6 Y80.65 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4596
M204 S6000
G1 X80.4 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X82.4 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.279 Z4.72 F42000
G1 X81.977 Y94.277 Z4.72
G1 Z4.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4596
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F4596
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z4.72 F42000
G1 Z4.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4596
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z4.72 F42000
G1 X82.8 Y99.8 Z4.72
G1 Z4.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4596
M204 S6000
G1 X80.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 4.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/82
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.72 I1.142 J.419 P1  F42000
G1 X85.583 Y90.679 Z4.72
G1 Z4.44
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F4590
M204 S6000
G3 X85.971 Y90.379 I.852 J.702 E.00954
G3 X86.56 Y90.113 I.582 J.504 E.01285
G1 X86.68 Y89.71 E.0081
G1 X86.733 Y89.728 E.00107
G3 X87.136 Y91.142 I-.38 J.873 E.03238
G3 X86.378 Y91.787 I-1.343 J-.809 E.01954
G1 X86.613 Y92.382 E.01233
G3 X85.806 Y94.026 I-.816 J.62 E.04369
G3 X85.348 Y92.258 I.198 J-.994 E.04383
G1 X85.746 Y91.997 E.00917
G3 X85.13 Y90.992 I5.209 J-3.886 E.02275
G3 X85.779 Y89.997 I.937 J-.098 E.02477
G3 X86.624 Y89.691 I.776 J.824 E.01782
; WIPE_START
G1 F9000
G1 X86.733 Y89.728 E-.04358
G1 X87.1 Y89.956 E-.16436
G1 X87.242 Y90.202 E-.10804
G1 X87.3 Y90.503 E-.11662
G1 X87.26 Y90.829 E-.12471
G1 X87.136 Y91.142 E-.1278
G1 X87.012 Y91.295 E-.07489
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.84 I1.085 J-.551 P1  F42000
G1 X85.086 Y87.505 Z4.84
G1 Z4.44
G1 E.8 F1800
G1 F4590
M204 S6000
G3 X85.466 Y87.062 I.362 J-.075 E.013
G1 X85.568 Y86.654 E.0081
G3 X86.612 Y87.858 I.079 J.986 E.0357
G3 X84.957 Y86.768 I-.932 J-.388 E.06843
G3 X85.511 Y86.639 I.442 J.644 E.01124
; WIPE_START
G1 F9000
G1 X85.932 Y86.702 E-.16168
G1 X86.222 Y86.832 E-.12071
G1 X86.458 Y87.037 E-.11878
G1 X86.61 Y87.295 E-.11392
G1 X86.663 Y87.578 E-.10929
G1 X86.612 Y87.858 E-.10816
G1 X86.575 Y87.92 E-.02746
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.84 I.12 J1.211 P1  F42000
G1 X88.867 Y87.692 Z4.84
G1 Z4.44
G1 E.8 F1800
G1 F4590
M204 S6000
G3 X89.253 Y87.151 I.416 J-.112 E.01466
G1 X89.303 Y86.733 E.0081
G3 X90.251 Y88.834 I-.274 J1.387 E.05192
G3 X88.666 Y88.234 I-.701 J-.541 E.04354
G3 X89.245 Y86.725 I.659 J-.613 E.03869
; WIPE_START
G1 F9000
G1 X89.551 Y86.773 E-.11775
G1 X89.881 Y86.947 E-.1417
G1 X90.156 Y87.232 E-.15074
G1 X90.341 Y87.577 E-.1486
G1 X90.455 Y88.094 E-.20121
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.84 I-1.057 J-.603 P1  F42000
G1 X88.33 Y91.818 Z4.84
G1 Z4.44
G1 E.8 F1800
G1 F4590
M204 S6000
G3 X88.857 Y91.55 I.501 J.334 E.01192
G1 X88.884 Y91.131 E.0081
G3 X89.899 Y93.071 I-.069 J1.272 E.0508
G3 X88.423 Y92.754 I-.634 J-.642 E.03448
G3 X88.825 Y91.127 I.318 J-.785 E.04661
; WIPE_START
G1 F9000
G1 X89.231 Y91.18 E-.15575
G1 X89.52 Y91.326 E-.12299
G1 X89.949 Y91.791 E-.2405
G1 X90.081 Y92.116 E-.13328
G1 X90.11 Y92.397 E-.10748
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.84 I.716 J.984 P1  F42000
G1 X94.446 Y89.243 Z4.84
G1 Z4.44
G1 E.8 F1800
G1 F4590
M204 S6000
G3 X94.884 Y88.845 I.475 J.083 E.01229
G1 X94.956 Y88.431 E.0081
G3 X94.553 Y90.253 I-.104 J.932 E.06067
G3 X94.898 Y88.419 I.426 J-.869 E.04854
; WIPE_START
G1 F9000
G1 X95.176 Y88.477 E-.1079
G1 X95.426 Y88.626 E-.11043
G1 X95.622 Y88.849 E-.11276
G1 X95.744 Y89.122 E-.11356
G1 X95.78 Y89.415 E-.11253
G1 X95.725 Y89.718 E-.11703
G1 X95.618 Y89.917 E-.08579
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.84 I-.047 J1.216 P1  F42000
G1 X96.802 Y89.963 Z4.84
G1 Z4.44
G1 E.8 F1800
G1 F4590
M204 S6000
G3 X97.38 Y89.563 I.579 J.219 E.01441
G1 X97.415 Y89.145 E.0081
G3 X98.052 Y89.316 I.026 J1.174 E.01289
G3 X99.504 Y90.336 I.268 J1.162 E.03857
G3 X98.111 Y91.032 I-.938 J-.136 E.03522
G2 X97.23 Y90.961 I-.536 J1.16 E.0174
G3 X96.66 Y89.452 I-.078 J-.832 E.042
G3 X97.356 Y89.14 I.716 J.665 E.0151
; WIPE_START
G1 F9000
G1 X97.663 Y89.166 E-.11722
G1 X98.052 Y89.316 E-.1583
G1 X98.487 Y89.292 E-.1655
G1 X98.821 Y89.389 E-.13217
G1 X99.085 Y89.545 E-.11639
G1 X99.215 Y89.677 E-.07043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.84 I-1.216 J.059 P1  F42000
G1 X99.401 Y93.501 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4590
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.84
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.84 F4000
            G39.3 S1
            G0 Z4.84 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z4.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F4590
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.093 Y83.989 Z4.84 F42000
G1 X82.8 Y81.1 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
M204 S10000
G1 X82.6 Y80.65 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4590
M204 S6000
G1 X80.4 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X82.4 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.279 Z4.84 F42000
G1 X81.977 Y94.277 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4590
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F4590
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z4.84 F42000
G1 Z4.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4590
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z4.84 F42000
G1 X82.8 Y99.8 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4590
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
M73 P61 R7
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/82
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.84 I1.144 J.416 P1  F42000
G1 X85.581 Y90.608 Z4.84
G1 Z4.56
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F4357
M204 S6000
G3 X86.443 Y90.071 I4.174 J5.741 E.0196
G1 X86.594 Y90.069 E.00291
G1 X86.717 Y89.667 E.0081
G1 X86.806 Y89.697 E.00181
G3 X87.157 Y91.089 I-.414 J.845 E.03147
G3 X86.561 Y91.627 I-1.165 J-.692 E.0157
G2 X86.743 Y92.799 I1.255 J.406 E.02372
G3 X85.293 Y93.827 I-.876 J.301 E.04589
G3 X85.777 Y92.044 I.822 J-.734 E.04223
G1 X85.391 Y91.481 E.01317
G3 X85.755 Y90.002 I.527 J-.655 E.03676
G3 X86.661 Y89.647 I.835 J.799 E.01936
; WIPE_START
G1 F9000
G1 X86.806 Y89.697 E-.05815
G1 X87.131 Y89.912 E-.14814
G1 X87.273 Y90.161 E-.10892
G1 X87.328 Y90.452 E-.11246
G1 X87.288 Y90.778 E-.12494
G1 X87.157 Y91.089 E-.12826
G1 X87.032 Y91.256 E-.07914
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.96 I-.516 J1.102 P1  F42000
G1 X88.257 Y91.829 Z4.96
G1 Z4.56
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.773 Y91.537 I.497 J.277 E.012
G1 X88.821 Y91.12 E.0081
G3 X89.724 Y91.579 I.065 J.991 E.02049
G3 X89.702 Y93.317 I-.718 J.86 E.03834
G3 X88.407 Y92.768 I-.376 J-.917 E.03016
G3 X88.756 Y91.114 I.261 J-.809 E.04808
M106 S201.45
M106 S255
; WIPE_START
G1 X89.132 Y91.131 E-.14278
G1 X89.394 Y91.238 E-.10773
G1 X89.724 Y91.579 E-.1803
G1 X89.962 Y91.872 E-.1433
G1 X90.089 Y92.181 E-.12722
G1 X90.105 Y92.335 E-.05867
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.96 I1.175 J-.316 P1  F42000
G1 X88.85 Y87.669 Z4.96
G1 Z4.56
G1 E.8 F1800
G1 F4357
M204 S6000
G3 X89.222 Y87.116 I.455 J-.096 E.01434
G1 X89.268 Y86.698 E.0081
G3 X90.296 Y87.654 I-.147 J1.188 E.02892
G3 X89.48 Y89.229 I-.862 J.552 E.04134
G1 X89.39 Y89.205 E.0018
G3 X88.682 Y88.257 I.235 J-.913 E.02465
G3 X89.209 Y86.69 I.628 J-.661 E.03991
; WIPE_START
G1 F9000
G1 X89.506 Y86.733 E-.11409
G1 X89.802 Y86.883 E-.12593
G1 X90.085 Y87.166 E-.15219
G1 X90.296 Y87.654 E-.20202
G1 X90.417 Y87.931 E-.11467
G1 X90.432 Y88.064 E-.0511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.96 I.137 J-1.209 P1  F42000
G1 X85.04 Y87.453 Z4.96
G1 Z4.56
G1 E.8 F1800
G1 F4357
M204 S6000
G3 X85.402 Y87.001 I.354 J-.087 E.01288
G1 X85.52 Y86.598 E.0081
G3 X86.54 Y87.293 I-.257 J1.473 E.02452
G3 X85.745 Y88.447 I-.898 J.232 E.03062
G3 X84.707 Y87.824 I-.193 J-.854 E.02577
G3 X85.446 Y86.578 I.707 J-.423 E.03415
; WIPE_START
G1 F9000
G1 X86.162 Y86.835 E-.28889
G1 X86.391 Y87.038 E-.11636
G1 X86.54 Y87.293 E-.11221
G1 X86.592 Y87.572 E-.10804
G1 X86.543 Y87.849 E-.1069
G1 X86.506 Y87.912 E-.0276
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.96 I-.209 J1.199 P1  F42000
G1 X94.456 Y89.298 Z4.96
G1 Z4.56
G1 E.8 F1800
G1 F4357
M204 S6000
G3 X94.891 Y88.906 I.476 J.09 E.01214
G1 X94.967 Y88.492 E.0081
G3 X94.558 Y90.278 I-.108 J.915 E.05962
G3 X94.9 Y88.479 I.41 J-.854 E.04789
; WIPE_START
G1 F9000
G1 X95.174 Y88.534 E-.10604
G1 X95.421 Y88.677 E-.10848
G1 X95.615 Y88.895 E-.11074
G1 X95.732 Y89.149 E-.1064
G1 X95.772 Y89.45 E-.11542
G1 X95.718 Y89.748 E-.11501
G1 X95.596 Y89.975 E-.09791
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.96 I-.205 J1.2 P1  F42000
G1 X96.695 Y90.163 Z4.96
G1 Z4.56
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.268 Y89.539 I.901 J.253 E.01694
G1 X97.286 Y89.12 E.0081
G1 X97.351 Y89.124 E.00125
G3 X98.209 Y89.335 I-12.129 J51.189 E.01705
G3 X99.525 Y90.503 I.21 J1.088 E.03917
G3 X98.038 Y90.978 I-.915 J-.3 E.03508
G2 X97.163 Y90.991 I-.418 J1.37 E.01716
G3 X96.623 Y89.473 I-.054 J-.835 E.04177
G3 X97.227 Y89.115 I.739 J.558 E.01388
M106 S201.45
; WIPE_START
G1 X97.351 Y89.124 E-.0471
G1 X98.209 Y89.335 E-.33604
G1 X98.551 Y89.335 E-.12995
G1 X99.122 Y89.566 E-.23372
G1 X99.146 Y89.59 E-.01319
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.96 I-1.214 J.079 P1  F42000
G1 X99.401 Y93.501 Z4.96
G1 Z4.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4357
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.96 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.96
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.96 F4000
            G39.3 S1
            G0 Z4.96 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z4.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F4357
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.093 Y83.989 Z4.96 F42000
G1 X82.8 Y81.1 Z4.96
G1 Z4.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
M204 S10000
G1 X82.6 Y80.65 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4357
M204 S6000
G1 X80.4 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X82.4 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.279 Z4.96 F42000
G1 X81.977 Y94.277 Z4.96
G1 Z4.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4357
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F4357
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z4.96 F42000
G1 Z4.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4357
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z4.96 F42000
G1 X82.8 Y99.8 Z4.96
G1 Z4.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4357
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/82
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.96 I1.097 J.527 P1  F42000
G1 X85.449 Y93.006 Z4.96
G1 Z4.68
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F4424
M204 S6000
G3 X85.896 Y92.587 I.545 J.133 E.01249
G1 X85.931 Y92.168 E.0081
G3 X86.671 Y93.531 I-.129 J.952 E.0348
G3 X85.018 Y93.339 I-.805 J-.284 E.04433
G3 X85.872 Y92.161 I1.068 J-.124 E.0308
; WIPE_START
G1 F9000
G1 X86.146 Y92.195 E-.10483
G1 X86.397 Y92.329 E-.1081
G1 X86.597 Y92.553 E-.11424
G1 X86.722 Y92.843 E-.12023
G1 X86.757 Y93.161 E-.12132
G1 X86.671 Y93.531 E-.14464
G1 X86.615 Y93.641 E-.04664
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.08 I1.196 J-.226 P1  F42000
G1 X85.996 Y90.366 Z5.08
G1 Z4.68
M73 P62 R7
G1 E.8 F1800
G1 F4424
M204 S6000
G3 X86.627 Y90.026 I.674 J.497 E.01428
G1 X86.753 Y89.625 E.0081
G1 X86.876 Y89.669 E.00253
G3 X87.176 Y91.04 I-.451 J.817 E.03062
G3 X85.113 Y91.265 I-1.111 J-.615 E.04685
G3 X85.786 Y89.989 I.814 J-.386 E.03227
G3 X86.697 Y89.606 I.775 J.567 E.02
; WIPE_START
G1 F9000
G1 X86.876 Y89.669 E-.0723
G1 X87.162 Y89.87 E-.13273
G1 X87.3 Y90.111 E-.1056
G1 X87.355 Y90.403 E-.11261
G1 X87.315 Y90.721 E-.1219
G1 X87.176 Y91.04 E-.13215
G1 X87.043 Y91.211 E-.08271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.08 I-.478 J1.119 P1  F42000
G1 X88.248 Y91.726 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.908 Y91.524 I.56 J.65 E.0137
G1 X88.922 Y91.104 E.0081
G3 X89.77 Y91.688 I.036 J.855 E.02128
G3 X89.723 Y93.381 I-.758 J.826 E.037
G3 X88.583 Y93.029 I-.358 J-.863 E.02494
G3 X87.862 Y92.321 I8.482 J-9.359 E.01948
G3 X88.8 Y91.118 I.756 J-.378 E.03669
G1 X88.863 Y91.101 E.00125
M106 S201.45
M106 S255
; WIPE_START
G1 X89.151 Y91.116 E-.10959
G1 X89.413 Y91.221 E-.107
G1 X89.623 Y91.402 E-.10543
G1 X89.77 Y91.688 E-.12208
G1 X89.972 Y91.94 E-.12279
G1 X90.102 Y92.255 E-.12952
G1 X90.12 Y92.421 E-.0636
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.08 I1.175 J-.317 P1  F42000
G1 X88.826 Y87.62 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F4424
M204 S6000
G3 X89.195 Y87.082 I.345 J-.159 E.01513
G1 X89.269 Y86.668 E.0081
G3 X90.236 Y87.64 I-.123 J1.089 E.02855
G3 X89.481 Y89.266 I-.79 J.621 E.04267
G1 X89.323 Y89.223 E.00315
G3 X88.69 Y88.256 I.309 J-.893 E.02397
G3 X88.508 Y86.979 I.825 J-.769 E.02646
G3 X89.18 Y86.656 I.748 J.696 E.01471
; WIPE_START
G1 F9000
G1 X89.468 Y86.696 E-.11027
G1 X89.753 Y86.838 E-.12113
G1 X90.005 Y87.083 E-.13336
G1 X90.191 Y87.425 E-.14812
G1 X90.236 Y87.64 E-.08353
G1 X90.4 Y88.006 E-.15222
G1 X90.404 Y88.035 E-.01137
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.08 I.142 J-1.209 P1  F42000
G1 X84.997 Y87.401 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.34 Y86.939 I.347 J-.102 E.01285
G1 X85.468 Y86.538 E.0081
G3 X86.524 Y87.566 I-.232 J1.295 E.03016
G3 X85.19 Y88.459 I-1.063 J-.145 E.03497
G3 X84.68 Y86.834 I.803 J-1.144 E.03528
G3 X85.385 Y86.515 I.627 J.447 E.01562
M106 S201.45
M106 S255
; WIPE_START
G1 X85.714 Y86.607 E-.12985
G1 X86.329 Y87.038 E-.28519
G1 X86.474 Y87.29 E-.11047
G1 X86.524 Y87.566 E-.10674
G1 X86.476 Y87.84 E-.10567
G1 X86.447 Y87.89 E-.02209
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.08 I-.218 J1.197 P1  F42000
G1 X94.472 Y89.35 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F4424
M204 S6000
G3 X94.895 Y88.963 I.445 J.061 E.01199
G1 X94.959 Y88.548 E.0081
G1 X95.063 Y88.567 E.00205
G3 X94.564 Y90.304 I-.213 J.879 E.05625
G3 X94.901 Y88.537 I.407 J-.838 E.04694
; WIPE_START
G1 F9000
G1 X95.063 Y88.567 E-.06281
G1 X95.407 Y88.72 E-.14294
G1 X95.59 Y88.914 E-.10156
G1 X95.721 Y89.184 E-.11389
G1 X95.763 Y89.482 E-.1146
G1 X95.71 Y89.775 E-.11316
G1 X95.57 Y90.032 E-.11098
G1 X95.57 Y90.032 E-.00006
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.08 I-.107 J1.212 P1  F42000
G1 X96.661 Y90.129 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.27 Y89.508 I1.025 J.397 E.01723
G1 X97.285 Y89.088 E.0081
G1 X97.354 Y89.092 E.00135
G3 X98.225 Y89.378 I-.893 J4.19 E.01771
G3 X99.58 Y90.492 I.249 J1.078 E.03902
G3 X98.23 Y91.072 I-.909 J-.254 E.03248
G1 X97.963 Y90.917 E.00595
G3 X96.766 Y90.98 I-.872 J-5.144 E.02316
G3 X96.582 Y89.503 I.294 J-.787 E.03527
G3 X97.226 Y89.084 I.803 J.53 E.01521
M106 S201.45
; WIPE_START
G1 X97.354 Y89.092 E-.04898
G1 X98.225 Y89.378 E-.34842
G1 X98.617 Y89.376 E-.14887
G1 X99.139 Y89.585 E-.21373
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.08 I-1.214 J.081 P1  F42000
G1 X99.401 Y93.501 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4424
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.08
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.08 F4000
            G39.3 S1
            G0 Z5.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F4424
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.093 Y83.989 Z5.08 F42000
G1 X82.8 Y81.1 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
M204 S10000
G1 X82.6 Y80.65 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4424
M204 S6000
G1 X80.4 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X82.4 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.279 Z5.08 F42000
G1 X81.977 Y94.277 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4424
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F4424
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4424
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z5.08 F42000
G1 X82.8 Y99.8 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4424
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/82
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.08 I1.094 J.532 P1  F42000
G1 X85.454 Y93.074 Z5.08
G1 Z4.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F4603
M204 S6000
G3 X85.887 Y92.656 I.498 J.082 E.01244
G1 X85.958 Y92.242 E.0081
G3 X86.736 Y93.254 I-.14 J.913 E.02718
G3 X85.678 Y94.08 I-.748 J.132 E.03172
G3 X85.352 Y92.44 I.251 J-.902 E.03984
G3 X85.869 Y92.23 I.562 J.642 E.01095
; WIPE_START
G1 F9000
G1 X86.139 Y92.267 E-.10373
G1 X86.387 Y92.402 E-.10717
G1 X86.585 Y92.625 E-.11329
G1 X86.703 Y92.891 E-.11059
G1 X86.736 Y93.254 E-.13864
G1 X86.764 Y93.447 E-.07383
G1 X86.707 Y93.708 E-.10161
G1 X86.69 Y93.732 E-.01114
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.195 J-.232 P1  F42000
G1 X86.034 Y90.352 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F4603
M204 S6000
G1 X86.055 Y90.346 E.00042
G3 X86.659 Y89.986 I.676 J.449 E.01401
G1 X86.787 Y89.586 E.0081
G3 X87.206 Y90.975 I-.272 J.839 E.03283
G3 X85.238 Y91.482 I-1.253 J-.791 E.04316
G3 X85.516 Y90.067 I.567 J-.623 E.03335
G2 X86.152 Y89.668 I-.357 J-1.275 E.01466
G3 X86.732 Y89.566 I.439 J.794 E.01157
; WIPE_START
G1 F9000
G1 X86.987 Y89.658 E-.10301
G1 X87.19 Y89.83 E-.1013
G1 X87.327 Y90.069 E-.1047
G1 X87.381 Y90.356 E-.11089
G1 X87.342 Y90.668 E-.11929
G1 X87.206 Y90.975 E-.12783
G1 X87.05 Y91.164 E-.09299
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I-.515 J1.103 P1  F42000
G1 X88.203 Y91.702 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.819 Y91.542 I.514 J.708 E.01256
G1 X88.934 Y91.51 E.00231
G1 X88.947 Y91.09 E.0081
G3 X89.816 Y91.8 I.05 J.825 E.02377
G3 X89.746 Y93.447 I-.748 J.794 E.03604
G3 X88.532 Y92.966 I-.344 J-.903 E.02763
G3 X87.799 Y92.3 I2.384 J-3.362 E.01915
G3 X88.782 Y91.116 I.767 J-.363 E.03715
G1 X88.888 Y91.087 E.00211
M106 S201.45
M106 S255
; WIPE_START
G1 X89.176 Y91.101 E-.10949
G1 X89.436 Y91.203 E-.10631
G1 X89.644 Y91.381 E-.10393
G1 X89.816 Y91.8 E-.17204
G1 X89.978 Y91.997 E-.09694
G1 X90.116 Y92.326 E-.1359
G1 X90.127 Y92.419 E-.0354
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.173 J-.323 P1  F42000
G1 X88.761 Y87.456 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F4603
M204 S6000
G3 X89.113 Y87.068 I.273 J-.106 E.01249
G1 X89.179 Y87.054 E.00131
G1 X89.218 Y86.635 E.0081
M73 P63 R7
G3 X90.201 Y87.716 I-.105 J1.083 E.03086
G3 X89.484 Y89.301 I-.732 J.624 E.04192
G1 X89.25 Y89.237 E.00467
G3 X88.664 Y88.2 I.548 J-.994 E.02417
G3 X88.307 Y87.171 I1.333 J-1.039 E.02138
G3 X89.159 Y86.628 I.843 J.384 E.02061
; WIPE_START
G1 F9000
G1 X89.561 Y86.712 E-.15575
G1 X89.95 Y87.027 E-.19029
G1 X90.122 Y87.34 E-.13564
G1 X90.201 Y87.716 E-.14601
G1 X90.364 Y88.023 E-.1323
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I.15 J-1.208 P1  F42000
G1 X84.956 Y87.351 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.279 Y86.874 I.339 J-.118 E.0129
G1 X85.383 Y86.467 E.0081
G1 X85.419 Y86.477 E.00073
G3 X86.46 Y87.559 I-.327 J1.357 E.03057
G3 X85.442 Y88.571 I-1.138 J-.128 E.0299
G3 X84.612 Y87.692 I.232 J-1.049 E.02473
G3 X85.041 Y86.467 I.755 J-.424 E.02829
G1 X85.326 Y86.451 E.0055
M106 S201.45
; WIPE_START
G1 X85.419 Y86.477 E-.0368
G1 X85.646 Y86.542 E-.08981
G1 X85.973 Y86.746 E-.1463
G1 X86.266 Y87.033 E-.15616
G1 X86.411 Y87.286 E-.11083
G1 X86.46 Y87.559 E-.10537
G1 X86.414 Y87.83 E-.1044
G1 X86.399 Y87.853 E-.01033
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I-.217 J1.197 P1  F42000
G1 X94.503 Y89.321 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F4603
M204 S6000
G3 X94.864 Y89.016 I.452 J.168 E.00952
G1 X94.906 Y88.598 E.0081
G3 X95.319 Y90.302 I-.079 J.921 E.04446
G3 X94.296 Y90.132 I-.443 J-.499 E.02289
G3 X94.847 Y88.592 I.676 J-.627 E.03878
; WIPE_START
G1 F9000
G1 X95.116 Y88.622 E-.103
G1 X95.371 Y88.746 E-.10778
G1 X95.579 Y88.954 E-.11169
G1 X95.71 Y89.219 E-.11242
G1 X95.751 Y89.512 E-.1125
G1 X95.7 Y89.801 E-.11143
G1 X95.572 Y90.035 E-.10119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I-.081 J1.214 P1  F42000
G1 X96.628 Y90.105 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F4603
M204 S6000
G3 X97.275 Y89.476 I1.263 J.651 E.01771
G1 X97.287 Y89.056 E.0081
G1 X97.35 Y89.06 E.00122
G3 X98.293 Y89.421 I-1.271 J4.728 E.01949
G3 X99.6 Y90.658 I.261 J1.034 E.0413
G3 X98.135 Y90.986 I-.869 J-.443 E.03304
G1 X97.619 Y90.864 E.01021
G3 X96.175 Y90.432 I-.562 J-.753 E.03374
G3 X96.547 Y89.529 I.904 J-.155 E.01984
G3 X97.228 Y89.053 I.855 J.498 E.01653
; WIPE_START
G1 F9000
G1 X97.35 Y89.06 E-.04643
G1 X97.499 Y89.069 E-.05671
G1 X98.293 Y89.421 E-.3299
G1 X98.613 Y89.408 E-.12172
G1 X98.929 Y89.474 E-.12293
G1 X99.121 Y89.574 E-.08232
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I-1.214 J.086 P1  F42000
G1 X99.401 Y93.501 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4603
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.2
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.2 F4000
            G39.3 S1
            G0 Z5.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F4603
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.093 Y83.989 Z5.2 F42000
G1 X82.8 Y81.1 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
M204 S10000
G1 X82.6 Y80.65 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4603
M204 S6000
G1 X80.4 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X82.4 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.279 Z5.2 F42000
G1 X81.977 Y94.277 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4603
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F4603
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4603
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z5.2 F42000
G1 X82.8 Y99.8 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4603
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/82
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.2 I1.092 J.536 P1  F42000
G1 X85.443 Y93.153 Z5.2
G1 Z4.92
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F4762
M204 S6000
G3 X85.878 Y92.723 I.505 J.076 E.01264
G1 X85.926 Y92.306 E.0081
G3 X86.701 Y93.026 I-.091 J.874 E.02189
G3 X85.674 Y94.108 I-.664 J.398 E.03876
G3 X85.111 Y92.82 I.113 J-.817 E.03246
G3 X85.868 Y92.297 I.819 J.376 E.01861
; WIPE_START
G1 F9000
G1 X86.136 Y92.337 E-.10332
G1 X86.367 Y92.462 E-.0996
G1 X86.556 Y92.664 E-.10525
G1 X86.701 Y93.026 E-.14818
G1 X86.831 Y93.497 E-.18563
G1 X86.775 Y93.752 E-.09904
G1 X86.747 Y93.793 E-.01897
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.32 I1.182 J-.291 P1  F42000
G1 X85.91 Y90.389 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F4762
M204 S6000
M73 P63 R6
G2 X86.23 Y90.12 I-.021 J-.351 E.00863
G3 X86.553 Y89.946 I.431 J.412 E.00718
G1 X86.543 Y89.526 E.0081
G1 X86.589 Y89.526 E.0009
G3 X87.233 Y90.916 I-.017 J.852 E.03668
G3 X85.764 Y91.697 I-1.617 J-1.27 E.03301
G3 X85.452 Y90.089 I-.051 J-.824 E.04586
G1 X85.812 Y89.979 E.00727
G3 X86.484 Y89.526 I.929 J.654 E.01595
; WIPE_START
G1 F9000
G1 X86.589 Y89.526 E-.04021
G1 X87.017 Y89.621 E-.16637
G1 X87.214 Y89.789 E-.09867
G1 X87.353 Y90.03 E-.10542
G1 X87.405 Y90.312 E-.10916
G1 X87.366 Y90.617 E-.11687
G1 X87.234 Y90.913 E-.1233
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.32 I1.024 J-.657 P1  F42000
G1 X84.917 Y87.302 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.221 Y86.808 I.33 J-.138 E.01304
G1 X85.326 Y86.401 E.0081
G1 X85.372 Y86.414 E.00092
G3 X86.322 Y87.97 I-.236 J1.213 E.03953
G3 X84.679 Y87.812 I-.809 J-.207 E.04561
G3 X84.763 Y86.506 I.817 J-.603 E.02741
G3 X85.269 Y86.384 I.403 J.564 E.01028
M106 S201.45
; WIPE_START
G1 X85.372 Y86.414 E-.04069
G1 X85.582 Y86.474 E-.08306
G1 X85.899 Y86.675 E-.14253
G1 X86.181 Y86.977 E-.15699
G1 X86.349 Y87.272 E-.12931
G1 X86.401 Y87.551 E-.10768
G1 X86.352 Y87.809 E-.09974
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.32 I.25 J1.191 P1  F42000
G1 X88.634 Y87.33 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F4762
M204 S6000
G3 X89.115 Y87.02 I.359 J.028 E.01275
G1 X89.169 Y86.601 E.00813
G3 X90.099 Y87.427 I.096 J.829 E.02706
G3 X90.412 Y88.447 I-3.417 J1.604 E.02064
G3 X88.729 Y88.62 I-.847 J.03 E.04913
G3 X88.673 Y88.194 I.453 J-.276 E.00853
G3 X88.209 Y87.392 I2.233 J-1.827 E.01793
G3 X89.108 Y86.599 I.767 J-.037 E.02651
; WIPE_START
G1 F9000
G1 X89.629 Y86.677 E-.20043
G1 X89.854 Y86.824 E-.10202
G1 X89.996 Y87.028 E-.09452
G1 X90.099 Y87.427 E-.15634
G1 X90.298 Y87.933 E-.20669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.32 I-1.057 J-.603 P1  F42000
G1 X88.16 Y91.681 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F4762
M204 S6000
G3 X88.804 Y91.54 I.496 J.725 E.01301
G1 X88.965 Y91.495 E.00323
G1 X88.976 Y91.075 E.0081
G3 X89.867 Y91.916 I.049 J.841 E.02643
G3 X89.771 Y93.518 I-.768 J.758 E.03489
G3 X88.573 Y93.031 I-.328 J-.91 E.02731
G3 X87.745 Y92.287 I4.315 J-5.635 E.02148
G3 X88.765 Y91.115 I.769 J-.36 E.03781
G1 X88.917 Y91.073 E.00304
; WIPE_START
G1 F9000
G1 X89.205 Y91.085 E-.10933
G1 X89.464 Y91.185 E-.10556
G1 X89.67 Y91.359 E-.10247
G1 X89.806 Y91.591 E-.10213
G1 X89.867 Y91.916 E-.12561
G1 X90 Y92.077 E-.07942
G1 X90.137 Y92.406 E-.13548
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.32 I.675 J1.012 P1  F42000
G1 X94.478 Y89.51 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F4762
M204 S6000
G3 X94.863 Y89.071 I.507 J.056 E.012
G1 X94.884 Y88.651 E.0081
G3 X95.517 Y90.151 I-.053 J.906 E.03894
G3 X94.175 Y90.035 I-.651 J-.293 E.03395
G3 X94.825 Y88.646 I.8 J-.473 E.03479
; WIPE_START
G1 F9000
G1 X95.096 Y88.67 E-.10341
G1 X95.363 Y88.792 E-.11167
G1 X95.568 Y88.993 E-.10891
G1 X95.697 Y89.252 E-.11024
G1 X95.739 Y89.54 E-.11052
G1 X95.687 Y89.824 E-.10963
G1 X95.559 Y90.071 E-.10563
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.32 I-.007 J1.217 P1  F42000
G1 X96.606 Y90.077 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F4762
M204 S6000
G3 X97.284 Y89.444 I1.622 J1.056 E.01807
G1 X97.293 Y89.024 E.0081
G1 X97.336 Y89.026 E.00082
G3 X97.989 Y89.352 I-.03 J.878 E.01453
G2 X98.988 Y89.509 I2.553 J-13.032 E.01949
G3 X99.293 Y91.075 I-.185 J.849 E.03899
G3 X98.031 Y90.896 I-.496 J-1.039 E.02603
G1 X97.503 Y90.916 E.01018
M73 P64 R6
G3 X96.121 Y90.186 I-.525 J-.68 E.03787
G3 X96.524 Y89.547 I1.108 J.252 E.01484
G3 X97.234 Y89.021 I.904 J.478 E.01762
; WIPE_START
G1 F9000
G1 X97.336 Y89.026 E-.03858
G1 X97.751 Y89.138 E-.16366
G1 X97.989 Y89.352 E-.12171
G1 X98.988 Y89.509 E-.3842
G1 X99.109 Y89.571 E-.05185
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.32 I-1.214 J.09 P1  F42000
G1 X99.401 Y93.501 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4762
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.32 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.32
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.32 F4000
            G39.3 S1
            G0 Z5.32 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z4.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F4762
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.093 Y83.989 Z5.32 F42000
G1 X82.8 Y81.1 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
M204 S10000
G1 X82.6 Y80.65 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4762
M204 S6000
G1 X80.4 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X82.4 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.279 Z5.32 F42000
G1 X81.977 Y94.277 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4762
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F4762
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z5.32 F42000
G1 Z4.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4762
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z5.32 F42000
G1 X82.8 Y99.8 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4762
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/82
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.32 I1.094 J.532 P1  F42000
G1 X85.381 Y93.223 Z5.32
G1 Z5.04
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X85.844 Y92.79 I.674 J.257 E.01266
G1 X85.858 Y92.37 E.0081
G1 X86.067 Y92.386 E.00404
G3 X86.847 Y93.794 I-.478 J1.185 E.03356
G3 X85.713 Y94.137 I-.769 J-.497 E.02483
G3 X85.24 Y92.695 I.031 J-.809 E.03791
G3 X85.799 Y92.366 I.719 J.581 E.01278
M106 S201.45
M106 S255
; WIPE_START
G1 X86.067 Y92.386 E-.10211
G1 X86.34 Y92.513 E-.11455
G1 X86.703 Y92.951 E-.21627
G1 X86.857 Y93.257 E-.13021
G1 X86.902 Y93.545 E-.11077
G1 X86.853 Y93.766 E-.08609
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.44 I1.173 J-.325 P1  F42000
G1 X85.906 Y90.35 Z5.44
G1 Z5.04
G1 E.8 F1800
G1 F4706
M204 S6000
G3 X86.586 Y89.908 I1.456 J1.499 E.01573
G1 X86.579 Y89.488 E.0081
G1 X86.644 Y89.489 E.00125
G3 X87.258 Y90.86 I-.042 J.842 E.03575
G3 X86.65 Y91.325 I-1.008 J-.688 E.015
G3 X84.918 Y91.327 I-.867 J-.821 E.03737
G3 X85.624 Y90.038 I.857 J-.369 E.03263
G3 X86.52 Y89.488 I1.656 J1.694 E.02044
; WIPE_START
G1 F9000
G1 X86.644 Y89.489 E-.04703
G1 X87.042 Y89.583 E-.15542
G1 X87.244 Y89.756 E-.10106
G1 X87.376 Y89.991 E-.1023
G1 X87.428 Y90.27 E-.10794
G1 X87.39 Y90.569 E-.11468
G1 X87.258 Y90.86 E-.12132
G1 X87.241 Y90.881 E-.01026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.44 I-.811 J.907 P1  F42000
G1 X88.119 Y91.666 Z5.44
G1 Z5.04
G1 E.8 F1800
G1 F4706
M204 S6000
G3 X88.788 Y91.539 I.485 J.732 E.01348
G1 X89 Y91.48 E.00424
G1 X89.005 Y91.06 E.0081
G3 X89.862 Y91.71 I.07 J.798 E.02273
G3 X90.199 Y92.851 I-3.563 J1.675 E.02303
G3 X88.765 Y93.316 I-.787 J.018 E.03885
G2 X88.31 Y92.729 I-3.579 J2.304 E.01433
G3 X88.749 Y91.114 I.156 J-.825 E.05336
G1 X88.946 Y91.059 E.00394
; WIPE_START
G1 F9000
G1 X89.237 Y91.069 E-.11094
G1 X89.495 Y91.166 E-.10472
G1 X89.7 Y91.336 E-.10105
G1 X89.862 Y91.71 E-.15485
G1 X90.133 Y92.419 E-.28845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.44 I1.162 J-.361 P1  F42000
G1 X88.541 Y87.291 Z5.44
G1 Z5.04
G1 E.8 F1800
G1 F4706
M204 S6000
G1 X88.54 Y87.289 E.00005
G3 X88.819 Y87.004 I.323 J.037 E.00826
G1 X89.087 Y86.986 E.00518
G1 X89.164 Y86.573 E.0081
G3 X90.077 Y86.983 I.116 J.964 E.02026
G2 X90.211 Y87.849 I6.604 J-.578 E.01691
G3 X89.416 Y89.345 I-.701 J.586 E.04174
G3 X88.721 Y88.344 I.224 J-.898 E.02564
G3 X88.117 Y87.358 I4.18 J-3.235 E.02233
G3 X88.726 Y86.59 I.71 J-.062 E.02081
G1 X89.106 Y86.563 E.00735
; WIPE_START
G1 F9000
G1 X89.704 Y86.643 E-.22913
G1 X89.934 Y86.786 E-.1029
G1 X90.077 Y86.983 E-.09256
G1 X90.098 Y87.377 E-.14984
G1 X90.211 Y87.849 E-.18468
G1 X90.212 Y87.851 E-.0009
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.44 I.136 J-1.209 P1  F42000
G1 X84.881 Y87.253 Z5.44
G1 Z5.04
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.163 Y86.738 I.322 J-.158 E.01326
G1 X85.271 Y86.332 E.0081
G1 X85.326 Y86.349 E.00112
G3 X86.15 Y88.319 I-.317 J1.29 E.04781
G3 X84.679 Y87.817 I-.649 J-.503 E.03927
G3 X84.718 Y86.433 I.807 J-.67 E.02915
G3 X85.214 Y86.316 I.392 J.547 E.01008
M106 S201.45
; WIPE_START
G1 X85.326 Y86.349 E-.0446
G1 X85.829 Y86.604 E-.21405
G1 X86.101 Y86.899 E-.15246
G1 X86.282 Y87.244 E-.14814
G1 X86.364 Y87.701 E-.17643
G1 X86.352 Y87.764 E-.02433
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.44 I-.247 J1.192 P1  F42000
G1 X94.493 Y89.449 Z5.44
G1 Z5.04
G1 E.8 F1800
G1 F4706
M204 S6000
G3 X94.848 Y89.118 I.337 J.005 E.01045
G1 X94.882 Y88.699 E.0081
G3 X95.652 Y89.92 I-.035 J.875 E.03269
G3 X94.615 Y90.64 I-.862 J-.134 E.02721
G3 X94.358 Y88.855 I.666 J-1.007 E.03926
G3 X94.823 Y88.691 I.429 J.476 E.00976
; WIPE_START
G1 F9000
G1 X95.098 Y88.717 E-.1047
G1 X95.352 Y88.833 E-.1061
G1 X95.554 Y89.03 E-.10729
G1 X95.683 Y89.284 E-.10815
G1 X95.723 Y89.558 E-.10554
G1 X95.652 Y89.92 E-.13993
G1 X95.56 Y90.133 E-.0883
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.44 I.101 J1.213 P1  F42000
G1 X96.605 Y90.045 Z5.44
G1 Z5.04
G1 E.8 F1800
G1 F4706
M204 S6000
G2 X96.95 Y89.661 I-1.082 J-1.318 E.00999
G3 X97.296 Y89.412 I.449 J.258 E.00848
G1 X97.313 Y88.992 E.0081
G3 X98.001 Y89.32 I.004 J.879 E.0152
G1 X98.475 Y89.507 E.00982
G3 X99.697 Y90.687 I.244 J.97 E.03911
G3 X98.114 Y90.922 I-.882 J-.496 E.03556
G1 X97.59 Y90.869 E.01016
G3 X96.172 Y90.726 I-.638 J-.774 E.03054
G3 X96.553 Y89.524 I.84 J-.396 E.02673
G3 X97.244 Y88.989 I.802 J.323 E.01765
; WIPE_START
G1 F9000
G1 X97.51 Y89.001 E-.10127
G1 X97.756 Y89.101 E-.10072
G1 X98.001 Y89.32 E-.12492
G1 X98.475 Y89.507 E-.19366
G1 X98.717 Y89.479 E-.09243
G1 X99.046 Y89.542 E-.12725
G1 X99.092 Y89.565 E-.01976
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.44 I-1.213 J.095 P1  F42000
G1 X99.401 Y93.501 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4706
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.44 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.44
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.44 F4000
            G39.3 S1
            G0 Z5.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z5.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F4706
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.093 Y83.989 Z5.44 F42000
G1 X82.8 Y81.1 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
M204 S10000
G1 X82.6 Y80.65 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4706
M204 S6000
G1 X80.4 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X82.4 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.279 Z5.44 F42000
G1 X81.977 Y94.277 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4706
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F4706
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z5.44 F42000
G1 Z5.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4706
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z5.44 F42000
G1 X82.8 Y99.8 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4706
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/82
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.44 I1.097 J.527 P1  F42000
G1 X85.332 Y93.248 Z5.44
G1 Z5.16
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X85.845 Y92.85 I.942 J.684 E.01268
G1 X85.864 Y92.43 E.0081
G3 X86.952 Y93.564 I-.201 J1.282 E.03255
M73 P65 R6
G3 X85.749 Y94.162 I-.793 J-.088 E.03076
G3 X85.16 Y92.751 I-.035 J-.814 E.03825
G3 X85.805 Y92.425 I.82 J.823 E.01415
M106 S201.45
M106 S255
; WIPE_START
G1 X86.081 Y92.45 E-.10554
G1 X86.521 Y92.732 E-.19848
G1 X86.777 Y93.012 E-.14446
G1 X86.931 Y93.31 E-.12748
G1 X86.952 Y93.564 E-.09682
G1 X86.889 Y93.785 E-.08723
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I1.175 J-.319 P1  F42000
G1 X85.95 Y90.323 Z5.56
G1 Z5.16
G1 E.8 F1800
G1 F4823
M204 S6000
G2 X86.469 Y89.92 I-1.157 J-2.022 E.01271
G1 X86.618 Y89.872 E.00302
G1 X86.614 Y89.452 E.0081
G1 X86.695 Y89.453 E.00156
G3 X87.282 Y90.807 I-.067 J.833 E.03485
G3 X86.583 Y91.28 I-.954 J-.656 E.01664
G3 X84.896 Y91.38 I-.887 J-.68 E.03695
G3 X85.475 Y90.09 I.734 J-.445 E.03201
G1 X85.908 Y89.876 E.00932
G3 X86.555 Y89.451 I.876 J.629 E.01526
; WIPE_START
G1 F9000
G1 X86.695 Y89.453 E-.05328
G1 X87.072 Y89.55 E-.14766
G1 X87.267 Y89.721 E-.09868
G1 X87.398 Y89.953 E-.10149
G1 X87.449 Y90.229 E-.1066
G1 X87.411 Y90.523 E-.11269
G1 X87.282 Y90.807 E-.11848
G1 X87.246 Y90.849 E-.02111
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I-.845 J.876 P1  F42000
G1 X88.077 Y91.651 Z5.56
G1 Z5.16
G1 E.8 F1800
G1 F4823
M204 S6000
G3 X88.772 Y91.539 I.485 J.796 E.01391
G1 X89.039 Y91.463 E.00534
G1 X89.047 Y91.043 E.0081
G1 X89.175 Y91.047 E.00248
G3 X89.922 Y91.84 I-.054 J.799 E.02308
G3 X90.223 Y92.935 I-3.728 J1.613 E.02196
G3 X88.802 Y93.379 I-.781 J-.003 E.03804
G2 X88.248 Y92.706 I-2.341 J1.364 E.01687
G3 X88.379 Y91.085 I.129 J-.806 E.04696
G2 X88.988 Y91.041 I.246 J-.836 E.01202
; WIPE_START
G1 F9000
G1 X89.175 Y91.047 E-.0713
G1 X89.53 Y91.145 E-.13968
G1 X89.732 Y91.312 E-.09959
G1 X89.864 Y91.536 E-.09886
G1 X89.922 Y91.84 E-.11763
G1 X90.129 Y92.417 E-.23293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I1.158 J-.374 P1  F42000
G1 X88.491 Y87.34 Z5.56
G1 Z5.16
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X88.487 Y87.27 E.00135
G3 X88.98 Y86.957 I.362 J.025 E.01308
G1 X89.056 Y86.544 E.0081
G3 X89.787 Y86.603 I.075 J3.635 E.01417
G3 X90.169 Y87.425 I-.372 J.672 E.01869
G2 X90.36 Y88.243 I1.193 J.153 E.01654
G3 X88.738 Y88.517 I-.782 J.304 E.05742
G1 X88.571 Y88.027 E.00999
G3 X88.997 Y86.534 I.28 J-.728 E.04454
M106 S201.45
M106 S255
; WIPE_START
G1 X89.486 Y86.538 E-.18567
G1 X89.787 Y86.603 E-.11712
G1 X89.968 Y86.741 E-.08628
G1 X90.11 Y86.955 E-.09757
G1 X90.183 Y87.211 E-.10128
G1 X90.169 Y87.425 E-.08159
G1 X90.187 Y87.663 E-.09048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I.115 J-1.212 P1  F42000
G1 X84.833 Y87.155 Z5.56
G1 Z5.16
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.138 Y86.676 I.309 J-.14 E.01296
G1 X85.222 Y86.264 E.00812
G3 X86.127 Y88.383 I-.369 J1.411 E.05122
G3 X84.681 Y87.824 I-.635 J-.508 E.03963
G3 X84.651 Y86.434 I.735 J-.711 E.02946
G3 X85.165 Y86.247 I.617 J.895 E.01065
M106 S201.45
M106 S255
; WIPE_START
G1 X85.46 Y86.334 E-.1169
G1 X85.755 Y86.527 E-.13374
G1 X86.026 Y86.823 E-.15259
G1 X86.214 Y87.177 E-.15248
G1 X86.328 Y87.703 E-.20429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I-.262 J1.188 P1  F42000
G1 X94.475 Y89.497 Z5.56
G1 Z5.16
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.794 Y89.049 I.349 J-.089 E.01207
G1 X94.866 Y88.633 E.00812
G3 X95.507 Y90.328 I-.242 J1.06 E.04128
G3 X94.206 Y90.3 I-.643 J-.334 E.03113
G3 X94.319 Y88.799 I1.297 J-.657 E.03049
G3 X94.808 Y88.619 I.549 J.737 E.01019
M106 S201.45
; WIPE_START
G1 X95.311 Y88.832 E-.20747
G1 X95.538 Y89.064 E-.12331
G1 X95.666 Y89.313 E-.10635
G1 X95.706 Y89.59 E-.10657
G1 X95.646 Y90.001 E-.15766
G1 X95.586 Y90.143 E-.05864
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I.145 J1.208 P1  F42000
G1 X96.6 Y90.021 Z5.56
G1 Z5.16
G1 E.8 F1800
G1 F4823
M204 S6000
G2 X96.964 Y89.632 I-.625 J-.949 E.01036
G3 X97.311 Y89.38 I.455 J.261 E.00852
G1 X97.316 Y88.96 E.0081
G3 X98.013 Y89.328 I.075 J.702 E.01612
G1 X98.514 Y89.545 E.01053
G3 X99.744 Y90.701 I.262 J.953 E.03899
G3 X98.165 Y90.927 I-.872 J-.463 E.03579
G2 X97.15 Y91.074 I-.319 J1.368 E.02023
G3 X96.299 Y89.721 I-.316 J-.746 E.04402
G2 X96.765 Y89.199 I-.853 J-1.23 E.01362
G3 X97.257 Y88.958 I.61 J.622 E.01075
; WIPE_START
G1 F9000
G1 X97.521 Y88.968 E-.10059
G1 X97.764 Y89.065 E-.09929
G1 X98.013 Y89.328 E-.1376
G1 X98.514 Y89.545 E-.20751
G1 X98.779 Y89.514 E-.10119
G1 X99.073 Y89.568 E-.11382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I.562 J-1.08 P1  F42000
G1 X82.8 Y81.1 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X80.801 Y81.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.56
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.56 F4000
            G39.3 S1
            G0 Z5.56 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.4 Y80.65 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4823
M204 S6000
G1 X82.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X80.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.133 Y84.597 Z5.56 F42000
G1 X92.601 Y87.902 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X92.099 Y87.902 E.0104
G1 X92.099 Y86.499 E.02909
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y87.842 E.01537
M204 S250
G1 X93 Y88.301 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y88.301 E.02379
G1 X91.7 Y86.1 E.04027
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y88.241 E.01356
M204 S10000
G1 X92.35 Y87.69 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104021
G1 F4823
M204 S6000
G1 X92.35 Y86.889 E.00306
G1 X92.369 Y86.85 E.00017
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I-.671 J-1.015 P1  F42000
G1 X93 Y89.571 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y89.571 E.02379
G1 X91.7 Y89.159 E.00754
G1 X93 Y89.159 E.02379
G1 X93 Y89.511 E.00644
; WIPE_START
M204 S6000
G1 X91.7 Y89.571 E-.49453
G1 X91.7 Y89.159 E-.15651
G1 X91.987 Y89.159 E-.10896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93 Y90.841 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F2400
M204 S1000
G1 X91.7 Y90.841 E.02379
G1 X91.7 Y90.429 E.00754
G1 X93 Y90.429 E.02379
G1 X93 Y90.781 E.00644
; WIPE_START
M204 S6000
G1 X91.7 Y90.841 E-.49453
G1 X91.7 Y90.429 E-.15651
G1 X91.987 Y90.429 E-.10896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.038 Y93.35 Z5.56 F42000
G1 X99.401 Y93.501 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y92.098 E.02909
G1 X92.601 Y92.098 E.0104
G1 X92.601 Y92.899 E.01661
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y91.699 E.04027
G1 X93 Y91.699 E.02379
G1 X93 Y92.5 E.01466
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
M204 S10000
G1 X99.189 Y93.2 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F4823
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.104021
G1 X92.35 Y93.111 E.00017
G1 X92.35 Y92.31 E.00306
; WIPE_START
G1 F15000
G1 X92.35 Y93.111 E-.72111
G1 X92.369 Y93.15 E-.03889
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I-.131 J-1.21 P1  F42000
G1 X81.977 Y94.277 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F4800
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4823
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z5.56 F42000
G1 X82.8 Y99.8 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4823
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/82
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
M73 P66 R6
G3 Z5.56 I1.1 J.522 P1  F42000
G1 X85.331 Y93.17 Z5.56
G1 Z5.28
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X85.847 Y92.905 I.58 J.498 E.01147
G1 X85.903 Y92.489 E.0081
G3 X86.963 Y93.321 I-.214 J1.364 E.02713
G3 X85.695 Y94.152 I-.817 J.136 E.03691
G3 X85.665 Y92.504 I-.004 J-.824 E.04949
G2 X85.811 Y92.48 I.024 J-.314 E.00287
M106 S201.45
M106 S255
; WIPE_START
G1 X86.276 Y92.588 E-.18122
G1 X86.6 Y92.798 E-.14677
G1 X86.856 Y93.07 E-.14208
G1 X86.963 Y93.321 E-.10362
G1 X86.969 Y93.597 E-.10515
G1 X86.909 Y93.803 E-.08116
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.68 I1.176 J-.312 P1  F42000
G1 X85.981 Y90.301 Z5.68
G1 Z5.28
G1 E.8 F1800
G1 F4293
M204 S6000
G2 X86.505 Y89.882 I-1.775 J-2.757 E.01297
G1 X86.647 Y89.837 E.00286
G1 X86.646 Y89.417 E.0081
G1 X86.74 Y89.419 E.00181
G3 X87.097 Y90.992 I-.135 J.857 E.03988
G3 X86.54 Y91.23 I-.647 J-.742 E.01186
G3 X85.088 Y91.596 I-.928 J-.615 E.03167
G3 X85.246 Y90.175 I.457 J-.668 E.03377
G2 X86.065 Y89.681 I-.44 J-1.654 E.01869
G3 X86.587 Y89.415 I.667 J.665 E.01149
; WIPE_START
G1 F9000
G1 X86.74 Y89.419 E-.05808
G1 X87.094 Y89.516 E-.13934
G1 X87.288 Y89.685 E-.09802
G1 X87.419 Y89.917 E-.10105
G1 X87.469 Y90.19 E-.10534
G1 X87.431 Y90.479 E-.11086
G1 X87.304 Y90.756 E-.11588
G1 X87.249 Y90.818 E-.03141
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.68 I-.88 J.84 P1  F42000
G1 X88.037 Y91.643 Z5.68
G1 Z5.28
G1 E.8 F1800
G1 F4293
M204 S6000
G3 X88.752 Y91.539 I.485 J.823 E.01429
G1 X89.08 Y91.445 E.00658
G1 X89.087 Y91.025 E.0081
G3 X89.936 Y91.835 I.086 J.76 E.02579
G3 X90.248 Y93.022 I-5.533 J2.087 E.02369
G3 X88.649 Y93.16 I-.818 J-.14 E.04204
G1 X88.599 Y93.01 E.00304
G1 X88.189 Y92.685 E.01009
G3 X88.317 Y91.084 I.129 J-.795 E.04629
G2 X89.028 Y91.023 I.273 J-.993 E.01403
; WIPE_START
G1 F9000
G1 X89.567 Y91.124 E-.20861
G1 X89.766 Y91.287 E-.09774
G1 X89.897 Y91.508 E-.09735
G1 X89.936 Y91.835 E-.12527
G1 X90.128 Y92.412 E-.23103
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.68 I1.183 J-.285 P1  F42000
G1 X88.807 Y86.934 Z5.68
G1 Z5.28
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X89.303 Y86.94 I.268 J-1.602 E.0096
G3 X89.543 Y86.924 I.15 J.43 E.0047
G1 X89.626 Y86.512 E.0081
G3 X90.201 Y87.179 I-.251 J.798 E.01788
G1 X90.193 Y87.948 E.01483
G3 X89.251 Y89.351 I-.652 J.58 E.04435
G1 X89.037 Y89.206 E.00499
G3 X88.754 Y88.573 I.47 J-.589 E.0139
G1 X88.604 Y88.076 E.01
G3 X88.541 Y86.534 I.264 J-.783 E.03839
G2 X89.568 Y86.5 I.214 J-9.13 E.01981
M106 S201.45
M106 S255
; WIPE_START
G1 X89.987 Y86.727 E-.18116
G1 X90.129 Y86.932 E-.09458
G1 X90.201 Y87.179 E-.09778
G1 X90.193 Y87.948 E-.29232
G1 X90.298 Y88.173 E-.09416
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.68 I.237 J-1.194 P1  F42000
G1 X84.792 Y87.081 Z5.68
G1 Z5.28
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.122 Y86.655 I.342 J-.076 E.01184
G1 X85.128 Y86.235 E.0081
G3 X86.171 Y87.254 I-.11 J1.156 E.0304
G3 X85.425 Y88.754 I-.797 J.538 E.03916
G3 X84.684 Y87.782 I.159 J-.89 E.02586
G3 X84.797 Y86.308 I.568 J-.698 E.03343
G3 X85.068 Y86.234 I.446 J1.106 E.00544
M106 S201.45
M106 S255
; WIPE_START
G1 X85.403 Y86.261 E-.12745
G1 X85.697 Y86.457 E-.13447
G1 X85.956 Y86.745 E-.14693
G1 X86.171 Y87.254 E-.21029
G1 X86.289 Y87.514 E-.1082
G1 X86.298 Y87.599 E-.03267
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.68 I-.356 J1.164 P1  F42000
G1 X94.554 Y90.127 Z5.68
G1 Z5.28
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.48 Y89.222 I2.642 J-.672 E.01757
G3 X94.8 Y89.033 I.662 J.756 E.00722
G1 X94.801 Y88.613 E.0081
G3 X95.649 Y89.363 I-.007 J.862 E.0238
G2 X96.016 Y89.571 I.39 J-.259 E.00845
G1 X96.538 Y89.493 E.01018
G3 X98.097 Y89.422 I.795 J.299 E.03815
G1 X98.625 Y89.573 E.01058
G3 X99.788 Y90.715 I.229 J.93 E.03757
G3 X98.2 Y90.876 I-.85 J-.468 E.03614
G2 X97.086 Y91.098 I-.268 J1.563 E.02239
G3 X96.039 Y90.719 I-.277 J-.871 E.02309
G2 X95.389 Y90.595 I-.62 J1.489 E.01285
G3 X94.089 Y90.03 I-.493 J-.642 E.03325
G3 X94.129 Y88.983 I1.737 J-.458 E.02049
G3 X94.742 Y88.613 I.786 J.608 E.01411
M106 S201.45
; WIPE_START
G1 X95.062 Y88.629 E-.12182
G1 X95.283 Y88.772 E-.10006
G1 X95.493 Y89.002 E-.11848
G1 X95.649 Y89.363 E-.14905
G1 X95.739 Y89.48 E-.05624
G1 X96.016 Y89.571 E-.11082
G1 X96.285 Y89.531 E-.10353
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.68 I.645 J-1.032 P1  F42000
G1 X82.8 Y81.1 Z5.68
G1 Z5.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X80.801 Y81.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.68 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.68
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.68 F4000
            G39.3 S1
            G0 Z5.68 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.4 Y80.65 F42000
G1 Z5.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4293
M204 S6000
G1 X82.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X80.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.173 Y84.53 Z5.68 F42000
G1 X92.601 Y87.733 Z5.68
G1 Z5.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4293
M204 S6000
G1 X92.099 Y87.733 E.0104
G1 X92.099 Y86.499 E.02559
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y87.673 E.01187
M204 S250
G1 X93 Y88.132 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y88.132 E.02379
G1 X91.7 Y86.1 E.03719
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y88.072 E.01047
M204 S10000
G1 X92.35 Y87.521 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104268
G1 F4293
M204 S6000
G1 X92.35 Y86.889 E.00243
G1 X92.369 Y86.85 E.00017
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.68 I-.648 J-1.03 P1  F42000
G1 X93.021 Y89.423 Z5.68
G1 Z5.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.358834
G1 F2400
M204 S1000
G1 X91.679 Y89.423 E.02184
G1 X91.679 Y89.307 E.00189
G1 X93.021 Y89.307 E.02184
G1 X93.021 Y89.363 E.00091
; WIPE_START
M204 S6000
G1 X91.679 Y89.423 E-.51016
G1 X91.679 Y89.307 E-.04408
G1 X92.221 Y89.307 E-.20576
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.021 Y90.693 Z5.68 F42000
G1 Z5.28
G1 E.8 F1800
G1 F2400
M204 S1000
G1 X91.679 Y90.693 E.02184
G1 X91.679 Y90.577 E.00189
G1 X93.021 Y90.577 E.02184
G1 X93.021 Y90.633 E.00091
; WIPE_START
M204 S6000
G1 X91.679 Y90.693 E-.51016
G1 X91.679 Y90.577 E-.04408
G1 X92.221 Y90.577 E-.20576
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.29 Y93.456 Z5.68 F42000
G1 X99.401 Y93.501 Z5.68
G1 Z5.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4293
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y92.267 E.02559
G1 X92.601 Y92.267 E.0104
G1 X92.601 Y92.899 E.01312
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y91.868 E.03719
G1 X93 Y91.868 E.02379
G1 X93 Y92.5 E.01157
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
M204 S10000
G1 X99.189 Y93.2 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F4293
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.104268
G1 X92.35 Y93.111 E.00017
G1 X92.35 Y92.479 E.00243
; WIPE_START
G1 F15000
G1 X92.35 Y93.111 E-.7114
G1 X92.369 Y93.15 E-.0486
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.68 I-.131 J-1.21 P1  F42000
G1 X81.977 Y94.277 Z5.68
G1 Z5.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4293
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F4293
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z5.68 F42000
G1 Z5.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4293
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z5.68 F42000
G1 X82.8 Y99.8 Z5.68
G1 Z5.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4293
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/82
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.68 I1.102 J.516 P1  F42000
G1 X85.248 Y93.26 Z5.68
G1 Z5.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X85.868 Y92.947 I.518 J.256 E.01434
G1 X85.981 Y92.542 E.0081
G3 X86.896 Y93.086 I-.275 J1.503 E.02095
G3 X85.674 Y94.152 I-.73 J.396 E.04323
G3 X85.609 Y92.531 I-.045 J-.81 E.0496
G1 X85.924 Y92.526 E.00608
M106 S201.45
M106 S255
; WIPE_START
G1 X86.351 Y92.651 E-.16884
G1 X86.682 Y92.86 E-.14874
G1 X86.896 Y93.086 E-.1184
G1 X86.988 Y93.63 E-.20971
G1 X86.919 Y93.866 E-.09325
G1 X86.886 Y93.911 E-.02107
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.183 J-.284 P1  F42000
G1 X86.02 Y90.295 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F3386
M204 S6000
G3 X86.666 Y89.805 I1.964 J1.921 E.01569
G1 X86.668 Y89.385 E.0081
G3 X87.323 Y90.707 I.018 J.815 E.03557
G3 X86.497 Y91.181 I-.942 J-.686 E.0189
G3 X84.865 Y91.398 I-.889 J-.442 E.0374
G3 X85.605 Y90.089 I.709 J-.463 E.03568
G3 X86.35 Y89.464 I13.985 J15.903 E.01874
G1 X86.609 Y89.383 E.00524
; WIPE_START
G1 F9000
G1 X87.094 Y89.476 E-.18735
G1 X87.257 Y89.59 E-.07585
G1 X87.435 Y89.879 E-.12876
G1 X87.486 Y90.151 E-.10535
G1 X87.448 Y90.436 E-.1093
G1 X87.323 Y90.707 E-.11347
G1 X87.253 Y90.786 E-.03992
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I-.67 J1.016 P1  F42000
G1 X88.355 Y91.513 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X89.115 Y91.425 I.106 J-2.406 E.01481
G1 X89.124 Y91.005 E.0081
G3 X89.968 Y91.803 I.072 J.769 E.02533
G1 X90.023 Y92.302 E.00968
G3 X89.52 Y93.759 I-.611 J.604 E.03686
G3 X88.657 Y93.127 I-.032 J-.861 E.02224
G1 X88.325 Y92.723 E.01009
M73 P67 R6
G3 X87.729 Y91.304 I-.015 J-.828 E.03804
G3 X88.612 Y91.11 I.656 J.88 E.01797
G1 X89.065 Y91.004 E.00896
M106 S201.45
M106 S255
; WIPE_START
G1 X89.35 Y91.01 E-.1083
G1 X89.591 Y91.1 E-.09792
G1 X89.786 Y91.259 E-.09561
G1 X89.922 Y91.481 E-.09871
G1 X89.968 Y91.803 E-.12362
G1 X90.023 Y92.302 E-.19088
G1 X90.074 Y92.409 E-.04496
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.178 J-.304 P1  F42000
G1 X88.661 Y86.936 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.767 Y86.901 I.116 J.174 E.00218
G2 X89.499 Y86.896 I.357 J-1.271 E.0143
G1 X89.597 Y86.483 E.00819
G3 X90.18 Y87.51 I-.163 J.772 E.02573
G2 X90.353 Y88.345 I1.045 J.22 E.01692
G3 X88.771 Y88.589 I-.767 J.275 E.05538
G2 X88.17 Y87.771 I-1.302 J.326 E.02007
G3 X89.151 Y86.543 I.667 J-.473 E.0407
G3 X89.54 Y86.47 I.361 J.855 E.00767
M106 S201.45
M106 S255
; WIPE_START
G1 X90.011 Y86.716 E-.20198
G1 X90.152 Y86.91 E-.0909
G1 X90.222 Y87.145 E-.09319
G1 X90.18 Y87.51 E-.13979
G1 X90.195 Y88.011 E-.19045
G1 X90.244 Y88.115 E-.04369
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I.231 J-1.195 P1  F42000
G1 X84.766 Y87.058 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.149 Y86.641 I.37 J-.044 E.01238
G1 X85.181 Y86.223 E.0081
G1 X85.303 Y86.232 E.00236
G3 X86.111 Y87.237 I-.377 J1.131 E.02626
G3 X85.404 Y88.786 I-.721 J.607 E.04098
G3 X84.69 Y87.752 I.177 J-.886 E.02679
G3 X84.546 Y86.458 I.605 J-.722 E.02772
G3 X85.122 Y86.218 I.595 J.618 E.0123
M106 S201.45
M106 S255
; WIPE_START
G1 X85.303 Y86.232 E-.06902
G1 X85.636 Y86.381 E-.13857
G1 X85.888 Y86.667 E-.1448
G1 X86.065 Y87.013 E-.14775
G1 X86.111 Y87.237 E-.0868
G1 X86.275 Y87.59 E-.14793
G1 X86.283 Y87.655 E-.02513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I-.351 J1.165 P1  F42000
G1 X94.525 Y90.14 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X94.51 Y90.115 E.00056
G3 X94.467 Y89.236 I5.021 J-.687 E.01698
G3 X94.847 Y89.023 I.366 J.208 E.00883
G1 X94.866 Y88.604 E.0081
G3 X95.605 Y89.23 I-.013 J.764 E.02024
G1 X95.669 Y89.578 E.00682
G2 X96.505 Y89.626 I.526 J-1.867 E.01628
G1 X96.595 Y89.344 E.00571
G2 X97.034 Y88.976 I-11.272 J-13.867 E.01103
G3 X98.116 Y89.392 I.35 J.703 E.02514
G1 X98.614 Y89.615 E.01052
G3 X99.822 Y90.73 I.292 J.895 E.03851
G3 X98.146 Y90.749 I-.844 J-.461 E.03927
G1 X97.55 Y90.778 E.0115
G3 X96.01 Y90.718 I-.75 J-.534 E.0352
G2 X94.959 Y90.794 I-.445 J1.146 E.02098
G3 X94.072 Y89.686 I-.021 J-.893 E.03161
G3 X94.807 Y88.601 I.772 J-.269 E.02932
M106 S201.45
; WIPE_START
G1 X95.27 Y88.717 E-.18148
G1 X95.463 Y88.943 E-.11278
G1 X95.605 Y89.23 E-.12195
G1 X95.669 Y89.578 E-.13438
G1 X95.91 Y89.63 E-.09392
G1 X96.214 Y89.628 E-.11548
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I.653 J-1.027 P1  F42000
G1 X82.8 Y81.1 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X80.801 Y81.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.8
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.8 F4000
            G39.3 S1
            G0 Z5.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.4 Y80.65 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F3386
M204 S6000
G1 X82.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X80.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.194 Y84.494 Z5.8 F42000
G1 X92.601 Y87.646 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3386
M204 S6000
G1 X92.099 Y87.646 E.0104
G1 X92.099 Y86.499 E.02379
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y87.586 E.01007
M204 S250
G1 X93 Y88.045 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y88.045 E.02379
G1 X91.7 Y86.1 E.0356
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y87.985 E.00888
M204 S10000
G1 X92.35 Y87.434 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.10445
G1 F3386
M204 S6000
G1 X92.35 Y86.889 E.0021
G1 X92.369 Y86.85 E.00017
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I-1.156 J.382 P1  F42000
G1 X99.401 Y93.501 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3386
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y92.354 E.02379
G1 X92.601 Y92.354 E.0104
G1 X92.601 Y92.899 E.01131
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y91.955 E.0356
G1 X93 Y91.955 E.02379
G1 X93 Y92.5 E.00998
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
M204 S10000
G1 X99.189 Y93.2 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F3386
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.10445
G1 X92.35 Y93.111 E.00017
G1 X92.35 Y92.566 E.0021
; WIPE_START
G1 F15000
G1 X92.35 Y93.111 E-.70421
G1 X92.369 Y93.15 E-.05579
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I-.131 J-1.21 P1  F42000
G1 X81.977 Y94.277 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3386
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F3386
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F3386
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z5.8 F42000
G1 X82.8 Y99.8 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F3386
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/82
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.8 I1.096 J.528 P1  F42000
G1 X85.227 Y93.478 Z5.8
G1 Z5.52
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X85.608 Y92.975 I.377 J-.11 E.01412
G1 X85.625 Y92.555 E.0081
G3 X86.792 Y92.944 I-.055 J2.108 E.02405
G3 X85.72 Y94.142 I-.573 J.566 E.04682
G3 X85.553 Y92.554 I-.134 J-.789 E.0504
M106 S201.45
M106 S255
; WIPE_START
G1 X85.862 Y92.555 E-.11758
G1 X86.437 Y92.716 E-.22672
G1 X86.792 Y92.944 E-.16038
G1 X86.999 Y93.406 E-.19227
G1 X87.007 Y93.572 E-.06305
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.92 I1.188 J-.265 P1  F42000
G1 X86.245 Y90.158 Z5.92
G1 Z5.52
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X86.783 Y89.78 I.521 J.169 E.01359
G1 X86.805 Y89.361 E.0081
G3 X87.14 Y90.884 I-.133 J.828 E.03861
G3 X86.44 Y91.155 I-.759 J-.922 E.01471
G3 X84.712 Y91.117 I-.857 J-.355 E.04289
G3 X85.51 Y90.123 I.826 J-.155 E.02791
G2 X86.145 Y89.595 I-.349 J-1.067 E.01629
G3 X86.745 Y89.358 I.622 J.698 E.01271
M106 S201.45
M106 S255
; WIPE_START
G1 X87.04 Y89.411 E-.1137
G1 X87.238 Y89.544 E-.09062
G1 X87.393 Y89.724 E-.09023
G1 X87.469 Y89.931 E-.08375
G1 X87.464 Y90.394 E-.17619
G1 X87.341 Y90.66 E-.11143
G1 X87.175 Y90.844 E-.09408
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.92 I-.537 J1.092 P1  F42000
G1 X88.526 Y91.509 Z5.92
G1 Z5.52
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X89.293 Y91.411 I.015 J-2.926 E.01495
G1 X89.336 Y90.993 E.00811
G3 X89.975 Y91.889 I-.081 J.733 E.02396
G1 X90.054 Y92.392 E.0098
G3 X88.644 Y93.029 I-.591 J.571 E.06064
G2 X87.924 Y92.606 I-.838 J.604 E.01657
G3 X88.356 Y91.098 I.32 J-.724 E.04376
G2 X89.281 Y90.977 I-.239 J-5.395 E.018
M106 S201.45
M106 S255
; WIPE_START
G1 X89.605 Y91.076 E-.12864
G1 X89.808 Y91.234 E-.09783
G1 X89.944 Y91.452 E-.09759
G1 X90.005 Y91.734 E-.10964
G1 X89.975 Y91.889 E-.06017
G1 X90.054 Y92.392 E-.19323
G1 X90.136 Y92.565 E-.0729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.92 I1.166 J-.35 P1  F42000
G1 X88.475 Y87.029 Z5.92
G1 Z5.52
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.205 Y86.974 I.407 J.527 E.01495
G1 X89.436 Y86.886 E.00476
G1 X89.444 Y86.463 E.00815
G3 X90.119 Y87.711 I.013 J.799 E.03363
G3 X90.388 Y88.669 I-5.353 J2.021 E.01921
G3 X88.784 Y88.438 I-.814 J-.031 E.05264
G1 X88.466 Y87.995 E.01051
G3 X89.165 Y86.54 I.327 J-.738 E.04987
G1 X89.385 Y86.455 E.00455
M106 S201.45
M106 S255
; WIPE_START
G1 X89.839 Y86.57 E-.17791
G1 X90.177 Y86.889 E-.17648
G1 X90.246 Y87.112 E-.08865
G1 X90.235 Y87.368 E-.09727
G1 X90.119 Y87.711 E-.13768
G1 X90.189 Y87.915 E-.08202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.92 I.177 J-1.204 P1  F42000
G1 X84.773 Y87.12 Z5.92
G1 Z5.52
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.055 Y86.622 I.378 J-.115 E.01235
G1 X85.057 Y86.202 E.0081
G3 X85.996 Y86.93 I.001 J.967 E.02466
G1 X86.07 Y87.303 E.00732
M73 P68 R6
G3 X85.381 Y88.817 I-.644 J.621 E.04115
G3 X84.697 Y87.723 I.212 J-.894 E.02757
G3 X84.998 Y86.201 I.467 J-.698 E.03811
M106 S201.45
M106 S255
; WIPE_START
G1 X85.616 Y86.351 E-.24162
G1 X85.822 Y86.588 E-.1193
G1 X85.996 Y86.93 E-.14591
G1 X86.07 Y87.303 E-.1443
G1 X86.207 Y87.554 E-.10887
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.92 I-.36 J1.163 P1  F42000
G1 X94.525 Y90.128 Z5.92
G1 Z5.52
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X94.43 Y89.34 I-3.619 J.037 E.01534
G3 X94.838 Y89.012 I.375 J.048 E.01114
G1 X94.94 Y88.605 E.0081
G3 X95.634 Y89.506 I-.114 J.806 E.02428
G1 X95.828 Y89.593 E.0041
G1 X96.56 Y89.709 E.01428
G1 X96.495 Y89.329 E.00744
G2 X97.169 Y88.908 I-4.874 J-8.557 E.01532
G3 X98.147 Y89.4 I.224 J.772 E.0232
G1 X98.629 Y89.653 E.01051
G3 X99.857 Y90.744 I.333 J.862 E.039
G3 X98.172 Y90.715 I-.834 J-.46 E.03983
G1 X97.577 Y90.721 E.01149
G3 X96.101 Y90.92 I-.824 J-.538 E.03256
G1 X95.924 Y90.645 E.0063
G1 X95.326 Y90.646 E.01153
G3 X94.08 Y90.178 I-.484 J-.605 E.03088
G2 X93.991 Y89.378 I-2.113 J-.171 E.01562
G3 X94.882 Y88.59 I.82 J.03 E.02564
M106 S201.45
; WIPE_START
G1 X95.199 Y88.687 E-.12582
G1 X95.434 Y88.879 E-.1152
G1 X95.574 Y89.172 E-.12343
G1 X95.634 Y89.506 E-.12909
G1 X95.828 Y89.593 E-.08092
G1 X96.31 Y89.67 E-.18555
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.92 I.652 J-1.028 P1  F42000
G1 X82.8 Y81.1 Z5.92
G1 Z5.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X80.801 Y81.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.92 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.92
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.92 F4000
            G39.3 S1
            G0 Z5.92 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.4 Y80.65 F42000
G1 Z5.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F3198
M204 S6000
G1 X82.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X80.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.205 Y84.475 Z5.92 F42000
G1 X92.601 Y87.599 Z5.92
G1 Z5.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3198
M204 S6000
G1 X92.099 Y87.599 E.0104
G1 X92.099 Y86.499 E.02281
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y87.539 E.00909
M204 S250
G1 X93 Y87.998 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y87.998 E.02379
G1 X91.7 Y86.1 E.03473
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y87.938 E.00802
M204 S10000
G1 X92.35 Y87.387 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104574
G1 F3198
M204 S6000
G1 X92.35 Y86.889 E.00192
G1 X92.369 Y86.85 E.00017
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.92 I-1.156 J.382 P1  F42000
G1 X99.401 Y93.501 Z5.92
G1 Z5.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3198
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y92.401 E.02281
G1 X92.601 Y92.401 E.0104
G1 X92.601 Y92.899 E.01033
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y92.002 E.03473
G1 X93 Y92.002 E.02379
G1 X93 Y92.5 E.00911
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
M204 S10000
G1 X99.189 Y93.2 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F3198
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.104574
G1 X92.35 Y93.111 E.00017
G1 X92.35 Y92.613 E.00192
; WIPE_START
G1 F15000
G1 X92.35 Y93.111 E-.69935
G1 X92.369 Y93.15 E-.06065
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.92 I-.131 J-1.21 P1  F42000
G1 X81.977 Y94.277 Z5.92
G1 Z5.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3198
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F3198
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z5.92 F42000
G1 Z5.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F3198
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z5.92 F42000
G1 X82.8 Y99.8 Z5.92
G1 Z5.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F3198
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/82
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.92 I1.103 J.515 P1  F42000
G1 X85.185 Y93.381 Z5.92
G1 Z5.64
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X85.55 Y92.993 I.398 J.008 E.01125
G1 X85.56 Y92.573 E.0081
G3 X86.769 Y92.946 I-.173 J2.705 E.02462
G3 X86.637 Y94.203 I-.529 J.58 E.02833
G3 X85.741 Y94.133 I-.397 J-.691 E.01841
G3 X84.766 Y93.605 I-.154 J-.881 E.02307
G3 X85.501 Y92.571 I.875 J-.156 E.02723
M106 S201.45
M106 S255
; WIPE_START
G1 X85.802 Y92.578 E-.11461
G1 X86.525 Y92.777 E-.28486
G1 X86.769 Y92.946 E-.11274
G1 X87.021 Y93.449 E-.21375
G1 X87.027 Y93.538 E-.03404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I1.181 J-.293 P1  F42000
G1 X86.206 Y90.227 Z6.04
G1 Z5.64
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X86.469 Y89.869 I-.675 J-.773 E.00863
G3 X86.79 Y89.759 I.309 J.377 E.00668
G1 X86.91 Y89.356 E.0081
G3 X87.356 Y90.615 I-.157 J.764 E.0309
G3 X86.527 Y91.058 I-.887 J-.662 E.0187
G3 X85.523 Y91.726 I-1.299 J-.863 E.02389
G3 X84.691 Y90.884 I-.044 J-.788 E.02579
G3 X85.5 Y90.154 I.859 J.138 E.0227
G1 X85.969 Y89.879 E.01049
G3 X86.854 Y89.337 I.798 J.31 E.02149
M106 S201.45
M106 S255
; WIPE_START
G1 X87.298 Y89.539 E-.18527
G1 X87.438 Y89.68 E-.0755
G1 X87.505 Y89.861 E-.07319
G1 X87.475 Y90.354 E-.18772
G1 X87.356 Y90.615 E-.10899
G1 X87.16 Y90.83 E-.11068
G1 X87.118 Y90.855 E-.01866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I-.563 J1.079 P1  F42000
G1 X88.411 Y91.53 Z6.04
G1 Z5.64
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X89.254 Y91.396 I-1.191 J-10.21 E.01648
G1 X89.262 Y90.976 E.0081
G3 X89.991 Y91.926 I.001 J.753 E.02668
G1 X90.047 Y92.431 E.00979
G3 X89.518 Y93.803 I-.593 J.56 E.03533
G3 X88.652 Y92.99 I.081 J-.954 E.0247
G2 X87.731 Y92.493 I-3.014 J4.483 E.02022
G3 X88.428 Y91.11 I.473 J-.629 E.04226
G2 X89.204 Y90.97 I-1.918 J-12.818 E.0152
M106 S201.45
M106 S255
; WIPE_START
G1 X89.619 Y91.057 E-.16127
G1 X89.815 Y91.216 E-.096
G1 X89.956 Y91.433 E-.09833
G1 X90.021 Y91.684 E-.09855
G1 X89.991 Y91.926 E-.09275
G1 X90.047 Y92.431 E-.19309
G1 X90.071 Y92.478 E-.02002
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I1.179 J-.303 P1  F42000
G1 X88.647 Y86.932 Z6.04
G1 Z5.64
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.092 Y87.008 I.146 J.489 E.00902
G1 X89.382 Y86.898 E.00598
G1 X89.438 Y86.482 E.0081
G3 X90.143 Y87.638 I.077 J.746 E.03254
G2 X90.385 Y88.699 I11.42 J-2.045 E.02099
G3 X88.802 Y88.442 I-.806 J-.039 E.05239
G1 X88.486 Y87.996 E.01053
G3 X88.125 Y86.735 I.256 J-.755 E.02967
G3 X89.104 Y86.554 I.641 J.73 E.02014
G3 X89.38 Y86.474 I.3 J.521 E.00559
M106 S201.45
M106 S255
; WIPE_START
G1 X89.87 Y86.573 E-.1902
M73 P68 R5
G1 X90.073 Y86.704 E-.09176
G1 X90.21 Y86.877 E-.08391
G1 X90.273 Y87.079 E-.08019
G1 X90.259 Y87.323 E-.09308
G1 X90.143 Y87.638 E-.12723
G1 X90.175 Y87.882 E-.09364
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I.16 J-1.206 P1  F42000
G1 X84.806 Y87.17 Z6.04
G1 Z5.64
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.042 Y86.599 I.342 J-.193 E.01371
G1 X85.121 Y86.187 E.0081
G3 X85.968 Y87.046 I-.065 J.911 E.02541
G3 X86.292 Y88.04 I-2.562 J1.384 E.02025
G3 X84.713 Y87.914 I-.794 J-.002 E.05048
G3 X84.335 Y87.032 I2.115 J-1.428 E.0186
G3 X85.063 Y86.175 I.771 J-.082 E.02423
M106 S201.45
M106 S255
; WIPE_START
G1 X85.437 Y86.278 E-.14752
G1 X85.712 Y86.453 E-.12376
G1 X85.929 Y86.848 E-.17109
G1 X85.968 Y87.046 E-.07695
G1 X86.214 Y87.63 E-.24067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I-.362 J1.162 P1  F42000
G1 X94.582 Y90.235 Z6.04
G1 Z5.64
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.568 Y89.659 I.516 J-.302 E.01159
G3 X94.757 Y88.991 I.296 J-.277 E.01608
G1 X94.83 Y88.577 E.0081
G3 X95.612 Y89.518 I-.097 J.876 E.02606
G2 X96.29 Y89.717 I.815 J-1.514 E.01372
G2 X96.982 Y88.982 I-515.319 J-485.609 E.01946
G3 X98.163 Y89.382 I.438 J.651 E.02779
G1 X98.61 Y89.694 E.01051
G3 X99.92 Y90.501 I.374 J.861 E.03476
G3 X98.484 Y91.009 I-.846 J-.105 E.03636
G1 X98.233 Y90.72 E.00737
G2 X97.495 Y90.76 I-.323 J.871 E.01467
G3 X95.939 Y90.688 I-.757 J-.489 E.03626
M73 P69 R5
G1 X95.343 Y90.647 E.0115
G3 X94.189 Y90.396 I-.5 J-.48 E.02727
G3 X94.123 Y89.735 I.664 J-.4 E.01324
G3 X94.771 Y88.566 I.687 J-.383 E.03079
M106 S201.45
; WIPE_START
G1 X95.089 Y88.644 E-.12432
G1 X95.446 Y88.9 E-.16656
G1 X95.612 Y89.518 E-.24314
G1 X96.182 Y89.686 E-.22597
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I.657 J-1.024 P1  F42000
G1 X82.8 Y81.1 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X80.801 Y81.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.04
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.04 F4000
            G39.3 S1
            G0 Z6.04 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.4 Y80.65 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F3191
M204 S6000
G1 X82.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X80.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.21 Y84.467 Z6.04 F42000
G1 X92.601 Y87.581 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3191
M204 S6000
G1 X92.099 Y87.581 E.0104
G1 X92.099 Y86.499 E.02244
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y87.521 E.00872
M204 S250
G1 X93 Y87.98 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y87.98 E.02379
G1 X91.7 Y86.1 E.03441
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y87.92 E.00769
M204 S10000
G1 X92.35 Y87.369 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104626
G1 F3191
M204 S6000
G1 X92.35 Y86.889 E.00185
G1 X92.369 Y86.85 E.00017
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I-1.156 J.382 P1  F42000
G1 X99.401 Y93.501 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3191
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y92.419 E.02244
G1 X92.601 Y92.419 E.0104
G1 X92.601 Y92.899 E.00996
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y92.02 E.03441
G1 X93 Y92.02 E.02379
G1 X93 Y92.5 E.00879
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
M204 S10000
G1 X99.189 Y93.2 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F3191
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.104626
G1 X92.35 Y93.111 E.00017
G1 X92.35 Y92.631 E.00185
; WIPE_START
G1 F15000
G1 X92.35 Y93.111 E-.69729
G1 X92.369 Y93.15 E-.06271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I-.131 J-1.21 P1  F42000
G1 X81.977 Y94.277 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3191
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F3191
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F3191
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z6.04 F42000
G1 X82.8 Y99.8 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F3191
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/82
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.04 I1.102 J.516 P1  F42000
G1 X85.18 Y93.412 Z6.04
G1 Z5.76
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X85.18 Y93.412 E.00001
G3 X85.538 Y93.009 I.371 J-.032 E.01161
G1 X85.547 Y92.589 E.0081
G3 X86.066 Y92.728 I-.144 J1.583 E.01041
G3 X86.949 Y93.249 I.06 J.906 E.021
G3 X86.436 Y94.264 I-.577 J.346 E.02612
G3 X85.763 Y94.123 I-.182 J-.812 E.01367
G3 X84.725 Y93.703 I-.235 J-.912 E.02311
G3 X85.488 Y92.588 I.951 J-.169 E.02886
M106 S201.45
M106 S255
; WIPE_START
G1 X85.744 Y92.595 E-.09742
G1 X86.066 Y92.728 E-.13234
G1 X86.593 Y92.829 E-.20383
G1 X86.949 Y93.249 E-.20936
G1 X87.049 Y93.502 E-.10354
G1 X87.045 Y93.538 E-.01352
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.16 I1.173 J-.324 P1  F42000
G1 X86.149 Y90.294 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X86.407 Y89.96 I-.079 J-.328 E.00877
G3 X86.655 Y89.765 I.423 J.282 E.00619
G1 X86.654 Y89.345 E.0081
G3 X87.491 Y89.642 I.03 J1.243 E.0175
G3 X86.651 Y90.976 I-.965 J.324 E.03476
G1 X86.229 Y91.254 E.00974
G3 X84.663 Y91.134 I-.757 J-.396 E.03841
G3 X85.515 Y90.185 I.89 J-.058 E.0274
G1 X85.98 Y89.906 E.01045
G3 X86.595 Y89.345 I.949 J.424 E.0165
M106 S201.45
M106 S255
; WIPE_START
G1 X87.154 Y89.425 E-.21467
G1 X87.491 Y89.642 E-.1523
G1 X87.556 Y89.812 E-.06913
G1 X87.55 Y90.033 E-.08428
G1 X87.367 Y90.569 E-.21515
G1 X87.324 Y90.617 E-.02448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.16 I.985 J-.714 P1  F42000
G1 X84.829 Y87.174 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X84.905 Y86.582 I.539 J-.232 E.01206
G1 X84.973 Y86.576 E.00133
G1 X85.062 Y86.166 E.0081
G3 X85.905 Y86.977 I-.11 J.957 E.02422
G1 X86.046 Y87.434 E.00922
G3 X84.755 Y88.387 I-.554 J.601 E.05546
G2 X84.581 Y87.523 I-2.207 J-.005 E.01711
G3 X84.801 Y86.17 I.635 J-.591 E.03048
G1 X85.005 Y86.152 E.00394
M106 S201.45
M106 S255
; WIPE_START
G1 X85.289 Y86.222 E-.11112
G1 X85.682 Y86.466 E-.17577
G1 X85.863 Y86.764 E-.13263
G1 X85.905 Y86.977 E-.08234
G1 X86.046 Y87.434 E-.1818
G1 X86.143 Y87.609 E-.07633
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.16 I.312 J1.176 P1  F42000
G1 X88.659 Y86.942 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.45 Y86.923 I.69 J11.975 E.01527
G1 X89.482 Y86.504 E.0081
G3 X90.288 Y87.268 I.1 J.702 E.02461
G3 X90.07 Y87.682 I-.856 J-.187 E.00913
G2 X90.37 Y88.555 I4.077 J-.912 E.01783
G3 X90.366 Y88.774 I-1.282 J.085 E.00422
G3 X89.919 Y89.454 I-.718 J.015 E.01667
G3 X88.823 Y88.545 I-.256 J-.807 E.0326
G2 X88.122 Y87.676 I-1.857 J.779 E.02182
G3 X88.623 Y86.521 I.434 J-.498 E.03214
G3 X89.423 Y86.5 I.906 J18.816 E.01542
M106 S201.45
M106 S255
; WIPE_START
G1 X89.913 Y86.582 E-.18894
G1 X90.121 Y86.711 E-.09315
G1 X90.301 Y87.047 E-.14496
G1 X90.288 Y87.268 E-.08413
G1 X90.07 Y87.682 E-.17784
G1 X90.131 Y87.859 E-.07098
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.16 I-1.1 J-.521 P1  F42000
G1 X88.388 Y91.537 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X89.173 Y91.389 I.086 J-1.698 E.01556
G1 X89.181 Y90.969 E.0081
G3 X90.014 Y92.014 I.018 J.84 E.02977
G1 X90.082 Y92.528 E.00999
G3 X89.753 Y93.811 I-.771 J.486 E.02859
G3 X88.696 Y93.061 I-.1 J-.978 E.02727
G2 X87.75 Y92.519 I-1.455 J1.445 E.02127
G3 X87.542 Y91.305 I.527 J-.716 E.02624
G3 X88.386 Y91.117 I.72 J1.244 E.01693
G2 X89.122 Y90.968 I-.113 J-2.454 E.01454
M106 S201.45
M106 S255
; WIPE_START
G1 X89.614 Y91.065 E-.19081
G1 X89.808 Y91.217 E-.09343
G1 X89.945 Y91.423 E-.09387
G1 X90.022 Y91.694 E-.10725
G1 X90.014 Y92.014 E-.12166
G1 X90.067 Y92.413 E-.15298
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.16 I.508 J1.106 P1  F42000
G1 X94.629 Y90.315 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.615 Y88.995 I1.254 J-.673 E.02647
G3 X94.713 Y88.973 I.079 J.123 E.00197
G1 X94.791 Y88.56 E.0081
G3 X95.572 Y89.448 I-.101 J.876 E.02498
G2 X96.165 Y89.77 I1.311 J-1.706 E.01306
G1 X96.321 Y89.718 E.00318
G1 X96.686 Y89.354 E.00993
G3 X97.556 Y88.789 I.774 J.241 E.02168
G3 X98.197 Y89.552 I-.549 J1.113 E.01977
G1 X98.752 Y89.713 E.01114
G3 X99.748 Y89.943 I.293 J1.002 E.0206
G3 X99.174 Y91.286 I-.686 J.501 E.03389
G3 X98.304 Y90.666 I.194 J-1.192 E.02132
G2 X97.405 Y90.806 I-.343 J.753 E.01857
G3 X96.546 Y91.246 I-.986 J-.867 E.01906
G3 X95.96 Y90.73 I.498 J-1.155 E.0153
G1 X95.369 Y90.644 E.01151
G3 X94.186 Y90.33 I-.526 J-.405 E.03003
G3 X94.208 Y88.818 I2.156 J-.725 E.02973
G1 X94.357 Y88.655 E.00426
G3 X94.733 Y88.547 I.336 J.463 E.0077
M106 S201.45
; WIPE_START
G1 X94.974 Y88.601 E-.0937
G1 X95.296 Y88.797 E-.14322
G1 X95.51 Y89.047 E-.12524
G1 X95.572 Y89.448 E-.15392
G1 X96.136 Y89.754 E-.24392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.16 I.662 J-1.021 P1  F42000
G1 X82.8 Y81.1 Z6.16
G1 Z5.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X80.801 Y81.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.16
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.16 F4000
            G39.3 S1
            G0 Z6.16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.4 Y80.65 F42000
G1 Z5.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F3189
M204 S6000
G1 X82.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X80.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.208 Y84.471 Z6.16 F42000
G1 X92.601 Y87.59 Z6.16
G1 Z5.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3189
M204 S6000
G1 X92.099 Y87.59 E.0104
G1 X92.099 Y86.499 E.02262
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y87.53 E.0089
M204 S250
G1 X93 Y87.989 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y87.989 E.02379
G1 X91.7 Y86.1 E.03457
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y87.929 E.00785
M204 S10000
G1 X92.35 Y87.378 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.1046
G1 F3189
M204 S6000
G1 X92.35 Y86.889 E.00189
G1 X92.369 Y86.85 E.00017
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.16 I-1.156 J.382 P1  F42000
G1 X99.401 Y93.501 Z6.16
G1 Z5.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3189
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y92.41 E.02262
G1 X92.601 Y92.41 E.0104
G1 X92.601 Y92.899 E.01015
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y92.011 E.03457
G1 X93 Y92.011 E.02379
G1 X93 Y92.5 E.00895
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
M204 S10000
G1 X99.189 Y93.2 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F3189
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.1046
G1 X92.35 Y93.111 E.00017
G1 X92.35 Y92.622 E.00189
; WIPE_START
M73 P70 R5
G1 F15000
G1 X92.35 Y93.111 E-.69833
G1 X92.369 Y93.15 E-.06167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.16 I-.131 J-1.21 P1  F42000
G1 X81.977 Y94.277 Z6.16
G1 Z5.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3189
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F3189
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z6.16 F42000
G1 Z5.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F3189
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z6.16 F42000
G1 X82.8 Y99.8 Z6.16
G1 Z5.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F3189
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/82
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.16 I1.104 J.513 P1  F42000
G1 X85.12 Y93.496 Z6.16
G1 Z5.88
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X85.596 Y93.025 I.52 J.05 E.01401
G1 X85.659 Y92.609 E.00811
G3 X86.059 Y92.787 I-.199 J.986 E.0085
G3 X86.98 Y93.315 I.113 J.869 E.02199
G3 X86.472 Y94.245 I-.517 J.321 E.02477
G3 X85.777 Y94.106 I-.067 J-1.47 E.01381
G3 X84.768 Y93.911 I-.21 J-1.621 E.02014
G3 X84.799 Y93.2 I.595 J-.33 E.01443
G3 X85.602 Y92.596 I.765 J.181 E.021
M106 S201.45
M106 S255
; WIPE_START
G1 X86.059 Y92.787 E-.18824
G1 X86.478 Y92.825 E-.15983
G1 X86.801 Y93.08 E-.15646
G1 X86.98 Y93.315 E-.11238
G1 X87.078 Y93.551 E-.09694
G1 X87.065 Y93.672 E-.04615
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.28 I1.181 J-.295 P1  F42000
G1 X86.216 Y90.279 Z6.28
G1 Z5.88
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X86.5 Y89.86 I-.646 J-.744 E.00986
G1 X86.575 Y89.81 E.00174
G3 X86.788 Y89.779 I.164 J.379 E.00419
G1 X86.897 Y89.373 E.0081
G3 X87.606 Y89.762 I.103 J.654 E.01678
G3 X86.698 Y90.913 I-1.114 J.055 E.03084
G1 X86.238 Y91.126 E.00978
G3 X84.659 Y91.252 I-.823 J-.354 E.03746
G3 X85.539 Y90.216 I.955 J-.081 E.02913
G1 X86 Y89.919 E.01057
G3 X86.84 Y89.357 I.744 J.205 E.02123
M106 S201.45
M106 S255
; WIPE_START
G1 X87.419 Y89.488 E-.22581
G1 X87.606 Y89.762 E-.12588
G1 X87.599 Y89.97 E-.07907
G1 X87.321 Y90.6 E-.26173
G1 X87.176 Y90.703 E-.06751
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.28 I-.713 J.986 P1  F42000
G1 X88.349 Y91.55 Z6.28
G1 Z5.88
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X89.07 Y91.396 E.01422
G3 X89.134 Y91.353 I.078 J.046 E.00155
G1 X89.19 Y90.936 E.0081
G3 X90.036 Y92.122 I-.091 J.96 E.03184
G3 X90.165 Y93.389 I-3.99 J1.046 E.02463
G3 X89.145 Y93.662 I-.577 J-.111 E.02533
G3 X88.75 Y92.908 I.391 J-.685 E.01734
G1 X88.234 Y92.637 E.01123
G3 X87.352 Y91.779 I.067 J-.952 E.02577
G3 X87.991 Y91.139 I.527 J-.113 E.02067
G2 X89.132 Y90.926 I.012 J-3.097 E.02251
M106 S201.45
M106 S255
; WIPE_START
G1 X89.616 Y91.078 E-.19273
G1 X89.801 Y91.218 E-.08817
G1 X90.073 Y91.752 E-.22786
G1 X90.093 Y91.943 E-.07299
G1 X90.036 Y92.122 E-.07139
G1 X90.086 Y92.399 E-.10686
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.28 I1.178 J-.307 P1  F42000
G1 X88.668 Y86.963 Z6.28
G1 Z5.88
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.191 Y87.031 I-.023 J2.223 E.01019
G3 X89.513 Y86.952 I.362 J.777 E.00644
G1 X89.514 Y86.532 E.0081
G3 X90.332 Y87.016 I.139 J.699 E.02006
G3 X89.894 Y87.891 I-1.241 J-.074 E.01939
G1 X90.25 Y88.122 E.00819
G2 X90.366 Y88.773 I3.426 J-.274 E.01275
G3 X90.245 Y89.312 I-1.761 J-.111 E.01069
G3 X89.47 Y89.45 I-.506 J-.594 E.01592
G3 X88.859 Y88.487 I.191 J-.797 E.0243
G1 X88.608 Y88.007 E.01043
G3 X87.858 Y87.156 I.495 J-1.193 E.02265
G3 X88.791 Y86.545 I.742 J.115 E.02424
G2 X89.455 Y86.529 I.287 J-1.924 E.01286
M106 S201.45
M106 S255
; WIPE_START
G1 X89.981 Y86.601 E-.20199
G1 X90.159 Y86.706 E-.07848
G1 X90.332 Y87.016 E-.13491
G1 X90.221 Y87.456 E-.17259
G1 X89.949 Y87.818 E-.17204
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.28 I.152 J-1.207 P1  F42000
G1 X84.866 Y87.177 Z6.28
G1 Z5.88
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X84.916 Y86.548 I.443 J-.281 E.01305
G1 X84.977 Y86.133 E.0081
G3 X85.866 Y87.027 I-.133 J1.021 E.02616
G1 X86.02 Y87.48 E.00922
G3 X86.279 Y88.35 I-.699 J.681 E.01821
G3 X84.846 Y88.679 I-.885 J-.571 E.03137
G3 X84.739 Y88.141 I.595 J-.397 E.01084
G2 X84.527 Y87.482 I-.462 J-.214 E.01467
G3 X84.56 Y86.263 I1.049 J-.582 E.02467
G3 X84.918 Y86.124 I.4 J.501 E.00753
M106 S201.45
M106 S255
; WIPE_START
G1 X85.193 Y86.185 E-.10713
G1 X85.521 Y86.381 E-.14501
G1 X85.798 Y86.676 E-.15387
G1 X85.866 Y87.027 E-.1356
G1 X86.02 Y87.48 E-.18185
G1 X86.066 Y87.564 E-.03655
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.28 I-.377 J1.157 P1  F42000
G1 X94.657 Y90.363 Z6.28
G1 Z5.88
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.61 Y89.77 I.644 J-.349 E.0118
G3 X94.661 Y88.946 I.613 J-.376 E.01694
G1 X94.714 Y88.53 E.0081
G3 X95.523 Y89.29 I-.183 J1.005 E.02262
G1 X95.493 Y89.489 E.00389
G1 X96.109 Y89.73 E.01275
G1 X96.38 Y89.671 E.00534
G3 X97.184 Y88.755 I19.206 J16.032 E.0235
G3 X97.942 Y89.081 I.174 J.64 E.01718
G3 X98.216 Y89.691 I-.78 J.717 E.0131
G2 X99.471 Y89.704 I.821 J-18.015 E.02419
G3 X99.888 Y90.291 I-.205 J.587 E.0148
G3 X99.336 Y91.336 I-1.028 J.125 E.02423
G3 X98.263 Y90.401 I.17 J-1.279 E.02906
G1 X97.543 Y90.362 E.0139
G1 X97.459 Y90.689 E.00652
G2 X97.161 Y91.006 I.764 J1.018 E.00843
G3 X96.438 Y91.264 I-.529 J-.341 E.01592
G2 X95.911 Y90.747 I-17.805 J17.615 E.01423
G2 X95.303 Y90.704 I-.404 J1.388 E.01183
G3 X94.218 Y90.411 I-.473 J-.405 E.02704
G3 X94.167 Y89.758 I1.323 J-.431 E.01274
G3 X94.459 Y88.561 I.834 J-.431 E.0259
G3 X94.655 Y88.522 I.254 J.753 E.00388
M106 S201.45
; WIPE_START
G1 X94.911 Y88.575 E-.09924
G1 X95.183 Y88.737 E-.12028
G1 X95.438 Y89.024 E-.14593
G1 X95.523 Y89.29 E-.10602
G1 X95.493 Y89.489 E-.07678
G1 X96.012 Y89.692 E-.21175
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.28 I.663 J-1.02 P1  F42000
G1 X82.8 Y81.1 Z6.28
G1 Z5.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X80.801 Y81.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.28 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.28
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.28 F4000
            G39.3 S1
            G0 Z6.28 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.4 Y80.65 F42000
G1 Z5.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F3234
M204 S6000
G1 X82.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X80.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.199 Y84.486 Z6.28 F42000
G1 X92.601 Y87.627 Z6.28
G1 Z5.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3234
M204 S6000
G1 X92.099 Y87.627 E.0104
G1 X92.099 Y86.499 E.02339
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y87.567 E.00966
M204 S250
G1 X93 Y88.026 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y88.026 E.02379
G1 X91.7 Y86.1 E.03524
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y87.966 E.00853
M204 S10000
G1 X92.35 Y87.415 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104499
G1 F3234
M204 S6000
G1 X92.35 Y86.889 E.00202
G1 X92.369 Y86.85 E.00017
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.28 I-1.156 J.382 P1  F42000
G1 X99.401 Y93.501 Z6.28
G1 Z5.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3234
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y92.373 E.02339
G1 X92.601 Y92.373 E.0104
G1 X92.601 Y92.899 E.01091
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y91.974 E.03524
G1 X93 Y91.974 E.02379
G1 X93 Y92.5 E.00962
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
M204 S10000
G1 X99.189 Y93.2 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F3234
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.104499
G1 X92.35 Y93.111 E.00017
G1 X92.35 Y92.585 E.00202
; WIPE_START
G1 F15000
G1 X92.35 Y93.111 E-.70231
G1 X92.369 Y93.15 E-.05769
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.28 I-.131 J-1.21 P1  F42000
G1 X81.977 Y94.277 Z6.28
G1 Z5.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3234
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F3234
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z6.28 F42000
G1 Z5.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F3234
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z6.28 F42000
G1 X82.8 Y99.8 Z6.28
G1 Z5.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F3234
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/82
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.28 I1.103 J.515 P1  F42000
G1 X85.176 Y93.406 Z6.28
G1 Z6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X85.618 Y93.049 I.425 J.073 E.01196
G1 X85.618 Y92.629 E.0081
G3 X87.107 Y93.594 I-.081 J1.754 E.03585
M73 P71 R5
G3 X86.558 Y94.22 I-.518 J.099 E.01849
G3 X85.763 Y94.048 I-.073 J-1.585 E.01585
G3 X84.767 Y93.976 I-.369 J-1.835 E.01948
G3 X84.73 Y93.303 I.321 J-.356 E.01443
G3 X85.559 Y92.629 I1.003 J.386 E.02156
M106 S201.45
M106 S255
; WIPE_START
G1 X85.757 Y92.629 E-.07529
G1 X86.36 Y92.838 E-.24243
G1 X86.606 Y92.976 E-.1071
G1 X86.826 Y93.153 E-.10725
G1 X87.107 Y93.594 E-.1988
G1 X87.113 Y93.67 E-.02913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.101 J.518 P1  F42000
G1 X88.092 Y91.591 Z6.4
G1 Z6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.911 Y91.491 I.847 J3.56 E.01593
G1 X89.112 Y91.308 E.00524
G1 X89.114 Y90.886 E.00813
G3 X90.142 Y91.971 I-.286 J1.301 E.03058
G2 X90.13 Y92.843 I.833 J.448 E.01748
G3 X89.752 Y93.883 I-.735 J.321 E.02353
G3 X88.784 Y93.016 I.143 J-1.133 E.02664
G1 X88.356 Y92.615 E.0113
G3 X87.39 Y91.922 I-.009 J-1.008 E.02451
G3 X87.864 Y91.143 I.361 J-.314 E.0233
G2 X88.73 Y91.088 I.286 J-2.323 E.01682
G3 X89.055 Y90.882 I.574 J.544 E.0075
M106 S201.45
M106 S255
; WIPE_START
G1 X89.281 Y90.919 E-.08726
G1 X89.762 Y91.23 E-.2175
G1 X90.024 Y91.595 E-.17065
G1 X90.142 Y91.971 E-.14965
G1 X90.023 Y92.199 E-.09797
G1 X90.039 Y92.295 E-.03697
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I.654 J-1.027 P1  F42000
G1 X86.433 Y89.999 Z6.4
G1 Z6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X86.897 Y89.827 I.328 J.172 E.01046
G3 X87.085 Y89.802 I.148 J.389 E.00369
G1 X87.12 Y89.383 E.0081
G3 X87.559 Y90.141 I.052 J.476 E.02132
G3 X86.708 Y90.858 I-1.091 J-.432 E.02234
G1 X86.517 Y90.824 E.00374
G3 X85.847 Y91.507 I-10.619 J-9.749 E.01843
G3 X84.661 Y91.347 I-.495 J-.803 E.025
G3 X85.15 Y90.376 I.797 J-.207 E.02289
G2 X85.954 Y90.018 I-2.954 J-7.722 E.01698
G3 X86.909 Y89.401 I.816 J.216 E.02403
G1 X87.061 Y89.379 E.00296
M106 S201.45
M106 S255
; WIPE_START
G1 X87.478 Y89.465 E-.16205
G1 X87.596 Y89.568 E-.05947
G1 X87.647 Y89.908 E-.1305
G1 X87.559 Y90.141 E-.0949
G1 X87.184 Y90.681 E-.24971
G1 X87.04 Y90.765 E-.06338
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.08 J.561 P1  F42000
G1 X88.964 Y87.059 Z6.4
G1 Z6
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X89.408 Y87.016 I.2 J-.248 E.00951
G3 X89.752 Y86.978 I.49 J2.871 E.00667
G1 X89.857 Y86.572 E.0081
G3 X90.261 Y87.38 I-.035 J.523 E.021
G1 X90.06 Y87.63 E.00618
G1 X90.124 Y88.205 E.01116
G3 X90.355 Y88.963 I-1.018 J.725 E.01554
G3 X89.796 Y89.513 I-.443 J.11 E.01821
G3 X88.873 Y88.768 I-.001 J-.943 E.02473
G3 X88.918 Y88.439 I.973 J-.035 E.00643
G1 X88.634 Y87.938 E.01109
G3 X87.822 Y87.025 I.334 J-1.114 E.0248
G3 X88.795 Y86.589 I.733 J.331 E.02247
G2 X89.275 Y86.613 I.275 J-.669 E.00943
G3 X89.796 Y86.556 I.45 J1.706 E.01014
M106 S201.45
M106 S255
; WIPE_START
G1 X90.199 Y86.702 E-.16288
G1 X90.312 Y86.829 E-.0647
G1 X90.349 Y87.173 E-.13141
G1 X90.261 Y87.38 E-.08549
G1 X90.06 Y87.63 E-.12178
G1 X90.117 Y88.136 E-.19374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I.222 J-1.197 P1  F42000
G1 X84.936 Y87.175 Z6.4
G1 Z6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X84.888 Y86.103 I1.479 J-.604 E.02108
G3 X85.808 Y86.974 I-.208 J1.142 E.02584
G2 X86.245 Y87.845 I1.421 J-.167 E.01916
G3 X86.015 Y88.609 I-.352 J.311 E.01839
G3 X84.875 Y88.767 I-.782 J-1.454 E.02266
G3 X84.761 Y88.048 I.358 J-.425 E.0153
G2 X84.452 Y87.088 I-3.484 J.592 E.0195
G3 X84.76 Y86.111 I.649 J-.333 E.02191
G1 X84.829 Y86.098 E.00134
M106 S201.45
M106 S255
; WIPE_START
G1 X85.093 Y86.145 E-.10205
G1 X85.376 Y86.307 E-.12388
G1 X85.687 Y86.633 E-.17138
G1 X85.808 Y86.974 E-.13729
G1 X85.919 Y87.438 E-.18142
G1 X85.991 Y87.529 E-.04399
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I-.339 J1.169 P1  F42000
G1 X94.625 Y90.031 Z6.4
G1 Z6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.676 Y89.63 I1.451 J-.02 E.00781
G3 X94.607 Y88.924 I.667 J-.421 E.01418
G1 X94.637 Y88.503 E.00815
G3 X95.514 Y89.435 I-.217 J1.083 E.02633
G2 X96.16 Y89.688 I1.104 J-1.87 E.01342
G2 X97.045 Y88.824 I-.526 J-1.425 E.02455
G3 X97.888 Y89.059 I.361 J.335 E.02076
G3 X97.751 Y90.295 I-.519 J.568 E.02792
G2 X96.917 Y91.262 I6.153 J6.143 E.02463
G3 X96.131 Y90.893 I-.291 J-.402 E.02038
G2 X95.72 Y90.664 I-.378 J.194 E.00961
G1 X95.21 Y90.75 E.00998
G3 X94.234 Y90.32 I-.432 J-.344 E.02793
G3 X94.235 Y89.688 I2.272 J-.31 E.01222
G3 X94.509 Y88.512 I.658 J-.466 E.02629
G1 X94.578 Y88.498 E.00136
M106 S201.45
M106 S255
; WIPE_START
G1 X94.821 Y88.537 E-.09349
G1 X95.078 Y88.683 E-.11211
G1 X95.325 Y88.952 E-.13879
G1 X95.514 Y89.435 E-.19735
G1 X96.049 Y89.645 E-.21826
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I-.235 J1.194 P1  F42000
G1 X98.947 Y90.215 Z6.4
G1 Z6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X99.437 Y90.094 I.903 J2.599 E.00974
G1 X99.56 Y89.688 E.00818
G1 X99.644 Y89.713 E.00169
G3 X99.861 Y90.311 I-.329 J.458 E.01303
G3 X99.482 Y91.337 I-1.434 J.053 E.02162
G3 X98.803 Y91.109 I-.203 J-.523 E.01499
G3 X99.097 Y89.743 I.297 J-.651 E.03735
G3 X99.503 Y89.671 I.342 J.755 E.00803
M106 S201.45
M106 S255
; WIPE_START
G1 X99.644 Y89.713 E-.0557
G1 X99.777 Y89.825 E-.06606
G1 X99.856 Y90.003 E-.07403
G1 X99.861 Y90.311 E-.11716
G1 X99.816 Y90.748 E-.16718
G1 X99.631 Y91.184 E-.17978
G1 X99.482 Y91.337 E-.08106
G1 X99.433 Y91.344 E-.01905
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I.638 J-1.036 P1  F42000
G1 X82.8 Y81.1 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X80.801 Y81.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.4
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.4 F4000
            G39.3 S1
            G0 Z6.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.4 Y80.65 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F15000
M204 S6000
G1 X82.6 Y80.65 E.05388
; WIPE_START
G1 X80.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.182 Y84.515 Z6.4 F42000
G1 X92.601 Y87.698 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X92.099 Y87.698 E.0104
G1 X92.099 Y86.499 E.02487
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y87.638 E.01115
M204 S250
G1 X93 Y88.066 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X93 Y88.098 E.00058
G1 X91.7 Y88.098 E.02379
G1 X91.7 Y88.066 E.00058
G1 X91.7 Y86.1 E.03597
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y88.006 E.00926
M204 S10000
G1 X92.35 Y87.486 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104335
G1 F15000
M204 S6000
G1 X92.35 Y86.889 E.0023
G1 X92.369 Y86.85 E.00017
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I-.642 J-1.034 P1  F42000
G1 X93.021 Y89.388 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.358834
G1 F600
M204 S1000
G1 X91.679 Y89.388 E.02184
G1 X91.679 Y89.342 E.00076
G1 X93.007 Y89.342 E.02162
M106 S201.45
M106 S255
; WIPE_START
M204 S6000
G1 X91.679 Y89.388 E-.50485
G1 X91.679 Y89.342 E-.0177
G1 X92.304 Y89.342 E-.23745
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.679 Y90.612 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F600
M204 S1000
G1 X93.021 Y90.612 E.02184
G1 X93.021 Y90.658 E.00076
G1 X91.693 Y90.658 E.02162
M106 S201.45
; WIPE_START
M204 S6000
G1 X93.021 Y90.612 E-.50485
G1 X93.021 Y90.658 E-.0177
G1 X92.396 Y90.658 E-.23745
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y93.501 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y92.302 E.02487
G1 X92.601 Y92.302 E.0104
G1 X92.601 Y92.899 E.0124
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y91.934 E.03597
G1 X91.7 Y91.902 E.00058
G1 X93 Y91.902 E.02379
G1 X93 Y91.934 E.00058
G1 X93 Y92.5 E.01036
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
M204 S10000
G1 X99.189 Y93.2 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F15000
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.104335
G1 X92.35 Y93.111 E.00017
G1 X92.35 Y92.514 E.0023
; WIPE_START
G1 X92.35 Y93.111 E-.70877
G1 X92.369 Y93.15 E-.05123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I-.131 J-1.21 P1  F42000
G1 X81.977 Y94.277 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F4800
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z6.4 F42000
G1 X82.8 Y99.8 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F15000
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/82
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.4 I1.099 J.522 P1  F42000
G1 X85.244 Y93.361 Z6.4
G1 Z6.12
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X85.719 Y93.024 I.587 J.325 E.0116
G1 X85.826 Y92.617 E.00812
G2 X86.888 Y93.258 I87.913 J-144.506 E.0239
G3 X86.629 Y94.194 I-.248 J.435 E.02555
G3 X85.849 Y93.995 I-.065 J-1.374 E.01573
G3 X84.637 Y93.935 I-.534 J-1.497 E.02402
G3 X84.907 Y93.106 I.647 J-.247 E.01818
G3 X85.77 Y92.6 I.911 J.563 E.02007
M106 S201.45
M106 S255
; WIPE_START
G1 X86.888 Y93.258 E-.49307
G1 X87.138 Y93.64 E-.17341
G1 X87.155 Y93.81 E-.06492
M73 P72 R5
G1 X87.116 Y93.874 E-.0286
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I1.101 J.519 P1  F42000
G1 X88.18 Y91.619 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X88.334 Y91.627 E.00298
G1 X88.981 Y91.395 E.01325
G1 X89.096 Y91.279 E.00314
G1 X89.124 Y90.846 E.00836
G3 X90.171 Y91.836 I-1.194 J2.313 E.02815
G3 X90.033 Y92.812 I-3.131 J.055 E.01908
G3 X89.902 Y93.872 I-.773 J.443 E.02208
G3 X89.088 Y93.507 I-.184 J-.68 E.01862
G3 X88.845 Y92.873 I1.194 J-.821 E.01321
G1 X88.343 Y92.614 E.01089
G3 X87.513 Y92.081 I.026 J-.955 E.01999
G3 X87.317 Y91.283 I.356 J-.511 E.0173
G3 X88.271 Y91.203 I.584 J1.242 E.01885
G1 X88.75 Y91.031 E.00981
G3 X89.065 Y90.84 I.351 J.222 E.00736
M106 S201.45
M106 S255
; WIPE_START
G1 X89.415 Y90.982 E-.14355
G1 X89.706 Y91.241 E-.14794
G1 X90.171 Y91.836 E-.28718
G1 X90.157 Y92.243 E-.15462
G1 X90.142 Y92.312 E-.02671
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I.647 J-1.031 P1  F42000
G1 X86.468 Y90.004 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X86.809 Y89.856 I.293 J.209 E.00752
G3 X87.152 Y89.801 I.281 J.654 E.00677
G1 X87.196 Y89.383 E.0081
G3 X87.605 Y90.067 I.08 J.416 E.01996
G3 X86.954 Y90.754 I-1.767 J-1.021 E.01842
G3 X86.32 Y90.726 I-.276 J-.936 E.01246
G3 X84.757 Y91.498 I-1.12 J-.298 E.03805
G3 X84.849 Y90.656 I.369 J-.386 E.01885
G3 X85.477 Y90.353 I.849 J.958 E.01362
G1 X85.934 Y90.059 E.01047
G1 X85.972 Y89.907 E.00302
G3 X87.127 Y89.378 I1.071 J.812 E.02552
M106 S201.45
M106 S255
; WIPE_START
G1 X87.538 Y89.443 E-.15788
G1 X87.649 Y89.535 E-.05491
G1 X87.694 Y89.843 E-.11857
G1 X87.605 Y90.067 E-.09143
G1 X87.182 Y90.63 E-.2678
G1 X87.021 Y90.718 E-.06941
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I1.069 J.581 P1  F42000
G1 X88.997 Y87.084 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X89.834 Y87.003 I.02 J-4.181 E.01623
G1 X89.922 Y86.592 E.0081
G3 X90.132 Y87.515 I-.022 J.49 E.02463
G1 X89.96 Y87.641 E.00411
G1 X90.103 Y88.236 E.01179
G3 X90.362 Y89.265 I-1.644 J.961 E.02073
G3 X89.641 Y89.467 I-.443 J-.192 E.01652
G3 X88.918 Y88.757 I.191 J-.918 E.02065
G2 X88.666 Y87.86 I-1.055 J-.187 E.01857
G3 X87.787 Y86.989 I.139 J-1.018 E.02559
G3 X88.838 Y86.664 I.705 J.416 E.02325
G2 X89.865 Y86.58 I-.21 J-8.927 E.01986
M106 S201.45
M106 S255
; WIPE_START
G1 X90.241 Y86.701 E-.15014
G1 X90.398 Y86.953 E-.11307
G1 X90.292 Y87.321 E-.14546
G1 X90.132 Y87.515 E-.09542
G1 X89.96 Y87.641 E-.08095
G1 X90.068 Y88.089 E-.17496
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I.226 J-1.196 P1  F42000
G1 X85.02 Y87.135 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X84.844 Y86.081 I1.165 J-.736 E.02114
G3 X85.711 Y87.084 I-.179 J1.031 E.02766
G2 X86.291 Y87.89 I1.768 J-.661 E.01937
G3 X86.088 Y88.584 I-.296 J.29 E.01696
G3 X84.848 Y88.804 I-1.064 J-2.395 E.02451
G3 X84.808 Y88.005 I.371 J-.419 E.01718
G1 X84.738 Y87.456 E.01067
G3 X84.506 Y86.232 I.857 J-.796 E.02532
G3 X84.766 Y86.073 I.361 J.297 E.00598
M106 S201.45
M106 S255
; WIPE_START
G1 X85.26 Y86.252 E-.1998
G1 X85.529 Y86.53 E-.14706
G1 X85.728 Y86.906 E-.16158
G1 X85.711 Y87.084 E-.06797
G1 X85.927 Y87.516 E-.1836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I-.334 J1.17 P1  F42000
G1 X94.691 Y90.017 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.773 Y89.669 I1.375 J.139 E.00691
G3 X94.598 Y88.904 I.839 J-.594 E.01552
G1 X94.607 Y88.483 E.00813
G3 X95.423 Y89.67 I-.26 J1.052 E.03036
G2 X96.415 Y89.643 I-.271 J-27.952 E.01914
G1 X96.852 Y89.261 E.01117
G3 X97.433 Y88.577 I.703 J.009 E.01877
G3 X97.988 Y89.263 I-.497 J.968 E.01749
G3 X97.906 Y90.258 I-.703 J.444 E.02066
G2 X97.047 Y91.134 I.516 J1.366 E.0244
G3 X96.211 Y91.077 I-.41 J-.134 E.02202
G2 X96.007 Y90.613 I-5.943 J2.337 E.00977
G2 X94.952 Y90.952 I-.15 J1.346 E.02201
G3 X94.292 Y90.546 I-.201 J-.413 E.0178
G3 X94.326 Y89.715 I2.103 J-.328 E.01612
G3 X94.406 Y88.511 I.749 J-.556 E.02531
G3 X94.524 Y88.475 I.121 J.186 E.00241
M106 S201.45
M106 S255
; WIPE_START
G1 X94.978 Y88.633 E-.18277
G1 X95.204 Y88.872 E-.12512
G1 X95.362 Y89.196 E-.13714
G1 X95.423 Y89.67 E-.1814
G1 X95.774 Y89.66 E-.13358
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I-.211 J1.199 P1  F42000
G1 X99.025 Y90.232 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X99.598 Y89.654 I-.033 J-.605 E.01719
G3 X99.881 Y90.164 I-.243 J.469 E.01191
G3 X99.603 Y91.274 I-4.999 J-.665 E.02211
G3 X98.894 Y91.215 I-.336 J-.25 E.01637
G3 X98.46 Y90.337 I.808 J-.946 E.01941
G3 X99.163 Y89.725 I.957 J.39 E.01863
G3 X99.54 Y89.639 I.36 J.713 E.00754
M106 S201.45
; WIPE_START
G1 X99.792 Y89.768 E-.10733
G1 X99.881 Y90.164 E-.15421
G1 X99.714 Y91.03 E-.33512
G1 X99.603 Y91.274 E-.1021
G1 X99.467 Y91.361 E-.06125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I.638 J-1.036 P1  F42000
G1 X82.8 Y81.1 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X80.801 Y81.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.52
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.52 F4000
            G39.3 S1
            G0 Z6.52 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.4 Y80.65 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4208
M204 S6000
G1 X82.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X80.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.15 Y84.568 Z6.52 F42000
G1 X92.601 Y87.829 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4208
M204 S6000
G1 X92.099 Y87.829 E.0104
G1 X92.099 Y86.499 E.02759
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y87.769 E.01387
M204 S250
G1 X93 Y88.138 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2460
M204 S1000
G1 X93 Y88.229 E.00166
G1 F3000
G1 X91.7 Y88.229 E.02379
G1 F2460
G1 X91.7 Y88.138 E.00166
G1 F2400
G1 X91.7 Y86.1 E.03729
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y88.078 E.01057
M204 S10000
G1 X92.35 Y87.617 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104114
G1 F4208
M204 S6000
G1 X92.35 Y86.889 E.00279
G1 X92.369 Y86.85 E.00017
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I-.524 J-1.099 P1  F42000
G1 X91.679 Y89.426 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.358834
G1 F2400
M204 S1000
G1 X91.679 Y89.304 E.00199
G1 F2520
G1 X91.679 Y89.211 E.00151
G1 F3000
G1 X93.021 Y89.211 E.02184
G1 F2520
G1 X93.021 Y89.304 E.00151
G1 F2400
G1 X93.021 Y89.426 E.00199
G1 F2520
G1 X93.021 Y89.519 E.00151
G1 F3000
G1 X91.679 Y89.519 E.02184
G1 F2520
G1 X91.679 Y89.486 E.00054
; WIPE_START
M204 S6000
G1 X91.679 Y89.304 E-.06933
G1 X91.679 Y89.211 E-.03531
G1 X93.021 Y89.211 E-.50964
G1 X93.021 Y89.304 E-.03531
G1 X93.021 Y89.426 E-.04653
G1 X93.021 Y89.519 E-.03531
G1 X92.945 Y89.519 E-.02858
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.679 Y90.696 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F2400
M204 S1000
G1 X91.679 Y90.574 E.00199
G1 F2520
G1 X91.679 Y90.481 E.00151
G1 F3000
G1 X93.021 Y90.481 E.02184
G1 F2520
G1 X93.021 Y90.574 E.00151
G1 F2400
G1 X93.021 Y90.696 E.00199
G1 F2520
G1 X93.021 Y90.789 E.00151
G1 F3000
G1 X91.679 Y90.789 E.02184
G1 F2520
G1 X91.679 Y90.756 E.00054
; WIPE_START
M204 S6000
G1 X91.679 Y90.574 E-.06933
G1 X91.679 Y90.481 E-.03531
G1 X93.021 Y90.481 E-.50964
G1 X93.021 Y90.574 E-.03531
G1 X93.021 Y90.696 E-.04653
G1 X93.021 Y90.789 E-.03531
G1 X92.945 Y90.789 E-.02858
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y93.501 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4208
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y92.171 E.02759
G1 X92.601 Y92.171 E.0104
G1 X92.601 Y92.899 E.01511
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y91.862 E.03729
G1 F2460
G1 X91.7 Y91.771 E.00166
G1 F3000
G1 X93 Y91.771 E.02379
G1 F2460
G1 X93 Y91.862 E.00166
G1 F2400
G1 X93 Y92.5 E.01167
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
M204 S10000
G1 X99.189 Y93.2 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F4208
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.104114
G1 X92.35 Y93.111 E.00017
G1 X92.35 Y92.383 E.00279
; WIPE_START
G1 F15000
G1 X92.35 Y93.111 E-.71746
G1 X92.369 Y93.15 E-.04254
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I-.131 J-1.21 P1  F42000
G1 X81.977 Y94.277 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4208
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F4208
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4208
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z6.52 F42000
G1 X82.8 Y99.8 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
M73 P73 R5
G1 F4208
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/82
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.52 I1.096 J.528 P1  F42000
G1 X85.256 Y93.416 Z6.52
G1 Z6.24
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X85.731 Y93.009 I1.389 J1.14 E.01212
G1 X85.835 Y92.588 E.00837
G3 X86.364 Y93.041 I-.568 J1.2 E.01359
G3 X87.188 Y93.838 I-.155 J.984 E.02354
G3 X86.466 Y94.155 I-.531 J-.227 E.01673
G3 X85.874 Y93.9 I.635 J-2.29 E.01247
G3 X84.72 Y94.041 I-.958 J-3.047 E.02253
G3 X84.611 Y93.482 I.124 J-.314 E.01305
G3 X85.775 Y92.572 I1.944 J1.287 E.02898
M106 S201.45
M106 S255
; WIPE_START
G1 X86.364 Y93.041 E-.28595
G1 X86.925 Y93.337 E-.24098
G1 X87.081 Y93.508 E-.08785
G1 X87.188 Y93.838 E-.13191
G1 X87.169 Y93.867 E-.01332
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.64 I1.081 J.558 P1  F42000
G1 X88.289 Y91.696 Z6.64
G1 Z6.24
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X88.437 Y91.702 E.00284
G1 X89.043 Y91.306 E.01396
G1 X89.164 Y90.822 E.00962
G3 X89.768 Y91.415 I-1.405 J2.036 E.0164
G3 X90.2 Y92.14 I-.184 J.6 E.01782
G1 X90.051 Y92.282 E.00397
G1 X89.955 Y92.827 E.01067
G3 X89.895 Y93.919 I-.681 J.51 E.02289
G3 X89.031 Y93.186 I-.051 J-.815 E.02413
G3 X88.984 Y92.873 I.505 J-.236 E.00618
G3 X87.968 Y92.452 I1.836 J-5.858 E.02123
G3 X87.189 Y91.472 I1.393 J-1.907 E.02442
G3 X87.674 Y91.148 I.379 J.042 E.01279
G2 X88.32 Y91.277 I7.1 J-33.89 E.0127
G2 X88.974 Y90.8 I-6.413 J-9.465 E.01561
G1 X89.109 Y90.799 E.00261
M106 S201.45
M106 S255
; WIPE_START
G1 X89.317 Y90.904 E-.08846
G1 X89.768 Y91.415 E-.25913
G1 X90.122 Y91.707 E-.17429
G1 X90.22 Y91.88 E-.07574
G1 X90.2 Y92.14 E-.09886
G1 X90.079 Y92.255 E-.06351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.64 I.66 J-1.022 P1  F42000
G1 X86.57 Y89.988 Z6.64
G1 Z6.24
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X87.268 Y89.797 I7.322 J25.369 E.01395
G1 X87.486 Y89.392 E.00886
G3 X87.75 Y89.611 I-.037 J.313 E.00701
G3 X87.281 Y90.385 I-1.272 J-.242 E.01781
G3 X86.496 Y90.734 I-.686 J-.485 E.01739
G1 X86.026 Y90.947 E.00995
G3 X84.659 Y91.457 I-.903 J-.333 E.03192
G3 X84.836 Y90.729 I.422 J-.283 E.01624
G3 X85.623 Y90.452 I.81 J1.046 E.01635
G3 X86.051 Y89.781 I4.851 J2.623 E.01536
G3 X87.428 Y89.376 I1.54 J2.694 E.02793
M106 S201.45
M106 S255
; WIPE_START
G1 X87.702 Y89.502 E-.11444
G1 X87.75 Y89.611 E-.04544
G1 X87.651 Y89.987 E-.14764
G1 X87.281 Y90.385 E-.20627
G1 X87.143 Y90.569 E-.08745
G1 X86.952 Y90.694 E-.08713
G1 X86.764 Y90.711 E-.07163
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.64 I1.02 J.664 P1  F42000
G1 X89.065 Y87.173 Z6.64
G1 Z6.24
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X89.92 Y87.027 I-.642 J-6.331 E.01673
G1 X89.979 Y86.611 E.0081
G3 X90.17 Y87.433 I.009 J.431 E.02265
G1 X89.907 Y87.615 E.00618
G1 X89.986 Y88.223 E.01181
G3 X90.381 Y89.332 I-1.814 J1.272 E.02296
G3 X89.699 Y89.476 I-.394 J-.18 E.01562
G3 X89.095 Y89.058 I2.533 J-4.306 E.01417
G3 X88.924 Y88.301 I1.488 J-.735 E.01509
G2 X88.257 Y87.623 I-1.025 J.34 E.01899
G3 X87.758 Y86.929 I.29 J-.734 E.0174
G3 X88.902 Y86.767 I.671 J.616 E.02413
G2 X89.921 Y86.603 I-3.374 J-24.077 E.01988
M106 S201.45
M106 S255
; WIPE_START
G1 X90.288 Y86.703 E-.14448
G1 X90.432 Y86.923 E-.10005
G1 X90.326 Y87.258 E-.13367
G1 X90.17 Y87.433 E-.08902
G1 X89.907 Y87.615 E-.12178
G1 X89.965 Y88.062 E-.17101
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.64 I.232 J-1.195 P1  F42000
G1 X85.14 Y87.125 Z6.64
G1 Z6.24
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X84.875 Y86.06 I.694 J-.738 E.02235
G3 X85.629 Y87.141 I-.475 J1.135 E.0268
G2 X86.34 Y87.938 I1.915 J-.992 E.02081
G3 X86.147 Y88.559 I-.244 J.265 E.01563
G2 X84.967 Y88.86 I4.665 J20.763 E.02349
G1 X84.864 Y88.856 E.00198
G3 X84.76 Y88.121 I.212 J-.405 E.01669
G1 X84.877 Y87.934 E.00426
G1 X84.805 Y87.379 E.01077
G3 X84.565 Y86.113 I.583 J-.766 E.02722
G3 X84.818 Y86.047 I.195 J.233 E.0052
M106 S201.45
M106 S255
; WIPE_START
G1 X85.121 Y86.177 E-.12523
G1 X85.381 Y86.436 E-.13964
G1 X85.568 Y86.787 E-.15111
G1 X85.629 Y87.141 E-.13632
G1 X85.865 Y87.56 E-.18278
G1 X85.916 Y87.601 E-.02491
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.64 I-.249 J1.191 P1  F42000
G1 X94.735 Y89.444 Z6.64
G1 Z6.24
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.672 Y88.473 I1.046 J-.555 E.01933
G3 X95.32 Y89.648 I-.556 J1.072 E.02742
G3 X94.761 Y91.055 I-1.066 J.391 E.03194
G3 X94.317 Y90.574 I.004 J-.449 E.01414
G2 X94.318 Y89.495 I-7.071 J-.546 E.02081
G3 X94.33 Y88.517 I.743 J-.48 E.01998
G3 X94.583 Y88.449 I.198 J.236 E.00522
M106 S201.45
M106 S255
; WIPE_START
G1 X94.858 Y88.566 E-.11333
G1 X95.092 Y88.805 E-.12745
G1 X95.241 Y89.105 E-.12694
G1 X95.32 Y89.648 E-.20884
G1 X95.374 Y90.09 E-.16905
G1 X95.368 Y90.127 E-.0144
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.64 I.33 J1.171 P1  F42000
G1 X97.045 Y89.655 Z6.64
G1 Z6.24
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X97.336 Y89.181 I-.106 J-.391 E.0118
G2 X97.473 Y88.537 I-1.922 J-.747 E.01274
G3 X97.882 Y89.196 I-.733 J.912 E.01523
G3 X98.03 Y90.188 I-1.192 J.685 E.01981
G3 X97.59 Y90.312 I-.323 J-.307 E.00926
G2 X96.97 Y91.249 I1.445 J1.629 E.0219
G3 X96.239 Y91.116 I-.345 J-.183 E.019
G2 X95.859 Y90.05 I-4.826 J1.116 E.02186
G3 X96.36 Y89.633 I.374 J-.06 E.01512
G2 X96.907 Y89.225 I-.725 J-1.541 E.01324
G3 X97.418 Y88.516 I.791 J.031 E.01786
M106 S201.45
M106 S255
; WIPE_START
G1 X97.706 Y88.736 E-.13777
G1 X97.882 Y89.196 E-.18711
G1 X98.093 Y89.857 E-.26363
G1 X98.03 Y90.188 E-.12829
G1 X97.931 Y90.243 E-.0432
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.64 I-.087 J1.214 P1  F42000
G1 X99.021 Y90.322 Z6.64
G1 Z6.24
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X99.458 Y90.068 I3.665 J5.814 E.00974
G1 X99.655 Y89.628 E.0093
G3 X99.888 Y90.073 I-.223 J.4 E.01023
G2 X99.679 Y91.139 I2.741 J1.091 E.02108
G3 X98.903 Y91.191 I-.393 J-.05 E.02104
G3 X98.551 Y90.314 I.877 J-.861 E.01869
G3 X99.573 Y89.61 I1.24 J.707 E.02473
M106 S201.45
M106 S255
; WIPE_START
G1 X99.808 Y89.712 E-.09744
G1 X99.888 Y90.073 E-.14034
G1 X99.759 Y90.467 E-.1579
G1 X99.679 Y91.139 E-.25713
G1 X99.575 Y91.361 E-.09277
G1 X99.542 Y91.379 E-.01442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.64 I-1.214 J-.081 P1  F42000
G1 X99.401 Y93.501 Z6.64
G1 Z6.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4662
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y92.154 E.02794
G1 X92.099 Y91.754 E.0083
G1 F1800
G1 X92.099 Y91.371 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X92.099 Y91.169 E.00421
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X92.099 Y90.786 E.00793
M106 S201.45
M106 S255
G1 F2797.506
G1 X92.099 Y90.484 E.00627
G1 F1800
G1 X92.099 Y90.101 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X92.099 Y89.899 E.00421
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X92.099 Y89.516 E.00793
M106 S201.45
M106 S255
G1 F2797.506
G1 X92.099 Y89.214 E.00627
G1 F1800
G1 X92.099 Y88.831 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X92.099 Y88.629 E.00421
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X92.099 Y88.246 E.00793
M106 S201.45
M106 S255
G1 F4662
G1 X92.099 Y87.846 E.0083
G1 X92.099 Y86.499 E.02794
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y87.846 E.01546
G1 X92.601 Y88.246 E.0083
G1 F1800
G1 X92.601 Y88.629 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X92.601 Y88.831 E.00421
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X92.601 Y89.214 E.00793
M106 S201.45
M106 S255
G1 F2797.506
G1 X92.601 Y89.516 E.00627
G1 F1800
G1 X92.601 Y89.899 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X92.601 Y90.101 E.00421
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X92.601 Y90.484 E.00793
M106 S201.45
M106 S255
G1 F2797.506
G1 X92.601 Y90.786 E.00627
G1 F1800
G1 X92.601 Y91.169 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X92.601 Y91.371 E.00421
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X92.601 Y91.754 E.00793
M106 S201.45
M106 S255
G1 F4662
G1 X92.601 Y92.154 E.0083
G1 X92.601 Y92.899 E.01546
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y91.731 E.03968
G1 F1920
G1 X91.7 Y91.371 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X91.7 Y91.169 E.00421
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X91.7 Y90.809 E.00659
G1 F2400
G1 X91.7 Y90.461 E.00635
G1 F1920
G1 X91.7 Y90.101 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X91.7 Y89.899 E.00421
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X91.7 Y89.539 E.00659
G1 F2400
G1 X91.7 Y89.191 E.00635
G1 F1920
G1 X91.7 Y88.831 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X91.7 Y88.629 E.00421
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X91.7 Y88.269 E.00659
G1 F2400
G1 X91.7 Y86.1 E.03968
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y88.269 E.01406
G1 F1920
G1 X93 Y88.629 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X93 Y88.831 E.00421
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X93 Y89.191 E.00659
G1 F2400
G1 X93 Y89.539 E.00635
G1 F1920
G1 X93 Y89.899 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X93 Y90.101 E.00421
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X93 Y90.461 E.00659
G1 F2400
G1 X93 Y90.809 E.00635
G1 F1920
G1 X93 Y91.169 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X93 Y91.371 E.00421
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X93 Y91.731 E.00659
G1 F2400
G1 X93 Y92.5 E.01406
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.64 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.64
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.64 F4000
            G39.3 S1
            G0 Z6.64 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z6.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F4662
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.093 Y83.989 Z6.64 F42000
G1 X82.8 Y81.1 Z6.64
G1 Z6.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.1 E.04757
G1 X80.2 Y80.2 E.01647
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.04 E.01537
M204 S10000
G1 X82.6 Y80.65 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4662
M204 S6000
G1 X80.4 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X82.4 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.279 Z6.64 F42000
G1 X81.977 Y94.277 Z6.64
G1 Z6.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4662
M204 S6000
G1 X81.023 Y94.277 E.01977
G1 X81.023 Y85.723 E.17741
G1 X81.977 Y85.723 E.01977
G1 X81.977 Y94.217 E.17617
M204 S10000
G1 X82.401 Y94.701 F42000
G1 F4662
M204 S6000
G1 X80.599 Y94.701 E.03737
G1 X80.599 Y85.299 E.19501
G1 X82.401 Y85.299 E.03737
G1 X82.401 Y94.641 E.19377
M204 S250
G1 X82.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.1 E.04757
G1 X80.2 Y84.9 E.18664
G1 X82.8 Y84.9 E.04757
G1 X82.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X80.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.064 Z6.64 F42000
G1 Z6.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4662
M204 S6000
G1 X81.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X81.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.523 Z6.64 F42000
G1 X82.8 Y99.8 Z6.64
G1 Z6.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.9 E.01647
G1 X82.8 Y98.9 E.04757
G1 X82.8 Y99.74 E.01537
M204 S10000
G1 X82.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4662
M204 S6000
G1 X80.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/82
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.64 I1.093 J.536 P1  F42000
G1 X85.278 Y93.483 Z6.64
G1 Z6.36
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X85.588 Y93.23 I1.362 J1.355 E.00773
G2 X85.854 Y92.555 I-.848 J-.723 E.01425
G3 X86.091 Y92.828 I-.099 J.326 E.00735
G2 X86.76 Y93.29 I.795 J-.436 E.01626
G3 X87.184 Y93.97 I-.144 J.561 E.01704
G3 X85.935 Y93.789 I-.518 J-.824 E.02646
G1 X85.77 Y93.928 E.00415
G2 X85.268 Y94 I-.193 J.435 E.01031
G3 X84.464 Y93.867 I-.329 J-.508 E.01724
G3 X85.062 Y93.123 I1.021 J.208 E.01911
G3 X85.796 Y92.545 I1.488 J1.134 E.01819
M106 S201.45
M106 S255
; WIPE_START
G1 X86.001 Y92.642 E-.08633
G1 X86.091 Y92.828 E-.07845
G1 X86.447 Y93.185 E-.19189
G1 X86.76 Y93.29 E-.12541
G1 X87.116 Y93.571 E-.17247
G1 X87.205 Y93.732 E-.06956
G1 X87.196 Y93.826 E-.03589
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.76 I.992 J-.705 P1  F42000
G1 X85.227 Y91.058 Z6.76
G1 Z6.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.12 Y91.104 I-.202 J-.325 E.00226
G3 X85.227 Y91.058 I.136 J.171 E.00228
G1 X85.376 Y90.597 E.00933
G3 X85.61 Y91.3 I.055 J.372 E.02024
G3 X84.579 Y91.423 I-.594 J-.593 E.02159
G3 X84.97 Y90.701 I.598 J-.143 E.01733
G3 X85.317 Y90.594 I.569 J1.223 E.00701
M106 S201.45
M106 S255
; WIPE_START
G1 X85.641 Y90.652 E-.12528
G1 X85.791 Y90.808 E-.08195
G1 X85.811 Y90.995 E-.07158
G1 X85.61 Y91.3 E-.13873
G1 X85.401 Y91.45 E-.09802
G1 X85.015 Y91.56 E-.15244
G1 X84.775 Y91.529 E-.092
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.76 I.737 J.969 P1  F42000
G1 X86.775 Y90.007 Z6.76
G1 Z6.36
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X87.571 Y89.384 I-.309 J-1.214 E.02004
G3 X87.797 Y89.562 I-.019 J.257 E.00589
G3 X87.204 Y90.355 I-1.059 J-.174 E.01983
G3 X86.35 Y90.47 I-.47 J-.262 E.01924
G3 X85.952 Y89.863 I-.034 J-.412 E.01707
G3 X86.786 Y89.552 I1.446 J2.599 E.01723
G3 X87.513 Y89.372 I.718 J1.339 E.01458
M106 S201.45
M106 S255
; WIPE_START
G1 X87.752 Y89.468 E-.09799
G1 X87.797 Y89.562 E-.03977
G1 X87.698 Y89.903 E-.13481
G1 X87.534 Y90.108 E-.09969
G1 X87.204 Y90.355 E-.15672
G1 X86.92 Y90.597 E-.14171
G1 X86.696 Y90.638 E-.08653
G1 X86.689 Y90.637 E-.00278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.76 I.599 J1.059 P1  F42000
G1 X89.741 Y88.912 Z6.76
G1 Z6.36
G1 E.8 F1800
G1 F9000
M204 S6000
M73 P74 R4
G3 X89.349 Y88.067 I.466 J-.729 E.01896
G3 X90.059 Y88.426 I-.492 J1.852 E.01546
G3 X90.403 Y89.216 I-18.095 J8.351 E.01661
G3 X89.957 Y89.561 I-.306 J.065 E.01354
G3 X88.918 Y88.364 I.616 J-1.584 E.03179
G3 X89.292 Y88.052 I.303 J-.017 E.01091
M106 S201.45
M106 S255
; WIPE_START
G1 X89.919 Y88.283 E-.25406
G1 X90.059 Y88.426 E-.07613
G1 X90.403 Y89.216 E-.32734
G1 X90.354 Y89.481 E-.10248
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.76 I1.192 J-.243 P1  F42000
G1 X89.862 Y87.072 Z6.76
G1 Z6.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.685 Y87.154 I-.239 J-.286 E.00381
G3 X89.862 Y87.072 I.23 J.265 E.00382
G1 X90.038 Y86.637 E.00904
G3 X90.211 Y87.349 I.047 J.366 E.02075
G3 X89.241 Y87.549 I-.723 J-1.058 E.01959
G3 X87.717 Y87.06 I-.473 J-1.144 E.03354
G3 X88.3 Y86.681 I.434 J.03 E.01552
G3 X88.88 Y86.893 I-.162 J1.339 E.01201
G1 X89.423 Y86.824 E.01055
G3 X89.979 Y86.63 I.611 J.857 E.01151
M106 S201.45
M106 S255
; WIPE_START
G1 X90.335 Y86.705 E-.13843
G1 X90.467 Y86.892 E-.08683
G1 X90.363 Y87.192 E-.12066
G1 X90.211 Y87.349 E-.08327
G1 X89.713 Y87.59 E-.21012
G1 X89.396 Y87.562 E-.12069
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.76 I-.202 J1.2 P1  F42000
G1 X94.586 Y88.437 Z6.76
G1 Z6.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X95.058 Y89.625 I-.408 J.849 E.02707
G3 X94.677 Y91.098 I-.736 J.595 E.03405
G3 X94.357 Y90.434 I.204 J-.508 E.0156
G3 X94.492 Y89.948 I2.404 J.409 E.00973
G2 X94.197 Y88.883 I-11.737 J2.684 E.02131
G3 X94.531 Y88.418 I.339 J-.11 E.01283
M106 S201.45
M106 S255
; WIPE_START
G1 X94.739 Y88.503 E-.08571
G1 X94.962 Y88.716 E-.11717
G1 X95.112 Y89.007 E-.12441
G1 X95.152 Y89.302 E-.11288
G1 X95.058 Y89.625 E-.12801
G1 X95.222 Y89.934 E-.13278
G1 X95.245 Y90.087 E-.05903
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.76 I.159 J1.207 P1  F42000
G1 X96.866 Y89.873 Z6.76
G1 Z6.36
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X97.342 Y89.291 E.0145
G2 X97.447 Y88.473 I-2.266 J-.706 E.01598
G3 X97.861 Y89.366 I-.692 J.864 E.01966
G3 X98.095 Y90.11 I-1.549 J.896 E.01515
G3 X97.563 Y90.304 I-.371 J-.192 E.012
G1 X97.11 Y90.671 E.01125
G3 X96.628 Y91.547 I-.896 J.077 E.02042
G3 X96.212 Y90.693 I.375 J-.712 E.01959
G3 X95.854 Y90.018 I13.995 J-7.851 E.01472
G3 X96.409 Y89.657 I.329 J-.101 E.01715
G2 X97.022 Y88.865 I-.637 J-1.126 E.01983
G3 X97.39 Y88.457 I.652 J.218 E.01089
M106 S201.45
M106 S255
; WIPE_START
G1 X97.689 Y88.72 E-.15136
G1 X97.861 Y89.366 E-.25402
G1 X98.096 Y89.932 E-.23293
G1 X98.095 Y90.11 E-.06757
G1 X98.01 Y90.224 E-.05412
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.76 I-.253 J1.19 P1  F42000
G1 X99.049 Y90.444 Z6.76
G1 Z6.36
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X99.677 Y89.589 I-.743 J-1.204 E.02097
G3 X99.894 Y89.979 I-.148 J.337 E.00925
G3 X99.648 Y90.613 I-4.789 J-1.495 E.01312
G3 X99.444 Y91.534 I-.762 J.314 E.01936
G3 X98.878 Y91.11 I-.013 J-.571 E.0147
G3 X98.612 Y90.495 I26.395 J-11.776 E.01291
G1 X98.656 Y90.258 E.00465
G3 X98.982 Y89.971 I.584 J.334 E.00852
G3 X99.618 Y89.582 I.976 J.882 E.01459
M106 S201.45
M106 S255
; WIPE_START
G1 X99.825 Y89.658 E-.08362
G1 X99.894 Y89.979 E-.12482
G1 X99.648 Y90.613 E-.25846
G1 X99.683 Y90.959 E-.13195
G1 X99.643 Y91.249 E-.11126
G1 X99.568 Y91.356 E-.0499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.76 I-.053 J-1.216 P1  F42000
G1 X88.358 Y91.844 Z6.76
G1 Z6.36
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X89.077 Y91.278 E.01765
G1 X89.094 Y90.765 E.00989
G3 X89.582 Y91.346 I-.442 J.868 E.01503
G3 X90.27 Y91.926 I-1.288 J2.225 E.01743
G3 X89.987 Y92.295 I-.326 J.044 E.00997
G1 X89.888 Y92.897 E.01175
G3 X89.891 Y93.966 I-.568 J.536 E.0227
G3 X89.15 Y92.976 I.058 J-.816 E.02701
G1 X88.582 Y92.632 E.01281
G3 X87.937 Y92.33 I-.149 J-.523 E.01496
G3 X87.151 Y91.447 I1.506 J-2.132 E.02299
G3 X87.269 Y91.193 I.226 J-.05 E.0058
G3 X88.28 Y91.371 I.319 J1.151 E.02045
G1 X88.748 Y91.002 E.01148
G3 X89.037 Y90.747 I.361 J.118 E.0078
M106 S201.45
M106 S255
; WIPE_START
G1 X89.422 Y91.031 E-.18177
G1 X89.582 Y91.346 E-.13436
G1 X90.008 Y91.613 E-.19114
G1 X90.27 Y91.926 E-.15498
G1 X90.254 Y92.148 E-.08448
G1 X90.223 Y92.165 E-.01327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.76 I.879 J-.841 P1  F42000
G1 X84.893 Y86.593 Z6.76
G1 Z6.36
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X84.999 Y86.788 E.00427
G3 X84.771 Y86.019 I1.177 J-.767 E.01569
G3 X85.47 Y87.034 I-.376 J1.007 E.0253
G1 X85.614 Y87.53 E.00997
G2 X86.391 Y87.99 I60.58 J-101.321 E.0174
G3 X86.212 Y88.531 I-.194 J.236 E.01416
G2 X85.553 Y88.596 I3.483 J38.878 E.01276
G3 X84.653 Y88.798 I-.576 J-.46 E.01922
G3 X84.996 Y87.919 I.782 J-.201 E.01943
G2 X84.896 Y87.246 I-2.703 J.057 E.01316
G3 X84.531 Y86.094 I.44 J-.773 E.0256
G3 X84.712 Y86.014 I.174 J.149 E.00395
M106 S201.45
; WIPE_START
G1 X84.986 Y86.105 E-.10978
G1 X85.235 Y86.343 E-.13085
G1 X85.409 Y86.665 E-.13903
G1 X85.47 Y87.034 E-.14197
G1 X85.614 Y87.53 E-.19645
G1 X85.709 Y87.586 E-.04191
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.76 I-.483 J1.117 P1  F42000
G1 X99.401 Y93.501 Z6.76
G1 Z6.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4752
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.76 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.76
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.76 F4000
            G39.3 S1
            G0 Z6.76 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z6.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F4752
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.092 Y83.99 Z6.76 F42000
G1 X82.8 Y81.103 Z6.76
G1 Z6.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.103 E.04757
G1 X80.2 Y80.2 E.01652
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.043 E.01542
M204 S10000
G1 X82.6 Y80.651 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.529472
G1 F4752
M204 S6000
G1 X80.4 Y80.651 E.0542
; WIPE_START
G1 F15000
G1 X82.4 Y80.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.28 Z6.76 F42000
G1 X81.977 Y94.279 Z6.76
G1 Z6.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4752
M204 S6000
G1 X81.023 Y94.279 E.01977
G1 X81.023 Y85.721 E.17753
G1 X81.977 Y85.721 E.01977
G1 X81.977 Y94.219 E.17629
M204 S10000
G1 X82.401 Y94.704 F42000
G1 F4752
M204 S6000
G1 X80.599 Y94.704 E.03737
G1 X80.599 Y85.296 E.19513
G1 X82.401 Y85.296 E.03737
G1 X82.401 Y94.644 E.19389
M204 S250
G1 X82.8 Y95.103 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.103 E.04757
G1 X80.2 Y84.897 E.18675
G1 X82.8 Y84.897 E.04757
G1 X82.8 Y95.043 E.18565
; WIPE_START
M204 S6000
G1 X80.801 Y95.089 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.067 Z6.76 F42000
G1 Z6.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4752
M204 S6000
G1 X81.5 Y85.933 E.21032
; WIPE_START
G1 F15000
G1 X81.5 Y87.933 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.331 Y95.52 Z6.76 F42000
G1 X82.8 Y99.8 Z6.76
G1 Z6.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.897 E.01652
G1 X82.8 Y98.897 E.04757
G1 X82.8 Y99.74 E.01542
M204 S10000
G1 X82.6 Y99.349 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.529472
G1 F4752
M204 S6000
G1 X80.4 Y99.349 E.0542
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.349 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/82
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.76 I1.072 J.576 P1  F42000
G1 X85.737 Y93.13 Z6.76
G1 Z6.48
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G2 X85.899 Y93.318 I.559 J-.319 E.00481
G2 X85.681 Y93.292 I-.132 J.182 E.00443
G1 X85.687 Y93.287 E.00016
G3 X85.918 Y92.516 I11.144 J2.91 E.01553
G3 X86.066 Y92.869 I-.237 J.307 E.00772
G2 X86.807 Y93.392 I1.203 J-.919 E.01775
G3 X87.24 Y93.978 I-.107 J.532 E.01541
G3 X86.237 Y93.847 I-.419 J-.698 E.02105
G1 X85.741 Y93.71 E.00991
G2 X85.075 Y94.009 I1.9 J5.117 E.01408
G3 X84.398 Y93.898 I-.283 J-.394 E.0147
G1 X84.417 Y93.806 E.0018
G3 X85.214 Y93.147 I1.29 J.747 E.02038
G3 X85.696 Y92.557 I2.905 J1.882 E.01471
G2 X85.843 Y92.508 I-.096 J-.53 E.00299
M106 S201.45
M106 S255
; WIPE_START
G1 X86.054 Y92.71 E-.11107
G1 X86.066 Y92.869 E-.0606
G1 X86.527 Y93.308 E-.24195
G1 X86.807 Y93.392 E-.11112
G1 X87.155 Y93.639 E-.16235
G1 X87.245 Y93.786 E-.06555
G1 X87.245 Y93.806 E-.00736
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I1.013 J-.675 P1  F42000
G1 X85.204 Y90.745 Z6.88
G1 Z6.48
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X85.242 Y90.747 E.00074
G3 X85.465 Y91.272 I.055 J.286 E.01526
G3 X84.519 Y91.427 I-.568 J-.5 E.02001
G3 X85.145 Y90.741 I.674 J-.012 E.01972
M106 S201.45
M106 S255
; WIPE_START
G1 X85.242 Y90.747 E-.03701
G1 X85.425 Y90.761 E-.06967
G1 X85.571 Y90.885 E-.07302
G1 X85.59 Y91.05 E-.06311
G1 X85.465 Y91.272 E-.09678
G1 X85.182 Y91.465 E-.13008
G1 X84.971 Y91.523 E-.08346
G1 X84.736 Y91.53 E-.08924
G1 X84.519 Y91.427 E-.09142
G1 X84.521 Y91.358 E-.02619
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I1.165 J.353 P1  F42000
G1 X85.506 Y88.109 Z6.88
G1 Z6.48
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X85.586 Y88.148 E.00171
G1 X85.47 Y88.179 E.00231
G2 X85.544 Y87.683 I-.573 J-.339 E.00992
G3 X86.443 Y88.045 I-.587 J2.75 E.01877
G3 X86.279 Y88.5 I-.148 J.204 E.01252
G2 X85.374 Y88.64 I.043 J3.278 E.01771
G3 X84.58 Y88.828 I-.518 J-.417 E.01692
G3 X85.116 Y87.951 I.842 J-.089 E.0213
G3 X85.485 Y87.68 I.406 J.168 E.00929
M106 S201.45
M106 S255
; WIPE_START
G1 X86.075 Y87.832 E-.23121
G1 X86.443 Y88.045 E-.16174
G1 X86.571 Y88.278 E-.1009
G1 X86.447 Y88.429 E-.07445
G1 X86.279 Y88.5 E-.0694
G1 X85.957 Y88.508 E-.12229
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I1.094 J-.534 P1  F42000
G1 X84.73 Y85.992 Z6.88
G1 Z6.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.232 Y87.025 I-.292 J.78 E.02443
G3 X84.554 Y86.713 I-.215 J-.425 E.01653
G3 X84.604 Y85.977 I.473 J-.337 E.01541
G1 X84.675 Y85.971 E.00136
M106 S201.45
M106 S255
; WIPE_START
G1 X85.078 Y86.234 E-.18322
G1 X85.25 Y86.54 E-.13308
G1 X85.296 Y86.838 E-.11462
G1 X85.232 Y87.025 E-.07535
G1 X85.096 Y87.107 E-.06035
G1 X84.83 Y87.035 E-.10465
G1 X84.678 Y86.858 E-.08873
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I.049 J1.216 P1  F42000
G1 X88.115 Y86.719 Z6.88
G1 Z6.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.901 Y87.2 I-.051 J.967 E.01851
G1 X88.873 Y87.354 E.00301
G3 X87.655 Y86.916 I-.43 J-.718 E.02851
G3 X88.056 Y86.716 I.44 J.378 E.00887
M106 S201.45
M106 S255
; WIPE_START
G1 X88.527 Y86.818 E-.18297
G1 X88.768 Y86.976 E-.10974
G1 X88.901 Y87.2 E-.09892
G1 X88.873 Y87.354 E-.05941
M73 P75 R4
G1 X88.679 Y87.474 E-.08671
G1 X88.227 Y87.451 E-.172
G1 X88.109 Y87.39 E-.05025
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I-.622 J1.046 P1  F42000
G1 X89.228 Y88.055 Z6.88
G1 Z6.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.181 Y88.847 I-.614 J1.708 E.02437
G3 X90.368 Y89.58 I-.546 J.529 E.01526
G3 X89.476 Y89.081 I-.066 J-.928 E.02084
G3 X88.922 Y88.341 I.979 J-1.312 E.01806
G3 X89.17 Y88.045 I.206 J-.079 E.00907
M106 S201.45
M106 S255
; WIPE_START
G1 X89.833 Y88.384 E-.283
G1 X90.181 Y88.847 E-.22014
G1 X90.42 Y89.303 E-.19565
G1 X90.425 Y89.464 E-.06121
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I1.21 J-.133 P1  F42000
G1 X90.117 Y86.664 Z6.88
G1 Z6.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.516 Y86.851 I.057 J.396 E.00899
G3 X89.415 Y87.386 I-.796 J-.239 E.02651
G1 X89.335 Y87.251 E.00303
G3 X90.058 Y86.66 I.777 J.213 E.01921
M106 S201.45
M106 S255
; WIPE_START
G1 X90.397 Y86.711 E-.13007
G1 X90.516 Y86.851 E-.0701
G1 X90.403 Y87.122 E-.11136
G1 X90.052 Y87.381 E-.16579
G1 X89.564 Y87.449 E-.18734
G1 X89.415 Y87.386 E-.06116
G1 X89.369 Y87.309 E-.03418
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I-.932 J-.783 P1  F42000
G1 X87.633 Y89.375 Z6.88
G1 Z6.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X87.827 Y89.433 I-.011 J.391 E.00395
G3 X87.373 Y90.168 I-.728 J.058 E.01783
G1 X87.051 Y90.331 E.00696
G3 X86.463 Y90.416 I-.336 J-.25 E.01271
G3 X85.851 Y89.952 I-.114 J-.486 E.01691
G3 X86.569 Y89.757 I.517 J.487 E.0151
G2 X87.234 Y89.436 I-1.888 J-4.748 E.01424
G3 X87.575 Y89.363 I.324 J.69 E.00678
M106 S201.45
M106 S255
; WIPE_START
G1 X87.827 Y89.433 E-.09928
G1 X87.837 Y89.63 E-.07517
G1 X87.746 Y89.815 E-.07828
G1 X87.373 Y90.168 E-.19522
G1 X87.051 Y90.331 E-.13718
G1 X86.901 Y90.48 E-.08018
G1 X86.695 Y90.504 E-.07863
G1 X86.656 Y90.489 E-.01606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I-.491 J1.114 P1  F42000
G1 X89.292 Y91.651 Z6.88
G1 Z6.48
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X89.393 Y91.739 E.00257
G1 X88.748 Y91.607 E.01269
G1 X89.079 Y91.395 E.00757
G1 X89.033 Y90.705 E.01333
G3 X89.482 Y91.26 I-.464 J.833 E.0141
G3 X90.333 Y91.989 I-2.998 J4.36 E.02164
G3 X90.063 Y92.28 I-.266 J.024 E.00862
G3 X88.908 Y92.068 I.433 J-5.623 E.02268
G3 X88.52 Y92.684 I-1.328 J-.407 E.01419
G3 X87.967 Y92.196 I-.006 J-.551 E.01557
G2 X87.258 Y91.665 I-104.057 J137.931 E.01708
G3 X87.178 Y91.178 I.172 J-.278 E.01075
G3 X88.189 Y91.466 I.212 J1.174 E.02099
G1 X88.729 Y91.121 E.01235
G3 X88.978 Y90.684 I.482 J-.014 E.01019
M106 S201.45
M106 S255
; WIPE_START
G1 X89.307 Y90.923 E-.15449
G1 X89.482 Y91.26 E-.1442
G1 X90.228 Y91.833 E-.35759
G1 X90.333 Y91.989 E-.07139
G1 X90.33 Y92.074 E-.03233
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I-.907 J-.812 P1  F42000
G1 X89.6 Y92.889 Z6.88
G1 Z6.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.907 Y94.018 I-.307 J.69 E.0258
G3 X89.384 Y92.918 I.134 J-.739 E.02742
G1 X89.544 Y92.87 E.00323
M106 S201.45
M106 S255
; WIPE_START
G1 X89.903 Y93.124 E-.16737
G1 X90.015 Y93.349 E-.09522
G1 X90.046 Y93.818 E-.17875
G1 X89.907 Y94.018 E-.09252
G1 X89.565 Y93.886 E-.13929
G1 X89.431 Y93.701 E-.08684
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I.88 J.841 P1  F42000
G1 X94.502 Y88.396 Z6.88
G1 Z6.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.924 Y89.446 I-.343 J.748 E.02405
G1 X94.998 Y89.967 E.01013
G3 X94.551 Y91.134 I-.582 J.447 E.02884
G1 X94.494 Y91.083 E.00147
G3 X94.579 Y90.074 I.968 J-.427 E.02036
G2 X94.556 Y89.405 I-1.124 J-.296 E.01308
G3 X94.378 Y88.382 I.374 J-.592 E.02254
G1 X94.447 Y88.376 E.00134
M106 S201.45
M106 S255
; WIPE_START
G1 X94.829 Y88.625 E-.17337
G1 X94.977 Y88.901 E-.11896
G1 X95.014 Y89.176 E-.10553
G1 X94.924 Y89.446 E-.10829
G1 X94.998 Y89.967 E-.19978
G1 X95.085 Y90.079 E-.05407
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I-.381 J1.156 P1  F42000
G1 X96.636 Y90.589 Z6.88
G1 Z6.48
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X96.481 Y90.169 I-.593 J-.021 E.00886
G1 X96.483 Y90.169 E.00003
G2 X97.36 Y89.56 I-.835 J-2.14 E.02078
G1 X97.435 Y88.385 E.0227
G3 X97.742 Y89.371 I-.693 J.757 E.02086
G2 X98.032 Y89.818 I1.048 J-.36 E.01038
G3 X97.995 Y90.324 I-.376 J.226 E.01041
G2 X97.492 Y90.325 I-.248 J1.598 E.00973
G2 X96.952 Y91.206 I.385 J.841 E.02113
G3 X96.592 Y91.621 I-.53 J-.097 E.01112
G3 X96.29 Y90.888 I.517 J-.642 E.01594
G2 X95.837 Y89.94 I-3.819 J1.242 E.0203
G3 X96.156 Y89.591 I.186 J-.15 E.01306
G1 X96.463 Y89.711 E.00635
G2 X97.017 Y89.3 I-.583 J-1.364 E.01342
G3 X97.376 Y88.376 I1.025 J-.133 E.01993
M106 S201.45
M106 S255
; WIPE_START
G1 X97.578 Y88.517 E-.09357
G1 X97.7 Y88.769 E-.10634
G1 X97.742 Y89.371 E-.22925
G1 X97.796 Y89.556 E-.07325
G1 X98.032 Y89.818 E-.13407
G1 X98.098 Y90.137 E-.12352
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I-.302 J1.179 P1  F42000
G1 X99.257 Y90.433 Z6.88
G1 Z6.48
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X99.235 Y90.542 E.00214
G1 X99.19 Y90.477 E.00151
G1 X99.731 Y89.551 E.02068
G3 X99.9 Y89.883 I-.043 J.231 E.00831
G2 X99.606 Y90.824 I5.019 J2.084 E.01903
G3 X99.369 Y91.62 I-.554 J.268 E.01756
G3 X98.863 Y90.742 I.551 J-.903 E.02038
G3 X99.023 Y90.084 I.309 J-.273 E.0153
G3 X99.672 Y89.55 I.93 J.468 E.01668
M106 S201.45
; WIPE_START
G1 X99.854 Y89.592 E-.07102
G1 X99.9 Y89.883 E-.1121
G1 X99.703 Y90.346 E-.19102
G1 X99.606 Y90.824 E-.1855
G1 X99.605 Y91.352 E-.20037
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I-1.211 J-.115 P1  F42000
G1 X99.401 Y93.501 Z6.88
G1 Z6.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.88
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.88 F4000
            G39.3 S1
            G0 Z6.88 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z6.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F6953
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.09 Y83.995 Z6.88 F42000
G1 X82.8 Y81.114 Z6.88
G1 Z6.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.114 E.04757
G1 X80.2 Y80.2 E.01673
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.054 E.01563
M204 S10000
G1 X82.6 Y80.657 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.540892
G1 F6953
M204 S6000
G1 X80.4 Y80.657 E.05543
; WIPE_START
G1 F15000
G1 X82.4 Y80.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.286 Z6.88 F42000
G1 X81.977 Y94.291 Z6.88
G1 Z6.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.023 Y94.291 E.01977
G1 X81.023 Y85.709 E.17801
G1 X81.977 Y85.709 E.01977
G1 X81.977 Y94.231 E.17676
M204 S10000
G1 X82.401 Y94.715 F42000
G1 F4800
M204 S6000
G1 X80.599 Y94.715 E.03737
G1 X80.599 Y85.285 E.19561
G1 X82.401 Y85.285 E.03737
G1 X82.401 Y94.655 E.19436
M204 S250
G1 X82.8 Y95.114 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.114 E.04757
G1 X80.2 Y84.886 E.18716
G1 X82.8 Y84.886 E.04757
G1 X82.8 Y95.054 E.18607
; WIPE_START
M204 S6000
G1 X80.801 Y95.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.079 Z6.88 F42000
G1 Z6.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F6953
M204 S6000
G1 X81.5 Y85.921 E.21091
; WIPE_START
G1 F15000
G1 X81.5 Y87.921 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.33 Y95.508 Z6.88 F42000
G1 X82.8 Y99.8 Z6.88
G1 Z6.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.886 E.01673
G1 X82.8 Y98.886 E.04757
G1 X82.8 Y99.74 E.01563
M204 S10000
G1 X82.6 Y99.343 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.540892
G1 F6953
M204 S6000
G1 X80.4 Y99.343 E.05543
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.343 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/82
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.88 I.979 J.723 P1  F42000
G1 X86.731 Y93.477 Z6.88
G1 Z6.6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X87.321 Y93.914 I-.095 J.745 E.01479
G3 X86.691 Y94.007 I-.364 J-.285 E.01354
G3 X86.376 Y93.566 I.119 J-.418 E.01129
G3 X86.673 Y93.465 I.241 J.223 E.00631
M106 S201.45
M106 S255
; WIPE_START
G1 X87.051 Y93.59 E-.15125
G1 X87.206 Y93.716 E-.07602
G1 X87.321 Y93.914 E-.08684
G1 X87.223 Y94.049 E-.06334
G1 X87.073 Y94.076 E-.05795
G1 X86.691 Y94.007 E-.1475
G1 X86.425 Y93.824 E-.12261
G1 X86.357 Y93.698 E-.05448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.147 J-.406 P1  F42000
G1 X85.921 Y92.464 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X86.046 Y92.611 I-.05 J.169 E.00393
G3 X85.453 Y93.607 I-1.08 J.031 E.02357
G3 X84.427 Y94.048 I-.882 J-.637 E.0226
G3 X84.56 Y93.616 I.202 J-.174 E.01039
G3 X85.423 Y93.045 I95.839 J143.652 E.01994
G3 X85.862 Y92.463 I.91 J.23 E.01445
M106 S201.45
M106 S255
; WIPE_START
G1 X86.046 Y92.611 E-.08982
G1 X85.991 Y93.027 E-.1594
G1 X85.88 Y93.212 E-.08185
G1 X85.453 Y93.607 E-.22099
G1 X85.344 Y93.759 E-.07119
G1 X85.036 Y93.946 E-.13675
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.215 J.062 P1  F42000
G1 X85.193 Y90.896 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.241 Y91.307 I-.055 J.214 E.01027
G3 X84.464 Y91.427 I-.456 J-.378 E.01656
G3 X85.134 Y90.892 I.631 J.103 E.01812
M106 S201.45
M106 S255
; WIPE_START
G1 X85.344 Y90.987 E-.08743
G1 X85.359 Y91.112 E-.04793
G1 X85.241 Y91.307 E-.08657
G1 X84.824 Y91.509 E-.17604
G1 X84.586 Y91.52 E-.09043
G1 X84.464 Y91.427 E-.05832
G1 X84.483 Y91.275 E-.05816
G1 X84.65 Y91.075 E-.09907
G1 X84.777 Y91.001 E-.05604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I-.071 J1.215 P1  F42000
G1 X87.292 Y91.148 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.208 Y91.761 I-.244 J1.355 E.02184
G3 X88.596 Y92.692 I-.388 J.708 E.02101
G3 X88.363 Y92.694 I-.118 J-.127 E.00494
G3 X87.779 Y91.901 I2.905 J-2.748 E.01901
G3 X87.037 Y91.314 I.288 J-1.127 E.0188
G3 X87.235 Y91.135 I.168 J-.013 E.00593
M106 S201.45
M106 S255
; WIPE_START
G1 X87.609 Y91.216 E-.14537
G1 X87.809 Y91.331 E-.08783
G1 X87.991 Y91.457 E-.08406
G1 X88.208 Y91.761 E-.14168
G1 X88.446 Y91.945 E-.11428
G1 X88.592 Y92.17 E-.10206
G1 X88.647 Y92.373 E-.07981
G1 X88.645 Y92.385 E-.0049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.19 J.256 P1  F42000
G1 X89.019 Y90.647 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.372 Y91.301 I-1.196 J1.069 E.01447
G1 X89.791 Y91.653 E.01055
G3 X90.401 Y92.095 I-.1 J.78 E.01514
G3 X90.156 Y92.256 I-.201 J-.038 E.00631
G3 X89.172 Y91.712 I-.111 J-.962 E.02312
G3 X88.873 Y90.665 I.45 J-.694 E.0229
G1 X88.961 Y90.638 E.00176
M106 S201.45
M106 S255
; WIPE_START
G1 X89.191 Y90.813 E-.11007
G1 X89.335 Y91.083 E-.11624
G1 X89.372 Y91.301 E-.08424
G1 X89.791 Y91.653 E-.20789
G1 X90.125 Y91.778 E-.13558
G1 X90.308 Y91.917 E-.08716
G1 X90.331 Y91.961 E-.01882
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I.864 J-.857 P1  F42000
G1 X87.744 Y89.353 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X87.901 Y89.481 I.001 J.16 E.00424
G3 X86.885 Y90.187 I-1.045 J-.421 E.02524
G3 X85.782 Y90.062 I-.479 J-.711 E.02328
G3 X86.133 Y89.803 I.303 J.043 E.00937
G2 X86.881 Y89.749 I.165 J-2.927 E.0145
G3 X87.684 Y89.352 I1.094 J1.202 E.01751
M106 S201.45
M106 S255
; WIPE_START
G1 X87.901 Y89.481 E-.09599
G1 X87.8 Y89.715 E-.09688
M73 P76 R4
G1 X87.639 Y89.888 E-.08967
G1 X87.206 Y90.131 E-.18864
G1 X86.885 Y90.187 E-.12389
G1 X86.501 Y90.309 E-.15321
G1 X86.47 Y90.31 E-.01172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I.796 J.92 P1  F42000
G1 X89.108 Y88.028 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.846 Y88.71 I-.457 J1.235 E.01987
G3 X90.326 Y89.156 I-.434 J.948 E.01284
G3 X90.419 Y89.601 I-.342 J.304 E.00917
G3 X90.131 Y89.589 I-.136 J-.176 E.00604
G3 X89.371 Y88.755 I.966 J-1.645 E.02208
G3 X88.909 Y88.109 I.196 J-.628 E.01643
G3 X89.05 Y88.016 I.177 J.115 E.00336
M106 S201.45
M106 S255
; WIPE_START
G1 X89.491 Y88.249 E-.18935
G1 X89.846 Y88.71 E-.22117
G1 X89.96 Y88.73 E-.04408
G1 X90.326 Y89.156 E-.21321
G1 X90.433 Y89.374 E-.09219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I.895 J-.824 P1  F42000
G1 X88.033 Y86.767 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.625 Y87.138 I-.081 J.785 E.01393
G3 X88.348 Y87.346 I-.271 J-.072 E.0072
G3 X87.605 Y86.962 I-.024 J-.864 E.01682
G3 X87.975 Y86.759 I.264 J.042 E.00937
M106 S201.45
M106 S255
; WIPE_START
G1 X88.215 Y86.791 E-.09223
G1 X88.517 Y86.961 E-.13134
G1 X88.625 Y87.138 E-.0788
G1 X88.598 Y87.25 E-.04371
G1 X88.348 Y87.346 E-.10207
G1 X87.954 Y87.271 E-.15225
G1 X87.698 Y87.101 E-.11675
G1 X87.635 Y87.008 E-.04285
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I-.586 J-1.066 P1  F42000
G1 X86.001 Y87.907 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X86.62 Y88.284 I-.061 J.797 E.01451
G3 X86.161 Y88.479 I-.383 J-.262 E.01016
G2 X84.964 Y88.847 I-.293 J1.175 E.02536
G3 X84.517 Y88.781 I-.196 J-.221 E.00992
G3 X85.527 Y88.019 I.993 J.267 E.02626
G3 X85.942 Y87.896 I.43 J.687 E.00845
M106 S201.45
M106 S255
; WIPE_START
G1 X86.349 Y88.003 E-.15979
G1 X86.525 Y88.117 E-.07953
G1 X86.62 Y88.284 E-.07291
G1 X86.527 Y88.421 E-.06296
G1 X86.161 Y88.479 E-.14106
G1 X85.888 Y88.444 E-.10443
G1 X85.53 Y88.52 E-.13934
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.155 J-.383 P1  F42000
G1 X84.675 Y85.938 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.069 Y86.822 I-.255 J.644 E.02066
G3 X84.496 Y86.381 I-.103 J-.46 E.01592
G3 X84.618 Y85.922 I.273 J-.173 E.01027
M106 S201.45
M106 S255
; WIPE_START
G1 X84.939 Y86.143 E-.14811
G1 X85.091 Y86.411 E-.11682
G1 X85.13 Y86.664 E-.09742
G1 X85.069 Y86.822 E-.06434
G1 X84.958 Y86.87 E-.0459
G1 X84.739 Y86.778 E-.09047
G1 X84.496 Y86.381 E-.17712
G1 X84.495 Y86.328 E-.01982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I-.075 J1.215 P1  F42000
G1 X90.383 Y86.69 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.453 Y87.043 I.001 J.183 E.00973
G3 X89.608 Y87.211 I-.522 J-.417 E.01805
G3 X89.965 Y86.739 I.491 J.001 E.01224
G3 X90.325 Y86.682 I.31 J.784 E.00708
M106 S201.45
M106 S255
; WIPE_START
G1 X90.526 Y86.743 E-.0798
G1 X90.568 Y86.84 E-.04011
G1 X90.453 Y87.043 E-.08861
G1 X90.297 Y87.174 E-.07738
G1 X89.91 Y87.311 E-.15596
G1 X89.751 Y87.301 E-.06071
G1 X89.608 Y87.211 E-.06433
G1 X89.587 Y87.086 E-.04811
G1 X89.664 Y86.946 E-.0607
G1 X89.847 Y86.82 E-.08429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I-.382 J1.155 P1  F42000
G1 X94.456 Y88.344 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X94.468 Y88.347 E.00023
G3 X94.813 Y89.188 I-.36 J.639 E.01891
G3 X94.312 Y88.917 I-.146 J-.327 E.01269
G3 X94.313 Y88.356 I.512 J-.28 E.01126
G1 X94.399 Y88.329 E.00174
M106 S201.45
M106 S255
; WIPE_START
G1 X94.468 Y88.347 E-.02708
G1 X94.694 Y88.534 E-.11167
G1 X94.836 Y88.786 E-.10977
G1 X94.869 Y89.029 E-.09306
G1 X94.813 Y89.188 E-.06431
G1 X94.707 Y89.25 E-.0466
G1 X94.521 Y89.196 E-.07367
G1 X94.312 Y88.917 E-.13245
G1 X94.268 Y88.653 E-.10139
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I-1.127 J.46 P1  F42000
G1 X94.911 Y90.229 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.612 Y91.2 I-.641 J.334 E.02172
G3 X94.441 Y90.701 I.176 J-.339 E.01122
G3 X94.87 Y90.187 I.565 J.035 E.0138
M106 S201.45
M106 S255
; WIPE_START
G1 X95.021 Y90.503 E-.13301
G1 X94.979 Y90.771 E-.10299
G1 X94.844 Y91.021 E-.10824
G1 X94.612 Y91.2 E-.11147
G1 X94.453 Y91.074 E-.07692
G1 X94.441 Y90.701 E-.14195
G1 X94.535 Y90.497 E-.08542
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I.674 J1.013 P1  F42000
G1 X95.978 Y89.536 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.728 Y90.394 I-.354 J1.066 E.02304
G3 X96.685 Y91.658 I-1.01 J.599 E.02575
G3 X96.47 Y91.573 I-.058 J-.168 E.00484
G3 X96.41 Y90.796 I1.086 J-.476 E.01532
G1 X96.171 Y90.302 E.01056
G3 X95.791 Y89.614 I.418 J-.681 E.01585
G3 X95.92 Y89.521 I.204 J.147 E.00313
M106 S201.45
M106 S255
; WIPE_START
G1 X96.168 Y89.606 E-.09961
G1 X96.467 Y89.832 E-.14233
G1 X96.665 Y90.14 E-.13904
G1 X96.728 Y90.394 E-.09951
G1 X96.887 Y90.729 E-.14093
G1 X96.919 Y91.04 E-.11875
G1 X96.911 Y91.091 E-.01982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.196 J.227 P1  F42000
G1 X97.433 Y88.339 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.637 Y89.337 I-.679 J.659 E.02074
G3 X98.119 Y90.113 I-13.29 J8.793 E.01761
G3 X98.034 Y90.359 I-.167 J.08 E.00557
G3 X97.284 Y89.591 I.064 J-.812 E.02258
G3 X97.295 Y88.36 I1.03 J-.607 E.02493
G1 X97.374 Y88.333 E.00162
M106 S201.45
M106 S255
; WIPE_START
G1 X97.524 Y88.394 E-.06146
G1 X97.625 Y88.629 E-.09715
G1 X97.675 Y88.937 E-.11886
G1 X97.637 Y89.337 E-.15258
G1 X98.095 Y90.075 E-.32995
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I.36 J1.162 P1  F42000
G1 X99.848 Y89.531 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X99.914 Y89.76 I-.089 J.149 E.00505
G3 X99.602 Y90.298 I-1.884 J-.732 E.01203
G1 X99.504 Y90.845 E.01072
G3 X99.439 Y91.661 I-.628 J.36 E.01675
G3 X99.003 Y91.02 I.198 J-.603 E.01607
G3 X99.598 Y89.567 I1.587 J-.198 E.03163
G3 X99.798 Y89.501 I.18 J.211 E.00415
M106 S201.45
M106 S255
; WIPE_START
G1 X99.924 Y89.612 E-.06364
G1 X99.914 Y89.76 E-.0564
G1 X99.841 Y89.99 E-.09195
G1 X99.602 Y90.298 E-.14774
G1 X99.504 Y90.845 E-.21139
G1 X99.597 Y91.229 E-.14998
G1 X99.586 Y91.33 E-.03889
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I-.217 J-1.198 P1  F42000
G1 X89.634 Y93.131 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.915 Y94.07 I-.201 J.572 E.02202
G1 X89.859 Y94.077 E.00108
G3 X89.47 Y93.183 I.369 J-.692 E.02028
G1 X89.576 Y93.117 E.00241
M106 S201.45
; WIPE_START
G1 X89.872 Y93.282 E-.12894
G1 X89.985 Y93.484 E-.08795
G1 X90.033 Y93.922 E-.16731
G1 X89.915 Y94.07 E-.07216
G1 X89.859 Y94.077 E-.02126
G1 X89.625 Y93.904 E-.1106
G1 X89.459 Y93.626 E-.12308
G1 X89.444 Y93.499 E-.0487
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I0 J1.217 P1  F42000
G1 X99.401 Y93.501 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7 F4000
            G39.3 S1
            G0 Z7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F15000
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.087 Y84.004 Z7 F42000
G1 X82.8 Y81.134 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.134 E.04757
G1 X80.2 Y80.2 E.0171
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.074 E.016
M204 S10000
G1 X82.6 Y80.667 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.560892
G1 F15000
M204 S6000
G1 X80.4 Y80.667 E.05758
; WIPE_START
G1 X82.4 Y80.667 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.296 Z7 F42000
G1 X81.977 Y94.311 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.023 Y94.311 E.01977
G1 X81.023 Y85.689 E.17884
G1 X81.977 Y85.689 E.01977
G1 X81.977 Y94.251 E.17759
M204 S10000
G1 X82.401 Y94.735 F42000
G1 F4800
M204 S6000
G1 X80.599 Y94.735 E.03737
G1 X80.599 Y85.265 E.19644
G1 X82.401 Y85.265 E.03737
G1 X82.401 Y94.675 E.19519
M204 S250
G1 X82.8 Y95.134 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.134 E.04757
G1 X80.2 Y84.866 E.1879
G1 X82.8 Y84.866 E.04757
G1 X82.8 Y95.074 E.1868
; WIPE_START
M204 S6000
G1 X80.801 Y95.121 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.099 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y85.901 E.21194
; WIPE_START
G1 X81.5 Y87.901 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.329 Y95.489 Z7 F42000
G1 X82.8 Y99.8 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.866 E.0171
G1 X82.8 Y98.866 E.04757
G1 X82.8 Y99.74 E.016
M204 S10000
G1 X82.6 Y99.333 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.560892
G1 F15000
M204 S6000
G1 X80.4 Y99.333 E.05758
; CHANGE_LAYER
; Z_HEIGHT: 6.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.333 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/82
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7 I1.198 J.214 P1  F42000
G1 X83.625 Y92.477 Z7
G1 Z6.72
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
M204 S6000
G1 X85.05 Y93.903 E.03887
G1 X86.315 Y93.903 E.02438
G1 X83.802 Y91.39 E.06851
G1 X83.802 Y90.125 E.02438
G1 X87.58 Y93.903 E.10298
G1 X88.844 Y93.903 E.02438
G1 X83.802 Y88.861 E.13745
G1 X83.802 Y87.596 E.02438
G1 X90.109 Y93.903 E.17193
G1 X90.698 Y93.903 E.01135
G1 X90.698 Y93.227 E.01302
G1 X83.802 Y86.331 E.18798
G1 X83.802 Y86.097 E.00452
G1 X84.832 Y86.097 E.01986
G1 X90.698 Y91.963 E.1599
G1 X90.698 Y90.698 E.02438
G1 X86.097 Y86.097 E.12542
G1 X87.362 Y86.097 E.02438
G1 X90.698 Y89.433 E.09095
G1 X90.698 Y88.169 E.02438
G1 X88.626 Y86.097 E.05647
G1 X89.891 Y86.097 E.02438
G1 X90.875 Y87.081 E.02684
; WIPE_START
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z7.12 I-.997 J.698 P1  F42000
G1 X93.825 Y91.295 Z7.12
G1 Z6.72
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X94.027 Y91.498 E.00552
G1 X95.292 Y91.498 E.02438
G1 X94.002 Y90.208 E.03516
G1 X94.002 Y88.943 E.02438
G1 X96.557 Y91.498 E.06964
G1 X97.821 Y91.498 E.02438
G1 X94.825 Y88.502 E.08167
G1 X96.09 Y88.502 E.02438
G1 X99.086 Y91.498 E.08167
G1 X99.803 Y91.498 E.01382
G1 X99.803 Y90.95 E.01055
G1 X97.355 Y88.502 E.06674
G1 X98.619 Y88.502 E.02438
G1 X99.98 Y89.863 E.03711
; WIPE_START
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z7.12 I-1.202 J-.192 P1  F42000
G1 X99.401 Y93.501 Z7.12
G1 Z6.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.12
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.12 F4000
            G39.3 S1
            G0 Z7.12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z6.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F12720
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.082 Y84.016 Z7.12 F42000
G1 X82.8 Y81.163 Z7.12
G1 Z6.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.163 E.04757
G1 X80.2 Y80.2 E.01763
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.103 E.01653
M204 S10000
M73 P77 R4
G1 X82.6 Y80.682 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.589992
G1 F12720
M204 S6000
G1 X80.4 Y80.682 E.06071
; WIPE_START
G1 F15000
G1 X82.4 Y80.682 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.163 Y88.311 Z7.12 F42000
G1 X81.977 Y94.34 Z7.12
G1 Z6.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.023 Y94.34 E.01977
G1 X81.023 Y85.66 E.18004
G1 X81.977 Y85.66 E.01977
G1 X81.977 Y94.28 E.1788
M204 S10000
G1 X82.401 Y94.764 F42000
G1 F4800
M204 S6000
G1 X80.599 Y94.764 E.03737
G1 X80.599 Y85.236 E.19764
G1 X82.401 Y85.236 E.03737
G1 X82.401 Y94.704 E.1964
M204 S250
G1 X82.8 Y95.163 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.163 E.04757
G1 X80.2 Y84.837 E.18896
G1 X82.8 Y84.837 E.04757
G1 X82.8 Y95.103 E.18786
; WIPE_START
M204 S6000
G1 X80.801 Y95.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.128 Z7.12 F42000
G1 Z6.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F12720
M204 S6000
G1 X81.5 Y85.872 E.21345
; WIPE_START
G1 F15000
G1 X81.5 Y87.872 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.327 Y95.46 Z7.12 F42000
G1 X82.8 Y99.8 Z7.12
G1 Z6.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.837 E.01763
G1 X82.8 Y98.837 E.04757
G1 X82.8 Y99.74 E.01653
M204 S10000
G1 X82.6 Y99.318 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.589992
G1 F12720
M204 S6000
G1 X80.4 Y99.318 E.06071
; CHANGE_LAYER
; Z_HEIGHT: 6.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.318 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/82
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.12 I.709 J.989 P1  F42000
G1 X89.714 Y94.08 Z7.12
G1 Z6.84
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
M204 S6000
G1 X90.698 Y93.096 E.02684
G1 X90.698 Y91.831 E.02438
G1 X88.626 Y93.903 E.05647
G1 X87.362 Y93.903 E.02438
G1 X90.698 Y90.567 E.09095
G1 X90.698 Y89.302 E.02438
G1 X86.097 Y93.903 E.12542
G1 X84.832 Y93.903 E.02438
G1 X90.698 Y88.037 E.1599
G1 X90.698 Y86.773 E.02438
G1 X83.802 Y93.669 E.18798
G1 X83.802 Y92.404 E.02438
G1 X90.109 Y86.097 E.17193
G1 X88.844 Y86.097 E.02438
G1 X83.802 Y91.139 E.13745
G1 X83.802 Y89.875 E.02438
G1 X87.58 Y86.097 E.10298
G1 X86.315 Y86.097 E.02438
G1 X83.802 Y88.61 E.06851
G1 X83.802 Y87.345 E.02438
G1 X85.228 Y85.92 E.03887
; WIPE_START
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z7.24 I-.315 J1.176 P1  F42000
G1 X94.205 Y88.325 Z7.24
G1 Z6.84
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X94.002 Y88.527 E.00552
G1 X94.002 Y89.792 E.02438
G1 X95.292 Y88.502 E.03516
G1 X96.557 Y88.502 E.02438
G1 X94.002 Y91.057 E.06964
G1 X94.002 Y91.498 E.00851
G1 X94.825 Y91.498 E.01587
G1 X97.821 Y88.502 E.08167
G1 X99.086 Y88.502 E.02438
G1 X96.09 Y91.498 E.08167
G1 X97.355 Y91.498 E.02438
G1 X99.803 Y89.05 E.06674
G1 X99.803 Y90.314 E.02438
G1 X98.442 Y91.675 E.03711
; WIPE_START
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z7.24 I-1.077 J.566 P1  F42000
G1 X99.401 Y93.501 Z7.24
G1 Z6.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.24 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.24
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.24 F4000
            G39.3 S1
            G0 Z7.24 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z6.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F14405
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.076 Y84.033 Z7.24 F42000
G1 X82.8 Y81.202 Z7.24
G1 Z6.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y81.202 E.04757
G1 X80.2 Y80.2 E.01834
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.142 E.01724
M204 S10000
G1 X82.6 Y80.701 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.628602
G1 F14405
M204 S6000
G1 X80.4 Y80.701 E.06487
; WIPE_START
G1 F15000
G1 X82.4 Y80.701 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.164 Y88.33 Z7.24 F42000
G1 X81.977 Y94.379 Z7.24
G1 Z6.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.023 Y94.379 E.01977
G1 X81.023 Y85.621 E.18165
G1 X81.977 Y85.621 E.01977
G1 X81.977 Y94.319 E.1804
M204 S10000
G1 X82.401 Y94.803 F42000
G1 F4800
M204 S6000
G1 X80.599 Y94.803 E.03737
G1 X80.599 Y85.197 E.19925
G1 X82.401 Y85.197 E.03737
G1 X82.401 Y94.743 E.198
M204 S250
G1 X82.8 Y95.202 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y95.202 E.04757
G1 X80.2 Y84.798 E.19037
G1 X82.8 Y84.798 E.04757
G1 X82.8 Y95.142 E.18928
; WIPE_START
M204 S6000
G1 X80.801 Y95.188 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.166 Z7.24 F42000
G1 Z6.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F14405
M204 S6000
G1 X81.5 Y85.834 E.21544
; WIPE_START
G1 F15000
G1 X81.5 Y87.834 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.324 Y95.421 Z7.24 F42000
G1 X82.8 Y99.8 Z7.24
G1 Z6.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.798 E.01834
G1 X82.8 Y98.798 E.04757
G1 X82.8 Y99.74 E.01724
M204 S10000
G1 X82.6 Y99.299 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.628602
G1 F14405
M204 S6000
G1 X80.4 Y99.299 E.06487
; CHANGE_LAYER
; Z_HEIGHT: 6.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.299 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/82
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.24 I.393 J1.152 P1  F42000
G1 X99.401 Y93.501 Z7.24
G1 Z6.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2782
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
M73 P78 R4
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.36 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.36
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.36 F4000
            G39.3 S1
            G0 Z7.36 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z6.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2782
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.069 Y84.05 Z7.36 F42000
G1 X82.8 Y81.242 Z7.36
G1 Z6.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X82.8 Y81.251 E.00016
G1 X80.2 Y81.251 E.04757
G1 X80.2 Y81.242 E.00016
G1 X80.2 Y80.2 E.01907
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.182 E.01797
M204 S10000
G1 X82.6 Y80.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.677402
G1 F2782
M204 S6000
G1 X80.4 Y80.725 E.07012
; WIPE_START
G1 F15000
G1 X82.4 Y80.725 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.164 Y88.354 Z7.36 F42000
G1 X81.977 Y94.427 Z7.36
G1 Z6.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2782
M204 S6000
G1 X81.023 Y94.427 E.01977
G1 X81.023 Y85.573 E.18367
G1 X81.977 Y85.573 E.01977
G1 X81.977 Y94.367 E.18243
M204 S10000
G1 X82.401 Y94.852 F42000
G1 F2782
M204 S6000
G1 X80.599 Y94.852 E.03737
G1 X80.599 Y85.148 E.20127
G1 X82.401 Y85.148 E.03737
G1 X82.401 Y94.792 E.20003
M204 S250
G1 X82.8 Y95.242 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X82.8 Y95.251 E.00016
G1 X80.2 Y95.251 E.04757
G1 X80.2 Y95.242 E.00016
G1 X80.2 Y84.758 E.19184
G1 X80.2 Y84.749 E.00016
G1 X82.8 Y84.749 E.04757
G1 X82.8 Y84.758 E.00016
G1 X82.8 Y95.182 E.19074
; WIPE_START
M204 S6000
G1 X82.8 Y95.251 E-.02614
G1 X80.869 Y95.251 E-.73386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.215 Z7.36 F42000
G1 Z6.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2782
M204 S6000
G1 X81.5 Y85.785 E.21797
; WIPE_START
G1 F15000
G1 X81.5 Y87.785 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.321 Y95.373 Z7.36 F42000
G1 X82.8 Y99.8 Z7.36
G1 Z6.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.758 E.01907
G1 X80.2 Y98.749 E.00016
G1 X82.8 Y98.749 E.04757
G1 X82.8 Y98.758 E.00016
G1 X82.8 Y99.74 E.01797
M204 S10000
G1 X82.6 Y99.275 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.677402
G1 F2782
M204 S6000
G1 X80.4 Y99.275 E.07012
; CHANGE_LAYER
; Z_HEIGHT: 7.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.4 Y99.275 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/82
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.36 I.391 J1.152 P1  F42000
G1 X99.401 Y93.501 Z7.36
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2939
M204 S6000
G1 X92.099 Y93.501 E.15145
G1 X92.099 Y86.499 E.14523
G1 X99.401 Y86.499 E.15145
G1 X99.401 Y87.101 E.01248
G1 X92.601 Y87.101 E.14105
G1 X92.601 Y92.899 E.12027
G1 X99.401 Y92.899 E.14105
G1 X99.401 Y93.441 E.01123
M204 S250
G1 X99.8 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X91.7 Y93.9 E.14821
G1 X91.7 Y86.1 E.14272
G1 X99.8 Y86.1 E.14821
G1 X99.8 Y87.5 E.02562
G1 X93 Y87.5 E.12443
G1 X93 Y92.5 E.09149
G1 X99.8 Y92.5 E.12443
G1 X99.8 Y93.84 E.02452
; WIPE_START
M204 S6000
G1 X97.8 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.48 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.48
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.48 F4000
            G39.3 S1
            G0 Z7.48 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.189 Y93.2 F42000
G1 Z7.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2939
M204 S6000
G1 X92.4 Y93.2 E.05883
G1 X92.389 Y93.189 E.00014
; LINE_WIDTH: 0.160992
G1 X92.369 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X92.35 Y93.111 E.0002
; LINE_WIDTH: 0.103165
G1 X92.35 Y86.889 E.02355
G1 X92.369 Y86.85 E.00016
; LINE_WIDTH: 0.160992
G1 X92.389 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X92.4 Y86.8 E.00014
G1 X99.189 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X97.189 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.098 Y83.976 Z7.48 F42000
G1 X82.401 Y80.912 Z7.48
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2939
M204 S6000
G1 X80.599 Y80.912 E.03737
G1 X80.599 Y80.599 E.00648
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y80.852 E.00524
M204 S250
G1 X82.8 Y81.291 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X82.8 Y81.311 E.00037
G1 X80.2 Y81.311 E.04757
G1 X80.2 Y81.291 E.00037
G1 X80.2 Y80.2 E.01996
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.231 E.01886
; WIPE_START
M204 S6000
G1 X82.8 Y81.311 E-.03041
G1 X80.88 Y81.311 E-.72959
; WIPE_END
M73 P79 R4
G1 E-.04 F1800
M204 S10000
G1 X81.513 Y88.917 Z7.48 F42000
G1 X81.977 Y94.487 Z7.48
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2939
M204 S6000
G1 X81.023 Y94.487 E.01977
G1 X81.023 Y85.513 E.18616
G1 X81.977 Y85.513 E.01977
G1 X81.977 Y94.427 E.18492
M204 S10000
G1 X82.401 Y94.912 F42000
G1 F2939
M204 S6000
G1 X80.599 Y94.912 E.03737
G1 X80.599 Y85.088 E.20376
G1 X82.401 Y85.088 E.03737
G1 X82.401 Y94.852 E.20252
M204 S250
G1 X82.8 Y95.291 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X82.8 Y95.311 E.00037
G1 X80.2 Y95.311 E.04757
G1 X80.2 Y95.291 E.00037
G1 X80.2 Y84.709 E.19362
G1 X80.2 Y84.689 E.00037
G1 X82.8 Y84.689 E.04757
G1 X82.8 Y84.709 E.00037
G1 X82.8 Y95.231 E.19253
; WIPE_START
M204 S6000
G1 X82.8 Y95.311 E-.03041
G1 X80.88 Y95.311 E-.72959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.275 Z7.48 F42000
G1 Z7.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2939
M204 S6000
G1 X81.5 Y85.725 E.22107
; WIPE_START
G1 F15000
G1 X81.5 Y87.725 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.087 Y95.335 Z7.48 F42000
G1 X82.401 Y99.401 Z7.48
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2939
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y99.088 E.00648
G1 X82.401 Y99.088 E.03737
G1 X82.401 Y99.341 E.00524
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
M73 P79 R3
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.709 E.01996
G1 X80.2 Y98.689 E.00037
G1 X82.8 Y98.689 E.04757
G1 X82.8 Y98.709 E.00037
G1 X82.8 Y99.74 E.01886
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/82
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
M106 S255
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.48 I.285 J1.183 P1  F42000
G1 X82.401 Y99.401 Z7.48
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y99.016 E.00799
G1 X82.401 Y99.016 E.03737
G1 X82.401 Y99.341 E.00674
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.649 E.02106
G1 X80.2 Y98.616 E.0006
G1 X82.8 Y98.616 E.04757
G1 X82.8 Y98.649 E.0006
G1 X82.8 Y99.74 E.01996
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.8 Y92.652 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X82.418 Y87.348 E.02012
G1 X82.818 Y87.348 E.0083
G1 F1800
G1 X83.2 Y87.348 E.00793
M106 S198.9
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X91.3 Y87.348 E.16801
M106 S198.9
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X91.683 Y87.348 E.00793
M106 S198.9
M106 S255
G1 F4800
G1 X92.083 Y87.348 E.0083
G1 X98.152 Y87.348 E.1259
G1 X98.552 Y87.348 E.0083
G1 F2936.46
G1 X98.552 Y87.518 E.00352
G1 F1800
G1 X98.552 Y87.9 E.00793
M106 S198.9
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X98.552 Y92.1 E.08712
M106 S198.9
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X98.552 Y92.483 E.00793
M106 S198.9
M106 S255
G1 F2936.46
G1 X98.552 Y92.652 E.00352
G1 F4800
G1 X98.152 Y92.652 E.0083
G1 X92.083 Y92.652 E.1259
G1 X91.683 Y92.652 E.0083
G1 F1800
G1 X91.3 Y92.652 E.00793
M106 S198.9
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X83.2 Y92.652 E.16801
M106 S198.9
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X82.86 Y92.652 E.00705
M106 S198.9
M106 S255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04
M204 S10000
G1 X81.977 Y94.56 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y94.56 E.01977
G1 X81.023 Y85.44 E.18918
G1 X81.977 Y85.44 E.01977
G1 X81.977 Y86.923 E.03077
G1 X82.418 Y86.923 E.00915
G1 X82.818 Y86.923 E.0083
G1 F1800
G1 X83.2 Y86.923 E.00793
M106 S198.9
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X91.3 Y86.923 E.16801
M106 S198.9
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X91.683 Y86.923 E.00793
M106 S198.9
M106 S255
G1 F4800
G1 X92.083 Y86.923 E.0083
G1 X98.977 Y86.923 E.143
G1 X98.977 Y87.518 E.01232
G1 F1800
G1 X98.977 Y87.9 E.00793
M106 S198.9
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X98.977 Y92.1 E.08712
M106 S198.9
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X98.977 Y92.483 E.00793
M106 S198.9
M106 S255
G1 F4800
G1 X98.977 Y93.077 E.01232
G1 X92.083 Y93.077 E.143
G1 X91.683 Y93.077 E.0083
G1 F1800
G1 X91.3 Y93.077 E.00793
M106 S198.9
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X83.2 Y93.077 E.16801
M106 S198.9
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X82.818 Y93.077 E.00793
M106 S198.9
M106 S255
G1 F4800
G1 X82.418 Y93.077 E.0083
G1 X81.977 Y93.077 E.00915
G1 X81.977 Y94.5 E.02953
M204 S10000
G1 X82.401 Y94.984 F42000
G1 F4800
M204 S6000
G1 X80.599 Y94.984 E.03737
G1 X80.599 Y85.016 E.20678
G1 X82.401 Y85.016 E.03737
G1 X82.401 Y86.499 E.03077
G1 X82.818 Y86.499 E.00864
G1 F1800
G1 X83.2 Y86.499 E.00793
M106 S198.9
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X91.3 Y86.499 E.16801
M106 S198.9
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X91.683 Y86.499 E.00793
M106 S198.9
M106 S255
G1 F4800
G1 X92.083 Y86.499 E.0083
G1 X99.401 Y86.499 E.1518
G1 X99.401 Y87.118 E.01282
G1 X99.401 Y87.518 E.0083
G1 F1800
G1 X99.401 Y87.9 E.00793
M106 S198.9
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X99.401 Y92.1 E.08712
M106 S198.9
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X99.401 Y92.483 E.00793
M106 S198.9
M106 S255
G1 F4800
G1 X99.401 Y92.883 E.0083
G1 X99.401 Y93.501 E.01282
G1 X92.083 Y93.501 E.1518
G1 X91.683 Y93.501 E.0083
G1 F1800
G1 X91.3 Y93.501 E.00793
M106 S198.9
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X83.2 Y93.501 E.16801
M106 S198.9
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X82.818 Y93.501 E.00793
M106 S198.9
M106 S255
G1 F4800
G1 X82.401 Y93.501 E.00864
G1 X82.401 Y94.924 E.02953
M204 S250
G1 X82.8 Y95.351 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X82.8 Y95.384 E.0006
G1 X80.2 Y95.384 E.04757
G1 X80.2 Y95.351 E.0006
G1 X80.2 Y84.649 E.19582
G1 X80.2 Y84.616 E.0006
G1 X82.8 Y84.616 E.04757
G1 X82.8 Y84.649 E.0006
G1 X82.8 Y86.1 E.02655
G1 X82.84 Y86.1 E.00073
G1 F1920
G1 X83.2 Y86.1 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
M73 P80 R3
G1 X91.3 Y86.1 E.16801
M106 S198.9
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X91.66 Y86.1 E.00659
G1 F2400
G1 X99.8 Y86.1 E.14894
G1 X99.8 Y87.54 E.02635
G1 F1920
G1 X99.8 Y87.9 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X99.8 Y92.1 E.08712
M106 S198.9
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X99.8 Y92.46 E.00659
G1 F2400
G1 X99.8 Y93.9 E.02635
G1 X91.66 Y93.9 E.14894
G1 F1920
G1 X91.3 Y93.9 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X83.2 Y93.9 E.16801
M106 S198.9
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X82.84 Y93.9 E.00659
G1 F2400
G1 X82.8 Y93.9 E.00073
G1 X82.8 Y95.291 E.02545
; WIPE_START
M204 S6000
G1 X82.8 Y95.384 E-.03523
G1 X80.893 Y95.384 E-.72477
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.6
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.6 F4000
            G39.3 S1
            G0 Z7.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y94.348 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.03836
; WIPE_START
G1 X81.5 Y94.348 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.136 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y85.652 E.03836
; WIPE_START
G1 X81.5 Y87.136 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I-.059 J1.216 P1  F42000
G1 X93.321 Y87.707 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.442672
G1 F3000
M204 S6000
G1 X81.796 Y87.707 E.23495
G1 X81.796 Y88.124 E.0085
G1 X98.204 Y88.124 E.33448
G1 X98.204 Y88.541 E.0085
G1 X81.796 Y88.541 E.33448
G1 X81.796 Y88.958 E.0085
G1 X98.204 Y88.958 E.33448
G1 X98.204 Y89.375 E.0085
G1 X81.796 Y89.375 E.33448
G1 X81.796 Y89.792 E.0085
G1 X98.204 Y89.792 E.33448
G1 X98.204 Y90.208 E.0085
G1 X81.796 Y90.208 E.33448
G1 X81.796 Y90.625 E.0085
G1 X98.204 Y90.625 E.33448
G1 X98.204 Y91.042 E.0085
G1 X81.796 Y91.042 E.33448
G1 X81.796 Y91.459 E.0085
G1 X98.204 Y91.459 E.33448
G1 X98.204 Y91.876 E.0085
G1 X81.796 Y91.876 E.33448
G1 X81.796 Y92.293 E.0085
G1 X93.321 Y92.293 E.23495
M106 S198.9
; WIPE_START
G1 X91.321 Y92.293 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I.955 J-.754 P1  F42000
G1 X82.401 Y80.984 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X80.599 Y80.984 E.03737
G1 X80.599 Y80.599 E.00799
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y80.924 E.00674
M204 S250
G1 X82.8 Y81.351 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X82.8 Y81.384 E.0006
G1 X80.2 Y81.384 E.04757
G1 X80.2 Y81.351 E.0006
G1 X80.2 Y80.2 E.02106
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.291 E.01996
; CHANGE_LAYER
; Z_HEIGHT: 7.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
G1 X82.8 Y81.384 E-.03523
G1 X80.893 Y81.384 E-.72477
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/82
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
M106 S201.45
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.6 I-1.213 J.102 P1  F42000
G1 X82.401 Y99.401 Z7.6
G1 Z7.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y98.928 E.0098
G1 X82.401 Y98.928 E.03737
G1 X82.401 Y99.341 E.00856
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.576 E.02239
G1 X80.2 Y98.529 E.00087
G1 F2520
G1 X82.8 Y98.529 E.04757
G1 F2400
G1 X82.8 Y98.576 E.00087
G1 X82.8 Y99.74 E.02129
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.8 Y92.652 Z7.72 F42000
G1 Z7.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.652 E.11003
G1 X82.86 Y92.652 E.3255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.977 Y94.648 Z7.72 F42000
G1 Z7.32
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y94.648 E.01977
G1 X81.023 Y85.352 E.1928
G1 X81.977 Y85.352 E.01977
G1 X81.977 Y86.923 E.03259
G1 X98.977 Y86.923 E.35262
G1 X98.977 Y93.077 E.12763
G1 X81.977 Y93.077 E.35262
G1 X81.977 Y94.588 E.03134
M204 S10000
G1 X82.401 Y95.072 F42000
G1 F4800
M204 S6000
G1 X80.599 Y95.072 E.03737
G1 X80.599 Y84.928 E.2104
G1 X82.401 Y84.928 E.03737
G1 X82.401 Y86.499 E.03259
G1 X99.401 Y86.499 E.35262
G1 X99.401 Y93.501 E.14523
G1 X82.401 Y93.501 E.35262
G1 X82.401 Y95.012 E.03134
M204 S250
G1 X82.8 Y95.424 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X82.8 Y95.471 E.00087
G1 F2520
G1 X80.2 Y95.471 E.04757
G1 F2400
G1 X80.2 Y95.424 E.00087
G1 X80.2 Y84.576 E.19848
G1 X80.2 Y84.529 E.00087
G1 F2520
G1 X82.8 Y84.529 E.04757
G1 F2400
G1 X82.8 Y84.576 E.00087
G1 X82.8 Y86.1 E.02788
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
G1 X82.8 Y95.364 E.02678
; WIPE_START
M204 S6000
G1 X82.8 Y95.471 E-.0408
G1 X80.907 Y95.471 E-.7192
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.72
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.72 F4000
            G39.3 S1
            G0 Z7.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y94.435 F42000
G1 Z7.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.04061
; WIPE_START
G1 X81.5 Y94.435 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.136 Z7.72 F42000
G1 Z7.32
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y85.565 E.04061
; WIPE_START
G1 X81.5 Y87.136 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.72 I-.234 J1.194 P1  F42000
G1 X96.134 Y90 Z7.72
G1 Z7.32
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
G1 X96.134 Y90.06 E.004
M204 S10000
G1 X96.566 Y90 F42000
; LINE_WIDTH: 0.419992
G1 F15000
M204 S6000
G1 X96.566 Y89.334 E.01284
G1 X83.434 Y89.334 E.25313
G1 X83.434 Y90.666 E.02568
G1 X96.566 Y90.666 E.25313
G1 X96.566 Y90.06 E.01168
M204 S10000
G1 X96.96 Y90 F42000
G1 F15000
M204 S6000
G1 X96.96 Y88.94 E.02044
G1 X83.04 Y88.94 E.26833
G1 X83.04 Y91.06 E.04088
G1 X96.96 Y91.06 E.26833
G1 X96.96 Y90.06 E.01928
M204 S10000
G1 X97.355 Y90 F42000
G1 F15000
M204 S6000
G1 X97.355 Y88.545 E.02804
G1 X82.645 Y88.545 E.28352
G1 X82.645 Y91.455 E.05607
G1 X97.355 Y91.455 E.28352
G1 X97.355 Y90.06 E.02688
M204 S10000
G1 X97.749 Y90 F42000
G1 F15000
M204 S6000
G1 X97.749 Y88.151 E.03564
G1 X82.251 Y88.151 E.29872
G1 X82.251 Y91.849 E.07127
G1 X97.749 Y91.849 E.29872
G1 X97.749 Y90.06 E.03448
M204 S10000
G1 X98.143 Y90 F42000
G1 F15000
M204 S6000
G1 X98.143 Y87.757 E.04324
G1 X81.857 Y87.757 E.31392
G1 X81.857 Y92.243 E.08647
G1 X98.143 Y92.243 E.31392
G1 X98.143 Y90.06 E.04208
; WIPE_START
G1 X98.143 Y92.06 E-.76
; WIPE_END
M73 P81 R3
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.72 I.697 J-.998 P1  F42000
G1 X82.401 Y81.072 Z7.72
G1 Z7.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X80.599 Y81.072 E.03737
G1 X80.599 Y80.599 E.0098
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y81.012 E.00856
M204 S250
G1 X82.8 Y81.424 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X82.8 Y81.471 E.00087
G1 F2520
G1 X80.2 Y81.471 E.04757
G1 F2400
G1 X80.2 Y81.424 E.00087
G1 X80.2 Y80.2 E.02239
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.364 E.02129
; CHANGE_LAYER
; Z_HEIGHT: 7.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
G1 X82.8 Y81.471 E-.0408
G1 X80.907 Y81.471 E-.7192
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/82
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.72 I-1.213 J.101 P1  F42000
G1 X82.401 Y99.401 Z7.72
G1 Z7.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y98.823 E.01199
G1 X82.401 Y98.823 E.03737
G1 X82.401 Y99.341 E.01074
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.489 E.02399
G1 X80.2 Y98.424 E.0012
G1 F2700
G1 X82.8 Y98.424 E.04757
G1 F2400
G1 X82.8 Y98.489 E.0012
G1 X82.8 Y99.74 E.02289
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.84
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.84 F4000
            G39.3 S1
            G0 Z7.84 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.811 Y99.112 F42000
G1 Z7.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.179382
G1 F15000
M204 S6000
G1 X82.189 Y99.112 E.01035
; WIPE_START
G1 X80.811 Y99.112 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.8 Y92.652 Z7.84 F42000
G1 Z7.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.652 E.11003
G1 X82.86 Y92.652 E.3255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.977 Y94.753 Z7.84 F42000
G1 Z7.44
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y94.753 E.01977
G1 X81.023 Y85.247 E.19717
G1 X81.977 Y85.247 E.01977
G1 X81.977 Y86.923 E.03477
G1 X98.977 Y86.923 E.35262
G1 X98.977 Y93.077 E.12763
G1 X81.977 Y93.077 E.35262
G1 X81.977 Y94.693 E.03353
M204 S10000
G1 X82.401 Y95.177 F42000
G1 F4800
M204 S6000
G1 X80.599 Y95.177 E.03737
G1 X80.599 Y84.823 E.21477
G1 X82.401 Y84.823 E.03737
G1 X82.401 Y86.499 E.03477
G1 X99.401 Y86.499 E.35262
G1 X99.401 Y93.501 E.14523
G1 X82.401 Y93.501 E.35262
G1 X82.401 Y95.117 E.03353
M204 S250
G1 X82.8 Y95.511 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X82.8 Y95.576 E.0012
G1 F2700
G1 X80.2 Y95.576 E.04757
G1 F2400
G1 X80.2 Y95.511 E.0012
G1 X80.2 Y84.489 E.20168
G1 X80.2 Y84.424 E.0012
G1 F2700
G1 X82.8 Y84.424 E.04757
G1 F2400
G1 X82.8 Y84.489 E.0012
G1 X82.8 Y86.1 E.02948
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
G1 X82.8 Y95.451 E.02838
; WIPE_START
M204 S6000
G1 X82.8 Y95.576 E-.04764
G1 X80.925 Y95.576 E-.71236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.541 Z7.84 F42000
G1 Z7.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.04334
; WIPE_START
G1 X81.5 Y94.541 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.136 Z7.84 F42000
G1 Z7.44
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y85.459 E.04334
; WIPE_START
G1 X81.5 Y87.136 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.84 I-.234 J1.194 P1  F42000
G1 X96.134 Y90 Z7.84
G1 Z7.44
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
G1 X96.134 Y90.06 E.004
M204 S10000
G1 X96.566 Y90 F42000
; LINE_WIDTH: 0.419992
G1 F15000
M204 S6000
G1 X96.566 Y89.334 E.01284
G1 X83.434 Y89.334 E.25313
G1 X83.434 Y90.666 E.02568
G1 X96.566 Y90.666 E.25313
G1 X96.566 Y90.06 E.01168
M204 S10000
G1 X96.96 Y90 F42000
G1 F15000
M204 S6000
G1 X96.96 Y88.94 E.02044
G1 X83.04 Y88.94 E.26833
G1 X83.04 Y91.06 E.04088
G1 X96.96 Y91.06 E.26833
G1 X96.96 Y90.06 E.01928
M204 S10000
G1 X97.355 Y90 F42000
G1 F15000
M204 S6000
G1 X97.355 Y88.545 E.02804
G1 X82.645 Y88.545 E.28352
G1 X82.645 Y91.455 E.05607
G1 X97.355 Y91.455 E.28352
G1 X97.355 Y90.06 E.02688
M204 S10000
G1 X97.749 Y90 F42000
G1 F15000
M204 S6000
G1 X97.749 Y88.151 E.03564
G1 X82.251 Y88.151 E.29872
G1 X82.251 Y91.849 E.07127
G1 X97.749 Y91.849 E.29872
G1 X97.749 Y90.06 E.03448
M204 S10000
G1 X98.143 Y90 F42000
G1 F15000
M204 S6000
G1 X98.143 Y87.757 E.04324
G1 X81.857 Y87.757 E.31392
G1 X81.857 Y92.243 E.08647
G1 X98.143 Y92.243 E.31392
G1 X98.143 Y90.06 E.04208
; WIPE_START
G1 X98.143 Y92.06 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.84 I.692 J-1.001 P1  F42000
G1 X82.401 Y81.177 Z7.84
G1 Z7.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X80.599 Y81.177 E.03737
G1 X80.599 Y80.599 E.01199
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y81.117 E.01074
M204 S250
G1 X82.8 Y81.511 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X82.8 Y81.576 E.0012
G1 F2700
G1 X80.2 Y81.576 E.04757
G1 F2400
G1 X80.2 Y81.511 E.0012
G1 X80.2 Y80.2 E.02399
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.451 E.02289
M204 S10000
G1 X82.189 Y80.888 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179382
G1 F15000
M204 S6000
G1 X80.811 Y80.888 E.01035
; CHANGE_LAYER
; Z_HEIGHT: 7.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.189 Y80.888 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/82
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.84 I-1.217 J.014 P1  F42000
G1 X82.401 Y99.401 Z7.84
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y98.695 E.01465
G1 X82.401 Y98.695 E.03737
G1 X82.401 Y99.341 E.0134
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.384 E.02592
G1 F2460
G1 X80.2 Y98.295 E.00162
G1 F2940
M73 P82 R3
G1 X82.8 Y98.295 E.04757
G1 F2460
G1 X82.8 Y98.384 E.00162
G1 F2400
G1 X82.8 Y99.74 E.02482
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.96
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.96 F4000
            G39.3 S1
            G0 Z7.96 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.811 Y99.048 F42000
G1 Z7.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.307672
G1 F15000
M204 S6000
G1 X82.189 Y99.048 E.01898
; WIPE_START
G1 X80.811 Y99.048 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.8 Y92.652 Z7.96 F42000
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.652 E.11003
G1 X82.86 Y92.652 E.3255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.977 Y94.881 Z7.96 F42000
G1 Z7.56
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y94.881 E.01977
G1 X81.023 Y85.119 E.20249
G1 X81.977 Y85.119 E.01977
G1 X81.977 Y86.923 E.03743
G1 X98.977 Y86.923 E.35262
G1 X98.977 Y93.077 E.12763
G1 X81.977 Y93.077 E.35262
G1 X81.977 Y94.821 E.03619
M204 S10000
G1 X82.401 Y95.305 F42000
G1 F4800
M204 S6000
G1 X80.599 Y95.305 E.03737
G1 X80.599 Y84.695 E.22009
G1 X82.401 Y84.695 E.03737
G1 X82.401 Y86.499 E.03743
G1 X99.401 Y86.499 E.35262
G1 X99.401 Y93.501 E.14523
G1 X82.401 Y93.501 E.35262
G1 X82.401 Y95.245 E.03619
M204 S250
G1 X82.8 Y95.616 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2460
M204 S1000
G1 X82.8 Y95.705 E.00162
G1 F2940
G1 X80.2 Y95.705 E.04757
G1 F2460
G1 X80.2 Y95.616 E.00162
G1 F2400
G1 X80.2 Y84.384 E.20553
G1 F2460
G1 X80.2 Y84.295 E.00162
G1 F2940
G1 X82.8 Y84.295 E.04757
G1 F2460
G1 X82.8 Y84.384 E.00162
G1 F2400
G1 X82.8 Y86.1 E.03141
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
G1 X82.8 Y95.556 E.03031
; WIPE_START
M204 S6000
G1 X82.8 Y95.705 E-.05635
G1 X80.948 Y95.705 E-.70365
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.669 Z7.96 F42000
G1 Z7.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.04666
; WIPE_START
G1 X81.5 Y94.669 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.136 Z7.96 F42000
G1 Z7.56
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y85.331 E.04666
; WIPE_START
G1 X81.5 Y87.136 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I-.234 J1.194 P1  F42000
G1 X96.134 Y90 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
G1 X96.134 Y90.06 E.004
M204 S10000
G1 X96.566 Y90 F42000
; LINE_WIDTH: 0.419992
G1 F15000
M204 S6000
G1 X96.566 Y89.334 E.01284
G1 X83.434 Y89.334 E.25313
G1 X83.434 Y90.666 E.02568
G1 X96.566 Y90.666 E.25313
G1 X96.566 Y90.06 E.01168
M204 S10000
G1 X96.96 Y90 F42000
G1 F15000
M204 S6000
G1 X96.96 Y88.94 E.02044
G1 X83.04 Y88.94 E.26833
G1 X83.04 Y91.06 E.04088
G1 X96.96 Y91.06 E.26833
G1 X96.96 Y90.06 E.01928
M204 S10000
G1 X97.355 Y90 F42000
G1 F15000
M204 S6000
G1 X97.355 Y88.545 E.02804
G1 X82.645 Y88.545 E.28352
G1 X82.645 Y91.455 E.05607
G1 X97.355 Y91.455 E.28352
G1 X97.355 Y90.06 E.02688
M204 S10000
G1 X97.749 Y90 F42000
G1 F15000
M204 S6000
G1 X97.749 Y88.151 E.03564
G1 X82.251 Y88.151 E.29872
G1 X82.251 Y91.849 E.07127
G1 X97.749 Y91.849 E.29872
G1 X97.749 Y90.06 E.03448
M204 S10000
G1 X98.143 Y90 F42000
G1 F15000
M204 S6000
G1 X98.143 Y87.757 E.04324
G1 X81.857 Y87.757 E.31392
G1 X81.857 Y92.243 E.08647
G1 X98.143 Y92.243 E.31392
G1 X98.143 Y90.06 E.04208
; WIPE_START
G1 X98.143 Y92.06 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I.686 J-1.005 P1  F42000
G1 X82.401 Y81.305 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X80.599 Y81.305 E.03737
G1 X80.599 Y80.599 E.01465
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y81.245 E.0134
M204 S250
G1 X82.8 Y81.616 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2460
M204 S1000
G1 X82.8 Y81.705 E.00162
G1 F2940
G1 X80.2 Y81.705 E.04757
G1 F2460
G1 X80.2 Y81.616 E.00162
G1 F2400
G1 X80.2 Y80.2 E.02592
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.556 E.02482
M204 S10000
G1 X82.189 Y80.952 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.307672
G1 F15000
M204 S6000
G1 X80.811 Y80.952 E.01898
; CHANGE_LAYER
; Z_HEIGHT: 7.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.189 Y80.952 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/82
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.96 I-1.217 J.014 P1  F42000
G1 X82.401 Y99.401 Z7.96
G1 Z7.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y98.534 E.01798
G1 X82.401 Y98.534 E.03737
G1 X82.401 Y99.341 E.01674
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.255 E.02826
G1 F2640
G1 X80.2 Y98.135 E.00221
G1 X82.8 Y98.135 E.04757
G1 X82.8 Y98.255 E.00221
G1 F2400
G1 X82.8 Y99.74 E.02717
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.08
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.08 F4000
            G39.3 S1
            G0 Z8.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.811 Y98.967 F42000
G1 Z7.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.468492
G1 F15000
M204 S6000
G1 X82.189 Y98.967 E.02981
; WIPE_START
G1 X80.811 Y98.967 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.8 Y92.652 Z8.08 F42000
G1 Z7.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.652 E.11003
G1 X82.86 Y92.652 E.3255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.977 Y95.042 Z8.08 F42000
G1 Z7.68
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y95.042 E.01977
M73 P83 R3
G1 X81.023 Y84.958 E.20917
G1 X81.977 Y84.958 E.01977
G1 X81.977 Y86.923 E.04077
G1 X98.977 Y86.923 E.35262
G1 X98.977 Y93.077 E.12763
G1 X81.977 Y93.077 E.35262
G1 X81.977 Y94.982 E.03952
M204 S10000
G1 X82.401 Y95.466 F42000
G1 F4800
M204 S6000
G1 X80.599 Y95.466 E.03737
G1 X80.599 Y84.534 E.22677
G1 X82.401 Y84.534 E.03737
G1 X82.401 Y86.499 E.04077
G1 X99.401 Y86.499 E.35262
G1 X99.401 Y93.501 E.14523
G1 X82.401 Y93.501 E.35262
G1 X82.401 Y95.406 E.03952
M204 S250
G1 X82.8 Y95.745 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2640
M204 S1000
G1 X82.8 Y95.865 E.00221
G1 X80.2 Y95.865 E.04757
G1 X80.2 Y95.745 E.00221
G1 F2400
G1 X80.2 Y84.255 E.21023
G1 F2640
G1 X80.2 Y84.135 E.00221
G1 X82.8 Y84.135 E.04757
G1 X82.8 Y84.255 E.00221
G1 F2400
G1 X82.8 Y86.1 E.03375
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
G1 X82.8 Y95.685 E.03266
; WIPE_START
M204 S6000
G1 X82.8 Y95.865 E-.06871
G1 X80.981 Y95.865 E-.69129
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y94.83 Z8.08 F42000
G1 Z7.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.05081
; WIPE_START
G1 X81.5 Y94.83 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.197 Z8.08 F42000
G1 X81.5 Y87.136 Z8.08
G1 Z7.68
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y85.17 E.05081
; WIPE_START
G1 X81.5 Y87.136 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.99 Y88.602 Z8.08 F42000
G1 X96.134 Y90 Z8.08
G1 Z7.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
G1 X96.134 Y90.06 E.004
M204 S10000
G1 X96.566 Y90 F42000
; LINE_WIDTH: 0.419992
G1 F15000
M204 S6000
G1 X96.566 Y89.334 E.01284
G1 X83.434 Y89.334 E.25313
G1 X83.434 Y90.666 E.02568
G1 X96.566 Y90.666 E.25313
G1 X96.566 Y90.06 E.01168
M204 S10000
G1 X96.96 Y90 F42000
G1 F15000
M204 S6000
G1 X96.96 Y88.94 E.02044
G1 X83.04 Y88.94 E.26833
G1 X83.04 Y91.06 E.04088
G1 X96.96 Y91.06 E.26833
G1 X96.96 Y90.06 E.01928
M204 S10000
G1 X97.355 Y90 F42000
G1 F15000
M204 S6000
G1 X97.355 Y88.545 E.02804
G1 X82.645 Y88.545 E.28352
G1 X82.645 Y91.455 E.05607
G1 X97.355 Y91.455 E.28352
G1 X97.355 Y90.06 E.02688
M204 S10000
G1 X97.749 Y90 F42000
G1 F15000
M204 S6000
G1 X97.749 Y88.151 E.03564
G1 X82.251 Y88.151 E.29872
G1 X82.251 Y91.849 E.07127
G1 X97.749 Y91.849 E.29872
G1 X97.749 Y90.06 E.03448
M204 S10000
G1 X98.143 Y90 F42000
G1 F15000
M204 S6000
G1 X98.143 Y87.757 E.04324
G1 X81.857 Y87.757 E.31392
G1 X81.857 Y92.243 E.08647
G1 X98.143 Y92.243 E.31392
G1 X98.143 Y90.06 E.04208
; WIPE_START
G1 X98.143 Y92.06 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.811 Y87.799 Z8.08 F42000
G1 X82.401 Y81.466 Z8.08
G1 Z7.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X80.599 Y81.466 E.03737
G1 X80.599 Y80.599 E.01798
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y81.406 E.01674
M204 S250
G1 X82.8 Y81.745 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2640
M204 S1000
G1 X82.8 Y81.865 E.00221
G1 X80.2 Y81.865 E.04757
G1 X80.2 Y81.745 E.00221
G1 F2400
G1 X80.2 Y80.2 E.02826
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.685 E.02717
M204 S10000
G1 X82.189 Y81.033 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.468492
G1 F15000
M204 S6000
G1 X80.811 Y81.033 E.02981
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.189 Y81.033 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/82
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.08 I-1.217 J.014 P1  F42000
G1 X82.401 Y99.401 Z8.08
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y98.319 E.02243
G1 X82.401 Y98.319 E.03737
G1 X82.401 Y99.341 E.02119
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y98.095 E.03121
G1 F2940
G1 X80.2 Y97.92 E.00319
G1 F1920
G1 X82.8 Y97.92 E.04757
G1 F2940
G1 X82.8 Y98.095 E.00319
G1 F2400
G1 X82.8 Y99.74 E.03011
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.2
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.2 F4000
            G39.3 S1
            G0 Z8.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.811 Y98.86 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.683032
G1 F15000
M204 S6000
G1 X82.189 Y98.86 E.04426
; WIPE_START
G1 X80.811 Y98.86 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.159 J.371 P1  F42000
G1 X82.8 Y92.652 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.652 E.11003
G1 X82.86 Y92.652 E.3255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.977 Y95.257 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y95.257 E.01977
G1 X81.023 Y84.743 E.21807
G1 X81.977 Y84.743 E.01977
G1 X81.977 Y86.923 E.04522
G1 X98.977 Y86.923 E.35262
G1 X98.977 Y93.077 E.12763
G1 X81.977 Y93.077 E.35262
G1 X81.977 Y95.197 E.04397
M204 S10000
G1 X82.401 Y95.681 F42000
G1 F4800
M204 S6000
G1 X80.599 Y95.681 E.03737
G1 X80.599 Y84.319 E.23567
G1 X82.401 Y84.319 E.03737
G1 X82.401 Y86.499 E.04522
G1 X99.401 Y86.499 E.35262
G1 X99.401 Y93.501 E.14523
G1 X82.401 Y93.501 E.35262
G1 X82.401 Y95.621 E.04397
M204 S250
G1 X82.8 Y95.905 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2940
M204 S1000
G1 X82.8 Y96.08 E.00319
G1 F1920
G1 X80.2 Y96.08 E.04757
G1 F2940
G1 X80.2 Y95.905 E.00319
G1 F2400
G1 X80.2 Y84.095 E.21611
G1 F2940
G1 X80.2 Y83.92 E.00319
G1 F1920
G1 X82.8 Y83.92 E.04757
G1 F2940
G1 X82.8 Y84.095 E.00319
G1 F2400
G1 X82.8 Y86.1 E.0367
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
M73 P84 R3
G1 X82.8 Y95.845 E.0356
; WIPE_START
M204 S6000
G1 X82.8 Y96.08 E-.08913
G1 X81.035 Y96.08 E-.67087
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y95.044 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.05636
; WIPE_START
G1 X81.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.232 Z8.2 F42000
G1 X81.5 Y87.136 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y84.956 E.05636
; WIPE_START
G1 X81.5 Y86.956 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.972 Y88.51 Z8.2 F42000
G1 X96.134 Y90 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
G1 X96.134 Y90.06 E.004
M204 S10000
G1 X96.566 Y90 F42000
; LINE_WIDTH: 0.419992
G1 F15000
M204 S6000
G1 X96.566 Y89.334 E.01284
G1 X83.434 Y89.334 E.25313
G1 X83.434 Y90.666 E.02568
G1 X96.566 Y90.666 E.25313
G1 X96.566 Y90.06 E.01168
M204 S10000
G1 X96.96 Y90 F42000
G1 F15000
M204 S6000
G1 X96.96 Y88.94 E.02044
G1 X83.04 Y88.94 E.26833
G1 X83.04 Y91.06 E.04088
G1 X96.96 Y91.06 E.26833
G1 X96.96 Y90.06 E.01928
M204 S10000
G1 X97.355 Y90 F42000
G1 F15000
M204 S6000
G1 X97.355 Y88.545 E.02804
G1 X82.645 Y88.545 E.28352
G1 X82.645 Y91.455 E.05607
G1 X97.355 Y91.455 E.28352
G1 X97.355 Y90.06 E.02688
M204 S10000
G1 X97.749 Y90 F42000
G1 F15000
M204 S6000
G1 X97.749 Y88.151 E.03564
G1 X82.251 Y88.151 E.29872
G1 X82.251 Y91.849 E.07127
G1 X97.749 Y91.849 E.29872
G1 X97.749 Y90.06 E.03448
M204 S10000
G1 X98.143 Y90 F42000
G1 F15000
M204 S6000
G1 X98.143 Y87.757 E.04324
G1 X81.857 Y87.757 E.31392
G1 X81.857 Y92.243 E.08647
G1 X98.143 Y92.243 E.31392
G1 X98.143 Y90.06 E.04208
; WIPE_START
G1 X98.143 Y92.06 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.771 Y87.859 Z8.2 F42000
G1 X82.401 Y81.681 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X80.599 Y81.681 E.03737
G1 X80.599 Y80.599 E.02243
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y81.621 E.02119
M204 S250
G1 X82.8 Y81.905 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2940
M204 S1000
G1 X82.8 Y82.08 E.00319
G1 F1920
G1 X80.2 Y82.08 E.04757
G1 F2940
G1 X80.2 Y81.905 E.00319
G1 F2400
G1 X80.2 Y80.2 E.03121
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y81.845 E.03011
M204 S10000
G1 X82.189 Y81.14 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.683032
G1 F15000
M204 S6000
G1 X80.811 Y81.14 E.04426
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 7.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X82.189 Y81.14 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/82
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.2 I-1.217 J-.014 P1  F42000
G1 X81.977 Y98.977 Z8.2
G1 Z7.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y98.39 E.01217
G1 X81.977 Y98.39 E.01977
G1 X81.977 Y98.917 E.01092
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y97.966 E.02977
G1 X82.401 Y97.966 E.03737
G1 X82.401 Y99.341 E.02852
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
M73 P84 R2
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y97.88 E.03513
G1 F2135.809
G1 X80.2 Y97.567 E.00574
G1 F600
G1 X82.8 Y97.567 E.04757
M106 S201.45
G1 F2135.809
G1 X82.8 Y97.88 E.00574
G1 F2400
G1 X82.8 Y99.74 E.03403
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.32 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.32
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.32 F4000
            G39.3 S1
            G0 Z8.32 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.236 Y98.683 F42000
G1 Z7.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188052
G1 F15000
M204 S6000
G1 X81.764 Y98.683 E.0042
; WIPE_START
G1 X81.236 Y98.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.32 I1.178 J.306 P1  F42000
G1 X82.8 Y92.652 Z8.32
G1 Z7.92
G1 E.8 F1800
M106 S255
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.652 E.11003
G1 X82.86 Y92.652 E.3255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.977 Y95.61 Z8.32 F42000
G1 Z7.92
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y95.61 E.01977
G1 X81.023 Y84.39 E.23273
G1 X81.977 Y84.39 E.01977
G1 X81.977 Y86.923 E.05255
G1 X98.977 Y86.923 E.35262
G1 X98.977 Y93.077 E.12763
G1 X81.977 Y93.077 E.35262
G1 X81.977 Y95.55 E.05131
M204 S10000
G1 X82.401 Y96.034 F42000
G1 F4800
M204 S6000
G1 X80.599 Y96.034 E.03737
G1 X80.599 Y83.966 E.25033
G1 X82.401 Y83.966 E.03737
G1 X82.401 Y86.499 E.05255
G1 X99.401 Y86.499 E.35262
G1 X99.401 Y93.501 E.14523
G1 X82.401 Y93.501 E.35262
G1 X82.401 Y95.974 E.05131
M204 S250
G1 X82.8 Y96.12 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2135.809
M204 S1000
G1 X82.8 Y96.434 E.00574
G1 F600
G1 X80.2 Y96.434 E.04757
M106 S201.45
M106 S255
G1 F2135.809
G1 X80.2 Y96.12 E.00574
G1 F2400
G1 X80.2 Y83.88 E.22397
G1 F2135.809
G1 X80.2 Y83.567 E.00574
G1 F600
G1 X82.8 Y83.567 E.04757
M106 S201.45
G1 F2135.809
G1 X82.8 Y83.88 E.00574
G1 F2400
G1 X82.8 Y86.1 E.04062
M106 S255
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
G1 X82.8 Y96.06 E.03952
; WIPE_START
M204 S6000
G1 X82.8 Y96.434 E-.14193
G1 X81.174 Y96.434 E-.61807
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y95.398 Z8.32 F42000
G1 Z7.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.0655
; WIPE_START
G1 X81.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.232 Z8.32 F42000
G1 X81.5 Y87.136 Z8.32
G1 Z7.92
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y84.602 E.0655
; WIPE_START
G1 X81.5 Y86.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.935 Y88.328 Z8.32 F42000
G1 X96.134 Y90 Z8.32
G1 Z7.92
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
G1 X96.134 Y90.06 E.004
M204 S10000
G1 X96.566 Y90 F42000
; LINE_WIDTH: 0.419992
G1 F15000
M204 S6000
G1 X96.566 Y89.334 E.01284
G1 X83.434 Y89.334 E.25313
G1 X83.434 Y90.666 E.02568
G1 X96.566 Y90.666 E.25313
G1 X96.566 Y90.06 E.01168
M204 S10000
G1 X96.96 Y90 F42000
G1 F15000
M204 S6000
G1 X96.96 Y88.94 E.02044
G1 X83.04 Y88.94 E.26833
G1 X83.04 Y91.06 E.04088
G1 X96.96 Y91.06 E.26833
G1 X96.96 Y90.06 E.01928
M204 S10000
G1 X97.355 Y90 F42000
G1 F15000
M204 S6000
G1 X97.355 Y88.545 E.02804
G1 X82.645 Y88.545 E.28352
G1 X82.645 Y91.455 E.05607
M73 P85 R2
G1 X97.355 Y91.455 E.28352
G1 X97.355 Y90.06 E.02688
M204 S10000
G1 X97.749 Y90 F42000
G1 F15000
M204 S6000
G1 X97.749 Y88.151 E.03564
G1 X82.251 Y88.151 E.29872
G1 X82.251 Y91.849 E.07127
G1 X97.749 Y91.849 E.29872
G1 X97.749 Y90.06 E.03448
M204 S10000
G1 X98.143 Y90 F42000
G1 F15000
M204 S6000
G1 X98.143 Y87.757 E.04324
G1 X81.857 Y87.757 E.31392
G1 X81.857 Y92.243 E.08647
G1 X98.143 Y92.243 E.31392
G1 X98.143 Y90.06 E.04208
; WIPE_START
G1 X98.143 Y92.06 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.733 Y87.917 Z8.32 F42000
G1 X81.977 Y81.61 Z8.32
G1 Z7.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.023 Y81.61 E.01977
G1 X81.023 Y81.023 E.01217
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y81.55 E.01092
M204 S10000
G1 X82.401 Y82.034 F42000
G1 F4800
M204 S6000
G1 X80.599 Y82.034 E.03737
G1 X80.599 Y80.599 E.02977
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y81.974 E.02852
M204 S250
G1 X82.8 Y82.12 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2135.809
M204 S1000
G1 X82.8 Y82.434 E.00574
G1 F600
G1 X80.2 Y82.434 E.04757
M106 S201.45
G1 F2135.809
G1 X80.2 Y82.12 E.00574
G1 F2400
G1 X80.2 Y80.2 E.03513
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y82.06 E.03403
; WIPE_START
M204 S6000
G1 X82.8 Y82.434 E-.14193
G1 X81.174 Y82.434 E-.61807
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.764 Y81.317 Z8.32 F42000
G1 Z7.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188052
G1 F15000
M204 S6000
G1 X81.236 Y81.317 E.0042
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 8.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.764 Y81.317 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/82
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.32 I-1.212 J.111 P1  F42000
G1 X82.8 Y92.652 Z8.32
G1 Z8.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.652 E.11003
G1 X82.86 Y92.652 E.3255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.44 I-1.213 J.093 P1  F42000
G1 X81.977 Y98.977 Z8.44
G1 Z8.04
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y97.949 E.02131
G1 X81.023 Y97.549 E.0083
G1 F1800
G1 X81.023 Y97.167 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X81.023 Y96.834 E.00691
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X81.023 Y96.451 E.00793
M106 S201.45
M106 S255
G1 F4800
G1 X81.023 Y96.051 E.0083
G1 X81.023 Y83.949 E.25103
G1 X81.023 Y83.549 E.0083
G1 F1800
G1 X81.023 Y83.167 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X81.023 Y82.834 E.00691
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X81.023 Y82.451 E.00793
M106 S201.45
M106 S255
G1 F4800
G1 X81.023 Y82.051 E.0083
G1 X81.023 Y81.023 E.02131
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y82.051 E.02131
G1 X81.977 Y82.451 E.0083
G1 F1800
G1 X81.977 Y82.834 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X81.977 Y83.167 E.00691
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X81.977 Y83.549 E.00793
M106 S201.45
M106 S255
G1 F4800
G1 X81.977 Y83.949 E.0083
G1 X81.977 Y86.923 E.0617
G1 X98.977 Y86.923 E.35262
G1 X98.977 Y93.077 E.12763
G1 X81.977 Y93.077 E.35262
G1 X81.977 Y96.051 E.0617
G1 X81.977 Y96.451 E.0083
G1 F1800
G1 X81.977 Y96.834 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X81.977 Y97.167 E.00691
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X81.977 Y97.549 E.00793
M106 S201.45
M106 S255
G1 F4800
G1 X81.977 Y97.949 E.0083
G1 X81.977 Y98.917 E.02007
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y97.949 E.03011
G1 X80.599 Y97.549 E.0083
G1 F1800
G1 X80.599 Y97.167 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X80.599 Y96.834 E.00691
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X80.599 Y96.451 E.00793
M106 S201.45
M106 S255
G1 F4800
G1 X80.599 Y96.051 E.0083
G1 X80.599 Y83.949 E.25103
G1 X80.599 Y83.549 E.0083
G1 F1800
G1 X80.599 Y83.167 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X80.599 Y82.834 E.00691
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X80.599 Y82.451 E.00793
M106 S201.45
M106 S255
G1 F4800
G1 X80.599 Y82.051 E.0083
G1 X80.599 Y80.599 E.03011
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y82.051 E.03011
G1 X82.401 Y82.451 E.0083
G1 F1800
G1 X82.401 Y82.834 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X82.401 Y83.167 E.00691
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X82.401 Y83.549 E.00793
M106 S201.45
M106 S255
G1 F4800
G1 X82.401 Y83.949 E.0083
G1 X82.401 Y86.499 E.0529
G1 X99.401 Y86.499 E.35262
G1 X99.401 Y93.501 E.14523
G1 X82.401 Y93.501 E.35262
G1 X82.401 Y96.051 E.0529
G1 X82.401 Y96.451 E.0083
G1 F1800
G1 X82.401 Y96.834 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X82.401 Y97.167 E.00691
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X82.401 Y97.549 E.00793
M106 S201.45
M106 S255
G1 F4800
G1 X82.401 Y97.949 E.0083
G1 X82.401 Y99.341 E.02887
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y97.527 E.0416
G1 F1920
G1 X80.2 Y97.167 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X80.2 Y96.834 E.00691
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X80.2 Y96.474 E.00659
G1 F2400
G1 X80.2 Y83.527 E.2369
G1 F1920
G1 X80.2 Y83.167 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X80.2 Y82.834 E.00691
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X80.2 Y82.474 E.00659
G1 F2400
G1 X80.2 Y80.2 E.0416
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y82.474 E.0416
G1 F1920
G1 X82.8 Y82.834 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X82.8 Y83.167 E.00691
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X82.8 Y83.527 E.00659
G1 F2400
G1 X82.8 Y86.1 E.04709
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
G1 X82.8 Y96.474 E.04709
G1 F1920
G1 X82.8 Y96.834 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X82.8 Y97.167 E.00691
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X82.8 Y97.527 E.00659
G1 F2400
G1 X82.8 Y99.74 E.0405
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.44 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.44
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.44 F4000
            G39.3 S1
            G0 Z8.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z8.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
M73 P86 R2
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.15254
; WIPE_START
G1 X81.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.232 Z8.44 F42000
G1 X81.5 Y87.136 Z8.44
G1 Z8.04
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y81.236 E.15254
; WIPE_START
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.428 Y86.438 Z8.44 F42000
G1 X96.134 Y90 Z8.44
G1 Z8.04
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
G1 X96.134 Y90.06 E.004
M204 S10000
G1 X96.566 Y90 F42000
; LINE_WIDTH: 0.419992
G1 F15000
M204 S6000
G1 X96.566 Y89.334 E.01284
G1 X83.434 Y89.334 E.25313
G1 X83.434 Y90.666 E.02568
G1 X96.566 Y90.666 E.25313
G1 X96.566 Y90.06 E.01168
M204 S10000
G1 X96.96 Y90 F42000
G1 F15000
M204 S6000
G1 X96.96 Y88.94 E.02044
G1 X83.04 Y88.94 E.26833
G1 X83.04 Y91.06 E.04088
G1 X96.96 Y91.06 E.26833
G1 X96.96 Y90.06 E.01928
M204 S10000
G1 X97.355 Y90 F42000
G1 F15000
M204 S6000
G1 X97.355 Y88.545 E.02804
G1 X82.645 Y88.545 E.28352
G1 X82.645 Y91.455 E.05607
G1 X97.355 Y91.455 E.28352
G1 X97.355 Y90.06 E.02688
M204 S10000
G1 X97.749 Y90 F42000
G1 F15000
M204 S6000
G1 X97.749 Y88.151 E.03564
G1 X82.251 Y88.151 E.29872
G1 X82.251 Y91.849 E.07127
G1 X97.749 Y91.849 E.29872
G1 X97.749 Y90.06 E.03448
M204 S10000
G1 X98.143 Y90 F42000
G1 F15000
M204 S6000
G1 X98.143 Y87.757 E.04324
G1 X81.857 Y87.757 E.31392
G1 X81.857 Y92.243 E.08647
G1 X98.143 Y92.243 E.31392
G1 X98.143 Y90.06 E.04208
; CHANGE_LAYER
; Z_HEIGHT: 8.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.143 Y92.06 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/82
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.44 I-.047 J-1.216 P1  F42000
G1 X82.8 Y92.652 Z8.44
G1 Z8.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.652 E.11003
G1 X82.86 Y92.652 E.3255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.56 I-1.213 J.093 P1  F42000
G1 X81.977 Y98.977 Z8.56
G1 Z8.16
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y86.923 E.12238
G1 X98.977 Y86.923 E.35262
G1 X98.977 Y93.077 E.12763
G1 X81.977 Y93.077 E.35262
G1 X81.977 Y98.917 E.12114
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y86.499 E.12238
G1 X99.401 Y86.499 E.35262
G1 X99.401 Y93.501 E.14523
G1 X82.401 Y93.501 E.35262
G1 X82.401 Y99.341 E.12114
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y86.1 E.10796
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
G1 X82.8 Y99.74 E.10686
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.56 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.56
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.56 F4000
            G39.3 S1
            G0 Z8.56 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z8.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.15254
; WIPE_START
G1 X81.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.232 Z8.56 F42000
G1 X81.5 Y87.136 Z8.56
G1 Z8.16
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y81.236 E.15254
; WIPE_START
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.428 Y86.438 Z8.56 F42000
G1 X96.134 Y90 Z8.56
G1 Z8.16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
G1 X96.134 Y90.06 E.004
M204 S10000
G1 X96.566 Y90 F42000
; LINE_WIDTH: 0.419992
G1 F15000
M204 S6000
G1 X96.566 Y89.334 E.01284
G1 X83.434 Y89.334 E.25313
G1 X83.434 Y90.666 E.02568
G1 X96.566 Y90.666 E.25313
G1 X96.566 Y90.06 E.01168
M204 S10000
G1 X96.96 Y90 F42000
G1 F15000
M204 S6000
G1 X96.96 Y88.94 E.02044
G1 X83.04 Y88.94 E.26833
G1 X83.04 Y91.06 E.04088
G1 X96.96 Y91.06 E.26833
G1 X96.96 Y90.06 E.01928
M204 S10000
G1 X97.355 Y90 F42000
G1 F15000
M204 S6000
G1 X97.355 Y88.545 E.02804
G1 X82.645 Y88.545 E.28352
G1 X82.645 Y91.455 E.05607
G1 X97.355 Y91.455 E.28352
G1 X97.355 Y90.06 E.02688
M204 S10000
G1 X97.749 Y90 F42000
G1 F15000
M204 S6000
G1 X97.749 Y88.151 E.03564
G1 X82.251 Y88.151 E.29872
G1 X82.251 Y91.849 E.07127
G1 X97.749 Y91.849 E.29872
G1 X97.749 Y90.06 E.03448
M204 S10000
G1 X98.143 Y90 F42000
G1 F15000
M204 S6000
G1 X98.143 Y87.757 E.04324
G1 X81.857 Y87.757 E.31392
G1 X81.857 Y92.243 E.08647
G1 X98.143 Y92.243 E.31392
G1 X98.143 Y90.06 E.04208
; CHANGE_LAYER
; Z_HEIGHT: 8.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.143 Y92.06 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/82
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.56 I-.047 J-1.216 P1  F42000
G1 X82.8 Y92.652 Z8.56
G1 Z8.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.652 E.11003
G1 X82.86 Y92.652 E.3255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.68 I-1.213 J.093 P1  F42000
G1 X81.977 Y98.977 Z8.68
G1 Z8.28
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y86.923 E.12238
G1 X98.977 Y86.923 E.35262
G1 X98.977 Y93.077 E.12763
G1 X81.977 Y93.077 E.35262
G1 X81.977 Y98.917 E.12114
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y86.499 E.12238
G1 X99.401 Y86.499 E.35262
G1 X99.401 Y93.501 E.14523
G1 X82.401 Y93.501 E.35262
G1 X82.401 Y99.341 E.12114
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y86.1 E.10796
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
G1 X82.8 Y99.74 E.10686
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.68 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.68
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.68 F4000
            G39.3 S1
            G0 Z8.68 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z8.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.15254
; WIPE_START
G1 X81.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.232 Z8.68 F42000
G1 X81.5 Y87.136 Z8.68
G1 Z8.28
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y81.236 E.15254
; WIPE_START
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.428 Y86.438 Z8.68 F42000
G1 X96.134 Y90 Z8.68
G1 Z8.28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
G1 X96.134 Y90.06 E.004
M204 S10000
G1 X96.566 Y90 F42000
; LINE_WIDTH: 0.419992
G1 F15000
M204 S6000
G1 X96.566 Y89.334 E.01284
G1 X83.434 Y89.334 E.25313
G1 X83.434 Y90.666 E.02568
M73 P87 R2
G1 X96.566 Y90.666 E.25313
G1 X96.566 Y90.06 E.01168
M204 S10000
G1 X96.96 Y90 F42000
G1 F15000
M204 S6000
G1 X96.96 Y88.94 E.02044
G1 X83.04 Y88.94 E.26833
G1 X83.04 Y91.06 E.04088
G1 X96.96 Y91.06 E.26833
G1 X96.96 Y90.06 E.01928
M204 S10000
G1 X97.355 Y90 F42000
G1 F15000
M204 S6000
G1 X97.355 Y88.545 E.02804
G1 X82.645 Y88.545 E.28352
G1 X82.645 Y91.455 E.05607
G1 X97.355 Y91.455 E.28352
G1 X97.355 Y90.06 E.02688
M204 S10000
G1 X97.749 Y90 F42000
G1 F15000
M204 S6000
G1 X97.749 Y88.151 E.03564
G1 X82.251 Y88.151 E.29872
G1 X82.251 Y91.849 E.07127
G1 X97.749 Y91.849 E.29872
G1 X97.749 Y90.06 E.03448
M204 S10000
G1 X98.143 Y90 F42000
G1 F15000
M204 S6000
G1 X98.143 Y87.757 E.04324
G1 X81.857 Y87.757 E.31392
G1 X81.857 Y92.243 E.08647
G1 X98.143 Y92.243 E.31392
G1 X98.143 Y90.06 E.04208
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.143 Y92.06 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/82
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.68 I-.047 J-1.216 P1  F42000
G1 X82.8 Y92.652 Z8.68
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.652 E.11003
G1 X82.86 Y92.652 E.3255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I-1.213 J.093 P1  F42000
G1 X81.977 Y98.977 Z8.8
G1 Z8.4
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y86.923 E.12238
G1 X98.977 Y86.923 E.35262
G1 X98.977 Y93.077 E.12763
G1 X81.977 Y93.077 E.35262
G1 X81.977 Y98.917 E.12114
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y86.499 E.12238
G1 X99.401 Y86.499 E.35262
G1 X99.401 Y93.501 E.14523
G1 X82.401 Y93.501 E.35262
G1 X82.401 Y99.341 E.12114
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y86.1 E.10796
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
G1 X82.8 Y99.74 E.10686
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.8
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.8 F4000
            G39.3 S1
            G0 Z8.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.15254
; WIPE_START
G1 X81.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.232 Z8.8 F42000
G1 X81.5 Y87.136 Z8.8
G1 Z8.4
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y81.236 E.15254
; WIPE_START
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.428 Y86.438 Z8.8 F42000
G1 X96.134 Y90 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
G1 X96.134 Y90.06 E.004
M204 S10000
G1 X96.566 Y90 F42000
; LINE_WIDTH: 0.419992
G1 F15000
M204 S6000
G1 X96.566 Y89.334 E.01284
G1 X83.434 Y89.334 E.25313
G1 X83.434 Y90.666 E.02568
G1 X96.566 Y90.666 E.25313
G1 X96.566 Y90.06 E.01168
M204 S10000
G1 X96.96 Y90 F42000
G1 F15000
M204 S6000
G1 X96.96 Y88.94 E.02044
G1 X83.04 Y88.94 E.26833
G1 X83.04 Y91.06 E.04088
G1 X96.96 Y91.06 E.26833
G1 X96.96 Y90.06 E.01928
M204 S10000
G1 X97.355 Y90 F42000
G1 F15000
M204 S6000
G1 X97.355 Y88.545 E.02804
G1 X82.645 Y88.545 E.28352
G1 X82.645 Y91.455 E.05607
G1 X97.355 Y91.455 E.28352
M73 P88 R2
G1 X97.355 Y90.06 E.02688
M204 S10000
G1 X97.749 Y90 F42000
G1 F15000
M204 S6000
G1 X97.749 Y88.151 E.03564
G1 X82.251 Y88.151 E.29872
G1 X82.251 Y91.849 E.07127
G1 X97.749 Y91.849 E.29872
G1 X97.749 Y90.06 E.03448
M204 S10000
G1 X98.143 Y90 F42000
G1 F15000
M204 S6000
G1 X98.143 Y87.757 E.04324
G1 X81.857 Y87.757 E.31392
G1 X81.857 Y92.243 E.08647
G1 X98.143 Y92.243 E.31392
G1 X98.143 Y90.06 E.04208
; CHANGE_LAYER
; Z_HEIGHT: 8.52
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X98.143 Y92.06 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/82
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.8 I-.047 J-1.216 P1  F42000
G1 X82.8 Y92.652 Z8.8
G1 Z8.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.652 E.11003
G1 X82.86 Y92.652 E.3255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.977 Y98.977 Z8.92 F42000
G1 Z8.52
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y86.923 E.12238
G1 X98.977 Y86.923 E.35262
G1 X98.977 Y93.077 E.12763
G1 X81.977 Y93.077 E.35262
G1 X81.977 Y98.917 E.12114
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y86.499 E.12238
G1 X99.401 Y86.499 E.35262
G1 X99.401 Y93.501 E.14523
G1 X82.401 Y93.501 E.35262
G1 X82.401 Y99.341 E.12114
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y86.1 E.10796
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
G1 X82.8 Y99.74 E.10686
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.92 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.92
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.92 F4000
            G39.3 S1
            G0 Z8.92 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z8.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.15254
; WIPE_START
G1 X81.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.232 Z8.92 F42000
G1 X81.5 Y87.136 Z8.92
G1 Z8.52
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y81.236 E.15254
; WIPE_START
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.428 Y86.438 Z8.92 F42000
G1 X96.134 Y90 Z8.92
G1 Z8.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
G1 X96.134 Y90.06 E.004
M204 S10000
G1 X96.566 Y90 F42000
; LINE_WIDTH: 0.419992
G1 F15000
M204 S6000
G1 X96.566 Y89.334 E.01284
G1 X83.434 Y89.334 E.25313
G1 X83.434 Y90.666 E.02568
G1 X96.566 Y90.666 E.25313
G1 X96.566 Y90.06 E.01168
M204 S10000
G1 X96.96 Y90 F42000
G1 F15000
M204 S6000
G1 X96.96 Y88.94 E.02044
G1 X83.04 Y88.94 E.26833
G1 X83.04 Y91.06 E.04088
G1 X96.96 Y91.06 E.26833
G1 X96.96 Y90.06 E.01928
M204 S10000
G1 X97.355 Y90 F42000
G1 F15000
M204 S6000
G1 X97.355 Y88.545 E.02804
G1 X82.645 Y88.545 E.28352
G1 X82.645 Y91.455 E.05607
G1 X97.355 Y91.455 E.28352
G1 X97.355 Y90.06 E.02688
M204 S10000
G1 X97.749 Y90 F42000
G1 F15000
M204 S6000
G1 X97.749 Y88.151 E.03564
G1 X82.251 Y88.151 E.29872
G1 X82.251 Y91.849 E.07127
G1 X97.749 Y91.849 E.29872
G1 X97.749 Y90.06 E.03448
M204 S10000
G1 X98.143 Y90 F42000
G1 F15000
M204 S6000
G1 X98.143 Y87.757 E.04324
G1 X81.857 Y87.757 E.31392
G1 X81.857 Y92.243 E.08647
G1 X98.143 Y92.243 E.31392
G1 X98.143 Y90.06 E.04208
; CHANGE_LAYER
; Z_HEIGHT: 8.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.143 Y92.06 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/82
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.92 I-.047 J-1.216 P1  F42000
G1 X82.8 Y92.652 Z8.92
G1 Z8.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.652 E.11003
G1 X82.86 Y92.652 E.3255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.977 Y98.977 Z9.04 F42000
G1 Z8.64
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y86.923 E.12238
G1 X98.977 Y86.923 E.35262
G1 X98.977 Y93.077 E.12763
G1 X81.977 Y93.077 E.35262
G1 X81.977 Y98.917 E.12114
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y86.499 E.12238
G1 X99.401 Y86.499 E.35262
G1 X99.401 Y93.501 E.14523
G1 X82.401 Y93.501 E.35262
G1 X82.401 Y99.341 E.12114
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y86.1 E.10796
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
G1 X82.8 Y99.74 E.10686
; WIPE_START
M204 S6000
M73 P89 R2
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.04 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.04
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.04 F4000
            G39.3 S1
            G0 Z9.04 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z8.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.15254
; WIPE_START
G1 X81.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.232 Z9.04 F42000
G1 X81.5 Y87.136 Z9.04
G1 Z8.64
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y81.236 E.15254
; WIPE_START
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.428 Y86.438 Z9.04 F42000
G1 X96.134 Y90 Z9.04
G1 Z8.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
G1 X96.134 Y90.06 E.004
M204 S10000
G1 X96.566 Y90 F42000
; LINE_WIDTH: 0.419992
G1 F15000
M204 S6000
G1 X96.566 Y89.334 E.01284
G1 X83.434 Y89.334 E.25313
G1 X83.434 Y90.666 E.02568
G1 X96.566 Y90.666 E.25313
G1 X96.566 Y90.06 E.01168
M204 S10000
G1 X96.96 Y90 F42000
G1 F15000
M204 S6000
G1 X96.96 Y88.94 E.02044
G1 X83.04 Y88.94 E.26833
G1 X83.04 Y91.06 E.04088
G1 X96.96 Y91.06 E.26833
G1 X96.96 Y90.06 E.01928
M204 S10000
G1 X97.355 Y90 F42000
G1 F15000
M204 S6000
G1 X97.355 Y88.545 E.02804
G1 X82.645 Y88.545 E.28352
G1 X82.645 Y91.455 E.05607
G1 X97.355 Y91.455 E.28352
G1 X97.355 Y90.06 E.02688
M204 S10000
G1 X97.749 Y90 F42000
G1 F15000
M204 S6000
G1 X97.749 Y88.151 E.03564
G1 X82.251 Y88.151 E.29872
G1 X82.251 Y91.849 E.07127
G1 X97.749 Y91.849 E.29872
G1 X97.749 Y90.06 E.03448
M204 S10000
G1 X98.143 Y90 F42000
G1 F15000
M204 S6000
G1 X98.143 Y87.757 E.04324
G1 X81.857 Y87.757 E.31392
G1 X81.857 Y92.243 E.08647
G1 X98.143 Y92.243 E.31392
G1 X98.143 Y90.06 E.04208
; CHANGE_LAYER
; Z_HEIGHT: 8.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.143 Y92.06 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/82
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.04 I-.047 J-1.216 P1  F42000
G1 X82.8 Y92.652 Z9.04
G1 Z8.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.652 E.11003
M73 P89 R1
G1 X82.86 Y92.652 E.3255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.977 Y98.977 Z9.16 F42000
G1 Z8.76
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y86.923 E.12238
G1 X98.977 Y86.923 E.35262
G1 X98.977 Y93.077 E.12763
G1 X81.977 Y93.077 E.35262
G1 X81.977 Y98.917 E.12114
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y86.499 E.12238
G1 X99.401 Y86.499 E.35262
G1 X99.401 Y93.501 E.14523
G1 X82.401 Y93.501 E.35262
G1 X82.401 Y99.341 E.12114
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y86.1 E.10796
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
G1 X82.8 Y99.74 E.10686
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.16
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.16 F4000
            G39.3 S1
            G0 Z9.16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z8.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.15254
; WIPE_START
G1 X81.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.232 Z9.16 F42000
G1 X81.5 Y87.136 Z9.16
G1 Z8.76
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y81.236 E.15254
; WIPE_START
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.428 Y86.438 Z9.16 F42000
G1 X96.134 Y90 Z9.16
G1 Z8.76
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
G1 X96.134 Y90.06 E.004
M204 S10000
G1 X96.566 Y90 F42000
; LINE_WIDTH: 0.419992
G1 F15000
M204 S6000
G1 X96.566 Y89.334 E.01284
G1 X83.434 Y89.334 E.25313
G1 X83.434 Y90.666 E.02568
G1 X96.566 Y90.666 E.25313
G1 X96.566 Y90.06 E.01168
M204 S10000
G1 X96.96 Y90 F42000
G1 F15000
M204 S6000
M73 P90 R1
G1 X96.96 Y88.94 E.02044
G1 X83.04 Y88.94 E.26833
G1 X83.04 Y91.06 E.04088
G1 X96.96 Y91.06 E.26833
G1 X96.96 Y90.06 E.01928
M204 S10000
G1 X97.355 Y90 F42000
G1 F15000
M204 S6000
G1 X97.355 Y88.545 E.02804
G1 X82.645 Y88.545 E.28352
G1 X82.645 Y91.455 E.05607
G1 X97.355 Y91.455 E.28352
G1 X97.355 Y90.06 E.02688
M204 S10000
G1 X97.749 Y90 F42000
G1 F15000
M204 S6000
G1 X97.749 Y88.151 E.03564
G1 X82.251 Y88.151 E.29872
G1 X82.251 Y91.849 E.07127
G1 X97.749 Y91.849 E.29872
G1 X97.749 Y90.06 E.03448
M204 S10000
G1 X98.143 Y90 F42000
G1 F15000
M204 S6000
G1 X98.143 Y87.757 E.04324
G1 X81.857 Y87.757 E.31392
G1 X81.857 Y92.243 E.08647
G1 X98.143 Y92.243 E.31392
G1 X98.143 Y90.06 E.04208
; CHANGE_LAYER
; Z_HEIGHT: 8.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.143 Y92.06 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/82
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.16 I-.047 J-1.216 P1  F42000
G1 X82.8 Y92.652 Z9.16
G1 Z8.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.02805
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.652 E.11003
G1 X82.86 Y92.652 E.3255
; WIPE_START
G1 X81.448 Y92.652 E-.53667
G1 X81.448 Y92.065 E-.22333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.977 Y98.977 Z9.28 F42000
G1 Z8.88
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y86.923 E.12238
G1 X98.977 Y86.923 E.35262
G1 X98.977 Y93.077 E.12763
G1 X81.977 Y93.077 E.35262
G1 X81.977 Y98.917 E.12114
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y86.499 E.12238
G1 X99.401 Y86.499 E.35262
G1 X99.401 Y93.501 E.14523
G1 X82.401 Y93.501 E.35262
G1 X82.401 Y99.341 E.12114
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y86.1 E.10796
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
G1 X82.8 Y99.74 E.10686
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.28 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.28
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.28 F4000
            G39.3 S1
            G0 Z9.28 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z8.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y92.865 E.15254
; WIPE_START
G1 X81.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.5 Y87.232 Z9.28 F42000
G1 X81.5 Y87.136 Z9.28
G1 Z8.88
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X81.5 Y81.236 E.15254
; WIPE_START
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.428 Y86.438 Z9.28 F42000
G1 X96.134 Y90 Z9.28
G1 Z8.88
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
G1 X96.134 Y90.06 E.004
M204 S10000
G1 X96.566 Y90 F42000
; LINE_WIDTH: 0.419992
G1 F15000
M204 S6000
G1 X96.566 Y89.334 E.01284
G1 X83.434 Y89.334 E.25313
G1 X83.434 Y90.666 E.02568
G1 X96.566 Y90.666 E.25313
G1 X96.566 Y90.06 E.01168
M204 S10000
G1 X96.96 Y90 F42000
G1 F15000
M204 S6000
G1 X96.96 Y88.94 E.02044
G1 X83.04 Y88.94 E.26833
G1 X83.04 Y91.06 E.04088
G1 X96.96 Y91.06 E.26833
G1 X96.96 Y90.06 E.01928
M204 S10000
G1 X97.355 Y90 F42000
G1 F15000
M204 S6000
G1 X97.355 Y88.545 E.02804
G1 X82.645 Y88.545 E.28352
G1 X82.645 Y91.455 E.05607
G1 X97.355 Y91.455 E.28352
G1 X97.355 Y90.06 E.02688
M204 S10000
G1 X97.749 Y90 F42000
G1 F15000
M204 S6000
G1 X97.749 Y88.151 E.03564
G1 X82.251 Y88.151 E.29872
G1 X82.251 Y91.849 E.07127
G1 X97.749 Y91.849 E.29872
G1 X97.749 Y90.06 E.03448
M204 S10000
M73 P91 R1
G1 X98.143 Y90 F42000
G1 F15000
M204 S6000
G1 X98.143 Y87.757 E.04324
G1 X81.857 Y87.757 E.31392
G1 X81.857 Y92.243 E.08647
G1 X98.143 Y92.243 E.31392
G1 X98.143 Y90.06 E.04208
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.143 Y92.06 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/82
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
M106 S196.35
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.28 I.562 J-1.08 P1  F42000
G1 X81.977 Y83.65 Z9.28
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.023 Y83.65 E.01977
G1 X81.023 Y81.023 E.05448
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y83.59 E.05323
; WIPE_START
G1 X81.023 Y83.65 E-.36287
G1 X81.023 Y82.605 E-.39713
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.467 Y90.224 Z9.4 F42000
G1 X81.977 Y98.977 Z9.4
G1 Z9
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y96.35 E.05448
G1 X81.977 Y96.35 E.01977
G1 X81.977 Y98.917 E.05323
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y84.074 E.07208
G1 X81.424 Y84.074 E.02026
G1 X81.424 Y95.926 E.24583
G1 X82.401 Y95.926 E.02026
G1 X82.401 Y99.341 E.07083
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y86.1 E.10796
G1 X99.8 Y86.1 E.31106
G1 X99.8 Y93.9 E.14272
G1 X82.8 Y93.9 E.31106
G1 X82.8 Y99.74 E.10686
; WIPE_START
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.4
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.4 F4000
            G39.3 S1
            G0 Z9.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y96.562 E.05694
M204 S10000
G1 X81.012 Y96.138 F42000
; LINE_WIDTH: 0.426512
G1 F15000
M204 S6000
G1 X81.012 Y83.862 E.24053
M204 S10000
G1 X81.5 Y83.438 F42000
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X81.5 Y81.236 E.05694
; WIPE_START
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.223 Y86.85 Z9.4 F42000
G1 X99.656 Y92.996 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.401502
G1 F2100
M204 S800
G1 X99.064 Y93.587 E.01536
G1 X98.533 Y93.587 E.00976
G1 X99.487 Y92.633 E.02479
G1 X99.487 Y92.102 E.00976
G1 X98.002 Y93.587 E.0386
G1 X97.47 Y93.587 E.00976
G1 X99.487 Y91.57 E.05241
G1 X99.487 Y91.039 E.00976
G1 X96.939 Y93.587 E.06621
G1 X96.407 Y93.587 E.00976
G1 X99.487 Y90.507 E.08002
G1 X99.487 Y89.976 E.00976
G1 X95.876 Y93.587 E.09382
G1 X95.345 Y93.587 E.00976
G1 X99.487 Y89.445 E.10763
G1 X99.487 Y88.913 E.00976
G1 X94.813 Y93.587 E.12144
G1 X94.282 Y93.587 E.00976
G1 X99.487 Y88.382 E.13524
G1 X99.487 Y87.85 E.00976
G1 X93.75 Y93.587 E.14905
G1 X93.219 Y93.587 E.00976
G1 X99.487 Y87.319 E.16285
G1 X99.487 Y86.788 E.00976
G1 X92.688 Y93.587 E.17666
G1 X92.156 Y93.587 E.00976
G1 X99.331 Y86.413 E.1864
G1 X98.799 Y86.413 E.00976
G1 X91.625 Y93.587 E.1864
G1 X91.093 Y93.587 E.00976
G1 X98.268 Y86.413 E.1864
G1 X97.737 Y86.413 E.00976
G1 X90.562 Y93.587 E.1864
G1 X90.031 Y93.587 E.00976
G1 X97.205 Y86.413 E.1864
G1 X96.674 Y86.413 E.00976
G1 X89.499 Y93.587 E.1864
G1 X88.968 Y93.587 E.00976
G1 X96.142 Y86.413 E.1864
G1 X95.611 Y86.413 E.00976
G1 X88.437 Y93.587 E.1864
G1 X87.905 Y93.587 E.00976
G1 X95.08 Y86.413 E.1864
G1 X94.548 Y86.413 E.00976
G1 X87.374 Y93.587 E.1864
G1 X86.842 Y93.587 E.00976
G1 X94.017 Y86.413 E.1864
G1 X93.485 Y86.413 E.00976
G1 X86.311 Y93.587 E.1864
G1 X85.78 Y93.587 E.00976
G1 X92.954 Y86.413 E.1864
G1 X92.423 Y86.413 E.00976
G1 X85.248 Y93.587 E.1864
G1 X84.717 Y93.587 E.00976
G1 X91.891 Y86.413 E.1864
G1 X91.36 Y86.413 E.00976
G1 X84.185 Y93.587 E.1864
G1 X83.654 Y93.587 E.00976
G1 X90.828 Y86.413 E.1864
G1 X90.297 Y86.413 E.00976
G1 X82.954 Y93.756 E.19078
; WIPE_START
M204 S6000
G1 X84.368 Y92.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.656 Y95.117 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F2100
M204 S800
G1 X82.185 Y95.588 E.01224
G1 X81.841 Y95.588 E.00631
G1 X81.762 Y95.554 E.00157
G1 X81.762 Y95.479 E.00138
G1 X82.487 Y94.754 E.01884
G1 X82.487 Y94.223 E.00976
G1 X81.762 Y94.948 E.01884
G1 X81.762 Y94.416 E.00976
G1 X89.766 Y86.413 E.20794
G1 X89.234 Y86.413 E.00976
G1 X81.762 Y93.885 E.19414
G1 X81.762 Y93.354 E.00976
G1 X88.703 Y86.413 E.18033
G1 X88.172 Y86.413 E.00976
G1 X81.762 Y92.822 E.16652
G1 X81.762 Y92.291 E.00976
G1 X87.64 Y86.413 E.15272
G1 X87.109 Y86.413 E.00976
G1 X81.762 Y91.759 E.13891
G1 X81.762 Y91.228 E.00976
G1 X86.577 Y86.413 E.1251
G1 X86.046 Y86.413 E.00976
G1 X81.762 Y90.697 E.1113
G1 X81.762 Y90.165 E.00976
G1 X85.515 Y86.413 E.09749
G1 X84.983 Y86.413 E.00976
G1 X81.762 Y89.634 E.08369
G1 X81.762 Y89.102 E.00976
M73 P92 R1
G1 X84.452 Y86.413 E.06988
G1 X83.92 Y86.413 E.00976
G1 X81.762 Y88.571 E.05607
G1 X81.762 Y88.04 E.00976
G1 X83.389 Y86.413 E.04227
G1 X82.858 Y86.413 E.00976
G1 X81.762 Y87.508 E.02846
G1 X81.762 Y86.977 E.00976
G1 X82.487 Y86.252 E.01884
G1 X82.487 Y85.72 E.00976
G1 X81.762 Y86.446 E.01884
G1 X81.762 Y85.914 E.00976
G1 X82.487 Y85.189 E.01884
G1 X82.487 Y84.658 E.00976
G1 X81.762 Y85.383 E.01884
G1 X81.762 Y84.851 E.00976
G1 X82.37 Y84.244 E.01579
; CHANGE_LAYER
; Z_HEIGHT: 9.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2100
M204 S6000
G1 X81.762 Y84.851 E-.32659
G1 X81.762 Y85.383 E-.20193
G1 X82.193 Y84.952 E-.23148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/82
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
M106 S201.45
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.4 I-1.217 J-.019 P1  F42000
G1 X81.977 Y98.977 Z9.4
G1 Z9.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1685
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1685
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1685
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.52 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.52
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.52 F4000
            G39.3 S1
            G0 Z9.52 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z9.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1685
M204 S6000
G1 X81.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/82
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.52 I-1.216 J.037 P1  F42000
G1 X81.977 Y98.977 Z9.52
G1 Z9.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1670
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1670
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1670
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.64 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.64
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.64 F4000
            G39.3 S1
            G0 Z9.64 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z9.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1670
M204 S6000
G1 X81.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/82
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.64 I-1.216 J.037 P1  F42000
G1 X81.977 Y98.977 Z9.64
G1 Z9.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1670
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1670
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1670
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.76 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.76
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.76 F4000
            G39.3 S1
            G0 Z9.76 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
M73 P93 R1
G1 Z9.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1670
M204 S6000
G1 X81.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/82
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.76 I-1.216 J.037 P1  F42000
G1 X81.977 Y98.977 Z9.76
G1 Z9.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1670
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1670
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1670
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.88
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.88 F4000
            G39.3 S1
            G0 Z9.88 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z9.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1670
M204 S6000
G1 X81.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/82
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.88 I-1.216 J.037 P1  F42000
G1 X81.977 Y98.977 Z9.88
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1670
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1670
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1670
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10 F4000
            G39.3 S1
            G0 Z10 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1670
M204 S6000
G1 X81.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/82
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z10 I-1.216 J.037 P1  F42000
G1 X81.977 Y98.977 Z10
G1 Z9.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1670
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1670
M204 S6000
G1 X80.599 Y99.401 E.03737
M73 P94 R1
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1670
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.12
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.12 F4000
            G39.3 S1
            G0 Z10.12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z9.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1670
M204 S6000
G1 X81.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/82
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z10.12 I-1.216 J.037 P1  F42000
G1 X81.977 Y98.977 Z10.12
G1 Z9.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1670
M204 S6000
G1 X81.023 Y98.977 E.01977
G1 X81.023 Y81.023 E.37239
G1 X81.977 Y81.023 E.01977
G1 X81.977 Y98.917 E.37115
M204 S10000
G1 X82.401 Y99.401 F42000
G1 F1670
M204 S6000
G1 X80.599 Y99.401 E.03737
G1 X80.599 Y80.599 E.38999
G1 X82.401 Y80.599 E.03737
G1 X82.401 Y99.341 E.38875
M204 S250
G1 X82.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1670
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.24 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.24
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.24 F4000
            G39.3 S1
            G0 Z10.24 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X81.5 Y98.764 F42000
G1 Z9.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1670
M204 S6000
G1 X81.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X81.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/82
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z10.24 I-1.213 J.095 P1  F42000
G1 X82.8 Y99.8 Z10.24
M73 P94 R0
G1 Z9.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1911
M204 S1000
G1 X80.2 Y99.8 E.04757
G1 X80.2 Y80.2 E.35864
G1 X82.8 Y80.2 E.04757
G1 X82.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
M73 P95 R0
G1 X80.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.36 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.36
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.36 F4000
            G39.3 S1
            G0 Z10.36 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X82.652 Y98.876 F42000
G1 Z9.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.409032
G1 F1911
M204 S800
G1 X82.044 Y99.483 E.01609
G1 X81.502 Y99.483 E.01016
G1 X82.483 Y98.502 E.026
G1 X82.483 Y97.96 E.01016
G1 X80.96 Y99.483 E.04036
G1 X80.517 Y99.483 E.00832
G1 X80.517 Y99.385 E.00184
G1 X82.483 Y97.418 E.05212
G1 X82.483 Y96.876 E.01016
G1 X80.517 Y98.843 E.05212
G1 X80.517 Y98.301 E.01016
G1 X82.483 Y96.334 E.05212
G1 X82.483 Y95.792 E.01016
G1 X80.517 Y97.759 E.05212
G1 X80.517 Y97.217 E.01016
G1 X82.483 Y95.25 E.05212
G1 X82.483 Y94.708 E.01016
G1 X80.517 Y96.675 E.05212
G1 X80.517 Y96.133 E.01016
G1 X82.483 Y94.166 E.05212
G1 X82.483 Y93.624 E.01016
G1 X80.517 Y95.591 E.05212
G1 X80.517 Y95.049 E.01016
G1 X82.483 Y93.082 E.05212
G1 X82.483 Y92.54 E.01016
G1 X80.517 Y94.507 E.05212
G1 X80.517 Y93.965 E.01016
G1 X82.483 Y91.998 E.05212
G1 X82.483 Y91.456 E.01016
G1 X80.517 Y93.423 E.05212
G1 X80.517 Y92.881 E.01016
G1 X82.483 Y90.914 E.05212
G1 X82.483 Y90.372 E.01016
G1 X80.517 Y92.339 E.05212
G1 X80.517 Y91.797 E.01016
G1 X82.483 Y89.83 E.05212
G1 X82.483 Y89.288 E.01016
G1 X80.517 Y91.255 E.05212
G1 X80.517 Y90.713 E.01016
G1 X82.483 Y88.746 E.05212
G1 X82.483 Y88.204 E.01016
G1 X80.517 Y90.17 E.05212
G1 X80.517 Y89.628 E.01016
G1 X82.483 Y87.662 E.05212
G1 X82.483 Y87.12 E.01016
G1 X80.517 Y89.086 E.05212
G1 X80.517 Y88.544 E.01016
G1 X82.483 Y86.578 E.05212
G1 X82.483 Y86.036 E.01016
G1 X80.517 Y88.002 E.05212
G1 X80.517 Y87.46 E.01016
G1 X82.483 Y85.494 E.05212
G1 X82.483 Y84.951 E.01016
G1 X80.517 Y86.918 E.05212
G1 X80.517 Y86.376 E.01016
G1 X82.483 Y84.409 E.05212
G1 X82.483 Y83.867 E.01016
G1 X80.517 Y85.834 E.05212
G1 X80.517 Y85.292 E.01016
M73 P96 R0
G1 X82.483 Y83.325 E.05212
G1 X82.483 Y82.783 E.01016
G1 X80.517 Y84.75 E.05212
G1 X80.517 Y84.208 E.01016
G1 X82.483 Y82.241 E.05212
G1 X82.483 Y81.699 E.01016
G1 X80.517 Y83.666 E.05212
G1 X80.517 Y83.124 E.01016
G1 X82.483 Y81.157 E.05212
G1 X82.483 Y80.615 E.01016
G1 X80.517 Y82.582 E.05212
G1 X80.517 Y82.04 E.01016
G1 X82.04 Y80.517 E.04037
G1 X81.498 Y80.517 E.01016
G1 X80.517 Y81.498 E.026
G1 X80.517 Y80.956 E.01016
G1 X81.124 Y80.348 E.0161
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F2100
M204 S6000
G1 X80.517 Y80.956 E-.32653
G1 X80.517 Y81.498 E-.20598
G1 X80.94 Y81.075 E-.22749
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.36 I1.217 J0 P1  F42000
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20260513 =====================
;turn off nozzle clog detect
G392 S0

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G90
G1 Z10.36 F900 ; lower z a little
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X181 F12000
T255
G1 X0 F18000
G1 X-13.0 F3000
G1 X0 F18000 ; wipe
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z109.96 F600
    G1 Z107.96

M400 P100
M17 R ; restore z current

G90
G1 X-13 Y180 F3600

G91
G1 Z-1 F600
G90
M83

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M100 E42 F20 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C46 D10 M100 E46 F10 N100
M1006 A44 B20 L100 C39 D20 M100 E48 F20 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C39 D10 M100 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C39 D10 M100 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B10 L100 C0 D10 M100 E48 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B20 L100 C41 D20 M100 E49 F20 N100
M1006 A0 B20 L100 C0 D20 M100 E0 F20 N100
M1006 A0 B20 L100 C37 D20 M100 E37 F20 N100
M1006 W
;=====printer finish  sound=========
M400 S1
M18 X Y Z
M73 P100 R0
; EXECUTABLE_BLOCK_END

