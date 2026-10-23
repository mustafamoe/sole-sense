; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 11m 43s; total estimated time: 18m 23s
; total layer number: 82
; total filament length [mm] : 412.68
; total filament volume [cm^3] : 992.60
; total filament weight [g] : 1.25
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
M73 P0 R18
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
M73 P2 R17
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA

    M104 S220

    G92 E0
    G1 E50 F523.843
    M400
    M106 P1 S178
    G92 E0
M73 P4 R17
    G1 E5 F523.843
    M109 S200 ; drop nozzle temp, make filament shink a bit
    M104 S180
    G92 E0
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
M73 P28 R13
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
M73 P29 R13
G1 X10 Y10 F20000

;===== bed leveling ==================================
;M1002 set_flag g29_before_print_flag=1
M1002 judge_flag g29_before_print_flag
M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X77.9831 Y80 I22.0169 J20
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
        G1 X-13.5 F3000
        G1 X0 F18000 ;wipe and shake
        G1 X-13.5 F3000
        G1 X0 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
M73 P30 R12
    G1 X-13.5 F3000
    M400
    M984 A0.1 E1 S1 F0.748496 H0.4
    M106 P1 S178
    M400 S7
    G1 X0 F18000
M73 P31 R12
    G1 X-13.5 F3000
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
G1 X86.638 Y84.028 F42000
M204 S6000
G1 Z.4
M73 P32 R12
G1 Z.24
M73 P33 R12
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X87.124 Y84.213 E.0228
G1 X87.443 Y83.992 E.01701
G1 X88.537 Y83.859 E.04831
G1 X89.567 Y84.25 E.04831
M73 P34 R12
G1 X90.156 Y84.915 E.03896
G1 X90.668 Y84.561 E.02731
G1 X91.762 Y84.428 E.04831
G1 X92.798 Y84.822 E.04862
G1 X93.247 Y84.512 E.02391
G1 X94.341 Y84.379 E.04831
G1 X95.37 Y84.77 E.04831
G1 X95.486 Y84.9 E.00761
G1 X96.55 Y84.811 E.04684
G1 X96.55 Y96.036 E.49229
G1 X96.151 Y96.187 E.01872
G1 X95.057 Y96.055 E.04831
G1 X94.49 Y95.663 E.03026
G1 X94.371 Y95.797 E.00786
M73 P35 R11
G1 X93.341 Y96.187 E.04831
G1 X92.247 Y96.055 E.04831
G1 X91.764 Y95.721 E.02576
G1 X91.116 Y95.967 E.0304
M73 P36 R11
G1 X90.022 Y95.834 E.04831
G1 X89.662 Y95.586 E.01919
G1 X88.544 Y96.01 E.05248
G1 X87.45 Y95.877 E.04831
G1 X87.111 Y95.643 E.01809
G1 X85.936 Y96.088 E.05511
G1 X84.842 Y95.956 E.04831
G1 X84.505 Y95.723 E.01797
G1 X83.324 Y96.171 E.0554
G1 X82.231 Y96.038 E.04831
G1 X81.324 Y95.412 E.04831
G1 X81.096 Y94.979 E.02147
G1 X80.797 Y94.942 E.01324
G1 X79.89 Y94.317 E.04831
G1 X79.402 Y93.386 E.04608
G1 X78.745 Y92.933 E.03502
G1 X78.233 Y91.957 E.04831
G1 X78.233 Y90.856 E.0483
G1 X78.704 Y89.958 E.04447
G1 X78.36 Y89.301 E.03252
G1 X78.36 Y88.2 E.0483
G1 X78.731 Y87.493 E.03501
G1 X78.287 Y86.648 E.04187
G1 X78.287 Y85.546 E.0483
G1 X78.799 Y84.571 E.04831
G1 X79.705 Y83.945 E.04831
G1 X80.799 Y83.813 E.04831
G1 X81.983 Y84.262 E.05555
G1 X82.442 Y83.945 E.02443
G1 X83.535 Y83.813 E.04831
G1 X84.589 Y84.212 E.04945
G1 X84.976 Y83.945 E.02062
G1 X86.07 Y83.813 E.04831
G1 X86.575 Y84.004 E.02371
M204 S6000
G1 X95.98 Y95.963 F42000
G1 F3000
M204 S500
G1 X95.98 Y85.246 E.47002
G1 X95.482 Y85.307 E.02201
G1 X95.482 Y95.7 E.45579
G3 X94.983 Y95.513 I-.071 J-.568 E.02427
G1 X94.983 Y85.054 E.45867
G1 X94.485 Y84.865 E.02337
G1 X94.485 Y95.169 E.45187
G1 X94.425 Y95.127 E.00321
G1 X94.135 Y95.455 E.01918
G1 X93.987 Y95.511 E.00694
G1 X93.987 Y84.829 E.46848
G1 X93.488 Y84.889 E.02201
G1 X93.488 Y95.7 E.47411
G3 X92.99 Y95.738 I-.286 J-.456 E.0228
G1 X92.99 Y85.18 E.46305
G1 X92.853 Y85.274 E.00728
G1 X92.492 Y85.137 E.01697
G1 X92.492 Y95.678 E.46228
G1 X92.395 Y95.666 E.00428
G1 X91.993 Y95.389 E.02139
G1 X91.993 Y84.948 E.4579
G2 X91.495 Y84.867 I-.326 J.435 E.02302
G1 X91.495 Y95.391 E.46154
G1 X91.066 Y95.554 E.02013
G1 X90.997 Y95.546 E.00305
G1 X90.997 Y84.928 E.46565
G2 X90.498 Y85.169 I-.019 J.595 E.02525
G1 X90.498 Y95.485 E.45243
G3 X90 Y95.328 I-.1 J-.553 E.02383
G1 X90 Y85.348 E.4377
G1 X89.502 Y84.785 E.03296
G1 X89.502 Y95.215 E.4574
G1 X89.003 Y95.404 E.02337
G1 X89.003 Y84.468 E.4796
G1 X88.505 Y84.279 E.02337
G1 X88.505 Y95.593 E.49618
G1 X88.007 Y95.538 E.02199
G1 X88.007 Y84.33 E.49152
G1 X87.591 Y84.381 E.01837
G1 X87.508 Y84.438 E.0044
G1 X87.508 Y95.427 E.48193
G1 X87.166 Y95.19 E.01827
G1 X87.01 Y95.249 E.0073
G1 X87.01 Y84.601 E.467
G1 X86.512 Y84.412 E.02337
G1 X86.512 Y95.438 E.48358
G1 X86.013 Y95.627 E.02337
G1 X86.013 Y84.226 E.50001
G1 X85.515 Y84.287 E.02201
G1 X85.515 Y95.631 E.49751
G1 X85.017 Y95.57 E.02201
G1 X85.017 Y84.408 E.48954
G1 X84.644 Y84.665 E.01984
G1 X84.518 Y84.617 E.00591
G1 X84.518 Y95.286 E.4679
G1 X84.02 Y95.475 E.02337
G1 X84.02 Y84.428 E.48447
G1 X83.522 Y84.239 E.02337
G1 X83.522 Y95.664 E.50105
G3 X83.024 Y95.728 I-.31 J-.443 E.02291
G1 X83.024 Y84.281 E.502
G1 X82.525 Y84.378 E.02226
G1 X82.525 Y95.667 E.4951
G1 X82.378 Y95.649 E.00651
G1 X82.027 Y95.407 E.01871
G1 X82.027 Y84.71 E.46913
G1 X81.529 Y84.521 E.02337
G1 X81.529 Y94.934 E.45665
G1 X81.355 Y94.604 E.01634
G1 X81.03 Y94.564 E.01437
G1 X81.03 Y84.332 E.44874
G2 X80.532 Y84.252 I-.326 J.435 E.02302
G1 X80.532 Y94.269 E.43933
G3 X80.034 Y93.721 I.273 J-.749 E.03378
G1 X80.034 Y84.312 E.41264
M73 P37 R11
G2 X79.535 Y84.553 I-.019 J.595 E.02525
G1 X79.535 Y92.988 E.36991
G1 X79.037 Y92.621 E.02715
G1 X79.037 Y84.652 E.34947
; WIPE_START
; WIPE_END
G1 E-.8 F1800
M204 S6000
G1 X85.241 Y89.098 Z.64 F42000
G1 X98.853 Y98.853 Z.64
G1 Z.24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X98.147 Y98.853 E.03096
G1 X98.147 Y81.147 E.77652
G1 X98.853 Y81.147 E.03096
G1 X98.853 Y98.793 E.77389
M204 S6000
G1 X99.302 Y99.302 F42000
G1 F3000
M204 S500
G1 X97.699 Y99.302 E.0703
G1 X97.699 Y80.698 E.81586
G1 X99.302 Y80.698 E.0703
G1 X99.302 Y99.242 E.81323
M204 S6000
G1 X99.75 Y99.75 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X97.25 Y99.75 E.10964
G1 X97.25 Y80.25 E.85519
G1 X99.75 Y80.25 E.10964
G1 X99.75 Y99.69 E.85256
; WIPE_START
G1 X97.751 Y99.738 E-.76
; WIPE_END
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




G1 X98.5 Y98.629 F42000
G1 Z.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.309064
G1 F3000
M204 S500
G1 X98.5 Y81.371 E.43464
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3000
G1 X98.5 Y83.371 E-.76
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
G3 Z.64 I-1.023 J-.659 P1  F42000
G1 X96.279 Y86.823 Z.64
G1 Z.36
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X96.456 Y87.065 I-.099 J.258 E.00611
G3 X96.223 Y87.327 I-.29 J-.023 E.00726
G3 X95.934 Y87.128 I-.013 J-.291 E.00726
G3 X96.098 Y86.817 I.287 J-.048 E.00726
G1 X96.223 Y86.802 E.00244
; WIPE_START
G1 X96.426 Y86.942 E-.1156
G1 X96.456 Y87.065 E-.05952
G1 X96.342 Y87.283 E-.1156
G1 X96.223 Y87.327 E-.05952
G1 X95.993 Y87.24 E-.11559
G1 X95.934 Y87.128 E-.05952
G1 X95.934 Y87.001 E-.05954
G1 X96.098 Y86.817 E-.11558
G1 X96.223 Y86.802 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-1.216 J.041 P1  F42000
G1 X96.285 Y88.651 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.463 Y88.892 I-.099 J.258 E.00611
G3 X96.23 Y89.155 I-.29 J-.023 E.00726
G3 X95.941 Y88.956 I-.013 J-.291 E.00726
G3 X96.104 Y88.645 I.287 J-.048 E.00726
G1 X96.23 Y88.63 E.00244
; WIPE_START
G1 X96.432 Y88.769 E-.1156
G1 X96.463 Y88.892 E-.05952
G1 X96.348 Y89.11 E-.1156
G1 X96.23 Y89.155 E-.05952
G1 X96 Y89.068 E-.11559
G1 X95.941 Y88.956 E-.05952
G1 X95.941 Y88.829 E-.05954
G1 X96.104 Y88.645 E-.11558
G1 X96.23 Y88.63 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-1.075 J-.57 P1  F42000
G1 X95.36 Y90.271 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X95.537 Y90.513 I-.099 J.258 E.00611
G3 X95.304 Y90.776 I-.29 J-.023 E.00726
G3 X95.015 Y90.576 I-.013 J-.291 E.00726
G3 X95.179 Y90.265 I.287 J-.048 E.00726
G1 X95.304 Y90.25 E.00244
; WIPE_START
G1 X95.507 Y90.39 E-.1156
G1 X95.537 Y90.513 E-.05952
G1 X95.423 Y90.731 E-.1156
G1 X95.304 Y90.776 E-.05952
G1 X95.074 Y90.688 E-.11559
G1 X95.015 Y90.576 E-.05952
G1 X95.015 Y90.45 E-.05954
G1 X95.179 Y90.265 E-.11558
G1 X95.304 Y90.25 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.875 J-.846 P1  F42000
G1 X94.099 Y89.003 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.276 Y89.244 I-.099 J.258 E.00611
G3 X94.044 Y89.507 I-.29 J-.023 E.00726
G3 X93.755 Y89.308 I-.013 J-.291 E.00726
G3 X93.918 Y88.997 I.287 J-.048 E.00726
G1 X94.044 Y88.982 E.00244
; WIPE_START
G1 X94.246 Y89.121 E-.1156
G1 X94.276 Y89.244 E-.05952
G1 X94.162 Y89.462 E-.1156
G1 X94.044 Y89.507 E-.05952
G1 X93.814 Y89.42 E-.11559
M73 P38 R11
G1 X93.755 Y89.308 E-.05952
G1 X93.755 Y89.181 E-.05954
G1 X93.918 Y88.997 E-.11558
G1 X94.044 Y88.982 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.863 J-.858 P1  F42000
G1 X92.821 Y87.751 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X92.999 Y87.993 I-.099 J.258 E.00611
G3 X92.766 Y88.256 I-.29 J-.023 E.00726
G3 X92.477 Y88.056 I-.013 J-.291 E.00726
G3 X92.64 Y87.745 I.287 J-.048 E.00726
G1 X92.766 Y87.73 E.00244
; WIPE_START
G1 X92.968 Y87.87 E-.1156
G1 X92.999 Y87.993 E-.05952
G1 X92.884 Y88.211 E-.1156
G1 X92.766 Y88.256 E-.05952
G1 X92.536 Y88.168 E-.11559
G1 X92.477 Y88.056 E-.05952
G1 X92.477 Y87.93 E-.05954
G1 X92.64 Y87.745 E-.11558
G1 X92.766 Y87.73 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.883 J-.837 P1  F42000
G1 X91.572 Y86.471 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.749 Y86.713 I-.099 J.258 E.00611
G3 X91.516 Y86.976 I-.29 J-.023 E.00726
G3 X91.227 Y86.776 I-.013 J-.291 E.00726
G3 X91.391 Y86.465 I.287 J-.048 E.00726
G1 X91.516 Y86.45 E.00244
; WIPE_START
G1 X91.719 Y86.59 E-.1156
G1 X91.749 Y86.713 E-.05952
G1 X91.635 Y86.931 E-.1156
G1 X91.516 Y86.976 E-.05952
G1 X91.286 Y86.889 E-.11559
G1 X91.227 Y86.776 E-.05952
G1 X91.227 Y86.65 E-.05954
G1 X91.391 Y86.465 E-.11558
G1 X91.516 Y86.45 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.366 J-1.161 P1  F42000
G1 X89.78 Y86.998 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.958 Y87.24 I-.099 J.258 E.00611
G3 X89.725 Y87.502 I-.29 J-.023 E.00726
G3 X89.436 Y87.303 I-.013 J-.291 E.00726
G3 X89.599 Y86.992 I.287 J-.047 E.00726
G1 X89.725 Y86.977 E.00244
; WIPE_START
G1 X89.928 Y87.117 E-.1156
G1 X89.958 Y87.24 E-.05952
G1 X89.844 Y87.457 E-.1156
G1 X89.725 Y87.502 E-.05952
G1 X89.495 Y87.415 E-.11559
G1 X89.436 Y87.303 E-.05953
G1 X89.495 Y87.064 E-.1156
G1 X89.599 Y86.992 E-.05952
G1 X89.725 Y86.977 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.748 J-.96 P1  F42000
G1 X88.347 Y85.902 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.524 Y86.144 I-.099 J.258 E.00611
G3 X88.291 Y86.407 I-.29 J-.023 E.00726
G3 X88.003 Y86.207 I-.013 J-.291 E.00726
G3 X88.166 Y85.896 I.287 J-.047 E.00726
G1 X88.291 Y85.881 E.00244
; WIPE_START
G1 X88.494 Y86.021 E-.1156
G1 X88.524 Y86.144 E-.05952
G1 X88.41 Y86.362 E-.1156
G1 X88.291 Y86.407 E-.05952
G1 X88.061 Y86.32 E-.11559
G1 X88.003 Y86.207 E-.05953
G1 X88.061 Y85.968 E-.1156
G1 X88.166 Y85.896 E-.05952
G1 X88.291 Y85.881 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.885 J-.835 P1  F42000
G1 X87.017 Y87.232 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X87.195 Y87.473 I-.099 J.258 E.00611
G3 X86.962 Y87.736 I-.29 J-.023 E.00726
G3 X86.673 Y87.537 I-.013 J-.291 E.00726
G3 X86.836 Y87.226 I.287 J-.047 E.00726
G1 X86.962 Y87.211 E.00244
; WIPE_START
G1 X87.165 Y87.35 E-.1156
G1 X87.195 Y87.473 E-.05952
G1 X87.081 Y87.691 E-.1156
G1 X86.962 Y87.736 E-.05952
G1 X86.732 Y87.649 E-.11559
G1 X86.673 Y87.537 E-.05953
G1 X86.732 Y87.298 E-.1156
G1 X86.836 Y87.226 E-.05952
G1 X86.962 Y87.211 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.951 J-.759 P1  F42000
G1 X85.88 Y85.855 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X86.057 Y86.097 I-.099 J.258 E.00611
G3 X85.824 Y86.36 I-.29 J-.023 E.00726
G3 X85.535 Y86.16 I-.013 J-.291 E.00726
G3 X85.699 Y85.85 I.287 J-.047 E.00726
G1 X85.824 Y85.834 E.00244
; WIPE_START
G1 X86.027 Y85.974 E-.1156
G1 X86.057 Y86.097 E-.05952
G1 X85.943 Y86.315 E-.1156
G1 X85.824 Y86.36 E-.05952
G1 X85.594 Y86.273 E-.11559
G1 X85.535 Y86.16 E-.05953
G1 X85.594 Y85.922 E-.1156
G1 X85.699 Y85.85 E-.05952
G1 X85.824 Y85.834 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.88 J-.84 P1  F42000
G1 X84.543 Y87.177 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X84.72 Y87.419 I-.099 J.258 E.00611
G3 X84.487 Y87.682 I-.29 J-.023 E.00726
G3 X84.198 Y87.482 I-.013 J-.291 E.00726
G3 X84.362 Y87.171 I.287 J-.047 E.00726
G1 X84.487 Y87.156 E.00244
; WIPE_START
G1 X84.69 Y87.296 E-.1156
G1 X84.72 Y87.419 E-.05952
G1 X84.606 Y87.637 E-.1156
G1 X84.487 Y87.682 E-.05952
G1 X84.257 Y87.594 E-.11559
G1 X84.198 Y87.482 E-.05953
G1 X84.257 Y87.243 E-.1156
G1 X84.362 Y87.171 E-.05952
G1 X84.487 Y87.156 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.914 J-.803 P1  F42000
G1 X83.345 Y85.855 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X83.522 Y86.097 I-.099 J.258 E.00611
G3 X83.29 Y86.36 I-.29 J-.023 E.00726
G3 X83.001 Y86.16 I-.013 J-.291 E.00726
G3 X83.164 Y85.85 I.287 J-.047 E.00726
G1 X83.29 Y85.834 E.00244
; WIPE_START
G1 X83.492 Y85.974 E-.1156
G1 X83.522 Y86.097 E-.05952
G1 X83.408 Y86.315 E-.1156
G1 X83.29 Y86.36 E-.05952
G1 X83.06 Y86.273 E-.11559
G1 X83.001 Y86.16 E-.05953
G1 X83.06 Y85.922 E-.1156
G1 X83.164 Y85.85 E-.05952
G1 X83.29 Y85.834 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.882 J-.838 P1  F42000
G1 X82.011 Y87.18 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X82.188 Y87.421 I-.099 J.258 E.00611
G3 X81.955 Y87.684 I-.29 J-.023 E.00726
G3 X81.666 Y87.485 I-.013 J-.291 E.00726
G3 X81.83 Y87.174 I.287 J-.047 E.00726
G1 X81.955 Y87.159 E.00244
; WIPE_START
G1 X82.158 Y87.298 E-.1156
G1 X82.188 Y87.421 E-.05952
G1 X82.074 Y87.639 E-.1156
G1 X81.955 Y87.684 E-.05952
G1 X81.725 Y87.597 E-.11559
G1 X81.666 Y87.485 E-.05953
G1 X81.725 Y87.246 E-.1156
G1 X81.83 Y87.174 E-.05952
G1 X81.955 Y87.159 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.89 J.83 P1  F42000
G1 X83.213 Y88.506 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X83.391 Y88.748 I-.099 J.258 E.00611
G3 X83.158 Y89.011 I-.29 J-.023 E.00726
G3 X82.869 Y88.811 I-.013 J-.291 E.00726
G3 X83.032 Y88.501 I.287 J-.047 E.00726
G1 X83.158 Y88.485 E.00244
; WIPE_START
G1 X83.361 Y88.625 E-.1156
G1 X83.391 Y88.748 E-.05952
G1 X83.277 Y88.966 E-.1156
G1 X83.158 Y89.011 E-.05952
G1 X82.928 Y88.924 E-.11559
G1 X82.869 Y88.811 E-.05953
G1 X82.928 Y88.573 E-.1156
G1 X83.032 Y88.501 E-.05952
G1 X83.158 Y88.485 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.925 J.791 P1  F42000
G1 X84.359 Y89.89 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X84.536 Y90.132 I-.099 J.258 E.00611
G3 X84.303 Y90.395 I-.29 J-.023 E.00726
G3 X84.015 Y90.195 I-.013 J-.291 E.00726
G3 X84.178 Y89.884 I.287 J-.047 E.00726
G1 X84.303 Y89.869 E.00244
; WIPE_START
G1 X84.506 Y90.009 E-.1156
G1 X84.536 Y90.132 E-.05952
G1 X84.422 Y90.35 E-.1156
G1 X84.303 Y90.395 E-.05952
G1 X84.073 Y90.308 E-.11559
G1 X84.015 Y90.195 E-.05953
G1 X84.073 Y89.956 E-.1156
G1 X84.178 Y89.884 E-.05952
G1 X84.303 Y89.869 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.885 J-.835 P1  F42000
G1 X83.029 Y91.219 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X83.207 Y91.461 I-.099 J.258 E.00611
G3 X82.974 Y91.724 I-.29 J-.023 E.00726
G3 X82.685 Y91.525 I-.013 J-.291 E.00726
G3 X82.848 Y91.214 I.287 J-.047 E.00726
G1 X82.974 Y91.199 E.00244
; WIPE_START
G1 X83.177 Y91.338 E-.1156
G1 X83.207 Y91.461 E-.05952
G1 X83.093 Y91.679 E-.1156
G1 X82.974 Y91.724 E-.05952
G1 X82.744 Y91.637 E-.11559
G1 X82.685 Y91.525 E-.05953
G1 X82.744 Y91.286 E-.1156
G1 X82.848 Y91.214 E-.05952
G1 X82.974 Y91.199 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.95 J-.76 P1  F42000
G1 X81.884 Y89.836 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X82.062 Y90.077 I-.099 J.258 E.00611
G3 X81.829 Y90.34 I-.29 J-.023 E.00726
G3 X81.54 Y90.141 I-.013 J-.291 E.00726
G3 X81.703 Y89.83 I.287 J-.047 E.00726
G1 X81.829 Y89.815 E.00244
; WIPE_START
G1 X82.031 Y89.954 E-.1156
G1 X82.062 Y90.077 E-.05952
G1 X81.947 Y90.295 E-.1156
G1 X81.829 Y90.34 E-.05952
G1 X81.599 Y90.253 E-.11559
G1 X81.54 Y90.141 E-.05953
G1 X81.599 Y89.902 E-.1156
G1 X81.703 Y89.83 E-.05952
G1 X81.829 Y89.815 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.914 J-.803 P1  F42000
G1 X80.681 Y88.509 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X80.859 Y88.751 I-.099 J.258 E.00611
G3 X80.626 Y89.014 I-.29 J-.023 E.00726
G3 X80.337 Y88.814 I-.013 J-.291 E.00726
G3 X80.5 Y88.503 I.287 J-.047 E.00726
G1 X80.626 Y88.488 E.00244
; WIPE_START
G1 X80.829 Y88.628 E-.1156
G1 X80.859 Y88.751 E-.05952
G1 X80.745 Y88.969 E-.1156
G1 X80.626 Y89.014 E-.05952
G1 X80.396 Y88.926 E-.11559
G1 X80.337 Y88.814 E-.05953
G1 X80.396 Y88.575 E-.1156
G1 X80.5 Y88.503 E-.05952
G1 X80.626 Y88.488 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I1.217 J-.008 P1  F42000
G1 X80.609 Y85.855 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X80.786 Y86.097 I-.099 J.258 E.00611
G3 X80.553 Y86.36 I-.29 J-.023 E.00726
G3 X80.264 Y86.16 I-.013 J-.291 E.00726
G3 X80.428 Y85.85 I.287 J-.047 E.00726
G1 X80.553 Y85.834 E.00244
; WIPE_START
G1 X80.756 Y85.974 E-.1156
G1 X80.786 Y86.097 E-.05952
G1 X80.672 Y86.315 E-.1156
G1 X80.553 Y86.36 E-.05952
G1 X80.323 Y86.273 E-.11559
G1 X80.264 Y86.16 E-.05953
G1 X80.323 Y85.922 E-.1156
G1 X80.428 Y85.85 E-.05952
G1 X80.553 Y85.834 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-1.217 J0 P1  F42000
G1 X80.555 Y91.165 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X80.732 Y91.407 I-.099 J.258 E.00611
G3 X80.499 Y91.67 I-.29 J-.023 E.00726
G3 X80.21 Y91.47 I-.013 J-.291 E.00726
G3 X80.374 Y91.159 I.287 J-.047 E.00726
G1 X80.499 Y91.144 E.00244
; WIPE_START
G1 X80.702 Y91.284 E-.1156
G1 X80.732 Y91.407 E-.05952
G1 X80.618 Y91.625 E-.1156
G1 X80.499 Y91.67 E-.05952
G1 X80.269 Y91.582 E-.11559
G1 X80.21 Y91.47 E-.05953
G1 X80.269 Y91.231 E-.1156
G1 X80.374 Y91.159 E-.05952
G1 X80.499 Y91.144 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.925 J.791 P1  F42000
G1 X81.7 Y92.549 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X81.878 Y92.791 I-.099 J.258 E.00611
G3 X81.645 Y93.053 I-.29 J-.023 E.00726
G3 X81.356 Y92.854 I-.013 J-.291 E.00726
G3 X81.519 Y92.543 I.287 J-.047 E.00726
G1 X81.645 Y92.528 E.00244
; WIPE_START
G1 X81.847 Y92.668 E-.1156
G1 X81.878 Y92.791 E-.05952
G1 X81.763 Y93.009 E-.1156
G1 X81.645 Y93.053 E-.05952
G1 X81.415 Y92.966 E-.11559
G1 X81.356 Y92.854 E-.05953
G1 X81.415 Y92.615 E-.1156
G1 X81.519 Y92.543 E-.05952
G1 X81.645 Y92.528 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.73 J.974 P1  F42000
G1 X83.134 Y93.644 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X83.311 Y93.886 I-.099 J.258 E.00611
G3 X83.078 Y94.149 I-.29 J-.023 E.00726
G3 X82.79 Y93.95 I-.013 J-.291 E.00726
G3 X82.953 Y93.639 I.287 J-.047 E.00726
G1 X83.078 Y93.623 E.00244
; WIPE_START
G1 X83.281 Y93.763 E-.1156
G1 X83.311 Y93.886 E-.05952
G1 X83.197 Y94.104 E-.1156
G1 X83.078 Y94.149 E-.05952
G1 X82.848 Y94.062 E-.11559
G1 X82.79 Y93.95 E-.05953
G1 X82.848 Y93.711 E-.1156
G1 X82.953 Y93.639 E-.05952
G1 X83.078 Y93.623 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.836 J.885 P1  F42000
G1 X84.463 Y92.315 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X84.641 Y92.557 I-.099 J.258 E.00611
G3 X84.408 Y92.82 I-.29 J-.023 E.00726
G3 X84.119 Y92.62 I-.013 J-.291 E.00726
G3 X84.282 Y92.309 I.287 J-.047 E.00726
G1 X84.408 Y92.294 E.00244
; WIPE_START
G1 X84.61 Y92.434 E-.1156
G1 X84.641 Y92.557 E-.05952
G1 X84.526 Y92.775 E-.1156
G1 X84.408 Y92.82 E-.05952
G1 X84.178 Y92.732 E-.11559
G1 X84.119 Y92.62 E-.05953
G1 X84.178 Y92.381 E-.1156
G1 X84.282 Y92.309 E-.05952
G1 X84.408 Y92.294 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.837 J.883 P1  F42000
G1 X85.745 Y93.562 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.923 Y93.804 I-.099 J.258 E.00611
G3 X85.69 Y94.067 I-.29 J-.023 E.00726
G3 X85.401 Y93.867 I-.013 J-.291 E.00726
G3 X85.564 Y93.556 I.287 J-.047 E.00726
G1 X85.69 Y93.541 E.00244
; WIPE_START
G1 X85.893 Y93.681 E-.1156
G1 X85.923 Y93.804 E-.05952
G1 X85.809 Y94.022 E-.1156
G1 X85.69 Y94.067 E-.05952
G1 X85.46 Y93.979 E-.11559
G1 X85.401 Y93.867 E-.05953
G1 X85.46 Y93.628 E-.1156
G1 X85.564 Y93.556 E-.05952
G1 X85.69 Y93.541 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.836 J.885 P1  F42000
G1 X87.075 Y92.233 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X87.252 Y92.475 I-.099 J.258 E.00611
G3 X87.02 Y92.737 I-.29 J-.023 E.00726
G3 X86.731 Y92.538 I-.013 J-.291 E.00726
G3 X86.894 Y92.227 I.287 J-.047 E.00726
G1 X87.02 Y92.212 E.00244
; WIPE_START
G1 X87.222 Y92.352 E-.1156
G1 X87.252 Y92.475 E-.05952
G1 X87.138 Y92.692 E-.1156
G1 X87.02 Y92.737 E-.05952
G1 X86.789 Y92.65 E-.11559
G1 X86.731 Y92.538 E-.05953
G1 X86.789 Y92.299 E-.1156
G1 X86.894 Y92.227 E-.05952
G1 X87.02 Y92.212 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.86 J-.861 P1  F42000
G1 X85.792 Y90.986 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.97 Y91.228 I-.099 J.258 E.00611
G3 X85.737 Y91.49 I-.29 J-.023 E.00726
G3 X85.448 Y91.291 I-.013 J-.291 E.00726
G3 X85.611 Y90.98 I.287 J-.047 E.00726
G1 X85.737 Y90.965 E.00244
; WIPE_START
G1 X85.94 Y91.105 E-.1156
G1 X85.97 Y91.228 E-.05952
G1 X85.856 Y91.445 E-.1156
G1 X85.737 Y91.49 E-.05952
G1 X85.507 Y91.403 E-.11559
G1 X85.448 Y91.291 E-.05953
G1 X85.507 Y91.052 E-.1156
G1 X85.611 Y90.98 E-.05952
G1 X85.737 Y90.965 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.836 J.885 P1  F42000
G1 X87.122 Y89.656 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X87.299 Y89.898 I-.099 J.258 E.00611
G3 X87.066 Y90.161 I-.29 J-.023 E.00726
G3 X86.778 Y89.962 I-.013 J-.291 E.00726
G3 X86.941 Y89.651 I.287 J-.047 E.00726
G1 X87.066 Y89.635 E.00244
; WIPE_START
G1 X87.269 Y89.775 E-.1156
G1 X87.299 Y89.898 E-.05952
G1 X87.185 Y90.116 E-.1156
G1 X87.066 Y90.161 E-.05952
G1 X86.836 Y90.074 E-.11559
G1 X86.778 Y89.962 E-.05953
G1 X86.836 Y89.723 E-.1156
G1 X86.941 Y89.651 E-.05952
G1 X87.066 Y89.635 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.748 J-.96 P1  F42000
G1 X85.688 Y88.561 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.866 Y88.803 I-.099 J.258 E.00611
G3 X85.633 Y89.065 I-.29 J-.023 E.00726
G3 X85.344 Y88.866 I-.013 J-.291 E.00726
G3 X85.507 Y88.555 I.287 J-.047 E.00726
G1 X85.633 Y88.54 E.00244
; WIPE_START
G1 X85.835 Y88.68 E-.1156
G1 X85.866 Y88.803 E-.05952
G1 X85.751 Y89.021 E-.1156
G1 X85.633 Y89.065 E-.05952
G1 X85.403 Y88.978 E-.11559
G1 X85.344 Y88.866 E-.05953
G1 X85.403 Y88.627 E-.1156
G1 X85.507 Y88.555 E-.05952
G1 X85.633 Y88.54 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.092 J1.214 P1  F42000
G1 X88.451 Y88.327 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.629 Y88.569 I-.099 J.258 E.00611
G3 X88.396 Y88.832 I-.29 J-.023 E.00726
G3 X88.107 Y88.632 I-.013 J-.291 E.00726
G3 X88.27 Y88.321 I.287 J-.047 E.00726
G1 X88.396 Y88.306 E.00244
; WIPE_START
G1 X88.598 Y88.446 E-.1156
G1 X88.629 Y88.569 E-.05952
G1 X88.514 Y88.787 E-.1156
G1 X88.396 Y88.832 E-.05952
G1 X88.166 Y88.745 E-.11559
G1 X88.107 Y88.632 E-.05953
G1 X88.166 Y88.393 E-.1156
G1 X88.27 Y88.321 E-.05952
G1 X88.396 Y88.306 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.837 J.883 P1  F42000
G1 X89.733 Y89.574 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.911 Y89.816 I-.099 J.258 E.00611
G3 X89.678 Y90.079 I-.29 J-.023 E.00726
G3 X89.389 Y89.879 I-.013 J-.291 E.00726
G3 X89.552 Y89.568 I.287 J-.047 E.00726
G1 X89.678 Y89.553 E.00244
; WIPE_START
G1 X89.881 Y89.693 E-.1156
G1 X89.911 Y89.816 E-.05952
G1 X89.797 Y90.034 E-.1156
G1 X89.678 Y90.079 E-.05952
G1 X89.448 Y89.991 E-.11559
G1 X89.389 Y89.879 E-.05953
G1 X89.448 Y89.64 E-.1156
G1 X89.552 Y89.568 E-.05952
G1 X89.678 Y89.553 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.84 J.881 P1  F42000
G1 X91.012 Y90.825 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.19 Y91.067 I-.099 J.258 E.00611
G3 X90.957 Y91.329 I-.29 J-.023 E.00726
G3 X90.668 Y91.13 I-.013 J-.291 E.00726
G3 X90.831 Y90.819 I.287 J-.048 E.00726
G1 X90.957 Y90.804 E.00244
; WIPE_START
G1 X91.159 Y90.944 E-.1156
G1 X91.19 Y91.067 E-.05952
G1 X91.075 Y91.284 E-.1156
G1 X90.957 Y91.329 E-.05952
G1 X90.727 Y91.242 E-.11559
G1 X90.668 Y91.13 E-.05952
G1 X90.668 Y91.003 E-.05954
G1 X90.831 Y90.819 E-.11558
G1 X90.957 Y90.804 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.863 J.858 P1  F42000
G1 X92.255 Y92.111 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X92.433 Y92.353 I-.099 J.258 E.00611
G3 X92.2 Y92.616 I-.29 J-.023 E.00726
G3 X91.911 Y92.416 I-.013 J-.291 E.00726
G3 X92.074 Y92.105 I.287 J-.048 E.00726
G1 X92.2 Y92.09 E.00244
; WIPE_START
G1 X92.402 Y92.23 E-.1156
G1 X92.433 Y92.353 E-.05952
G1 X92.318 Y92.571 E-.1156
G1 X92.2 Y92.616 E-.05952
G1 X91.97 Y92.528 E-.11559
G1 X91.911 Y92.416 E-.05952
G1 X91.911 Y92.29 E-.05954
G1 X92.074 Y92.105 E-.11558
G1 X92.2 Y92.09 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-1.041 J.63 P1  F42000
G1 X93.15 Y93.661 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X93.328 Y93.903 I-.099 J.258 E.00611
G3 X93.095 Y94.166 I-.29 J-.023 E.00726
G3 X92.806 Y93.966 I-.013 J-.291 E.00726
G3 X92.969 Y93.655 I.287 J-.048 E.00726
G1 X93.095 Y93.64 E.00244
; WIPE_START
G1 X93.298 Y93.78 E-.1156
G1 X93.328 Y93.903 E-.05952
G1 X93.214 Y94.121 E-.1156
G1 X93.095 Y94.166 E-.05952
G1 X92.865 Y94.078 E-.11559
G1 X92.806 Y93.966 E-.05952
G1 X92.806 Y93.84 E-.05954
G1 X92.969 Y93.655 E-.11558
G1 X93.095 Y93.64 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.807 J.911 P1  F42000
G1 X94.508 Y92.387 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.685 Y92.629 I-.099 J.258 E.00611
G3 X94.453 Y92.892 I-.29 J-.023 E.00726
G3 X94.164 Y92.693 I-.013 J-.291 E.00726
G3 X94.327 Y92.382 I.287 J-.048 E.00726
G1 X94.453 Y92.366 E.00244
; WIPE_START
G1 X94.655 Y92.506 E-.1156
G1 X94.685 Y92.629 E-.05952
G1 X94.571 Y92.847 E-.1156
G1 X94.453 Y92.892 E-.05952
G1 X94.223 Y92.805 E-.11559
G1 X94.164 Y92.693 E-.05952
G1 X94.164 Y92.566 E-.05954
G1 X94.327 Y92.382 E-.11558
G1 X94.453 Y92.366 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I1.067 J-.585 P1  F42000
G1 X93.584 Y90.782 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X93.762 Y91.024 I-.099 J.258 E.00611
G3 X93.529 Y91.286 I-.29 J-.023 E.00726
G3 X93.24 Y91.087 I-.013 J-.291 E.00726
G3 X93.403 Y90.776 I.287 J-.048 E.00726
G1 X93.529 Y90.761 E.00244
; WIPE_START
G1 X93.732 Y90.901 E-.1156
G1 X93.762 Y91.024 E-.05952
G1 X93.647 Y91.241 E-.1156
G1 X93.529 Y91.286 E-.05952
G1 X93.299 Y91.199 E-.11559
G1 X93.24 Y91.087 E-.05952
G1 X93.24 Y90.96 E-.05954
G1 X93.403 Y90.776 E-.11558
G1 X93.529 Y90.761 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.887 J-.833 P1  F42000
G1 X92.341 Y89.495 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X92.519 Y89.737 I-.099 J.258 E.00611
G3 X92.286 Y90 I-.29 J-.023 E.00726
G3 X91.997 Y89.801 I-.013 J-.291 E.00726
G3 X92.16 Y89.49 I.287 J-.048 E.00726
G1 X92.286 Y89.474 E.00244
; WIPE_START
G1 X92.489 Y89.614 E-.1156
G1 X92.519 Y89.737 E-.05952
G1 X92.405 Y89.955 E-.1156
G1 X92.286 Y90 E-.05952
G1 X92.056 Y89.913 E-.11559
G1 X91.997 Y89.801 E-.05952
G1 X91.997 Y89.674 E-.05954
G1 X92.16 Y89.49 E-.11558
G1 X92.286 Y89.474 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.863 J-.858 P1  F42000
G1 X91.063 Y88.245 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.24 Y88.487 I-.099 J.258 E.00611
G3 X91.008 Y88.749 I-.29 J-.023 E.00726
G3 X90.719 Y88.55 I-.013 J-.291 E.00726
G3 X90.882 Y88.239 I.287 J-.048 E.00726
G1 X91.008 Y88.224 E.00244
; WIPE_START
G1 X91.21 Y88.364 E-.1156
G1 X91.24 Y88.487 E-.05952
G1 X91.126 Y88.704 E-.1156
G1 X91.008 Y88.749 E-.05952
G1 X90.777 Y88.662 E-.11559
G1 X90.719 Y88.55 E-.05952
G1 X90.719 Y88.423 E-.05954
G1 X90.882 Y88.239 E-.11558
G1 X91.008 Y88.224 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.605 J1.056 P1  F42000
G1 X94.15 Y86.422 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.328 Y86.664 I-.099 J.258 E.00611
G3 X94.095 Y86.926 I-.29 J-.023 E.00726
G3 X93.806 Y86.727 I-.013 J-.291 E.00726
G3 X93.969 Y86.416 I.287 J-.048 E.00726
G1 X94.095 Y86.401 E.00244
; WIPE_START
G1 X94.298 Y86.541 E-.1156
G1 X94.328 Y86.664 E-.05952
G1 X94.214 Y86.881 E-.1156
G1 X94.095 Y86.926 E-.05952
G1 X93.865 Y86.839 E-.11559
G1 X93.806 Y86.727 E-.05952
G1 X93.806 Y86.6 E-.05954
G1 X93.969 Y86.416 E-.11558
G1 X94.095 Y86.401 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-1.128 J.457 P1  F42000
G1 X96.285 Y91.81 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.463 Y92.052 I-.099 J.258 E.00611
G3 X96.23 Y92.315 I-.29 J-.023 E.00726
G3 X95.941 Y92.116 I-.013 J-.291 E.00726
G3 X96.104 Y91.805 I.287 J-.048 E.00726
G1 X96.23 Y91.789 E.00244
; WIPE_START
G1 X96.432 Y91.929 E-.1156
G1 X96.463 Y92.052 E-.05952
G1 X96.348 Y92.27 E-.1156
G1 X96.23 Y92.315 E-.05952
G1 X96 Y92.228 E-.11559
G1 X95.941 Y92.116 E-.05952
G1 X95.941 Y91.989 E-.05954
G1 X96.104 Y91.805 E-.11558
G1 X96.23 Y91.789 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-1.205 J-.173 P1  F42000
G1 X95.961 Y93.661 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.138 Y93.903 I-.099 J.258 E.00611
G3 X95.905 Y94.166 I-.29 J-.023 E.00726
G3 X95.617 Y93.966 I-.013 J-.291 E.00726
G3 X95.78 Y93.655 I.287 J-.048 E.00726
G1 X95.905 Y93.64 E.00244
; WIPE_START
G1 X96.108 Y93.78 E-.1156
G1 X96.138 Y93.903 E-.05952
G1 X96.024 Y94.121 E-.1156
G1 X95.905 Y94.166 E-.05952
G1 X95.675 Y94.078 E-.11559
G1 X95.617 Y93.966 E-.05952
G1 X95.617 Y93.84 E-.05954
G1 X95.78 Y93.655 E-.11558
G1 X95.905 Y93.64 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.049 J-1.216 P1  F42000
G1 X90.926 Y93.44 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.103 Y93.682 I-.099 J.258 E.00611
G3 X90.87 Y93.945 I-.29 J-.023 E.00726
G3 X90.581 Y93.746 I-.013 J-.291 E.00726
G3 X90.745 Y93.435 I.287 J-.048 E.00726
G1 X90.87 Y93.419 E.00244
; WIPE_START
G1 X91.073 Y93.559 E-.1156
G1 X91.103 Y93.682 E-.05952
G1 X90.989 Y93.9 E-.1156
G1 X90.87 Y93.945 E-.05952
G1 X90.64 Y93.858 E-.11559
G1 X90.581 Y93.746 E-.05952
G1 X90.581 Y93.619 E-.05954
G1 X90.745 Y93.435 E-.11558
G1 X90.87 Y93.419 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.887 J-.833 P1  F42000
G1 X89.683 Y92.154 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.86 Y92.396 I-.099 J.258 E.00611
G3 X89.627 Y92.659 I-.29 J-.023 E.00726
G3 X89.338 Y92.459 I-.013 J-.291 E.00726
G3 X89.502 Y92.148 I.287 J-.047 E.00726
G1 X89.627 Y92.133 E.00244
; WIPE_START
G1 X89.83 Y92.273 E-.1156
G1 X89.86 Y92.396 E-.05952
G1 X89.746 Y92.614 E-.1156
G1 X89.627 Y92.659 E-.05952
G1 X89.397 Y92.572 E-.11559
G1 X89.338 Y92.459 E-.05953
G1 X89.397 Y92.22 E-.1156
G1 X89.502 Y92.148 E-.05952
G1 X89.627 Y92.133 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I.863 J-.858 P1  F42000
G1 X88.404 Y90.903 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.582 Y91.145 I-.099 J.258 E.00611
G3 X88.349 Y91.408 I-.29 J-.023 E.00726
G3 X88.06 Y91.209 I-.013 J-.291 E.00726
G3 X88.223 Y90.898 I.287 J-.047 E.00726
G1 X88.349 Y90.882 E.00244
; WIPE_START
G1 X88.551 Y91.022 E-.1156
G1 X88.582 Y91.145 E-.05952
G1 X88.467 Y91.363 E-.1156
G1 X88.349 Y91.408 E-.05952
G1 X88.119 Y91.321 E-.11559
G1 X88.06 Y91.209 E-.05953
G1 X88.119 Y90.97 E-.1156
G1 X88.223 Y90.898 E-.05952
G1 X88.349 Y90.882 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-1.217 J.002 P1  F42000
G1 X88.353 Y93.483 Z.76
G1 Z.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.531 Y93.725 I-.099 J.258 E.00611
G3 X88.298 Y93.988 I-.29 J-.023 E.00726
G3 X88.009 Y93.789 I-.013 J-.291 E.00726
G3 X88.172 Y93.478 I.287 J-.047 E.00726
G1 X88.298 Y93.462 E.00244
; WIPE_START
G1 X88.501 Y93.602 E-.1156
G1 X88.531 Y93.725 E-.05952
G1 X88.417 Y93.943 E-.1156
G1 X88.298 Y93.988 E-.05952
G1 X88.068 Y93.901 E-.11559
G1 X88.009 Y93.789 E-.05953
G1 X88.068 Y93.55 E-.1156
G1 X88.172 Y93.478 E-.05952
G1 X88.298 Y93.462 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.558 J1.081 P1  F42000
G1 X98.977 Y98.977 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
M73 P39 R11
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 0.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/82
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z.76 I-1.035 J-.64 P1  F42000
G1 X96.262 Y86.858 Z.76
G1 Z.48
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X96.412 Y87.065 I-.098 J.229 E.00517
G3 X96.205 Y86.842 I-.221 J-.002 E.02031
; WIPE_START
G1 X96.385 Y86.959 E-.11999
G1 X96.412 Y87.065 E-.06124
G1 X96.385 Y87.171 E-.06124
G1 X96.255 Y87.274 E-.09257
G1 X96.097 Y87.266 E-.08904
G1 X96.012 Y87.196 E-.06175
G1 X95.971 Y87.094 E-.06169
G1 X96.012 Y86.933 E-.09286
G1 X96.205 Y86.842 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-1.216 J.042 P1  F42000
G1 X96.268 Y88.686 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.419 Y88.892 I-.098 J.229 E.00517
G3 X96.211 Y88.67 I-.221 J-.002 E.02031
; WIPE_START
G1 X96.391 Y88.787 E-.11999
G1 X96.419 Y88.892 E-.06124
G1 X96.391 Y88.998 E-.06124
G1 X96.262 Y89.101 E-.09257
G1 X96.103 Y89.094 E-.08904
G1 X96.018 Y89.024 E-.06175
G1 X95.977 Y88.922 E-.06169
G1 X96.018 Y88.761 E-.09286
G1 X96.211 Y88.67 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-1.075 J-.571 P1  F42000
G1 X95.343 Y90.306 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X95.493 Y90.513 I-.098 J.229 E.00517
G3 X95.286 Y90.291 I-.221 J-.002 E.02031
; WIPE_START
G1 X95.466 Y90.407 E-.11999
G1 X95.493 Y90.513 E-.06124
G1 X95.466 Y90.619 E-.06124
G1 X95.337 Y90.722 E-.09257
G1 X95.178 Y90.715 E-.08904
G1 X95.093 Y90.645 E-.06175
G1 X95.052 Y90.542 E-.06169
G1 X95.093 Y90.381 E-.09286
G1 X95.286 Y90.291 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.877 J-.843 P1  F42000
G1 X94.082 Y89.038 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.232 Y89.244 I-.098 J.229 E.00517
G3 X94.025 Y89.022 I-.221 J-.002 E.02031
; WIPE_START
G1 X94.205 Y89.138 E-.11999
G1 X94.232 Y89.244 E-.06124
G1 X94.205 Y89.35 E-.06124
G1 X94.076 Y89.453 E-.09257
G1 X93.917 Y89.446 E-.08904
G1 X93.832 Y89.376 E-.06175
G1 X93.791 Y89.274 E-.06169
G1 X93.832 Y89.113 E-.09286
G1 X94.025 Y89.022 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.866 J-.855 P1  F42000
G1 X92.804 Y87.786 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X92.955 Y87.993 I-.098 J.229 E.00517
G3 X92.747 Y87.771 I-.221 J-.002 E.02031
; WIPE_START
G1 X92.927 Y87.887 E-.11999
G1 X92.955 Y87.993 E-.06124
G1 X92.927 Y88.099 E-.06124
G1 X92.798 Y88.202 E-.09257
G1 X92.639 Y88.195 E-.08904
G1 X92.554 Y88.125 E-.06175
G1 X92.513 Y88.022 E-.06169
G1 X92.554 Y87.861 E-.09286
G1 X92.747 Y87.771 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.885 J-.835 P1  F42000
G1 X91.555 Y86.507 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.705 Y86.713 I-.098 J.229 E.00517
G3 X91.498 Y86.491 I-.221 J-.002 E.02031
; WIPE_START
G1 X91.678 Y86.607 E-.11999
G1 X91.705 Y86.713 E-.06124
G1 X91.678 Y86.819 E-.06124
G1 X91.549 Y86.922 E-.09257
G1 X91.39 Y86.915 E-.08904
G1 X91.305 Y86.845 E-.06175
G1 X91.264 Y86.742 E-.06169
G1 X91.305 Y86.581 E-.09286
G1 X91.498 Y86.491 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.363 J-1.161 P1  F42000
G1 X89.764 Y87.033 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.914 Y87.24 I-.098 J.229 E.00517
G3 X89.707 Y87.017 I-.221 J-.002 E.02031
; WIPE_START
G1 X89.887 Y87.134 E-.11999
G1 X89.914 Y87.24 E-.06124
G1 X89.887 Y87.346 E-.06124
G1 X89.757 Y87.448 E-.09257
G1 X89.598 Y87.441 E-.08904
G1 X89.513 Y87.371 E-.06174
G1 X89.473 Y87.269 E-.06171
G1 X89.513 Y87.108 E-.09284
G1 X89.707 Y87.017 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.751 J-.958 P1  F42000
G1 X88.33 Y85.938 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.48 Y86.144 I-.098 J.229 E.00517
G3 X88.273 Y85.922 I-.221 J-.002 E.02031
; WIPE_START
G1 X88.453 Y86.038 E-.11999
G1 X88.48 Y86.144 E-.06124
G1 X88.453 Y86.25 E-.06124
G1 X88.324 Y86.353 E-.09257
G1 X88.165 Y86.346 E-.08904
G1 X88.08 Y86.276 E-.06174
G1 X88.039 Y86.173 E-.06171
G1 X88.08 Y86.012 E-.09284
G1 X88.273 Y85.922 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.884 J-.836 P1  F42000
G1 X87.001 Y87.267 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X87.151 Y87.473 I-.098 J.229 E.00517
G3 X86.944 Y87.251 I-.221 J-.002 E.02031
; WIPE_START
G1 X87.124 Y87.367 E-.11999
G1 X87.151 Y87.473 E-.06124
G1 X87.124 Y87.579 E-.06124
G1 X86.994 Y87.682 E-.09257
G1 X86.835 Y87.675 E-.08904
G1 X86.75 Y87.605 E-.06174
G1 X86.71 Y87.503 E-.06171
G1 X86.75 Y87.342 E-.09284
G1 X86.944 Y87.251 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.953 J-.757 P1  F42000
G1 X85.863 Y85.891 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X86.013 Y86.097 I-.098 J.229 E.00517
G3 X85.806 Y85.875 I-.221 J-.002 E.02031
; WIPE_START
G1 X85.986 Y85.991 E-.11999
G1 X86.013 Y86.097 E-.06124
G1 X85.986 Y86.203 E-.06124
G1 X85.857 Y86.306 E-.09257
G1 X85.698 Y86.299 E-.08904
G1 X85.613 Y86.229 E-.06174
G1 X85.572 Y86.126 E-.06171
G1 X85.613 Y85.966 E-.09284
G1 X85.806 Y85.875 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.879 J-.841 P1  F42000
G1 X84.526 Y87.212 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X84.676 Y87.419 I-.098 J.229 E.00517
G3 X84.469 Y87.196 I-.221 J-.002 E.02031
; WIPE_START
G1 X84.649 Y87.313 E-.11999
G1 X84.676 Y87.419 E-.06124
G1 X84.649 Y87.525 E-.06124
G1 X84.52 Y87.628 E-.09257
G1 X84.361 Y87.621 E-.08904
G1 X84.276 Y87.55 E-.06174
G1 X84.235 Y87.448 E-.06171
G1 X84.276 Y87.287 E-.09284
G1 X84.469 Y87.196 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.916 J-.801 P1  F42000
G1 X83.328 Y85.891 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X83.478 Y86.097 I-.098 J.229 E.00517
G3 X83.271 Y85.875 I-.221 J-.002 E.02031
; WIPE_START
G1 X83.451 Y85.991 E-.11999
G1 X83.478 Y86.097 E-.06124
G1 X83.451 Y86.203 E-.06124
G1 X83.322 Y86.306 E-.09257
G1 X83.163 Y86.299 E-.08904
G1 X83.078 Y86.229 E-.06174
G1 X83.037 Y86.126 E-.06171
G1 X83.078 Y85.966 E-.09284
G1 X83.271 Y85.875 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.881 J-.84 P1  F42000
G1 X81.994 Y87.215 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X82.144 Y87.421 I-.098 J.229 E.00517
G3 X81.937 Y87.199 I-.221 J-.002 E.02031
; WIPE_START
G1 X82.117 Y87.316 E-.11999
G1 X82.144 Y87.421 E-.06124
G1 X82.117 Y87.527 E-.06124
G1 X81.988 Y87.63 E-.09257
G1 X81.829 Y87.623 E-.08904
G1 X81.744 Y87.553 E-.06174
G1 X81.703 Y87.451 E-.06171
G1 X81.744 Y87.29 E-.09284
G1 X81.937 Y87.199 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.888 J.833 P1  F42000
G1 X83.197 Y88.542 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X83.347 Y88.748 I-.098 J.229 E.00517
G3 X83.14 Y88.526 I-.221 J-.002 E.02031
; WIPE_START
G1 X83.32 Y88.642 E-.11999
G1 X83.347 Y88.748 E-.06124
G1 X83.32 Y88.854 E-.06124
G1 X83.19 Y88.957 E-.09257
G1 X83.031 Y88.95 E-.08904
G1 X82.946 Y88.88 E-.06174
G1 X82.906 Y88.777 E-.06171
G1 X82.946 Y88.616 E-.09284
G1 X83.14 Y88.526 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.923 J.793 P1  F42000
G1 X84.342 Y89.926 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X84.492 Y90.132 I-.098 J.229 E.00517
G3 X84.285 Y89.91 I-.221 J-.002 E.02031
; WIPE_START
G1 X84.465 Y90.026 E-.11999
G1 X84.492 Y90.132 E-.06124
G1 X84.465 Y90.238 E-.06124
G1 X84.336 Y90.341 E-.09257
G1 X84.177 Y90.334 E-.08904
G1 X84.092 Y90.264 E-.06174
G1 X84.051 Y90.161 E-.06171
G1 X84.092 Y90 E-.09284
G1 X84.285 Y89.91 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.884 J-.836 P1  F42000
G1 X83.013 Y91.255 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X83.163 Y91.461 I-.098 J.229 E.00517
G3 X82.956 Y91.239 I-.221 J-.002 E.02031
; WIPE_START
G1 X83.136 Y91.355 E-.11999
G1 X83.163 Y91.461 E-.06124
G1 X83.136 Y91.567 E-.06124
G1 X83.006 Y91.67 E-.09257
G1 X82.847 Y91.663 E-.08904
G1 X82.762 Y91.593 E-.06174
G1 X82.722 Y91.49 E-.06171
G1 X82.762 Y91.33 E-.09284
G1 X82.956 Y91.239 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.952 J-.758 P1  F42000
G1 X81.867 Y89.871 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X82.018 Y90.077 I-.098 J.229 E.00517
G3 X81.81 Y89.855 I-.221 J-.002 E.02031
; WIPE_START
G1 X81.99 Y89.971 E-.11999
G1 X82.018 Y90.077 E-.06124
G1 X81.99 Y90.183 E-.06124
G1 X81.861 Y90.286 E-.09257
G1 X81.702 Y90.279 E-.08904
G1 X81.617 Y90.209 E-.06174
G1 X81.576 Y90.107 E-.06171
G1 X81.617 Y89.946 E-.09284
G1 X81.81 Y89.855 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.916 J-.801 P1  F42000
G1 X80.665 Y88.544 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X80.815 Y88.751 I-.098 J.229 E.00517
G3 X80.608 Y88.528 I-.221 J-.002 E.02031
; WIPE_START
G1 X80.788 Y88.645 E-.11999
G1 X80.815 Y88.751 E-.06124
G1 X80.788 Y88.857 E-.06124
G1 X80.658 Y88.96 E-.09257
G1 X80.499 Y88.953 E-.08904
G1 X80.414 Y88.882 E-.06174
G1 X80.374 Y88.78 E-.06171
G1 X80.414 Y88.619 E-.09284
G1 X80.608 Y88.528 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I1.217 J-.007 P1  F42000
G1 X80.592 Y85.891 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X80.742 Y86.097 I-.098 J.229 E.00517
G3 X80.535 Y85.875 I-.221 J-.002 E.02031
; WIPE_START
G1 X80.715 Y85.991 E-.11999
G1 X80.742 Y86.097 E-.06124
G1 X80.715 Y86.203 E-.06124
G1 X80.586 Y86.306 E-.09257
G1 X80.427 Y86.299 E-.08904
G1 X80.342 Y86.229 E-.06174
G1 X80.301 Y86.126 E-.06171
G1 X80.342 Y85.966 E-.09284
G1 X80.535 Y85.875 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-1.217 J.001 P1  F42000
G1 X80.538 Y91.2 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X80.688 Y91.407 I-.098 J.229 E.00517
G3 X80.481 Y91.184 I-.221 J-.002 E.02031
; WIPE_START
G1 X80.661 Y91.301 E-.11999
G1 X80.688 Y91.407 E-.06124
G1 X80.661 Y91.513 E-.06124
G1 X80.532 Y91.616 E-.09257
G1 X80.373 Y91.609 E-.08904
G1 X80.288 Y91.538 E-.06174
G1 X80.247 Y91.436 E-.06171
G1 X80.288 Y91.275 E-.09284
G1 X80.481 Y91.184 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.923 J.793 P1  F42000
G1 X81.683 Y92.584 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X81.834 Y92.791 I-.098 J.229 E.00517
G3 X81.626 Y92.568 I-.221 J-.002 E.02031
; WIPE_START
G1 X81.806 Y92.685 E-.11999
G1 X81.834 Y92.791 E-.06124
G1 X81.806 Y92.897 E-.06124
G1 X81.677 Y93 E-.09257
G1 X81.518 Y92.992 E-.08904
G1 X81.433 Y92.922 E-.06174
G1 X81.392 Y92.82 E-.06171
G1 X81.433 Y92.659 E-.09284
G1 X81.626 Y92.568 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.728 J.976 P1  F42000
G1 X83.117 Y93.68 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X83.267 Y93.886 I-.098 J.229 E.00517
G3 X83.06 Y93.664 I-.221 J-.002 E.02031
; WIPE_START
G1 X83.24 Y93.78 E-.11999
G1 X83.267 Y93.886 E-.06124
G1 X83.24 Y93.992 E-.06124
G1 X83.111 Y94.095 E-.09257
G1 X82.952 Y94.088 E-.08904
G1 X82.867 Y94.018 E-.06174
G1 X82.826 Y93.915 E-.06171
G1 X82.867 Y93.755 E-.09284
G1 X83.06 Y93.664 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.837 J.883 P1  F42000
G1 X84.446 Y92.35 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X84.597 Y92.557 I-.098 J.229 E.00517
G3 X84.389 Y92.335 I-.221 J-.002 E.02031
; WIPE_START
G1 X84.569 Y92.451 E-.11999
G1 X84.597 Y92.557 E-.06124
G1 X84.569 Y92.663 E-.06124
G1 X84.44 Y92.766 E-.09257
G1 X84.281 Y92.759 E-.08904
G1 X84.196 Y92.689 E-.06174
G1 X84.155 Y92.586 E-.06171
G1 X84.196 Y92.425 E-.09284
G1 X84.389 Y92.335 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.835 J.885 P1  F42000
G1 X85.729 Y93.597 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.879 Y93.804 I-.098 J.229 E.00517
G3 X85.672 Y93.581 I-.221 J-.002 E.02031
; WIPE_START
G1 X85.852 Y93.698 E-.11999
G1 X85.879 Y93.804 E-.06124
G1 X85.852 Y93.91 E-.06124
G1 X85.722 Y94.013 E-.09257
G1 X85.563 Y94.006 E-.08904
G1 X85.478 Y93.935 E-.06174
G1 X85.438 Y93.833 E-.06171
G1 X85.478 Y93.672 E-.09284
G1 X85.672 Y93.581 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.837 J.883 P1  F42000
G1 X87.058 Y92.268 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X87.208 Y92.475 I-.098 J.229 E.00517
G3 X87.001 Y92.252 I-.221 J-.002 E.02031
; WIPE_START
G1 X87.181 Y92.369 E-.11999
G1 X87.208 Y92.475 E-.06124
G1 X87.181 Y92.58 E-.06124
G1 X87.052 Y92.683 E-.09257
G1 X86.893 Y92.676 E-.08904
G1 X86.808 Y92.606 E-.06174
G1 X86.767 Y92.504 E-.06171
G1 X86.808 Y92.343 E-.09284
G1 X87.001 Y92.252 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.862 J-.859 P1  F42000
G1 X85.776 Y91.021 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.926 Y91.228 I-.098 J.229 E.00517
G3 X85.719 Y91.005 I-.221 J-.002 E.02031
; WIPE_START
G1 X85.899 Y91.122 E-.11999
G1 X85.926 Y91.228 E-.06124
G1 X85.899 Y91.334 E-.06124
G1 X85.769 Y91.436 E-.09257
G1 X85.61 Y91.429 E-.08904
G1 X85.525 Y91.359 E-.06174
G1 X85.485 Y91.257 E-.06171
G1 X85.525 Y91.096 E-.09284
G1 X85.719 Y91.005 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.837 J.883 P1  F42000
G1 X87.105 Y89.692 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X87.255 Y89.898 I-.098 J.229 E.00517
G3 X87.048 Y89.676 I-.221 J-.002 E.02031
; WIPE_START
G1 X87.228 Y89.792 E-.11999
G1 X87.255 Y89.898 E-.06124
G1 X87.228 Y90.004 E-.06124
G1 X87.099 Y90.107 E-.09257
G1 X86.94 Y90.1 E-.08904
G1 X86.855 Y90.03 E-.06174
G1 X86.814 Y89.927 E-.06171
G1 X86.855 Y89.767 E-.09284
G1 X87.048 Y89.676 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.751 J-.958 P1  F42000
G1 X85.671 Y88.596 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X85.822 Y88.803 I-.098 J.229 E.00517
G3 X85.614 Y88.58 I-.221 J-.002 E.02031
; WIPE_START
G1 X85.794 Y88.697 E-.11999
G1 X85.822 Y88.803 E-.06124
G1 X85.794 Y88.909 E-.06124
G1 X85.665 Y89.012 E-.09257
G1 X85.506 Y89.004 E-.08904
G1 X85.421 Y88.934 E-.06174
G1 X85.38 Y88.832 E-.06171
G1 X85.421 Y88.671 E-.09284
G1 X85.614 Y88.58 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.094 J1.213 P1  F42000
G1 X88.434 Y88.363 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.585 Y88.569 I-.098 J.229 E.00517
G3 X88.377 Y88.347 I-.221 J-.002 E.02031
; WIPE_START
G1 X88.557 Y88.463 E-.11999
G1 X88.585 Y88.569 E-.06124
G1 X88.557 Y88.675 E-.06124
G1 X88.428 Y88.778 E-.09257
G1 X88.269 Y88.771 E-.08904
G1 X88.184 Y88.701 E-.06174
G1 X88.143 Y88.598 E-.06171
G1 X88.184 Y88.437 E-.09284
G1 X88.377 Y88.347 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.835 J.885 P1  F42000
G1 X89.717 Y89.609 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.867 Y89.816 I-.098 J.229 E.00517
G3 X89.66 Y89.593 I-.221 J-.002 E.02031
; WIPE_START
G1 X89.84 Y89.71 E-.11999
G1 X89.867 Y89.816 E-.06124
G1 X89.84 Y89.922 E-.06124
G1 X89.71 Y90.025 E-.09257
G1 X89.551 Y90.018 E-.08904
G1 X89.466 Y89.947 E-.06174
G1 X89.426 Y89.845 E-.06171
G1 X89.466 Y89.684 E-.09284
G1 X89.66 Y89.593 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.837 J.883 P1  F42000
G1 X90.995 Y90.86 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.146 Y91.067 I-.098 J.229 E.00517
G3 X90.938 Y90.844 I-.221 J-.002 E.02031
; WIPE_START
G1 X91.118 Y90.961 E-.11999
G1 X91.146 Y91.067 E-.06124
G1 X91.118 Y91.173 E-.06124
G1 X90.989 Y91.275 E-.09257
G1 X90.83 Y91.268 E-.08904
G1 X90.745 Y91.198 E-.06175
G1 X90.704 Y91.096 E-.06169
G1 X90.745 Y90.935 E-.09286
G1 X90.938 Y90.844 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.861 J.86 P1  F42000
G1 X92.238 Y92.146 Z.88
G1 Z.48
G1 E.8 F1800
M73 P40 R11
G1 F9000
M204 S6000
G3 X92.388 Y92.353 I-.098 J.229 E.00517
G3 X92.181 Y92.131 I-.221 J-.002 E.02031
; WIPE_START
G1 X92.361 Y92.247 E-.11999
G1 X92.388 Y92.353 E-.06124
G1 X92.361 Y92.459 E-.06124
G1 X92.232 Y92.562 E-.09257
G1 X92.073 Y92.555 E-.08904
G1 X91.988 Y92.485 E-.06175
G1 X91.947 Y92.382 E-.06169
G1 X91.988 Y92.221 E-.09286
G1 X92.181 Y92.131 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-1.04 J.632 P1  F42000
G1 X93.134 Y93.696 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X93.284 Y93.903 I-.098 J.229 E.00517
G3 X93.077 Y93.68 I-.221 J-.002 E.02031
; WIPE_START
G1 X93.257 Y93.797 E-.11999
G1 X93.284 Y93.903 E-.06124
G1 X93.257 Y94.009 E-.06124
G1 X93.127 Y94.112 E-.09257
G1 X92.968 Y94.105 E-.08904
G1 X92.883 Y94.034 E-.06175
G1 X92.843 Y93.932 E-.06169
G1 X92.883 Y93.771 E-.09286
G1 X93.077 Y93.68 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.809 J.909 P1  F42000
G1 X94.491 Y92.423 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.641 Y92.629 I-.098 J.229 E.00517
G3 X94.434 Y92.407 I-.221 J-.002 E.02031
; WIPE_START
G1 X94.614 Y92.523 E-.11999
G1 X94.641 Y92.629 E-.06124
G1 X94.614 Y92.735 E-.06124
G1 X94.485 Y92.838 E-.09257
G1 X94.326 Y92.831 E-.08904
G1 X94.241 Y92.761 E-.06175
G1 X94.2 Y92.658 E-.06169
G1 X94.241 Y92.498 E-.09286
G1 X94.434 Y92.407 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I1.068 J-.583 P1  F42000
G1 X93.568 Y90.817 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X93.718 Y91.024 I-.098 J.229 E.00517
G3 X93.511 Y90.801 I-.221 J-.002 E.02031
; WIPE_START
G1 X93.691 Y90.918 E-.11999
G1 X93.718 Y91.024 E-.06124
G1 X93.691 Y91.13 E-.06124
G1 X93.561 Y91.232 E-.09257
G1 X93.402 Y91.225 E-.08904
G1 X93.317 Y91.155 E-.06175
G1 X93.277 Y91.053 E-.06169
G1 X93.317 Y90.892 E-.09286
G1 X93.511 Y90.801 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.89 J-.831 P1  F42000
G1 X92.325 Y89.531 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X92.475 Y89.737 I-.098 J.229 E.00517
G3 X92.268 Y89.515 I-.221 J-.002 E.02031
; WIPE_START
G1 X92.448 Y89.631 E-.11999
G1 X92.475 Y89.737 E-.06124
G1 X92.448 Y89.843 E-.06124
G1 X92.318 Y89.946 E-.09257
G1 X92.159 Y89.939 E-.08904
G1 X92.074 Y89.869 E-.06175
G1 X92.034 Y89.766 E-.06169
G1 X92.074 Y89.606 E-.09286
G1 X92.268 Y89.515 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.865 J-.856 P1  F42000
G1 X91.046 Y88.28 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.196 Y88.487 I-.098 J.229 E.00517
G3 X90.989 Y88.264 I-.221 J-.002 E.02031
; WIPE_START
G1 X91.169 Y88.381 E-.11999
G1 X91.196 Y88.487 E-.06124
G1 X91.169 Y88.592 E-.06124
G1 X91.04 Y88.695 E-.09257
G1 X90.881 Y88.688 E-.08904
G1 X90.796 Y88.618 E-.06175
G1 X90.755 Y88.516 E-.06169
G1 X90.796 Y88.355 E-.09286
G1 X90.989 Y88.264 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.606 J1.055 P1  F42000
G1 X94.134 Y86.457 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.284 Y86.664 I-.098 J.229 E.00517
G3 X94.077 Y86.441 I-.221 J-.002 E.02031
; WIPE_START
G1 X94.257 Y86.558 E-.11999
G1 X94.284 Y86.664 E-.06124
G1 X94.257 Y86.77 E-.06124
G1 X94.127 Y86.872 E-.09257
G1 X93.968 Y86.865 E-.08904
G1 X93.883 Y86.795 E-.06175
G1 X93.843 Y86.693 E-.06169
G1 X93.883 Y86.532 E-.09286
G1 X94.077 Y86.441 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-1.128 J.457 P1  F42000
G1 X96.268 Y91.846 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.419 Y92.052 I-.098 J.229 E.00517
G3 X96.211 Y91.83 I-.221 J-.002 E.02031
; WIPE_START
G1 X96.391 Y91.946 E-.11999
G1 X96.419 Y92.052 E-.06124
G1 X96.391 Y92.158 E-.06124
G1 X96.262 Y92.261 E-.09257
G1 X96.103 Y92.254 E-.08904
G1 X96.018 Y92.184 E-.06175
G1 X95.977 Y92.081 E-.06169
G1 X96.018 Y91.921 E-.09286
G1 X96.211 Y91.83 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-1.205 J-.173 P1  F42000
G1 X95.944 Y93.696 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.094 Y93.903 I-.098 J.229 E.00517
G3 X95.887 Y93.68 I-.221 J-.002 E.02031
; WIPE_START
G1 X96.067 Y93.797 E-.11999
G1 X96.094 Y93.903 E-.06124
G1 X96.067 Y94.009 E-.06124
G1 X95.938 Y94.112 E-.09257
G1 X95.779 Y94.105 E-.08904
G1 X95.694 Y94.034 E-.06175
G1 X95.653 Y93.932 E-.06169
G1 X95.694 Y93.771 E-.09286
G1 X95.887 Y93.68 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.05 J-1.216 P1  F42000
G1 X90.909 Y93.476 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.059 Y93.682 I-.098 J.229 E.00517
G3 X90.852 Y93.46 I-.221 J-.002 E.02031
; WIPE_START
G1 X91.032 Y93.576 E-.11999
G1 X91.059 Y93.682 E-.06124
G1 X91.032 Y93.788 E-.06124
G1 X90.903 Y93.891 E-.09257
G1 X90.744 Y93.884 E-.08904
G1 X90.659 Y93.814 E-.06175
G1 X90.618 Y93.711 E-.06169
G1 X90.659 Y93.551 E-.09286
G1 X90.852 Y93.46 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.89 J-.83 P1  F42000
G1 X89.666 Y92.189 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.816 Y92.396 I-.098 J.229 E.00517
G3 X89.609 Y92.174 I-.221 J-.002 E.02031
; WIPE_START
G1 X89.789 Y92.29 E-.11999
G1 X89.816 Y92.396 E-.06124
G1 X89.789 Y92.502 E-.06124
G1 X89.66 Y92.605 E-.09257
G1 X89.501 Y92.598 E-.08904
G1 X89.416 Y92.528 E-.06174
G1 X89.375 Y92.425 E-.06171
G1 X89.416 Y92.264 E-.09284
M73 P40 R10
G1 X89.609 Y92.174 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.865 J-.856 P1  F42000
G1 X88.387 Y90.939 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.538 Y91.145 I-.098 J.229 E.00517
G3 X88.331 Y90.923 I-.221 J-.002 E.02031
; WIPE_START
G1 X88.51 Y91.039 E-.11999
G1 X88.538 Y91.145 E-.06124
G1 X88.51 Y91.251 E-.06124
G1 X88.381 Y91.354 E-.09257
G1 X88.222 Y91.347 E-.08904
G1 X88.137 Y91.277 E-.06174
G1 X88.096 Y91.174 E-.06171
G1 X88.137 Y91.014 E-.09284
G1 X88.331 Y90.923 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-1.217 J.003 P1  F42000
G1 X88.337 Y93.519 Z.88
G1 Z.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X88.487 Y93.725 I-.098 J.229 E.00517
G3 X88.28 Y93.503 I-.221 J-.002 E.02031
; WIPE_START
G1 X88.46 Y93.619 E-.11999
G1 X88.487 Y93.725 E-.06124
G1 X88.46 Y93.831 E-.06124
G1 X88.33 Y93.934 E-.09257
G1 X88.171 Y93.927 E-.08904
G1 X88.086 Y93.857 E-.06174
G1 X88.046 Y93.754 E-.06171
G1 X88.086 Y93.594 E-.09284
G1 X88.28 Y93.503 E-.11963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.554 J1.083 P1  F42000
G1 X98.977 Y98.977 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
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
G1 X98.5 Y98.764 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/82
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z.88 I-1.151 J-.396 P1  F42000
G1 X94.772 Y94.08 Z.88
G1 Z.6
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4060
M204 S6000
G1 X96.198 Y92.655 E.03887
G1 X96.198 Y91.39 E.02438
G1 X93.685 Y93.903 E.06851
G1 X92.42 Y93.903 E.02438
G1 X96.198 Y90.125 E.10298
G1 X96.198 Y88.861 E.02438
G1 X91.156 Y93.903 E.13745
G1 X89.891 Y93.903 E.02438
G1 X96.198 Y87.596 E.17193
G1 X96.198 Y86.331 E.02438
G1 X88.626 Y93.903 E.2064
G1 X87.362 Y93.903 E.02438
G1 X95.168 Y86.097 E.21279
G1 X93.903 Y86.097 E.02438
G1 X86.097 Y93.903 E.21279
G1 X84.832 Y93.903 E.02438
G1 X92.638 Y86.097 E.21279
G1 X91.374 Y86.097 E.02438
G1 X83.568 Y93.903 E.21279
G1 X82.303 Y93.903 E.02438
G1 X90.109 Y86.097 E.21279
G1 X88.844 Y86.097 E.02438
G1 X81.038 Y93.903 E.21279
G1 X80.197 Y93.903 E.01622
G1 X80.197 Y93.48 E.00816
G1 X87.58 Y86.097 E.20125
G1 X86.315 Y86.097 E.02438
G1 X80.197 Y92.215 E.16678
G1 X80.197 Y90.95 E.02438
G1 X85.05 Y86.097 E.1323
G1 X83.786 Y86.097 E.02438
G1 X80.197 Y89.686 E.09783
G1 X80.197 Y88.421 E.02438
G1 X82.521 Y86.097 E.06336
G1 X81.257 Y86.097 E.02438
G1 X80.02 Y87.334 E.03372
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z1 I-.637 J1.037 P1  F42000
G1 X98.977 Y98.977 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4060
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F4060
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
; WIPE_END
M73 P41 R10
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




G1 X98.5 Y98.764 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4060
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 0.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/82
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1 I-1.09 J-.54 P1  F42000
G1 X96.375 Y87.523 Z1
G1 Z.72
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4044
M204 S6000
G1 X94.95 Y86.097 E.03887
G1 X93.685 Y86.097 E.02438
G1 X96.198 Y88.61 E.06851
G1 X96.198 Y89.875 E.02438
G1 X92.42 Y86.097 E.10298
G1 X91.156 Y86.097 E.02438
G1 X96.198 Y91.139 E.13745
G1 X96.198 Y92.404 E.02438
G1 X89.891 Y86.097 E.17193
G1 X88.626 Y86.097 E.02438
G1 X96.198 Y93.669 E.2064
G1 X96.198 Y93.903 E.00452
G1 X95.168 Y93.903 E.01986
G1 X87.362 Y86.097 E.21279
G1 X86.097 Y86.097 E.02438
G1 X93.903 Y93.903 E.21279
G1 X92.638 Y93.903 E.02438
G1 X84.832 Y86.097 E.21279
G1 X83.568 Y86.097 E.02438
G1 X91.374 Y93.903 E.21279
G1 X90.109 Y93.903 E.02438
G1 X82.303 Y86.097 E.21279
G1 X81.038 Y86.097 E.02438
G1 X88.844 Y93.903 E.21279
G1 X87.58 Y93.903 E.02438
G1 X80.197 Y86.52 E.20125
G1 X80.197 Y87.785 E.02438
G1 X86.315 Y93.903 E.16678
G1 X85.05 Y93.903 E.02438
G1 X80.197 Y89.05 E.1323
G1 X80.197 Y90.314 E.02438
G1 X83.786 Y93.903 E.09783
G1 X82.521 Y93.903 E.02438
G1 X80.197 Y91.579 E.06336
G1 X80.197 Y92.843 E.02438
G1 X81.434 Y94.08 E.03372
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z1.12 I-.327 J1.172 P1  F42000
G1 X98.977 Y98.977 Z1.12
G1 Z.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4044
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F4044
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4044
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/82
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.12 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z1.12
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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
M73 P42 R10
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




G1 X98.5 Y98.764 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 0.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/82
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.24 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z1.24
G1 Z.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 1.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/82
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S255
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.36 I-1.217 J.007 P1  F42000
G1 X98.552 Y92.652 Z1.36
G1 Z1.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X97.583 Y92.652 E.02012
G1 X97.183 Y92.652 E.0083
G1 F1800
G1 X96.8 Y92.652 E.00793
M106 S191.25
M106 S255
; FEATURE: Overhang wall
G1 F600
M204 S1000
G1 X81.448 Y92.652 E.31844
G1 X81.448 Y87.348 E.11003
G1 X96.8 Y87.348 E.31844
M106 S191.25
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X97.183 Y87.348 E.00793
M106 S191.25
M106 S255
G1 F4800
G1 X97.583 Y87.348 E.0083
G1 X98.552 Y87.348 E.02012
M73 P43 R10
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X97.583 Y92.652 E-.36922
G1 X97.183 Y92.652 E-.152
G1 X96.8 Y92.652 E-.14535
G1 X96.554 Y92.652 E-.09343
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y98.977 Z1.48 F42000
G1 Z1.08
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y93.077 E.12238
G1 X97.583 Y93.077 E.00915
G1 X97.183 Y93.077 E.0083
G1 F1800
G1 X96.8 Y93.077 E.00793
M106 S191.25
M106 S255
; FEATURE: Overhang wall
G1 F600
M204 S1000
G1 X81.023 Y93.077 E.32724
G1 X81.023 Y86.923 E.12763
G1 X96.8 Y86.923 E.32724
M106 S191.25
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X97.183 Y86.923 E.00793
M106 S191.25
M106 S255
G1 F4800
G1 X97.583 Y86.923 E.0083
G1 X98.023 Y86.923 E.00915
G1 X98.023 Y81.023 E.12238
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y93.501 E.12238
G1 X97.183 Y93.501 E.00864
G1 F1800
G1 X96.8 Y93.501 E.00793
M106 S191.25
M106 S255
; FEATURE: Overhang wall
G1 F600
M204 S1000
G1 X80.599 Y93.501 E.33604
G1 X80.599 Y86.499 E.14523
G1 X96.8 Y86.499 E.33604
M106 S191.25
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X97.183 Y86.499 E.00793
M106 S191.25
M106 S255
G1 F4800
G1 X97.599 Y86.499 E.00864
G1 X97.599 Y80.599 E.12238
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y93.9 E.10796
G1 X97.16 Y93.9 E.00073
G1 F1920
G1 X96.8 Y93.9 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
G1 X80.2 Y93.9 E.34433
G1 X80.2 Y86.1 E.16179
G1 X96.8 Y86.1 E.34433
M106 S191.25
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X97.16 Y86.1 E.00659
G1 F2400
G1 X97.2 Y86.1 E.00073
G1 X97.2 Y80.2 E.10796
M73 P44 R10
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z1.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.15254
; WIPE_START
G1 X98.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y87.232 Z1.48 F42000
G1 X98.5 Y87.136 Z1.48
G1 Z1.08
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X98.5 Y81.236 E.15254
; WIPE_START
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.122 Y85.19 Z1.48 F42000
G1 X81.618 Y87.707 Z1.48
G1 Z1.08
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.442672
G1 F3000
M204 S6000
G1 X98.204 Y87.707 E.3381
G1 X98.204 Y88.124 E.0085
G1 X81.796 Y88.124 E.33448
G1 X81.796 Y88.541 E.0085
G1 X98.204 Y88.541 E.33448
G1 X98.204 Y88.958 E.0085
G1 X81.796 Y88.958 E.33448
G1 X81.796 Y89.375 E.0085
G1 X98.204 Y89.375 E.33448
G1 X98.204 Y89.792 E.0085
G1 X81.796 Y89.792 E.33448
G1 X81.796 Y90.208 E.0085
G1 X98.204 Y90.208 E.33448
G1 X98.204 Y90.625 E.0085
G1 X81.796 Y90.625 E.33448
G1 X81.796 Y91.042 E.0085
G1 X98.204 Y91.042 E.33448
G1 X98.204 Y91.459 E.0085
G1 X81.796 Y91.459 E.33448
G1 X81.796 Y91.876 E.0085
M73 P45 R10
G1 X98.204 Y91.876 E.33448
G1 X98.204 Y92.293 E.0085
G1 X81.618 Y92.293 E.3381
M106 S191.25
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3000
G1 X83.618 Y92.293 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/82
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S201.45
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.48 I-.029 J1.217 P1  F42000
G1 X98.552 Y92.652 Z1.48
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.35479
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X96.552 Y92.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y98.977 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y93.077 E.12238
G1 X81.023 Y93.077 E.35262
G1 X81.023 Y86.923 E.12763
G1 X98.023 Y86.923 E.35262
G1 X98.023 Y81.023 E.12238
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y93.501 E.12238
G1 X80.599 Y93.501 E.35262
G1 X80.599 Y86.499 E.14523
G1 X97.599 Y86.499 E.35262
G1 X97.599 Y80.599 E.12238
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y93.9 E.10796
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y80.2 E.10796
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.15254
; WIPE_START
G1 X98.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.094 J-.532 P1  F42000
G1 X96.134 Y90 Z1.6
G1 Z1.2
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
M73 P45 R9
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
M73 P46 R9
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
G1 X98.5 Y87.136 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y81.236 E.15254
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/82
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.6 I-1.217 J.007 P1  F42000
G1 X98.552 Y92.652 Z1.6
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.35479
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X96.552 Y92.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y98.977 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y93.077 E.12238
G1 X81.023 Y93.077 E.35262
G1 X81.023 Y86.923 E.12763
G1 X98.023 Y86.923 E.35262
G1 X98.023 Y81.023 E.12238
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y93.501 E.12238
G1 X80.599 Y93.501 E.35262
G1 X80.599 Y86.499 E.14523
G1 X97.599 Y86.499 E.35262
G1 X97.599 Y80.599 E.12238
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y93.9 E.10796
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y80.2 E.10796
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.15254
; WIPE_START
G1 X98.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.72 I1.094 J-.532 P1  F42000
G1 X96.134 Y90 Z1.72
G1 Z1.32
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
G1 X98.5 Y87.136 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y81.236 E.15254
; CHANGE_LAYER
; Z_HEIGHT: 1.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/82
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.72 I-1.217 J.007 P1  F42000
G1 X98.552 Y92.652 Z1.72
G1 Z1.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.35479
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X96.552 Y92.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y98.977 Z1.84 F42000
G1 Z1.44
G1 E.8 F1800
M73 P47 R9
G1 F4800
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y93.077 E.12238
G1 X81.023 Y93.077 E.35262
G1 X81.023 Y86.923 E.12763
G1 X98.023 Y86.923 E.35262
G1 X98.023 Y81.023 E.12238
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y93.501 E.12238
G1 X80.599 Y93.501 E.35262
G1 X80.599 Y86.499 E.14523
G1 X97.599 Y86.499 E.35262
G1 X97.599 Y80.599 E.12238
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y93.9 E.10796
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y80.2 E.10796
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z1.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.15254
; WIPE_START
G1 X98.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.84 I1.094 J-.532 P1  F42000
G1 X96.134 Y90 Z1.84
G1 Z1.44
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
G1 X98.5 Y87.136 Z1.84 F42000
G1 Z1.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y81.236 E.15254
; CHANGE_LAYER
; Z_HEIGHT: 1.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/82
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.84 I-1.217 J.007 P1  F42000
G1 X98.552 Y92.652 Z1.84
G1 Z1.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.35479
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X96.552 Y92.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y98.977 Z1.96 F42000
G1 Z1.56
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y93.077 E.12238
G1 X81.023 Y93.077 E.35262
G1 X81.023 Y86.923 E.12763
G1 X98.023 Y86.923 E.35262
G1 X98.023 Y81.023 E.12238
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y93.501 E.12238
G1 X80.599 Y93.501 E.35262
G1 X80.599 Y86.499 E.14523
G1 X97.599 Y86.499 E.35262
G1 X97.599 Y80.599 E.12238
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y93.9 E.10796
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y80.2 E.10796
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z1.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.15254
; WIPE_START
G1 X98.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.134 Y90 Z1.96 F42000
G1 Z1.56
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
M73 P48 R9
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
G1 X98.5 Y87.136 Z1.96 F42000
G1 Z1.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y81.236 E.15254
; CHANGE_LAYER
; Z_HEIGHT: 1.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/82
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.96 I-1.217 J.007 P1  F42000
G1 X98.552 Y92.652 Z1.96
G1 Z1.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.35479
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X96.552 Y92.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y98.977 Z2.08 F42000
G1 Z1.68
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y93.077 E.12238
G1 X81.023 Y93.077 E.35262
G1 X81.023 Y86.923 E.12763
G1 X98.023 Y86.923 E.35262
G1 X98.023 Y81.023 E.12238
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y93.501 E.12238
G1 X80.599 Y93.501 E.35262
G1 X80.599 Y86.499 E.14523
G1 X97.599 Y86.499 E.35262
G1 X97.599 Y80.599 E.12238
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y93.9 E.10796
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y80.2 E.10796
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z1.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.15254
; WIPE_START
G1 X98.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.134 Y90 Z2.08 F42000
G1 Z1.68
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
M73 P49 R9
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
G1 X98.5 Y87.136 Z2.08 F42000
G1 Z1.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y81.236 E.15254
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/82
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.08 I-1.217 J.007 P1  F42000
G1 X98.552 Y92.652 Z2.08
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.35479
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X96.552 Y92.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y98.977 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y93.077 E.12238
G1 X81.023 Y93.077 E.35262
G1 X81.023 Y86.923 E.12763
G1 X98.023 Y86.923 E.35262
G1 X98.023 Y81.023 E.12238
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y93.501 E.12238
G1 X80.599 Y93.501 E.35262
G1 X80.599 Y86.499 E.14523
G1 X97.599 Y86.499 E.35262
G1 X97.599 Y80.599 E.12238
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y93.9 E.10796
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y80.2 E.10796
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.15254
; WIPE_START
G1 X98.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.134 Y90 Z2.2 F42000
G1 Z1.8
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
M73 P50 R9
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y87.136 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y81.236 E.15254
; CHANGE_LAYER
; Z_HEIGHT: 1.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/82
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.2 I-1.217 J.007 P1  F42000
G1 X98.552 Y92.652 Z2.2
G1 Z1.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.35479
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X96.552 Y92.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y98.977 Z2.32 F42000
G1 Z1.92
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y93.077 E.12238
G1 X81.023 Y93.077 E.35262
G1 X81.023 Y86.923 E.12763
G1 X98.023 Y86.923 E.35262
G1 X98.023 Y81.023 E.12238
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y93.501 E.12238
G1 X80.599 Y93.501 E.35262
G1 X80.599 Y86.499 E.14523
G1 X97.599 Y86.499 E.35262
G1 X97.599 Y80.599 E.12238
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y93.9 E.10796
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y80.2 E.10796
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z1.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.15254
; WIPE_START
G1 X98.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.134 Y90 Z2.32 F42000
G1 Z1.92
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
G1 X98.5 Y87.136 Z2.32 F42000
G1 Z1.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y81.236 E.15254
; CHANGE_LAYER
; Z_HEIGHT: 2.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/82
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.32 I-1.217 J.007 P1  F42000
G1 X98.552 Y92.652 Z2.32
G1 Z2.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.35479
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X96.552 Y92.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y98.977 Z2.44 F42000
G1 Z2.04
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y93.077 E.12238
G1 X81.023 Y93.077 E.35262
G1 X81.023 Y86.923 E.12763
G1 X98.023 Y86.923 E.35262
G1 X98.023 Y81.023 E.12238
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y93.501 E.12238
G1 X80.599 Y93.501 E.35262
G1 X80.599 Y86.499 E.14523
G1 X97.599 Y86.499 E.35262
G1 X97.599 Y80.599 E.12238
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
M73 P51 R9
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y93.9 E.10796
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y80.2 E.10796
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z2.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.15254
; WIPE_START
G1 X98.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.134 Y90 Z2.44 F42000
G1 Z2.04
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494712
G1 F15000
M204 S6000
G1 X96.134 Y89.766 E.00538
G1 X83.866 Y89.766 E.28131
G1 X83.866 Y90.234 E.01075
G1 X96.134 Y90.234 E.28131
M73 P51 R8
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
G1 X98.5 Y87.136 Z2.44 F42000
G1 Z2.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y81.236 E.15254
; CHANGE_LAYER
; Z_HEIGHT: 2.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/82
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.44 I-1.217 J.007 P1  F42000
G1 X98.552 Y92.652 Z2.44
G1 Z2.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.35479
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X96.552 Y92.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y94.373 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.023 Y94.373 E.01977
G1 X98.023 Y93.077 E.02688
G1 X81.023 Y93.077 E.35262
G1 X81.023 Y86.923 E.12763
G1 X98.023 Y86.923 E.35262
G1 X98.023 Y85.627 E.02688
G1 X98.977 Y85.627 E.01977
G1 X98.977 Y94.313 E.18015
M204 S10000
G1 X99.401 Y94.797 F42000
G1 F4800
M204 S6000
G1 X97.599 Y94.797 E.03737
G1 X97.599 Y93.501 E.02688
G1 X80.599 Y93.501 E.35262
G1 X80.599 Y86.499 E.14523
G1 X97.599 Y86.499 E.35262
G1 X97.599 Y85.203 E.02688
G1 X99.401 Y85.203 E.03737
G1 X99.401 Y94.737 E.19775
; WIPE_START
G1 X97.599 Y94.797 E-.68496
G1 X97.599 Y94.599 E-.07505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.8 Y99.8 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y93.9 E.10796
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y80.2 E.10796
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X97.4 Y99.302 F42000
G1 Z2.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.622622
G1 F15000
M204 S6000
G1 X99.6 Y99.302 E.06422
; WIPE_START
G1 X97.6 Y99.302 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.886 Y94.966 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.406022
G1 F2100
M204 S800
G1 X99.487 Y95.567 E.0158
G1 X99.487 Y96.105 E.01
G1 X98.517 Y95.135 E.02551
G1 X97.979 Y95.135 E.01
G1 X99.487 Y96.643 E.03965
G1 X99.487 Y97.181 E.01
G1 X97.513 Y95.206 E.05192
G1 X97.513 Y95.744 E.01
G1 X99.487 Y97.718 E.05192
G1 X99.487 Y98.256 E.01
G1 X97.513 Y96.282 E.05192
G1 X97.513 Y96.819 E.01
G1 X99.487 Y98.794 E.05192
G1 X99.487 Y98.865 E.00133
M73 P52 R8
G1 X99.021 Y98.865 E.00867
G1 X97.513 Y97.357 E.03965
G1 X97.513 Y97.895 E.01
G1 X98.483 Y98.865 E.02551
G1 X97.945 Y98.865 E.01
G1 X97.344 Y98.264 E.0158
; WIPE_START
M204 S6000
G1 X97.945 Y98.865 E-.32292
G1 X98.483 Y98.865 E-.20436
G1 X98.05 Y98.432 E-.23272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.161 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.03351
; WIPE_START
G1 X98.5 Y94.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.134 Y90 Z2.56 F42000
G1 Z2.16
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
G1 X98.5 Y87.136 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y85.839 E.03351
; WIPE_START
G1 X98.5 Y87.136 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.656 Y81.736 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.406022
G1 F2100
M204 S800
G1 X99.055 Y81.135 E.0158
G1 X98.517 Y81.135 E.01
G1 X99.487 Y82.105 E.02551
G1 X99.487 Y82.643 E.01
G1 X97.979 Y81.135 E.03965
G1 X97.513 Y81.135 E.00867
G1 X97.513 Y81.206 E.00133
G1 X99.487 Y83.181 E.05192
G1 X99.487 Y83.718 E.01
G1 X97.513 Y81.744 E.05192
G1 X97.513 Y82.282 E.01
G1 X99.487 Y84.256 E.05192
G1 X99.487 Y84.794 E.01
G1 X97.513 Y82.819 E.05192
G1 X97.513 Y83.357 E.01
G1 X99.021 Y84.865 E.03965
G1 X98.483 Y84.865 E.01
G1 X97.513 Y83.895 E.02551
G1 X97.513 Y84.433 E.01
G1 X98.114 Y85.034 E.0158
; WIPE_START
M204 S6000
G1 X97.513 Y84.433 E-.32292
G1 X97.513 Y83.895 E-.20436
G1 X97.946 Y84.328 E-.23273
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.4 Y80.698 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.622622
G1 F15000
M204 S6000
G1 X99.6 Y80.698 E.06422
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X97.6 Y80.698 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/82
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.56 I-.52 J1.1 P1  F42000
G1 X98.977 Y81.349 Z2.56
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X98.023 Y81.349 E.01977
G1 X98.023 Y81.023 E.00676
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y81.289 E.00551
M204 S10000
G1 X99.401 Y81.773 F42000
G1 F4800
M204 S6000
G1 X97.599 Y81.773 E.03737
G1 X97.599 Y80.599 E.02435
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y81.713 E.02311
M204 S250
G1 X99.8 Y82.173 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y82.173 E.04757
G1 X97.2 Y80.2 E.03609
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y82.113 E.035
; WIPE_START
M204 S6000
G1 X97.801 Y82.159 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.346 Y89.772 Z2.68 F42000
G1 X98.552 Y92.652 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.35479
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X96.552 Y92.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y95.349 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.023 Y95.349 E.01977
G1 X98.023 Y93.077 E.04714
G1 X81.023 Y93.077 E.35262
G1 X81.023 Y86.923 E.12763
G1 X98.023 Y86.923 E.35262
G1 X98.023 Y84.651 E.04714
G1 X98.977 Y84.651 E.01977
G1 X98.977 Y95.289 E.22066
M204 S10000
G1 X99.401 Y95.773 F42000
G1 F4800
M204 S6000
G1 X97.599 Y95.773 E.03737
G1 X97.599 Y93.501 E.04714
G1 X80.599 Y93.501 E.35262
G1 X80.599 Y86.499 E.14523
G1 X97.599 Y86.499 E.35262
G1 X97.599 Y84.227 E.04714
G1 X99.401 Y84.227 E.03737
G1 X99.401 Y95.713 E.23826
M204 S250
G1 X99.8 Y96.173 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y96.173 E.04757
G1 X97.2 Y93.9 E.04158
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y83.827 E.04158
G1 X99.8 Y83.827 E.04757
G1 X99.8 Y96.113 E.22479
; WIPE_START
M204 S6000
G1 X97.801 Y96.159 E-.76
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




G1 X98.5 Y95.137 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.05875
; WIPE_START
G1 X98.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.134 Y90 Z2.68 F42000
G1 Z2.28
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
M73 P53 R8
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
G1 X98.5 Y87.136 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y84.863 E.05875
; WIPE_START
G1 X98.5 Y86.863 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.8 Y94.49 Z2.68 F42000
G1 X98.977 Y98.977 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y98.651 E.00676
G1 X98.977 Y98.651 E.01977
G1 X98.977 Y98.917 E.00551
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y98.227 E.02435
G1 X99.401 Y98.227 E.03737
G1 X99.401 Y99.341 E.02311
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y97.827 E.03609
G1 X99.8 Y97.827 E.04757
G1 X99.8 Y99.74 E.035
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/82
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.68 I1.212 J.106 P1  F42000
G1 X99.401 Y81.53 Z2.68
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X97.599 Y81.53 E.03737
G1 X97.599 Y80.599 E.0193
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y81.47 E.01806
M204 S250
G1 X99.8 Y81.929 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.929 E.04757
G1 X97.2 Y80.2 E.03164
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.869 E.03054
; WIPE_START
M204 S6000
G1 X97.801 Y81.915 E-.76
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




G1 X97.811 Y81.065 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.532202
G1 F15000
M204 S6000
G1 X99.189 Y81.065 E.0341
; WIPE_START
G1 X97.811 Y81.065 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.298 Y88.681 Z2.8 F42000
G1 X98.552 Y92.652 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.35479
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X96.552 Y92.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y95.106 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.023 Y95.106 E.01977
G1 X98.023 Y93.077 E.04209
G1 X81.023 Y93.077 E.35262
G1 X81.023 Y86.923 E.12763
G1 X98.023 Y86.923 E.35262
G1 X98.023 Y84.894 E.04209
G1 X98.977 Y84.894 E.01977
G1 X98.977 Y95.046 E.21056
M204 S10000
G1 X99.401 Y95.53 F42000
G1 F4800
M204 S6000
G1 X97.599 Y95.53 E.03737
G1 X97.599 Y93.501 E.04209
G1 X80.599 Y93.501 E.35262
G1 X80.599 Y86.499 E.14523
G1 X97.599 Y86.499 E.35262
G1 X97.599 Y84.47 E.04209
G1 X99.401 Y84.47 E.03737
G1 X99.401 Y95.47 E.22816
M204 S250
G1 X99.8 Y95.929 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.929 E.04757
G1 X97.2 Y93.9 E.03713
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y84.071 E.03713
G1 X99.8 Y84.071 E.04757
G1 X99.8 Y95.869 E.21588
; WIPE_START
M204 S6000
G1 X97.801 Y95.915 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.894 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.05246
; WIPE_START
G1 X98.5 Y94.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.134 Y90 Z2.8 F42000
G1 Z2.4
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
M73 P54 R8
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
G1 X98.5 Y87.136 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y85.106 E.05246
; WIPE_START
G1 X98.5 Y87.106 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.058 Y94.718 Z2.8 F42000
G1 X99.401 Y99.401 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y98.47 E.0193
G1 X99.401 Y98.47 E.03737
G1 X99.401 Y99.341 E.01806
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.071 E.03164
G1 X99.8 Y98.071 E.04757
G1 X99.8 Y99.74 E.03054
; WIPE_START
M204 S6000
G1 X97.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.189 Y98.935 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.532202
G1 F15000
M204 S6000
G1 X97.811 Y98.935 E.0341
; CHANGE_LAYER
; Z_HEIGHT: 2.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.189 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/82
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.8 I1.217 J.015 P1  F42000
G1 X99.401 Y81.355 Z2.8
G1 Z2.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X97.599 Y81.355 E.03737
G1 X97.599 Y80.599 E.01567
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y81.295 E.01443
M204 S250
G1 X99.8 Y81.754 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.754 E.04757
G1 X97.2 Y80.2 E.02843
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.694 E.02734
; WIPE_START
M204 S6000
G1 X97.801 Y81.74 E-.76
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




G1 X97.811 Y80.977 F42000
G1 Z2.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.357022
G1 F15000
M204 S6000
G1 X99.189 Y80.977 E.02231
; WIPE_START
G1 X97.811 Y80.977 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.295 Y88.594 Z2.92 F42000
G1 X98.552 Y92.652 Z2.92
G1 Z2.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.35479
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X96.552 Y92.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y94.931 Z2.92 F42000
G1 Z2.52
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.023 Y94.931 E.01977
G1 X98.023 Y93.077 E.03846
G1 X81.023 Y93.077 E.35262
G1 X81.023 Y86.923 E.12763
G1 X98.023 Y86.923 E.35262
G1 X98.023 Y85.069 E.03846
G1 X98.977 Y85.069 E.01977
G1 X98.977 Y94.871 E.2033
M204 S10000
G1 X99.401 Y95.355 F42000
G1 F4800
M204 S6000
G1 X97.599 Y95.355 E.03737
G1 X97.599 Y93.501 E.03846
G1 X80.599 Y93.501 E.35262
G1 X80.599 Y86.499 E.14523
G1 X97.599 Y86.499 E.35262
G1 X97.599 Y84.645 E.03846
G1 X99.401 Y84.645 E.03737
G1 X99.401 Y95.295 E.2209
M204 S250
G1 X99.8 Y95.754 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.754 E.04757
G1 X97.2 Y93.9 E.03392
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y84.246 E.03392
G1 X99.8 Y84.246 E.04757
G1 X99.8 Y95.694 E.20947
; WIPE_START
M204 S6000
G1 X97.801 Y95.74 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.718 Z2.92 F42000
G1 Z2.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.04793
; WIPE_START
G1 X98.5 Y94.718 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.134 Y90 Z2.92 F42000
G1 Z2.52
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
G1 X98.5 Y87.136 Z2.92 F42000
M73 P55 R8
G1 Z2.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y85.282 E.04793
; WIPE_START
G1 X98.5 Y87.136 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.059 Y94.747 Z2.92 F42000
G1 X99.401 Y99.401 Z2.92
G1 Z2.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y98.645 E.01567
G1 X99.401 Y98.645 E.03737
G1 X99.401 Y99.341 E.01443
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.246 E.02843
G1 X99.8 Y98.246 E.04757
G1 X99.8 Y99.74 E.02734
M204 S10000
G1 X99.189 Y99.023 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.357022
G1 F15000
M204 S6000
G1 X97.811 Y99.023 E.02231
; CHANGE_LAYER
; Z_HEIGHT: 2.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.189 Y99.023 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/82
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.92 I1.217 J.014 P1  F42000
G1 X99.401 Y81.217 Z2.92
G1 Z2.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X97.599 Y81.217 E.03737
G1 X97.599 Y80.599 E.01281
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y81.157 E.01157
M204 S250
G1 X99.8 Y81.616 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.616 E.04757
G1 X97.2 Y80.2 E.02591
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.556 E.02482
; WIPE_START
M204 S6000
G1 X97.801 Y81.602 E-.76
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




G1 X97.811 Y80.908 F42000
G1 Z2.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.219232
G1 F15000
M204 S6000
G1 X99.189 Y80.908 E.01303
; WIPE_START
G1 X97.811 Y80.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.292 Y88.525 Z3.04 F42000
G1 X98.552 Y92.652 Z3.04
G1 Z2.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.35479
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X96.552 Y92.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y94.793 Z3.04 F42000
G1 Z2.64
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.023 Y94.793 E.01977
G1 X98.023 Y93.077 E.0356
G1 X81.023 Y93.077 E.35262
G1 X81.023 Y86.923 E.12763
G1 X98.023 Y86.923 E.35262
G1 X98.023 Y85.207 E.0356
G1 X98.977 Y85.207 E.01977
G1 X98.977 Y94.733 E.19758
M204 S10000
G1 X99.401 Y95.217 F42000
G1 F4800
M204 S6000
G1 X97.599 Y95.217 E.03737
G1 X97.599 Y93.501 E.0356
G1 X80.599 Y93.501 E.35262
G1 X80.599 Y86.499 E.14523
G1 X97.599 Y86.499 E.35262
G1 X97.599 Y84.783 E.0356
G1 X99.401 Y84.783 E.03737
G1 X99.401 Y95.157 E.21518
M204 S250
G1 X99.8 Y95.616 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.616 E.04757
G1 X97.2 Y93.9 E.0314
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y84.384 E.0314
G1 X99.8 Y84.384 E.04757
G1 X99.8 Y95.556 E.20443
; WIPE_START
M204 S6000
G1 X97.801 Y95.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.581 Z3.04 F42000
G1 Z2.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.04437
; WIPE_START
G1 X98.5 Y94.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.134 Y90 Z3.04 F42000
G1 Z2.64
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
G1 X98.5 Y87.136 Z3.04 F42000
G1 Z2.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y85.419 E.04437
; WIPE_START
G1 X98.5 Y87.136 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.059 Y94.747 Z3.04 F42000
G1 X99.401 Y99.401 Z3.04
G1 Z2.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y98.783 E.01281
G1 X99.401 Y98.783 E.03737
M73 P56 R8
G1 X99.401 Y99.341 E.01157
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.384 E.02591
G1 X99.8 Y98.384 E.04757
G1 X99.8 Y99.74 E.02482
M204 S10000
G1 X99.189 Y99.092 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.219232
G1 F15000
M204 S6000
G1 X97.811 Y99.092 E.01303
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.189 Y99.092 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/82
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.04 I1.217 J.014 P1  F42000
G1 X99.401 Y81.105 Z3.04
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X97.599 Y81.105 E.03737
G1 X97.599 Y80.599 E.01048
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y81.045 E.00924
M204 S250
G1 X99.8 Y81.504 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.504 E.04757
G1 X97.2 Y80.2 E.02386
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.444 E.02276
; WIPE_START
M204 S6000
G1 X97.801 Y81.49 E-.76
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




G1 X97.811 Y80.852 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106992
G1 F15000
M204 S6000
G1 X99.189 Y80.852 E.00547
; WIPE_START
G1 X97.811 Y80.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.29 Y88.469 Z3.16 F42000
G1 X98.552 Y92.652 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X81.448 Y92.652 E.35479
G1 X81.448 Y87.348 E.11003
G1 X98.552 Y87.348 E.35479
G1 X98.552 Y92.592 E.10879
; WIPE_START
G1 X96.552 Y92.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.977 Y94.68 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X98.023 Y94.68 E.01977
G1 X98.023 Y93.077 E.03327
G1 X81.023 Y93.077 E.35262
G1 X81.023 Y86.923 E.12763
G1 X98.023 Y86.923 E.35262
G1 X98.023 Y85.32 E.03327
G1 X98.977 Y85.32 E.01977
G1 X98.977 Y94.62 E.19293
M204 S10000
G1 X99.401 Y95.105 F42000
G1 F4800
M204 S6000
G1 X97.599 Y95.105 E.03737
G1 X97.599 Y93.501 E.03327
G1 X80.599 Y93.501 E.35262
G1 X80.599 Y86.499 E.14523
G1 X97.599 Y86.499 E.35262
G1 X97.599 Y84.895 E.03327
G1 X99.401 Y84.895 E.03737
G1 X99.401 Y95.045 E.21052
M204 S250
G1 X99.8 Y95.504 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.504 E.04757
G1 X97.2 Y93.9 E.02935
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y84.496 E.02935
G1 X99.8 Y84.496 E.04757
G1 X99.8 Y95.444 E.20032
; WIPE_START
M204 S6000
G1 X97.801 Y95.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.468 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y92.865 E.04147
; WIPE_START
G1 X98.5 Y94.468 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.134 Y90 Z3.16 F42000
G1 Z2.76
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
M73 P56 R7
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
G1 X98.5 Y87.136 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y85.532 E.04147
; WIPE_START
G1 X98.5 Y87.136 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.059 Y94.747 Z3.16 F42000
G1 X99.401 Y99.401 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y98.895 E.01048
G1 X99.401 Y98.895 E.03737
G1 X99.401 Y99.341 E.00924
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.496 E.02386
G1 X99.8 Y98.496 E.04757
G1 X99.8 Y99.74 E.02276
M204 S10000
G1 X99.189 Y99.148 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.106992
G1 F15000
M204 S6000
G1 X97.811 Y99.148 E.00547
; CHANGE_LAYER
; Z_HEIGHT: 2.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.189 Y99.148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/82
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
M106 S196.35
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.16 I1.217 J.014 P1  F42000
G1 X99.401 Y81.012 Z3.16
G1 Z2.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X97.599 Y81.012 E.03737
G1 X97.599 Y80.599 E.00856
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y80.952 E.00731
M204 S250
G1 X99.8 Y81.411 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.411 E.04757
G1 X97.2 Y80.2 E.02216
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.351 E.02106
; WIPE_START
M204 S6000
G1 X97.801 Y81.397 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.691 Y88.977 Z3.28 F42000
G1 X99.401 Y95.012 Z3.28
G1 Z2.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X98.576 Y95.012 E.01711
G1 X98.576 Y84.988 E.20791
G1 X99.401 Y84.988 E.01711
G1 X99.401 Y94.952 E.20667
M204 S250
G1 X99.8 Y95.411 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.411 E.04757
G1 X97.2 Y93.9 E.02765
G1 X80.2 Y93.9 E.31106
G1 X80.2 Y86.1 E.14272
G1 X97.2 Y86.1 E.31106
G1 X97.2 Y84.589 E.02765
M73 P57 R7
G1 X99.8 Y84.589 E.04757
G1 X99.8 Y95.351 E.19692
; WIPE_START
M204 S6000
G1 X97.801 Y95.397 E-.76
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




G1 X98.988 Y94.8 F42000
G1 Z2.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.426512
G1 F15000
M204 S6000
G1 X98.988 Y85.2 E.18809
M204 S10000
G1 X98.406 Y85.493 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.401622
G1 F2100
M204 S800
G1 X97.815 Y84.902 E.01537
G1 X97.513 Y84.902 E.00555
G1 X97.513 Y85.131 E.00422
G1 X98.238 Y85.857 E.01885
G1 X98.238 Y86.388 E.00977
G1 X97.513 Y85.663 E.01885
G1 X97.513 Y86.195 E.00977
G1 X98.238 Y86.92 E.01885
G1 X98.238 Y87.451 E.00977
G1 X97.199 Y86.413 E.02699
G1 X96.668 Y86.413 E.00977
G1 X98.238 Y87.983 E.0408
G1 X98.238 Y88.514 E.00977
G1 X96.136 Y86.413 E.05462
G1 X95.605 Y86.413 E.00977
G1 X98.238 Y89.046 E.06843
G1 X98.238 Y89.577 E.00977
G1 X95.073 Y86.413 E.08225
G1 X94.542 Y86.413 E.00977
G1 X98.238 Y90.109 E.09606
G1 X98.238 Y90.641 E.00977
G1 X94.01 Y86.413 E.10988
G1 X93.479 Y86.413 E.00977
G1 X98.238 Y91.172 E.12369
G1 X98.238 Y91.704 E.00977
G1 X92.947 Y86.413 E.13751
G1 X92.415 Y86.413 E.00977
G1 X98.238 Y92.235 E.15132
G1 X98.238 Y92.767 E.00977
G1 X91.884 Y86.413 E.16514
G1 X91.352 Y86.413 E.00977
G1 X98.238 Y93.298 E.17895
G1 X98.238 Y93.83 E.00977
G1 X90.821 Y86.413 E.19277
G1 X90.289 Y86.413 E.00977
G1 X98.406 Y94.53 E.21096
M204 S10000
G1 X97.344 Y94 F42000
G1 F2100
M204 S800
G1 X98.238 Y94.893 E.02322
G1 X98.238 Y95.098 E.00377
G1 X97.911 Y95.098 E.006
G1 X97.344 Y94.531 E.01474
M204 S10000
G1 X97.1 Y93.756 F42000
G1 F2100
M204 S800
G1 X89.758 Y86.413 E.19084
G1 X89.226 Y86.413 E.00977
G1 X96.401 Y93.587 E.18646
G1 X95.869 Y93.587 E.00977
G1 X88.694 Y86.413 E.18646
G1 X88.163 Y86.413 E.00977
G1 X95.337 Y93.587 E.18646
G1 X94.806 Y93.587 E.00977
G1 X87.631 Y86.413 E.18646
G1 X87.262 Y86.413 E.00679
G1 X87.262 Y86.462 E.00091
G1 X87.149 Y86.462 E.00208
G1 X94.274 Y93.587 E.18518
G1 X93.743 Y93.587 E.00977
G1 X86.618 Y86.462 E.18518
G1 X86.086 Y86.462 E.00977
G1 X93.211 Y93.587 E.18518
G1 X92.68 Y93.587 E.00977
G1 X85.554 Y86.462 E.18518
G1 X85.023 Y86.462 E.00977
G1 X92.148 Y93.587 E.18518
G1 X91.616 Y93.587 E.00977
G1 X84.491 Y86.462 E.18518
G1 X83.96 Y86.462 E.00977
G1 X91.085 Y93.587 E.18518
G1 X90.553 Y93.587 E.00977
G1 X83.428 Y86.462 E.18518
G1 X82.897 Y86.462 E.00977
G1 X90.022 Y93.587 E.18518
G1 X89.49 Y93.587 E.00977
G1 X82.365 Y86.462 E.18518
G1 X81.834 Y86.462 E.00977
G1 X88.959 Y93.587 E.18518
G1 X88.427 Y93.587 E.00977
G1 X81.302 Y86.462 E.18518
G1 X80.77 Y86.462 E.00977
G1 X87.896 Y93.587 E.18518
G1 X87.364 Y93.587 E.00977
G1 X80.513 Y86.736 E.17806
G1 X80.513 Y87.268 E.00977
G1 X86.783 Y93.538 E.16296
G1 X86.252 Y93.538 E.00977
G1 X80.513 Y87.799 E.14915
G1 X80.513 Y88.331 E.00977
G1 X85.72 Y93.538 E.13533
G1 X85.188 Y93.538 E.00977
G1 X80.513 Y88.862 E.12152
G1 X80.513 Y89.394 E.00977
G1 X84.657 Y93.538 E.1077
G1 X84.125 Y93.538 E.00977
G1 X80.513 Y89.925 E.09389
G1 X80.513 Y90.457 E.00977
G1 X83.594 Y93.538 E.08007
G1 X83.062 Y93.538 E.00977
G1 X80.513 Y90.989 E.06626
G1 X80.513 Y91.52 E.00977
G1 X82.531 Y93.538 E.05244
G1 X81.999 Y93.538 E.00977
G1 X80.513 Y92.052 E.03863
G1 X80.513 Y92.583 E.00977
G1 X81.467 Y93.538 E.02481
G1 X80.936 Y93.538 E.00977
G1 X80.344 Y92.946 E.01537
; WIPE_START
M204 S6000
G1 X80.936 Y93.538 E-.31791
G1 X81.467 Y93.538 E-.20199
G1 X81.021 Y93.091 E-.2401
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.24 Y95.569 Z3.28 F42000
G1 X99.401 Y99.401 Z3.28
G1 Z2.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y98.988 E.00856
G1 X99.401 Y98.988 E.03737
G1 X99.401 Y99.341 E.00731
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.589 E.02216
G1 X99.8 Y98.589 E.04757
G1 X99.8 Y99.74 E.02106
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
M73 P58 R7
G1 X97.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/82
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
M106 S201.45
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.28 I1.213 J.103 P1  F42000
G1 X99.401 Y80.934 Z3.28
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2994
M204 S6000
G1 X97.599 Y80.934 E.03737
G1 X97.599 Y80.599 E.00695
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y80.874 E.00571
M204 S250
G1 X99.8 Y81.334 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.334 E.04757
G1 X97.2 Y80.2 E.02074
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.274 E.01965
; WIPE_START
M204 S6000
G1 X97.801 Y81.32 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.987 Y87.243 Z3.4 F42000
G1 X87.901 Y93.501 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2994
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
; WIPE_START
M204 S6000
G1 X86.3 Y93.855 E-.76
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




G1 X87.611 Y93.189 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2994
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2994
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.209 Y94.059 Z3.4 F42000
G1 X98.977 Y94.51 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2994
M204 S6000
G1 X98.023 Y94.51 E.01977
G1 X98.023 Y85.49 E.1871
G1 X98.977 Y85.49 E.01977
G1 X98.977 Y94.45 E.18586
M204 S10000
G1 X99.401 Y94.934 F42000
G1 F2994
M204 S6000
G1 X97.599 Y94.934 E.03737
G1 X97.599 Y85.066 E.2047
G1 X99.401 Y85.066 E.03737
G1 X99.401 Y94.874 E.20346
M204 S250
G1 X99.8 Y95.334 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.334 E.04757
G1 X97.2 Y84.666 E.19519
G1 X99.8 Y84.666 E.04757
G1 X99.8 Y95.274 E.19409
; WIPE_START
M204 S6000
G1 X97.801 Y95.32 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.298 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2994
M204 S6000
G1 X98.5 Y85.702 E.22225
; WIPE_START
G1 F15000
G1 X98.5 Y87.702 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.086 Y95.312 Z3.4 F42000
G1 X99.401 Y99.401 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2994
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y99.066 E.00695
G1 X99.401 Y99.066 E.03737
G1 X99.401 Y99.341 E.00571
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.666 E.02074
G1 X99.8 Y98.666 E.04757
G1 X99.8 Y99.74 E.01965
; CHANGE_LAYER
; Z_HEIGHT: 3.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/82
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
M73 P59 R7
G3 Z3.4 I1.213 J.103 P1  F42000
G1 X99.401 Y80.87 Z3.4
G1 Z3.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2958
M204 S6000
G1 X97.599 Y80.87 E.03737
G1 X97.599 Y80.599 E.00562
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y80.81 E.00438
M204 S250
G1 X99.8 Y81.27 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.27 E.04757
G1 X97.2 Y80.2 E.01957
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.21 E.01847
; WIPE_START
M204 S6000
G1 X97.801 Y81.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.002 Y87.191 Z3.52 F42000
G1 X87.901 Y93.501 Z3.52
G1 Z3.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2958
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
; WIPE_START
M204 S6000
G1 X86.3 Y93.855 E-.76
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




G1 X87.611 Y93.189 F42000
G1 Z3.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2958
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z3.52 F42000
G1 Z3.12
G1 E.8 F1800
G1 F2958
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.214 Y94.016 Z3.52 F42000
G1 X98.977 Y94.446 Z3.52
G1 Z3.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2958
M204 S6000
G1 X98.023 Y94.446 E.01977
G1 X98.023 Y85.554 E.18445
G1 X98.977 Y85.554 E.01977
G1 X98.977 Y94.386 E.1832
M204 S10000
G1 X99.401 Y94.87 F42000
G1 F2958
M204 S6000
G1 X97.599 Y94.87 E.03737
G1 X97.599 Y85.13 E.20205
G1 X99.401 Y85.13 E.03737
G1 X99.401 Y94.81 E.2008
M204 S250
G1 X99.8 Y95.27 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.27 E.04757
G1 X97.2 Y84.73 E.19284
G1 X99.8 Y84.73 E.04757
G1 X99.8 Y95.21 E.19175
; WIPE_START
M204 S6000
G1 X97.801 Y95.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.234 Z3.52 F42000
G1 Z3.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2958
M204 S6000
G1 X98.5 Y85.766 E.21893
; WIPE_START
G1 F15000
G1 X98.5 Y87.766 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.089 Y95.376 Z3.52 F42000
G1 X99.401 Y99.401 Z3.52
G1 Z3.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2958
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y99.13 E.00562
G1 X99.401 Y99.13 E.03737
G1 X99.401 Y99.341 E.00438
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.73 E.01957
G1 X99.8 Y98.73 E.04757
G1 X99.8 Y99.74 E.01847
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/82
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.52 I1.21 J.13 P1  F42000
G1 X99.8 Y81.217 Z3.52
G1 Z3.24
G1 E.8 F1800
G1 F2400
M204 S1000
G1 X97.2 Y81.217 E.04757
G1 X97.2 Y80.2 E.01861
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.157 E.01751
; WIPE_START
M204 S6000
G1 X97.801 Y81.203 E-.76
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




G1 X97.4 Y80.709 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.643662
G1 F2867
M204 S6000
G1 X99.6 Y80.709 E.06649
; WIPE_START
G1 F15000
G1 X97.6 Y80.709 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.989 Y86.79 Z3.64 F42000
G1 X87.901 Y93.501 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2867
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
M73 P60 R7
G1 F2867
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
G1 F2867
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.218 Y93.982 Z3.64 F42000
G1 X98.977 Y94.394 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2867
M204 S6000
G1 X98.023 Y94.394 E.01977
G1 X98.023 Y85.606 E.18227
G1 X98.977 Y85.606 E.01977
G1 X98.977 Y94.334 E.18103
M204 S10000
G1 X99.401 Y94.818 F42000
G1 F2867
M204 S6000
G1 X97.599 Y94.818 E.03737
G1 X97.599 Y85.182 E.19987
G1 X99.401 Y85.182 E.03737
G1 X99.401 Y94.758 E.19863
M204 S250
G1 X99.8 Y95.217 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.217 E.04757
G1 X97.2 Y84.783 E.19093
G1 X99.8 Y84.783 E.04757
G1 X99.8 Y95.157 E.18983
; WIPE_START
M204 S6000
G1 X97.801 Y95.203 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.182 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2867
M204 S6000
G1 X98.5 Y85.818 E.21622
; WIPE_START
G1 F15000
G1 X98.5 Y87.818 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.323 Y95.406 Z3.64 F42000
G1 X99.8 Y99.8 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.783 E.01861
G1 X99.8 Y98.783 E.04757
G1 X99.8 Y99.74 E.01751
M204 S10000
G1 X99.6 Y99.291 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.643662
G1 F2867
M204 S6000
G1 X97.4 Y99.291 E.06649
; CHANGE_LAYER
; Z_HEIGHT: 3.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.291 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/82
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.64 I1.217 J.027 P1  F42000
G1 X99.8 Y81.175 Z3.64
G1 Z3.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.175 E.04757
G1 X97.2 Y80.2 E.01784
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.115 E.01675
; WIPE_START
M204 S6000
G1 X97.801 Y81.161 E-.76
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




G1 X97.4 Y80.688 F42000
G1 Z3.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.601712
G1 F2801
M204 S6000
G1 X99.6 Y80.688 E.06197
; WIPE_START
G1 F15000
G1 X97.6 Y80.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.994 Y86.773 Z3.76 F42000
G1 X87.901 Y93.501 Z3.76
G1 Z3.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2801
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2801
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z3.76 F42000
G1 Z3.36
G1 E.8 F1800
G1 F2801
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.221 Y93.954 Z3.76 F42000
G1 X98.977 Y94.352 Z3.76
G1 Z3.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2801
M204 S6000
G1 X98.023 Y94.352 E.01977
G1 X98.023 Y85.648 E.18053
G1 X98.977 Y85.648 E.01977
G1 X98.977 Y94.292 E.17929
M204 S10000
G1 X99.401 Y94.776 F42000
G1 F2801
M204 S6000
G1 X97.599 Y94.776 E.03737
G1 X97.599 Y85.224 E.19813
G1 X99.401 Y85.224 E.03737
G1 X99.401 Y94.716 E.19689
M204 S250
G1 X99.8 Y95.175 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.175 E.04757
G1 X97.2 Y84.825 E.18939
G1 X99.8 Y84.825 E.04757
G1 X99.8 Y95.115 E.18829
; WIPE_START
M204 S6000
G1 X97.801 Y95.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.14 Z3.76 F42000
G1 Z3.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2801
M204 S6000
G1 X98.5 Y85.86 E.21405
; WIPE_START
G1 F15000
G1 X98.5 Y87.86 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P61 R7
G1 X99.326 Y95.448 Z3.76 F42000
G1 X99.8 Y99.8 Z3.76
G1 Z3.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.825 E.01784
G1 X99.8 Y98.825 E.04757
G1 X99.8 Y99.74 E.01675
M204 S10000
G1 X99.6 Y99.312 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.601712
G1 F2801
M204 S6000
G1 X97.4 Y99.312 E.06197
; CHANGE_LAYER
; Z_HEIGHT: 3.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.312 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/82
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.76 I1.217 J.027 P1  F42000
G1 X99.8 Y81.143 Z3.76
G1 Z3.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.143 E.04757
G1 X97.2 Y80.2 E.01726
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.083 E.01616
; WIPE_START
M204 S6000
G1 X97.801 Y81.129 E-.76
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




G1 X97.4 Y80.672 F42000
G1 Z3.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.569602
G1 F2786
M204 S6000
G1 X99.6 Y80.672 E.05852
; WIPE_START
G1 F15000
G1 X97.6 Y80.672 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.997 Y86.76 Z3.88 F42000
G1 X87.901 Y93.501 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2786
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2786
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z3.88 F42000
G1 Z3.48
G1 E.8 F1800
G1 F2786
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.223 Y93.933 Z3.88 F42000
G1 X98.977 Y94.32 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2786
M204 S6000
G1 X98.023 Y94.32 E.01977
G1 X98.023 Y85.68 E.1792
G1 X98.977 Y85.68 E.01977
G1 X98.977 Y94.26 E.17795
M204 S10000
G1 X99.401 Y94.744 F42000
G1 F2786
M204 S6000
G1 X97.599 Y94.744 E.03737
G1 X97.599 Y85.256 E.1968
G1 X99.401 Y85.256 E.03737
G1 X99.401 Y94.684 E.19555
M204 S250
G1 X99.8 Y95.143 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.143 E.04757
G1 X97.2 Y84.857 E.18822
G1 X99.8 Y84.857 E.04757
G1 X99.8 Y95.083 E.18712
; WIPE_START
M204 S6000
G1 X97.801 Y95.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.107 Z3.88 F42000
G1 Z3.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2786
M204 S6000
G1 X98.5 Y85.893 E.21239
; WIPE_START
G1 F15000
G1 X98.5 Y87.893 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.328 Y95.48 Z3.88 F42000
G1 X99.8 Y99.8 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.857 E.01726
G1 X99.8 Y98.857 E.04757
G1 X99.8 Y99.74 E.01616
M204 S10000
G1 X99.6 Y99.328 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.569602
G1 F2786
M204 S6000
G1 X97.4 Y99.328 E.05852
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.328 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/82
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.88 I1.217 J.027 P1  F42000
G1 X99.8 Y81.12 Z3.88
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.12 E.04757
G1 X97.2 Y80.2 E.01684
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.06 E.01574
; WIPE_START
M204 S6000
G1 X97.801 Y81.106 E-.76
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




G1 X97.4 Y80.66 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.546582
G1 F2776
M204 S6000
G1 X99.6 Y80.66 E.05604
; WIPE_START
G1 F15000
G1 X97.6 Y80.66 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93 Y86.75 Z4 F42000
G1 X87.901 Y93.501 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2776
M204 S6000
M73 P61 R6
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
M73 P62 R6
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2776
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F2776
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.224 Y93.917 Z4 F42000
G1 X98.977 Y94.297 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2776
M204 S6000
G1 X98.023 Y94.297 E.01977
G1 X98.023 Y85.703 E.17824
G1 X98.977 Y85.703 E.01977
G1 X98.977 Y94.237 E.177
M204 S10000
G1 X99.401 Y94.721 F42000
G1 F2776
M204 S6000
G1 X97.599 Y94.721 E.03737
G1 X97.599 Y85.279 E.19584
G1 X99.401 Y85.279 E.03737
G1 X99.401 Y94.661 E.1946
M204 S250
G1 X99.8 Y95.12 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.12 E.04757
G1 X97.2 Y84.88 E.18737
G1 X99.8 Y84.88 E.04757
G1 X99.8 Y95.06 E.18627
; WIPE_START
M204 S6000
G1 X97.801 Y95.106 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.084 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2776
M204 S6000
G1 X98.5 Y85.916 E.2112
; WIPE_START
G1 F15000
G1 X98.5 Y87.916 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.33 Y95.503 Z4 F42000
G1 X99.8 Y99.8 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.88 E.01684
G1 X99.8 Y98.88 E.04757
G1 X99.8 Y99.74 E.01574
M204 S10000
G1 X99.6 Y99.34 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.546582
G1 F2776
M204 S6000
G1 X97.4 Y99.34 E.05604
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.34 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/82
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4 I1.217 J.027 P1  F42000
G1 X99.8 Y81.106 Z4
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.106 E.04757
G1 X97.2 Y80.2 E.01657
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.046 E.01548
; WIPE_START
M204 S6000
G1 X97.801 Y81.092 E-.76
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




G1 X97.4 Y80.653 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.532332
G1 F2769
M204 S6000
G1 X99.6 Y80.653 E.05451
; WIPE_START
G1 F15000
G1 X97.6 Y80.653 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.002 Y86.744 Z4.12 F42000
G1 X87.901 Y93.501 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2769
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2769
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
G1 F2769
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.225 Y93.908 Z4.12 F42000
G1 X98.977 Y94.282 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2769
M204 S6000
G1 X98.023 Y94.282 E.01977
G1 X98.023 Y85.718 E.17765
G1 X98.977 Y85.718 E.01977
G1 X98.977 Y94.222 E.17641
M204 S10000
G1 X99.401 Y94.707 F42000
G1 F2769
M204 S6000
G1 X97.599 Y94.707 E.03737
G1 X97.599 Y85.293 E.19525
G1 X99.401 Y85.293 E.03737
G1 X99.401 Y94.647 E.19401
M204 S250
G1 X99.8 Y95.106 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.106 E.04757
G1 X97.2 Y84.894 E.18685
G1 X99.8 Y84.894 E.04757
G1 X99.8 Y95.046 E.18575
; WIPE_START
M204 S6000
G1 X97.801 Y95.092 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.07 Z4.12 F42000
G1 Z3.72
M73 P63 R6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2769
M204 S6000
G1 X98.5 Y85.93 E.21047
; WIPE_START
G1 F15000
G1 X98.5 Y87.93 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.517 Z4.12 F42000
G1 X99.8 Y99.8 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.894 E.01657
G1 X99.8 Y98.894 E.04757
G1 X99.8 Y99.74 E.01548
M204 S10000
G1 X99.6 Y99.347 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.532332
G1 F2769
M204 S6000
G1 X97.4 Y99.347 E.05451
; CHANGE_LAYER
; Z_HEIGHT: 3.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.347 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/82
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.12 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z4.12
G1 Z3.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z3.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526712
G1 F2767
M204 S6000
G1 X99.6 Y80.65 E.0539
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.002 Y86.742 Z4.24 F42000
G1 X87.901 Y93.501 Z4.24
G1 Z3.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2767
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z4.24 F42000
G1 Z3.84
G1 E.8 F1800
G1 F2767
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.226 Y93.904 Z4.24 F42000
G1 X98.977 Y94.277 Z4.24
G1 Z3.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17742
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17618
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2767
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19502
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18665
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18555
; WIPE_START
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.065 Z4.24 F42000
G1 Z3.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2767
M204 S6000
G1 X98.5 Y85.935 E.21017
; WIPE_START
G1 F15000
G1 X98.5 Y87.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.522 Z4.24 F42000
G1 X99.8 Y99.8 Z4.24
G1 Z3.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526712
G1 F2767
M204 S6000
G1 X97.4 Y99.35 E.0539
; CHANGE_LAYER
; Z_HEIGHT: 3.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/82
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.24 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z4.24
G1 Z3.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z3.96
M73 P64 R6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2783
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.487 Y85.22 Z4.36 F42000
G1 X87.901 Y87.902 Z4.36
G1 Z3.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2783
M204 S6000
G1 X87.399 Y87.902 E.0104
G1 X87.399 Y87.101 E.01661
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y87.842 E.02784
M204 S250
G1 X88.3 Y88.301 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X87 Y88.301 E.02379
G1 X87 Y87.5 E.01465
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y88.241 E.03917
M204 S10000
G1 X87.65 Y87.69 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103032
G1 F2783
M204 S6000
G1 X87.65 Y86.889 E.00303
; LINE_WIDTH: 0.122352
G1 X87.631 Y86.85 E.0002
; LINE_WIDTH: 0.160992
G1 X87.611 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X87.6 Y86.8 E.00014
G1 X80.811 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.3 Y89.571 Z4.36 F42000
G1 Z3.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X87 Y89.571 E.02379
G1 X87 Y89.159 E.00753
G1 X88.3 Y89.159 E.02379
G1 X88.3 Y89.511 E.00644
; WIPE_START
M204 S6000
G1 X87 Y89.571 E-.49453
G1 X87 Y89.159 E-.15647
G1 X87.287 Y89.159 E-.10901
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.3 Y90.841 Z4.36 F42000
G1 Z3.96
G1 E.8 F1800
G1 F2400
M204 S1000
G1 X87 Y90.841 E.02379
G1 X87 Y90.429 E.00753
G1 X88.3 Y90.429 E.02379
G1 X88.3 Y90.781 E.00644
; WIPE_START
M204 S6000
G1 X87 Y90.841 E-.49453
G1 X87 Y90.429 E-.15647
G1 X87.287 Y90.429 E-.10901
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.901 Y93.501 Z4.36 F42000
G1 Z3.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2783
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y92.098 E.01661
G1 X87.901 Y92.098 E.0104
G1 X87.901 Y93.441 E.02784
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y91.699 E.01465
G1 X88.3 Y91.699 E.02379
G1 X88.3 Y93.84 E.03917
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.160992
G1 F2783
M204 S6000
G1 X87.631 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y93.111 E.0002
; LINE_WIDTH: 0.103032
G1 X87.65 Y92.31 E.00303
M204 S10000
G1 X87.611 Y93.189 F42000
; LINE_WIDTH: 0.203005
G1 F2783
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.427 Y93.707 Z4.36 F42000
G1 X98.977 Y94.277 Z4.36
G1 Z3.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2783
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2783
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z4.36 F42000
G1 Z3.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2783
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z4.36 F42000
G1 X99.8 Y99.8 Z4.36
G1 Z3.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2783
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 4.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/82
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.36 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z4.36
G1 Z4.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z4.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2705
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.436 Y85.151 Z4.48 F42000
G1 X87.901 Y87.733 Z4.48
G1 Z4.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2705
M204 S6000
G1 X87.399 Y87.733 E.0104
G1 X87.399 Y87.101 E.01312
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y87.673 E.02435
M204 S250
G1 X88.3 Y88.132 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X87 Y88.132 E.02379
G1 X87 Y87.5 E.01157
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y88.072 E.03609
M204 S10000
G1 X87.65 Y87.521 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103032
G1 F2705
M204 S6000
G1 X87.65 Y86.889 E.00239
; LINE_WIDTH: 0.122352
G1 X87.631 Y86.85 E.0002
; LINE_WIDTH: 0.160992
G1 X87.611 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X87.6 Y86.8 E.00014
G1 X80.811 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.321 Y89.423 Z4.48 F42000
G1 Z4.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.358834
G1 F2400
M204 S1000
G1 X86.979 Y89.423 E.02184
G1 X86.979 Y89.307 E.00189
G1 X88.321 Y89.307 E.02184
G1 X88.321 Y89.363 E.00091
; WIPE_START
M204 S6000
G1 X86.979 Y89.423 E-.51015
M73 P65 R6
G1 X86.979 Y89.307 E-.04405
G1 X87.521 Y89.307 E-.20579
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.321 Y90.693 Z4.48 F42000
G1 Z4.08
G1 E.8 F1800
G1 F2400
M204 S1000
G1 X86.979 Y90.693 E.02184
G1 X86.979 Y90.577 E.00189
G1 X88.321 Y90.577 E.02184
G1 X88.321 Y90.633 E.00091
; WIPE_START
M204 S6000
G1 X86.979 Y90.693 E-.51015
G1 X86.979 Y90.577 E-.04405
G1 X87.521 Y90.577 E-.20579
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.901 Y93.501 Z4.48 F42000
G1 Z4.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2705
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y92.267 E.01312
G1 X87.901 Y92.267 E.0104
G1 X87.901 Y93.441 E.02435
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y91.868 E.01157
G1 X88.3 Y91.868 E.02379
G1 X88.3 Y93.84 E.03609
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.160992
G1 F2705
M204 S6000
G1 X87.631 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y93.111 E.0002
; LINE_WIDTH: 0.103032
G1 X87.65 Y92.479 E.00239
M204 S10000
G1 X87.611 Y93.189 F42000
; LINE_WIDTH: 0.203005
G1 F2705
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.427 Y93.707 Z4.48 F42000
G1 X98.977 Y94.277 Z4.48
G1 Z4.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2705
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2705
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z4.48 F42000
G1 Z4.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2705
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z4.48 F42000
G1 X99.8 Y99.8 Z4.48
G1 Z4.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2705
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/82
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.48 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z4.48
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2368
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2368
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.41 Y85.115 Z4.6 F42000
G1 X87.901 Y87.646 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2368
M204 S6000
G1 X87.399 Y87.646 E.0104
G1 X87.399 Y87.101 E.01131
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y87.586 E.02254
M204 S250
G1 X88.3 Y88.045 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2368
M204 S1000
G1 X87 Y88.045 E.02379
G1 X87 Y87.5 E.00998
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y87.985 E.0345
M204 S10000
G1 X87.65 Y87.434 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103032
G1 F2368
M204 S6000
G1 X87.65 Y86.889 E.00206
; LINE_WIDTH: 0.122352
G1 X87.631 Y86.85 E.0002
; LINE_WIDTH: 0.160992
G1 X87.611 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X87.6 Y86.8 E.00014
G1 X80.811 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.428 Y92.878 Z4.6 F42000
G1 X87.901 Y93.501 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2368
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y92.354 E.01131
G1 X87.901 Y92.354 E.0104
G1 X87.901 Y93.441 E.02254
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2368
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y91.955 E.00998
G1 X88.3 Y91.955 E.02379
G1 X88.3 Y93.84 E.0345
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.160992
G1 F2368
M204 S6000
G1 X87.631 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y93.111 E.0002
; LINE_WIDTH: 0.103032
G1 X87.65 Y92.566 E.00206
M204 S10000
G1 X87.611 Y93.189 F42000
; LINE_WIDTH: 0.203005
G1 F2368
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.427 Y93.707 Z4.6 F42000
G1 X98.977 Y94.277 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2368
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2368
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2368
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z4.6 F42000
M73 P66 R6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2368
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z4.6 F42000
G1 X99.8 Y99.8 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2368
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2368
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 4.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/82
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.6 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z4.6
G1 Z4.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2362
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z4.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2362
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.396 Y85.095 Z4.72 F42000
G1 X87.901 Y87.599 Z4.72
G1 Z4.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2362
M204 S6000
G1 X87.399 Y87.599 E.0104
G1 X87.399 Y87.101 E.01033
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y87.539 E.02157
M204 S250
G1 X88.3 Y87.998 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2362
M204 S1000
G1 X87 Y87.998 E.02379
G1 X87 Y87.5 E.00911
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y87.938 E.03363
M204 S10000
G1 X87.65 Y87.387 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103032
G1 F2362
M204 S6000
G1 X87.65 Y86.889 E.00188
; LINE_WIDTH: 0.122352
G1 X87.631 Y86.85 E.0002
; LINE_WIDTH: 0.160992
G1 X87.611 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X87.6 Y86.8 E.00014
G1 X80.811 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.428 Y92.878 Z4.72 F42000
G1 X87.901 Y93.501 Z4.72
G1 Z4.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2362
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y92.401 E.01033
G1 X87.901 Y92.401 E.0104
G1 X87.901 Y93.441 E.02157
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2362
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y92.002 E.00911
G1 X88.3 Y92.002 E.02379
G1 X88.3 Y93.84 E.03363
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.160992
G1 F2362
M204 S6000
G1 X87.631 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y93.111 E.0002
; LINE_WIDTH: 0.103032
G1 X87.65 Y92.613 E.00188
M204 S10000
G1 X87.611 Y93.189 F42000
; LINE_WIDTH: 0.203005
G1 F2362
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.427 Y93.707 Z4.72 F42000
G1 X98.977 Y94.277 Z4.72
G1 Z4.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2362
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2362
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2362
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z4.72 F42000
G1 Z4.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2362
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z4.72 F42000
G1 X99.8 Y99.8 Z4.72
G1 Z4.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2362
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2362
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 4.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/82
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.72 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z4.72
G1 Z4.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2360
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z4.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2360
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.39 Y85.087 Z4.84 F42000
G1 X87.901 Y87.581 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2360
M204 S6000
G1 X87.399 Y87.581 E.0104
G1 X87.399 Y87.101 E.00996
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
M73 P67 R6
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y87.521 E.0212
M204 S250
G1 X88.3 Y87.98 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2360
M204 S1000
G1 X87 Y87.98 E.02379
G1 X87 Y87.5 E.00879
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y87.92 E.03331
M204 S10000
G1 X87.65 Y87.369 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103032
G1 F2360
M204 S6000
G1 X87.65 Y86.889 E.00182
; LINE_WIDTH: 0.122352
G1 X87.631 Y86.85 E.0002
; LINE_WIDTH: 0.160992
G1 X87.611 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X87.6 Y86.8 E.00014
G1 X80.811 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.428 Y92.878 Z4.84 F42000
G1 X87.901 Y93.501 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2360
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y92.419 E.00996
G1 X87.901 Y92.419 E.0104
G1 X87.901 Y93.441 E.0212
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2360
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y92.02 E.00879
G1 X88.3 Y92.02 E.02379
G1 X88.3 Y93.84 E.03331
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.160992
G1 F2360
M204 S6000
G1 X87.631 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y93.111 E.0002
; LINE_WIDTH: 0.103032
G1 X87.65 Y92.631 E.00182
M204 S10000
G1 X87.611 Y93.189 F42000
; LINE_WIDTH: 0.203005
G1 F2360
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.427 Y93.707 Z4.84 F42000
G1 X98.977 Y94.277 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2360
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2360
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2360
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z4.84 F42000
G1 Z4.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2360
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
M73 P67 R5
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z4.84 F42000
G1 X99.8 Y99.8 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2360
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2360
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 4.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/82
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.84 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z4.84
G1 Z4.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2361
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z4.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2361
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.393 Y85.091 Z4.96 F42000
G1 X87.901 Y87.59 Z4.96
G1 Z4.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2361
M204 S6000
G1 X87.399 Y87.59 E.0104
G1 X87.399 Y87.101 E.01015
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y87.53 E.02138
M204 S250
G1 X88.3 Y87.989 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2361
M204 S1000
G1 X87 Y87.989 E.02379
G1 X87 Y87.5 E.00895
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y87.929 E.03347
M204 S10000
G1 X87.65 Y87.378 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103032
G1 F2361
M204 S6000
G1 X87.65 Y86.889 E.00185
; LINE_WIDTH: 0.122352
G1 X87.631 Y86.85 E.0002
; LINE_WIDTH: 0.160992
G1 X87.611 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X87.6 Y86.8 E.00014
G1 X80.811 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.428 Y92.878 Z4.96 F42000
G1 X87.901 Y93.501 Z4.96
G1 Z4.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2361
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y92.41 E.01015
G1 X87.901 Y92.41 E.0104
G1 X87.901 Y93.441 E.02138
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2361
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y92.011 E.00895
G1 X88.3 Y92.011 E.02379
G1 X88.3 Y93.84 E.03347
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.160992
G1 F2361
M204 S6000
G1 X87.631 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y93.111 E.0002
; LINE_WIDTH: 0.103032
G1 X87.65 Y92.622 E.00185
M204 S10000
G1 X87.611 Y93.189 F42000
; LINE_WIDTH: 0.203005
G1 F2361
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
M73 P68 R5
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.427 Y93.707 Z4.96 F42000
G1 X98.977 Y94.277 Z4.96
G1 Z4.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2361
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2361
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2361
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z4.96 F42000
G1 Z4.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2361
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z4.96 F42000
G1 X99.8 Y99.8 Z4.96
G1 Z4.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2361
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2361
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/82
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.96 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z4.96
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2366
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2366
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.404 Y85.107 Z5.08 F42000
G1 X87.901 Y87.627 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2366
M204 S6000
G1 X87.399 Y87.627 E.0104
G1 X87.399 Y87.101 E.01091
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y87.567 E.02214
M204 S250
G1 X88.3 Y88.026 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2366
M204 S1000
G1 X87 Y88.026 E.02379
G1 X87 Y87.5 E.00962
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y87.966 E.03414
M204 S10000
G1 X87.65 Y87.415 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103032
G1 F2366
M204 S6000
G1 X87.65 Y86.889 E.00199
; LINE_WIDTH: 0.122352
G1 X87.631 Y86.85 E.0002
; LINE_WIDTH: 0.160992
G1 X87.611 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X87.6 Y86.8 E.00014
G1 X80.811 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.428 Y92.878 Z5.08 F42000
G1 X87.901 Y93.501 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2366
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y92.373 E.01091
G1 X87.901 Y92.373 E.0104
G1 X87.901 Y93.441 E.02214
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2366
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y91.974 E.00962
G1 X88.3 Y91.974 E.02379
G1 X88.3 Y93.84 E.03414
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.160992
G1 F2366
M204 S6000
G1 X87.631 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y93.111 E.0002
; LINE_WIDTH: 0.103032
G1 X87.65 Y92.585 E.00199
M204 S10000
G1 X87.611 Y93.189 F42000
; LINE_WIDTH: 0.203005
G1 F2366
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.427 Y93.707 Z5.08 F42000
G1 X98.977 Y94.277 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2366
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2366
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2366
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2366
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z5.08 F42000
G1 X99.8 Y99.8 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2366
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2366
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/82
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.08 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z5.08
G1 Z4.8
G1 E.8 F1800
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
M73 P69 R5
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4128
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.426 Y85.137 Z5.2 F42000
G1 X87.901 Y87.698 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4128
M204 S6000
G1 X87.399 Y87.698 E.0104
G1 X87.399 Y87.101 E.0124
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y87.638 E.02363
M204 S250
G1 X88.3 Y88.066 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X88.3 Y88.098 E.00058
G1 X87 Y88.098 E.02379
G1 X87 Y88.066 E.00058
G1 X87 Y87.5 E.01036
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y88.006 E.03487
M204 S10000
G1 X87.65 Y87.486 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103032
G1 F4128
M204 S6000
G1 X87.65 Y86.889 E.00226
; LINE_WIDTH: 0.122352
G1 X87.631 Y86.85 E.0002
; LINE_WIDTH: 0.160992
G1 X87.611 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X87.6 Y86.8 E.00014
G1 X80.811 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.321 Y89.388 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.358834
G1 F600
M204 S1000
G1 X86.979 Y89.388 E.02184
G1 X86.979 Y89.342 E.00076
G1 X88.307 Y89.342 E.02162
M106 S201.45
M106 S255
; WIPE_START
M204 S6000
G1 X86.979 Y89.388 E-.50486
G1 X86.979 Y89.342 E-.0177
G1 X87.604 Y89.342 E-.23744
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.979 Y90.612 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F600
M204 S1000
G1 X88.321 Y90.612 E.02184
G1 X88.321 Y90.658 E.00076
G1 X86.993 Y90.658 E.02162
M106 S201.45
; WIPE_START
M204 S6000
G1 X88.321 Y90.612 E-.50486
G1 X88.321 Y90.658 E-.0177
G1 X87.696 Y90.658 E-.23744
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.901 Y93.501 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4128
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y92.302 E.0124
G1 X87.901 Y92.302 E.0104
G1 X87.901 Y93.441 E.02363
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y91.934 E.01036
G1 X87 Y91.902 E.00058
G1 X88.3 Y91.902 E.02379
G1 X88.3 Y91.934 E.00058
G1 X88.3 Y93.84 E.03487
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.160992
G1 F4128
M204 S6000
G1 X87.631 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y93.111 E.0002
; LINE_WIDTH: 0.103032
G1 X87.65 Y92.514 E.00226
M204 S10000
G1 X87.611 Y93.189 F42000
; LINE_WIDTH: 0.203005
G1 F4128
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.427 Y93.707 Z5.2 F42000
G1 X98.977 Y94.277 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4128
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F4128
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F4128
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z5.2 F42000
G1 X99.8 Y99.8 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F4128
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 4.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/82
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.2 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z5.2
G1 Z4.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z4.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2722
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.466 Y85.191 Z5.32 F42000
G1 X87.901 Y87.829 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2722
M204 S6000
G1 X87.399 Y87.829 E.0104
G1 X87.399 Y87.101 E.01511
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y87.769 E.02634
M204 S250
G1 X88.3 Y88.138 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2460
M204 S1000
G1 X88.3 Y88.229 E.00166
G1 F2722
G1 X87 Y88.229 E.02379
G1 F2460
G1 X87 Y88.138 E.00166
G1 F2400
G1 X87 Y87.5 E.01167
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y88.078 E.03619
M204 S10000
M73 P70 R5
G1 X87.65 Y87.617 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103032
G1 F2722
M204 S6000
G1 X87.65 Y86.889 E.00275
; LINE_WIDTH: 0.122352
G1 X87.631 Y86.85 E.0002
; LINE_WIDTH: 0.160992
G1 X87.611 Y86.811 E.00029
; LINE_WIDTH: 0.203005
G1 X87.6 Y86.8 E.00014
G1 X80.811 Y86.8 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.979 Y89.426 Z5.32 F42000
G1 Z4.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.358834
G1 F2400
M204 S1000
G1 X86.979 Y89.304 E.00199
G1 F2520
G1 X86.979 Y89.211 E.00151
G1 F2722
G1 X88.321 Y89.211 E.02184
G1 F2520
G1 X88.321 Y89.304 E.00151
G1 F2400
G1 X88.321 Y89.426 E.00199
G1 F2520
G1 X88.321 Y89.519 E.00151
G1 F2722
G1 X86.979 Y89.519 E.02184
G1 F2520
G1 X86.979 Y89.486 E.00054
; WIPE_START
M204 S6000
G1 X86.979 Y89.304 E-.06934
G1 X86.979 Y89.211 E-.03529
G1 X88.321 Y89.211 E-.50965
G1 X88.321 Y89.304 E-.03529
G1 X88.321 Y89.426 E-.04654
G1 X88.321 Y89.519 E-.03529
G1 X88.245 Y89.519 E-.0286
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.979 Y90.696 Z5.32 F42000
G1 Z4.92
G1 E.8 F1800
G1 F2400
M204 S1000
G1 X86.979 Y90.574 E.00199
G1 F2520
G1 X86.979 Y90.481 E.00151
G1 F2722
G1 X88.321 Y90.481 E.02184
G1 F2520
G1 X88.321 Y90.574 E.00151
G1 F2400
G1 X88.321 Y90.696 E.00199
G1 F2520
G1 X88.321 Y90.789 E.00151
G1 F2722
G1 X86.979 Y90.789 E.02184
G1 F2520
G1 X86.979 Y90.756 E.00054
; WIPE_START
M204 S6000
G1 X86.979 Y90.574 E-.06933
G1 X86.979 Y90.481 E-.03529
G1 X88.321 Y90.481 E-.50964
G1 X88.321 Y90.574 E-.03529
G1 X88.321 Y90.696 E-.04653
G1 X88.321 Y90.789 E-.03529
G1 X88.245 Y90.789 E-.02861
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.901 Y93.501 Z5.32 F42000
G1 Z4.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2722
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y92.171 E.01511
G1 X87.901 Y92.171 E.0104
G1 X87.901 Y93.441 E.02634
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y91.862 E.01167
G1 F2460
G1 X87 Y91.771 E.00166
G1 F2722
G1 X88.3 Y91.771 E.02379
G1 F2460
G1 X88.3 Y91.862 E.00166
G1 F2400
G1 X88.3 Y93.84 E.03619
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.160992
G1 F2722
M204 S6000
G1 X87.631 Y93.15 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y93.111 E.0002
; LINE_WIDTH: 0.103032
G1 X87.65 Y92.383 E.00275
M204 S10000
G1 X87.611 Y93.189 F42000
; LINE_WIDTH: 0.203005
G1 F2722
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.427 Y93.707 Z5.32 F42000
G1 X98.977 Y94.277 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2722
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2722
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z5.32 F42000
G1 Z4.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2722
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z5.32 F42000
G1 X99.8 Y99.8 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2722
M204 S6000
G1 X97.4 Y99.35 E.05388
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/82
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.32 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z5.32
G1 Z5.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z5.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2857
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.002 Y86.742 Z5.44 F42000
G1 X87.901 Y93.501 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2857
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y92.154 E.01546
G1 X87.399 Y91.754 E.0083
G1 F1800
G1 X87.399 Y91.371 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X87.399 Y91.169 E.00421
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X87.399 Y90.786 E.00793
M106 S201.45
M106 S255
G1 F2797.286
G1 X87.399 Y90.484 E.00627
G1 F1800
G1 X87.399 Y90.101 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X87.399 Y89.899 E.00421
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X87.399 Y89.516 E.00793
M106 S201.45
M106 S255
G1 F2797.286
G1 X87.399 Y89.214 E.00627
G1 F1800
G1 X87.399 Y88.831 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X87.399 Y88.629 E.00421
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X87.399 Y88.246 E.00793
M106 S201.45
M106 S255
G1 F2857
G1 X87.399 Y87.846 E.0083
G1 X87.399 Y87.101 E.01546
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y87.846 E.02794
G1 X87.901 Y88.246 E.0083
G1 F1800
G1 X87.901 Y88.629 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X87.901 Y88.831 E.00421
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X87.901 Y89.214 E.00793
M106 S201.45
M106 S255
G1 F2797.286
G1 X87.901 Y89.516 E.00627
G1 F1800
G1 X87.901 Y89.899 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X87.901 Y90.101 E.00421
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X87.901 Y90.484 E.00793
M106 S201.45
M106 S255
G1 F2797.286
G1 X87.901 Y90.786 E.00627
G1 F1800
G1 X87.901 Y91.169 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X87.901 Y91.371 E.00421
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X87.901 Y91.754 E.00793
M106 S201.45
M106 S255
G1 F2857
G1 X87.901 Y92.154 E.0083
G1 X87.901 Y93.441 E.02669
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y91.731 E.01406
G1 F1920
G1 X87 Y91.371 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X87 Y91.169 E.00421
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X87 Y90.809 E.00659
G1 F2400
G1 X87 Y90.461 E.00635
G1 F1920
G1 X87 Y90.101 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X87 Y89.899 E.00421
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X87 Y89.539 E.00659
G1 F2400
M73 P71 R5
G1 X87 Y89.191 E.00635
G1 F1920
G1 X87 Y88.831 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X87 Y88.629 E.00421
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X87 Y88.269 E.00659
G1 F2400
G1 X87 Y87.5 E.01406
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y88.269 E.03968
G1 F1920
G1 X88.3 Y88.629 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X88.3 Y88.831 E.00421
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X88.3 Y89.191 E.00659
G1 F2400
G1 X88.3 Y89.539 E.00635
G1 F1920
G1 X88.3 Y89.899 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X88.3 Y90.101 E.00421
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X88.3 Y90.461 E.00659
G1 F2400
G1 X88.3 Y90.809 E.00635
G1 F1920
G1 X88.3 Y91.169 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X88.3 Y91.371 E.00421
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
G1 X88.3 Y91.731 E.00659
G1 F2400
G1 X88.3 Y93.84 E.03858
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2857
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z5.44 F42000
G1 Z5.04
G1 E.8 F1800
G1 F2857
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.226 Y93.904 Z5.44 F42000
G1 X98.977 Y94.277 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2857
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2857
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z5.44 F42000
G1 Z5.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2857
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z5.44 F42000
G1 X99.8 Y99.8 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2857
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/82
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.44 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z5.44
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2767
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.002 Y86.742 Z5.56 F42000
G1 X87.901 Y93.501 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2767
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F2767
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.226 Y93.904 Z5.56 F42000
G1 X98.977 Y94.277 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2767
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2767
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z5.56 F42000
G1 X99.8 Y99.8 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2767
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 5.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/82
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.56 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z5.56
G1 Z5.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z5.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2767
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.002 Y86.742 Z5.68 F42000
G1 X87.901 Y93.501 Z5.68
G1 Z5.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
M73 P72 R5
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2767
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z5.68 F42000
G1 Z5.28
G1 E.8 F1800
G1 F2767
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.226 Y93.904 Z5.68 F42000
G1 X98.977 Y94.277 Z5.68
G1 Z5.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2767
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z5.68 F42000
G1 Z5.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2767
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z5.68 F42000
G1 X99.8 Y99.8 Z5.68
G1 Z5.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2767
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/82
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.68 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z5.68
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2767
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.002 Y86.742 Z5.8 F42000
G1 X87.901 Y93.501 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2767
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F2767
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
M73 P72 R4
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.226 Y93.904 Z5.8 F42000
G1 X98.977 Y94.277 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2767
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
M73 P73 R4
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2767
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z5.8 F42000
G1 X99.8 Y99.8 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2767
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 5.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/82
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.8 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z5.8
G1 Z5.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z5.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2767
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.002 Y86.742 Z5.92 F42000
G1 X87.901 Y93.501 Z5.92
G1 Z5.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2767
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z5.92 F42000
G1 Z5.52
G1 E.8 F1800
G1 F2767
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.226 Y93.904 Z5.92 F42000
G1 X98.977 Y94.277 Z5.92
G1 Z5.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2767
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z5.92 F42000
G1 Z5.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2767
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z5.92 F42000
G1 X99.8 Y99.8 Z5.92
G1 Z5.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2767
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/82
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.92 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z5.92
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2767
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
M73 P74 R4
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.002 Y86.742 Z6.04 F42000
G1 X87.901 Y93.501 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2767
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
G1 F2767
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.226 Y93.904 Z6.04 F42000
G1 X98.977 Y94.277 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2767
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2767
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z6.04 F42000
G1 X99.8 Y99.8 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2767
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 5.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/82
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.04 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z6.04
G1 Z5.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z5.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2767
M204 S6000
G1 X99.6 Y80.65 E.05388
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.002 Y86.742 Z6.16 F42000
G1 X87.901 Y93.501 Z6.16
G1 Z5.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2767
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z6.16 F42000
G1 Z5.76
G1 E.8 F1800
G1 F2767
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.226 Y93.904 Z6.16 F42000
M73 P75 R4
G1 X98.977 Y94.277 Z6.16
G1 Z5.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17741
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17617
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2767
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19501
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18664
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18554
; WIPE_START
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.064 Z6.16 F42000
G1 Z5.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2767
M204 S6000
G1 X98.5 Y85.936 E.21016
; WIPE_START
G1 F15000
G1 X98.5 Y87.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.523 Z6.16 F42000
G1 X99.8 Y99.8 Z6.16
G1 Z5.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526512
G1 F2767
M204 S6000
G1 X97.4 Y99.35 E.05388
; CHANGE_LAYER
; Z_HEIGHT: 5.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/82
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.16 I1.217 J.027 P1  F42000
G1 X99.8 Y81.1 Z6.16
G1 Z5.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.1 E.04757
G1 X97.2 Y80.2 E.01647
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.04 E.01537
; WIPE_START
M204 S6000
G1 X97.801 Y81.086 E-.76
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




G1 X97.4 Y80.65 F42000
G1 Z5.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526712
G1 F2767
M204 S6000
G1 X99.6 Y80.65 E.0539
; WIPE_START
G1 F15000
G1 X97.6 Y80.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.002 Y86.742 Z6.28 F42000
G1 X87.901 Y93.501 Z6.28
G1 Z5.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2767
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z6.28 F42000
G1 Z5.88
G1 E.8 F1800
G1 F2767
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.226 Y93.904 Z6.28 F42000
G1 X98.977 Y94.277 Z6.28
G1 Z5.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2767
M204 S6000
G1 X98.023 Y94.277 E.01977
G1 X98.023 Y85.723 E.17742
G1 X98.977 Y85.723 E.01977
G1 X98.977 Y94.217 E.17618
M204 S10000
G1 X99.401 Y94.701 F42000
G1 F2767
M204 S6000
G1 X97.599 Y94.701 E.03737
G1 X97.599 Y85.299 E.19502
G1 X99.401 Y85.299 E.03737
G1 X99.401 Y94.641 E.19377
M204 S250
G1 X99.8 Y95.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.1 E.04757
G1 X97.2 Y84.9 E.18665
G1 X99.8 Y84.9 E.04757
G1 X99.8 Y95.04 E.18555
; WIPE_START
M204 S6000
G1 X97.801 Y95.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.065 Z6.28 F42000
G1 Z5.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2767
M204 S6000
G1 X98.5 Y85.935 E.21017
; WIPE_START
G1 F15000
G1 X98.5 Y87.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.522 Z6.28 F42000
G1 X99.8 Y99.8 Z6.28
G1 Z5.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.9 E.01647
G1 X99.8 Y98.9 E.04757
G1 X99.8 Y99.74 E.01537
M204 S10000
G1 X99.6 Y99.35 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.526712
G1 F2767
M204 S6000
G1 X97.4 Y99.35 E.0539
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/82
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.28 I1.217 J.027 P1  F42000
G1 X99.8 Y81.106 Z6.28
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.106 E.04757
G1 X97.2 Y80.2 E.01657
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.046 E.01548
; WIPE_START
M204 S6000
G1 X97.801 Y81.092 E-.76
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




M73 P76 R4
G1 X97.4 Y80.653 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.532332
G1 F2769
M204 S6000
G1 X99.6 Y80.653 E.05451
; WIPE_START
G1 F15000
G1 X97.6 Y80.653 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.002 Y86.744 Z6.4 F42000
G1 X87.901 Y93.501 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2769
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2769
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.811 Y86.8 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F2769
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.225 Y93.908 Z6.4 F42000
G1 X98.977 Y94.282 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2769
M204 S6000
G1 X98.023 Y94.282 E.01977
G1 X98.023 Y85.718 E.17765
G1 X98.977 Y85.718 E.01977
G1 X98.977 Y94.222 E.17641
M204 S10000
G1 X99.401 Y94.707 F42000
G1 F2769
M204 S6000
G1 X97.599 Y94.707 E.03737
G1 X97.599 Y85.293 E.19525
G1 X99.401 Y85.293 E.03737
G1 X99.401 Y94.647 E.19401
M204 S250
G1 X99.8 Y95.106 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.106 E.04757
G1 X97.2 Y84.894 E.18685
G1 X99.8 Y84.894 E.04757
G1 X99.8 Y95.046 E.18575
; WIPE_START
M204 S6000
G1 X97.801 Y95.092 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.07 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2769
M204 S6000
G1 X98.5 Y85.93 E.21047
; WIPE_START
G1 F15000
G1 X98.5 Y87.93 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.331 Y95.517 Z6.4 F42000
G1 X99.8 Y99.8 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.894 E.01657
G1 X99.8 Y98.894 E.04757
G1 X99.8 Y99.74 E.01548
M204 S10000
G1 X99.6 Y99.347 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.532332
G1 F2769
M204 S6000
G1 X97.4 Y99.347 E.05451
; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.347 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/82
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.4 I1.217 J.027 P1  F42000
G1 X99.8 Y81.12 Z6.4
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.12 E.04757
G1 X97.2 Y80.2 E.01684
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.06 E.01574
; WIPE_START
M204 S6000
G1 X97.801 Y81.106 E-.76
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




G1 X97.4 Y80.66 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.546582
G1 F2776
M204 S6000
G1 X99.6 Y80.66 E.05604
; WIPE_START
G1 F15000
G1 X97.6 Y80.66 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93 Y86.75 Z6.52 F42000
G1 X87.901 Y93.501 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2776
M204 S6000
G1 X80.599 Y93.501 E.15145
G1 X80.599 Y92.899 E.01248
G1 X87.399 Y92.899 E.14105
G1 X87.399 Y87.101 E.12027
G1 X80.599 Y87.101 E.14105
G1 X80.599 Y86.499 E.01248
G1 X87.901 Y86.499 E.15145
G1 X87.901 Y93.441 E.14398
M204 S250
G1 X88.3 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
M204 S10000
G1 X87.611 Y93.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203005
G1 F2776
M204 S6000
G1 X87.6 Y93.2 E.00014
G1 X80.811 Y93.2 E.05883
; WIPE_START
G1 F15000
G1 X82.811 Y93.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P77 R4
G1 X80.811 Y86.8 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F2776
M204 S6000
G1 X87.6 Y86.8 E.05883
G1 X87.611 Y86.811 E.00014
; LINE_WIDTH: 0.160992
G1 X87.631 Y86.85 E.00029
; LINE_WIDTH: 0.122352
G1 X87.65 Y86.889 E.0002
; LINE_WIDTH: 0.103165
G1 X87.65 Y93.111 E.02355
G1 X87.631 Y93.15 E.00016
; LINE_WIDTH: 0.160992
G1 X87.611 Y93.189 E.00029
; WIPE_START
G1 F15000
G1 X87.631 Y93.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.224 Y93.917 Z6.52 F42000
G1 X98.977 Y94.297 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2776
M204 S6000
G1 X98.023 Y94.297 E.01977
G1 X98.023 Y85.703 E.17824
G1 X98.977 Y85.703 E.01977
G1 X98.977 Y94.237 E.177
M204 S10000
G1 X99.401 Y94.721 F42000
G1 F2776
M204 S6000
G1 X97.599 Y94.721 E.03737
G1 X97.599 Y85.279 E.19584
G1 X99.401 Y85.279 E.03737
G1 X99.401 Y94.661 E.1946
M204 S250
G1 X99.8 Y95.12 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.12 E.04757
G1 X97.2 Y84.88 E.18737
G1 X99.8 Y84.88 E.04757
G1 X99.8 Y95.06 E.18627
; WIPE_START
M204 S6000
G1 X97.801 Y95.106 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.084 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F2776
M204 S6000
G1 X98.5 Y85.916 E.2112
; WIPE_START
G1 F15000
G1 X98.5 Y87.916 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.33 Y95.503 Z6.52 F42000
G1 X99.8 Y99.8 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.88 E.01684
G1 X99.8 Y98.88 E.04757
G1 X99.8 Y99.74 E.01574
M204 S10000
G1 X99.6 Y99.34 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.546582
G1 F2776
M204 S6000
G1 X97.4 Y99.34 E.05604
; CHANGE_LAYER
; Z_HEIGHT: 6.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.34 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/82
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.52 I1.217 J.027 P1  F42000
G1 X99.8 Y81.143 Z6.52
G1 Z6.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y81.143 E.04757
G1 X97.2 Y80.2 E.01726
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.083 E.01616
; WIPE_START
M204 S6000
G1 X97.801 Y81.129 E-.76
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




G1 X97.4 Y80.672 F42000
G1 Z6.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.569602
G1 F15000
M204 S6000
G1 X99.6 Y80.672 E.05852
; WIPE_START
G1 X97.6 Y80.672 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.211 Y86.915 Z6.64 F42000
G1 X88.3 Y93.9 Z6.64
G1 Z6.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X80.2 Y93.9 E.14821
G1 X80.2 Y92.5 E.02562
G1 X87 Y92.5 E.12443
G1 X87 Y87.5 E.09149
G1 X80.2 Y87.5 E.12443
G1 X80.2 Y86.1 E.02562
G1 X88.3 Y86.1 E.14821
G1 X88.3 Y93.84 E.14163
; WIPE_START
M204 S6000
G1 X86.3 Y93.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.152 Y87.006 Z6.64 F42000
G1 Z6.24
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.400812
G1 F2100
M204 S800
G1 X87.562 Y86.417 E.0153
G1 X87.032 Y86.417 E.00973
G1 X87.983 Y87.368 E.02469
G1 X87.983 Y87.899 E.00973
G1 X86.333 Y86.248 E.04281
; WIPE_START
M204 S6000
G1 X87.747 Y87.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.906 Y87.352 Z6.64 F42000
G1 Z6.24
G1 E.8 F1800
G1 F2100
M204 S800
G1 X85.971 Y86.417 E.02425
G1 X85.44 Y86.417 E.00973
G1 X86.207 Y87.183 E.01989
G1 X85.677 Y87.183 E.00973
G1 X84.91 Y86.417 E.01989
G1 X84.379 Y86.417 E.00973
G1 X85.146 Y87.183 E.01989
G1 X84.616 Y87.183 E.00973
G1 X83.849 Y86.417 E.01989
G1 X83.319 Y86.417 E.00973
G1 X84.085 Y87.183 E.01989
G1 X83.555 Y87.183 E.00973
G1 X82.788 Y86.417 E.01989
G1 X82.258 Y86.417 E.00973
G1 X83.025 Y87.183 E.01989
G1 X82.494 Y87.183 E.00973
G1 X81.727 Y86.417 E.01989
G1 X81.197 Y86.417 E.00973
G1 X81.964 Y87.183 E.01989
G1 X81.433 Y87.183 E.00973
G1 X80.667 Y86.417 E.01989
G1 X80.517 Y86.417 E.00275
G1 X80.517 Y86.797 E.00698
G1 X81.071 Y87.352 E.01439
; WIPE_START
M204 S6000
G1 X80.517 Y86.797 E-.29811
G1 X80.517 Y86.417 E-.14458
G1 X80.667 Y86.417 E-.05698
G1 X81.151 Y86.901 E-.26034
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.148 Y87.594 Z6.64 F42000
G1 Z6.24
G1 E.8 F1800
G1 F2100
M204 S800
G1 X87.983 Y88.429 E.02166
G1 X87.983 Y88.96 E.00973
G1 X87.317 Y88.293 E.01729
G1 X87.317 Y88.823 E.00973
G1 X87.983 Y89.49 E.01729
G1 X87.983 Y90.021 E.00973
G1 X87.317 Y89.354 E.01729
G1 X87.317 Y89.884 E.00973
G1 X87.983 Y90.551 E.01729
G1 X87.983 Y91.081 E.00973
G1 X87.317 Y90.415 E.01729
G1 X87.317 Y90.945 E.00973
G1 X87.983 Y91.612 E.01729
G1 X87.983 Y92.142 E.00973
G1 X87.317 Y91.475 E.01729
G1 X87.317 Y92.006 E.00973
G1 X87.983 Y92.673 E.01729
M73 P78 R4
G1 X87.983 Y93.203 E.00973
G1 X87.317 Y92.536 E.01729
G1 X87.317 Y92.817 E.00514
G1 X87.067 Y92.817 E.00459
G1 X87.833 Y93.583 E.01989
G1 X87.303 Y93.583 E.00973
G1 X86.536 Y92.817 E.01989
G1 X86.006 Y92.817 E.00973
G1 X86.773 Y93.583 E.01989
G1 X86.242 Y93.583 E.00973
G1 X85.475 Y92.817 E.01989
G1 X84.945 Y92.817 E.00973
G1 X85.712 Y93.583 E.01989
G1 X85.181 Y93.583 E.00973
G1 X84.414 Y92.817 E.01989
G1 X83.884 Y92.817 E.00973
G1 X84.651 Y93.583 E.01989
G1 X84.12 Y93.583 E.00973
G1 X83.354 Y92.817 E.01989
G1 X82.823 Y92.817 E.00973
G1 X83.59 Y93.583 E.01989
G1 X83.06 Y93.583 E.00973
G1 X82.293 Y92.817 E.01989
G1 X81.762 Y92.817 E.00973
G1 X82.529 Y93.583 E.01989
G1 X81.999 Y93.583 E.00973
G1 X81.232 Y92.817 E.01989
G1 X80.702 Y92.817 E.00973
G1 X81.468 Y93.583 E.01989
G1 X80.938 Y93.583 E.00973
G1 X80.348 Y92.994 E.01529
; WIPE_START
M204 S6000
G1 X80.938 Y93.583 E-.31693
G1 X81.468 Y93.583 E-.20156
G1 X81.019 Y93.134 E-.24152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.635 Y93.637 Z6.64 F42000
G1 X98.977 Y94.32 Z6.64
G1 Z6.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X98.023 Y94.32 E.01977
G1 X98.023 Y85.68 E.1792
G1 X98.977 Y85.68 E.01977
G1 X98.977 Y94.26 E.17795
M204 S10000
G1 X99.401 Y94.744 F42000
G1 F4800
M204 S6000
G1 X97.599 Y94.744 E.03737
G1 X97.599 Y85.256 E.1968
G1 X99.401 Y85.256 E.03737
G1 X99.401 Y94.684 E.19555
M204 S250
G1 X99.8 Y95.143 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y95.143 E.04757
G1 X97.2 Y84.857 E.18822
G1 X99.8 Y84.857 E.04757
G1 X99.8 Y95.083 E.18712
; WIPE_START
M204 S6000
M73 P78 R3
G1 X97.801 Y95.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.107 Z6.64 F42000
G1 Z6.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F15000
M204 S6000
G1 X98.5 Y85.893 E.21239
; WIPE_START
G1 X98.5 Y87.893 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.328 Y95.48 Z6.64 F42000
G1 X99.8 Y99.8 Z6.64
G1 Z6.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.857 E.01726
G1 X99.8 Y98.857 E.04757
G1 X99.8 Y99.74 E.01616
M204 S10000
G1 X99.6 Y99.328 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.569602
G1 F15000
M204 S6000
G1 X97.4 Y99.328 E.05852
; CHANGE_LAYER
; Z_HEIGHT: 6.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.328 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/82
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.64 I1.217 J.027 P1  F42000
G1 X99.8 Y81.175 Z6.64
G1 Z6.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1219
M204 S1000
G1 X97.2 Y81.175 E.04757
G1 X97.2 Y80.2 E.01784
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.115 E.01675
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y81.161 E-.76
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




G1 X97.4 Y80.688 F42000
G1 Z6.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.601712
G1 F1219
M204 S6000
G1 X99.6 Y80.688 E.06197
; WIPE_START
G1 F15000
G1 X97.6 Y80.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.365 Y88.282 Z6.76 F42000
G1 X98.977 Y94.352 Z6.76
G1 Z6.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1219
M204 S6000
G1 X98.023 Y94.352 E.01977
G1 X98.023 Y85.648 E.18053
G1 X98.977 Y85.648 E.01977
G1 X98.977 Y94.292 E.17929
M204 S10000
G1 X99.401 Y94.776 F42000
G1 F1219
M204 S6000
G1 X97.599 Y94.776 E.03737
G1 X97.599 Y85.224 E.19813
G1 X99.401 Y85.224 E.03737
G1 X99.401 Y94.716 E.19689
M204 S250
G1 X99.8 Y95.175 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1219
M204 S1000
G1 X97.2 Y95.175 E.04757
G1 X97.2 Y84.825 E.18939
G1 X99.8 Y84.825 E.04757
G1 X99.8 Y95.115 E.18829
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y95.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.14 Z6.76 F42000
G1 Z6.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1219
M204 S6000
G1 X98.5 Y85.86 E.21405
; WIPE_START
G1 F15000
G1 X98.5 Y87.86 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.326 Y95.448 Z6.76 F42000
G1 X99.8 Y99.8 Z6.76
G1 Z6.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1219
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.825 E.01784
G1 X99.8 Y98.825 E.04757
G1 X99.8 Y99.74 E.01675
M204 S10000
G1 X99.6 Y99.312 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.601712
G1 F1219
M204 S6000
G1 X97.4 Y99.312 E.06197
; CHANGE_LAYER
; Z_HEIGHT: 6.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.312 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/82
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.76 I1.217 J.027 P1  F42000
G1 X99.8 Y81.215 Z6.76
G1 Z6.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1233
M204 S1000
G1 X99.8 Y81.217 E.00004
G1 X97.2 Y81.215 E.04757
G1 X97.2 Y80.2 E.01858
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.155 E.01748
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y81.217 E-.02354
G1 X97.862 Y81.216 E-.73646
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




G1 X97.4 Y80.709 F42000
G1 Z6.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.643662
G1 F1233
M204 S6000
G1 X99.6 Y80.709 E.06649
; WIPE_START
G1 F15000
G1 X97.6 Y80.709 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.364 Y88.303 Z6.88 F42000
G1 X98.977 Y94.394 Z6.88
G1 Z6.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1233
M204 S6000
G1 X98.023 Y94.394 E.01977
G1 X98.023 Y85.606 E.18227
G1 X98.977 Y85.606 E.01977
G1 X98.977 Y94.334 E.18103
M204 S10000
G1 X99.401 Y94.818 F42000
G1 F1233
M204 S6000
G1 X97.599 Y94.818 E.03737
G1 X97.599 Y85.182 E.19987
G1 X99.401 Y85.182 E.03737
G1 X99.401 Y94.758 E.19863
M204 S250
G1 X99.8 Y95.215 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1233
M204 S1000
G1 X99.8 Y95.217 E.00004
G1 X97.2 Y95.215 E.04757
G1 X97.2 Y84.785 E.19085
G1 X99.8 Y84.785 E.04757
G1 X99.8 Y95.155 E.18976
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y95.217 E-.02354
G1 X97.862 Y95.216 E-.73646
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.182 Z6.88 F42000
G1 Z6.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1233
M204 S6000
G1 X98.5 Y85.818 E.21622
; WIPE_START
G1 F15000
G1 X98.5 Y87.818 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.323 Y95.406 Z6.88 F42000
G1 X99.8 Y99.8 Z6.88
G1 Z6.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1233
M204 S1000
M73 P79 R3
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.785 E.01858
G1 X99.8 Y98.785 E.04757
G1 X99.8 Y99.74 E.01748
M204 S10000
G1 X99.6 Y99.291 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.643662
G1 F1233
M204 S6000
G1 X97.4 Y99.291 E.06649
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.4 Y99.291 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/82
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.88 I1.217 J0 P1  F42000
G1 X99.401 Y80.87 Z6.88
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1271
M204 S6000
G1 X97.599 Y80.87 E.03737
G1 X97.599 Y80.599 E.00562
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y80.81 E.00438
M204 S250
G1 X99.8 Y81.257 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1271
M204 S1000
G1 X99.8 Y81.27 E.00023
G1 X97.2 Y81.27 E.04757
G1 X97.2 Y81.257 E.00023
G1 X97.2 Y80.2 E.01934
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.197 E.01825
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y81.27 E-.02753
G1 X97.872 Y81.27 E-.73247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.51 Y88.875 Z7 F42000
G1 X98.977 Y94.446 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1271
M204 S6000
G1 X98.023 Y94.446 E.01977
G1 X98.023 Y85.554 E.18445
G1 X98.977 Y85.554 E.01977
G1 X98.977 Y94.386 E.1832
M204 S10000
G1 X99.401 Y94.87 F42000
G1 F1271
M204 S6000
G1 X97.599 Y94.87 E.03737
G1 X97.599 Y85.13 E.20205
G1 X99.401 Y85.13 E.03737
G1 X99.401 Y94.81 E.2008
M204 S250
G1 X99.8 Y95.257 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1271
M204 S1000
G1 X99.8 Y95.27 E.00023
G1 X97.2 Y95.27 E.04757
G1 X97.2 Y95.257 E.00023
G1 X97.2 Y84.743 E.19239
G1 X97.2 Y84.73 E.00023
G1 X99.8 Y84.73 E.04757
G1 X99.8 Y84.743 E.00023
G1 X99.8 Y95.197 E.19129
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y95.27 E-.02753
G1 X97.872 Y95.27 E-.73247
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




G1 X98.5 Y94.234 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1271
M204 S6000
G1 X98.5 Y85.766 E.21893
; WIPE_START
G1 F15000
G1 X98.5 Y87.766 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.089 Y95.376 Z7 F42000
G1 X99.401 Y99.401 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1271
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y99.13 E.00562
G1 X99.401 Y99.13 E.03737
G1 X99.401 Y99.341 E.00438
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1271
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.743 E.01934
G1 X97.2 Y98.73 E.00023
G1 X99.8 Y98.73 E.04757
G1 X99.8 Y98.743 E.00023
G1 X99.8 Y99.74 E.01825
; CHANGE_LAYER
; Z_HEIGHT: 6.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/82
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7 I1.213 J.103 P1  F42000
G1 X99.401 Y80.934 Z7
G1 Z6.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1300
M204 S6000
G1 X97.599 Y80.934 E.03737
G1 X97.599 Y80.599 E.00695
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y80.874 E.00571
M204 S250
G1 X99.8 Y81.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1300
M204 S1000
G1 X99.8 Y81.334 E.00044
G1 X97.2 Y81.334 E.04757
G1 X97.2 Y81.31 E.00044
G1 X97.2 Y80.2 E.0203
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.25 E.01921
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y81.334 E-.03194
G1 X97.884 Y81.334 E-.72806
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P80 R3
G1 X98.515 Y88.94 Z7.12 F42000
G1 X98.977 Y94.51 Z7.12
G1 Z6.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1300
M204 S6000
G1 X98.023 Y94.51 E.01977
G1 X98.023 Y85.49 E.1871
G1 X98.977 Y85.49 E.01977
G1 X98.977 Y94.45 E.18586
M204 S10000
G1 X99.401 Y94.934 F42000
G1 F1300
M204 S6000
G1 X97.599 Y94.934 E.03737
G1 X97.599 Y85.066 E.2047
G1 X99.401 Y85.066 E.03737
G1 X99.401 Y94.874 E.20346
M204 S250
G1 X99.8 Y95.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1300
M204 S1000
G1 X99.8 Y95.334 E.00044
G1 X97.2 Y95.334 E.04757
G1 X97.2 Y95.31 E.00044
G1 X97.2 Y84.69 E.19431
G1 X97.2 Y84.666 E.00044
G1 X99.8 Y84.666 E.04757
G1 X99.8 Y84.69 E.00044
G1 X99.8 Y95.25 E.19321
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y95.334 E-.03194
G1 X97.884 Y95.334 E-.72806
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




G1 X98.5 Y94.298 F42000
G1 Z6.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1300
M204 S6000
G1 X98.5 Y85.702 E.22225
; WIPE_START
G1 F15000
G1 X98.5 Y87.702 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.086 Y95.312 Z7.12 F42000
G1 X99.401 Y99.401 Z7.12
G1 Z6.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1300
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y99.066 E.00695
G1 X99.401 Y99.066 E.03737
G1 X99.401 Y99.341 E.00571
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1300
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.69 E.0203
G1 X97.2 Y98.666 E.00044
G1 X99.8 Y98.666 E.04757
G1 X99.8 Y98.69 E.00044
G1 X99.8 Y99.74 E.01921
; CHANGE_LAYER
; Z_HEIGHT: 6.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/82
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.12 I1.213 J.103 P1  F42000
G1 X99.401 Y81.012 Z7.12
G1 Z6.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1321
M204 S6000
G1 X97.599 Y81.012 E.03737
G1 X97.599 Y80.599 E.00856
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y80.952 E.00731
M204 S250
G1 X99.8 Y81.374 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1321
M204 S1000
G1 X99.8 Y81.411 E.00068
G1 X97.2 Y81.411 E.04757
G1 X97.2 Y81.374 E.00068
G1 X97.2 Y80.2 E.02148
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.314 E.02038
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y81.411 E-.03697
G1 X97.897 Y81.411 E-.72303
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.52 Y89.018 Z7.24 F42000
G1 X98.977 Y94.587 Z7.24
G1 Z6.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1321
M204 S6000
G1 X98.023 Y94.587 E.01977
G1 X98.023 Y85.413 E.19031
G1 X98.977 Y85.413 E.01977
G1 X98.977 Y94.527 E.18907
M204 S10000
G1 X99.401 Y95.012 F42000
G1 F1321
M204 S6000
G1 X97.599 Y95.012 E.03737
G1 X97.599 Y84.988 E.20791
G1 X99.401 Y84.988 E.03737
G1 X99.401 Y94.952 E.20667
M204 S250
G1 X99.8 Y95.374 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1321
M204 S1000
G1 X99.8 Y95.411 E.00068
G1 X97.2 Y95.411 E.04757
G1 X97.2 Y95.374 E.00068
G1 X97.2 Y84.626 E.19665
G1 X97.2 Y84.589 E.00068
G1 X99.8 Y84.589 E.04757
G1 X99.8 Y84.626 E.00068
G1 X99.8 Y95.314 E.19556
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y95.411 E-.03697
G1 X97.897 Y95.411 E-.72303
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




G1 X98.5 Y94.375 F42000
G1 Z6.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1321
M204 S6000
G1 X98.5 Y85.625 E.22624
; WIPE_START
G1 F15000
G1 X98.5 Y87.625 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.082 Y95.235 Z7.24 F42000
G1 X99.401 Y99.401 Z7.24
G1 Z6.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1321
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y98.988 E.00856
G1 X99.401 Y98.988 E.03737
G1 X99.401 Y99.341 E.00731
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1321
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.626 E.02148
G1 X97.2 Y98.589 E.00068
G1 X99.8 Y98.589 E.04757
G1 X99.8 Y98.626 E.00068
G1 X99.8 Y99.74 E.02038
; CHANGE_LAYER
; Z_HEIGHT: 6.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/82
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
M73 P81 R3
G3 Z7.24 I1.213 J.104 P1  F42000
G1 X99.401 Y81.105 Z7.24
G1 Z6.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1402
M204 S6000
G1 X97.599 Y81.105 E.03737
G1 X97.599 Y80.599 E.01048
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y81.045 E.00924
M204 S250
G1 X99.8 Y81.451 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1402
M204 S1000
G1 X99.8 Y81.504 E.00097
G1 X97.2 Y81.504 E.04757
G1 X97.2 Y81.451 E.00097
G1 X97.2 Y80.2 E.02289
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.391 E.02179
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y81.504 E-.04295
G1 X97.913 Y81.504 E-.71705
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




G1 X97.811 Y80.852 F42000
G1 Z6.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106992
G1 F1402
M204 S6000
G1 X99.189 Y80.852 E.00547
; WIPE_START
G1 F15000
G1 X97.811 Y80.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.452 Y88.457 Z7.36 F42000
G1 X98.977 Y94.68 Z7.36
G1 Z6.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1402
M204 S6000
G1 X98.023 Y94.68 E.01977
G1 X98.023 Y85.32 E.19417
G1 X98.977 Y85.32 E.01977
G1 X98.977 Y94.62 E.19293
M204 S10000
G1 X99.401 Y95.105 F42000
G1 F1402
M204 S6000
G1 X97.599 Y95.105 E.03737
G1 X97.599 Y84.895 E.21177
G1 X99.401 Y84.895 E.03737
G1 X99.401 Y95.045 E.21052
M204 S250
G1 X99.8 Y95.451 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1402
M204 S1000
G1 X99.8 Y95.504 E.00097
G1 X97.2 Y95.504 E.04757
G1 X97.2 Y95.451 E.00097
G1 X97.2 Y84.549 E.19948
G1 X97.2 Y84.496 E.00097
G1 X99.8 Y84.496 E.04757
G1 X99.8 Y84.549 E.00097
G1 X99.8 Y95.391 E.19838
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y95.504 E-.04295
G1 X97.913 Y95.504 E-.71705
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.468 Z7.36 F42000
G1 Z6.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1402
M204 S6000
G1 X98.5 Y85.532 E.23105
; WIPE_START
G1 F15000
G1 X98.5 Y87.532 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.078 Y95.142 Z7.36 F42000
G1 X99.401 Y99.401 Z7.36
G1 Z6.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1402
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y98.895 E.01048
G1 X99.401 Y98.895 E.03737
G1 X99.401 Y99.341 E.00924
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1402
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.549 E.02289
G1 X97.2 Y98.496 E.00097
G1 X99.8 Y98.496 E.04757
G1 X99.8 Y98.549 E.00097
G1 X99.8 Y99.74 E.02179
M204 S10000
G1 X99.189 Y99.148 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.106992
G1 F1402
M204 S6000
G1 X97.811 Y99.148 E.00547
; CHANGE_LAYER
; Z_HEIGHT: 7.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.189 Y99.148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/82
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.36 I1.217 J.014 P1  F42000
G1 X99.401 Y81.217 Z7.36
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1420
M204 S6000
G1 X97.599 Y81.217 E.03737
G1 X97.599 Y80.599 E.01281
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y81.157 E.01157
M204 S250
G1 X99.8 Y81.544 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1420
M204 S1000
G1 X99.8 Y81.616 E.00132
G1 X97.2 Y81.616 E.04757
G1 X97.2 Y81.544 E.00132
G1 X97.2 Y80.2 E.02459
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.484 E.02349
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y81.616 E-.05025
G1 X97.932 Y81.616 E-.70975
; WIPE_END
M73 P82 R3
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




G1 X97.811 Y80.908 F42000
G1 Z7.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.219232
G1 F1420
M204 S6000
G1 X99.189 Y80.908 E.01303
; WIPE_START
G1 F15000
G1 X97.811 Y80.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.45 Y88.514 Z7.48 F42000
G1 X98.977 Y94.793 Z7.48
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1420
M204 S6000
G1 X98.023 Y94.793 E.01977
G1 X98.023 Y85.207 E.19883
G1 X98.977 Y85.207 E.01977
G1 X98.977 Y94.733 E.19758
M204 S10000
G1 X99.401 Y95.217 F42000
G1 F1420
M204 S6000
G1 X97.599 Y95.217 E.03737
G1 X97.599 Y84.783 E.21643
G1 X99.401 Y84.783 E.03737
G1 X99.401 Y95.157 E.21518
M204 S250
G1 X99.8 Y95.544 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1420
M204 S1000
G1 X99.8 Y95.616 E.00132
G1 X97.2 Y95.616 E.04757
G1 X97.2 Y95.544 E.00132
G1 X97.2 Y84.456 E.20289
G1 X97.2 Y84.384 E.00132
G1 X99.8 Y84.384 E.04757
G1 X99.8 Y84.456 E.00132
G1 X99.8 Y95.484 E.20179
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y95.616 E-.05025
G1 X97.932 Y95.616 E-.70975
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.581 Z7.48 F42000
G1 Z7.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1420
M204 S6000
G1 X98.5 Y85.419 E.23686
; WIPE_START
G1 F15000
G1 X98.5 Y87.419 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.072 Y95.03 Z7.48 F42000
G1 X99.401 Y99.401 Z7.48
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1420
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y98.783 E.01281
G1 X99.401 Y98.783 E.03737
G1 X99.401 Y99.341 E.01157
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1420
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.456 E.02459
G1 X97.2 Y98.384 E.00132
G1 X99.8 Y98.384 E.04757
G1 X99.8 Y98.456 E.00132
G1 X99.8 Y99.74 E.02349
M204 S10000
G1 X99.189 Y99.092 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.219232
G1 F1420
M204 S6000
G1 X97.811 Y99.092 E.01303
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.189 Y99.092 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/82
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.48 I1.217 J.015 P1  F42000
G1 X99.401 Y81.355 Z7.48
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1457
M204 S6000
G1 X97.599 Y81.355 E.03737
G1 X97.599 Y80.599 E.01567
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y81.295 E.01443
M204 S250
G1 X99.8 Y81.656 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1457
M204 S1000
G1 X99.8 Y81.754 E.00179
G1 X97.2 Y81.754 E.04757
G1 X97.2 Y81.656 E.00179
G1 X97.2 Y80.2 E.02665
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.596 E.02555
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y81.754 E-.05996
G1 X97.958 Y81.754 E-.70004
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




G1 X97.811 Y80.977 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.357022
G1 F1457
M204 S6000
G1 X99.189 Y80.977 E.02231
; WIPE_START
G1 F15000
G1 X97.811 Y80.977 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.446 Y88.583 Z7.6 F42000
G1 X98.977 Y94.931 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1457
M204 S6000
G1 X98.023 Y94.931 E.01977
G1 X98.023 Y85.069 E.20454
G1 X98.977 Y85.069 E.01977
G1 X98.977 Y94.871 E.2033
M204 S10000
G1 X99.401 Y95.355 F42000
G1 F1457
M204 S6000
G1 X97.599 Y95.355 E.03737
G1 X97.599 Y84.645 E.22214
G1 X99.401 Y84.645 E.03737
G1 X99.401 Y95.295 E.2209
M204 S250
G1 X99.8 Y95.656 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1457
M204 S1000
G1 X99.8 Y95.754 E.00179
G1 X97.2 Y95.754 E.04757
G1 X97.2 Y95.656 E.00179
G1 X97.2 Y84.344 E.20699
G1 X97.2 Y84.246 E.00179
G1 X99.8 Y84.246 E.04757
G1 X99.8 Y84.344 E.00179
G1 X99.8 Y95.596 E.20589
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y95.754 E-.05996
G1 X97.958 Y95.754 E-.70004
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.718 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1457
M204 S6000
G1 X98.5 Y85.282 E.24398
; WIPE_START
G1 F15000
G1 X98.5 Y87.282 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.066 Y94.893 Z7.6 F42000
G1 X99.401 Y99.401 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1457
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y98.645 E.01567
G1 X99.401 Y98.645 E.03737
G1 X99.401 Y99.341 E.01443
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1457
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.344 E.02665
G1 X97.2 Y98.246 E.00179
G1 X99.8 Y98.246 E.04757
G1 X99.8 Y98.344 E.00179
G1 X99.8 Y99.74 E.02555
M204 S10000
G1 X99.189 Y99.023 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.357022
G1 F1457
M204 S6000
G1 X97.811 Y99.023 E.02231
; CHANGE_LAYER
; Z_HEIGHT: 7.32
; LAYER_HEIGHT: 0.12
; WIPE_START
M73 P83 R3
G1 F15000
G1 X99.189 Y99.023 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/82
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.6 I1.217 J.015 P1  F42000
G1 X99.401 Y81.53 Z7.6
G1 Z7.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1540
M204 S6000
G1 X97.599 Y81.53 E.03737
G1 X97.599 Y80.599 E.0193
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y81.47 E.01806
M204 S250
G1 X99.8 Y81.794 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1540
M204 S1000
G1 X99.8 Y81.929 E.00247
G1 X97.2 Y81.929 E.04757
G1 X97.2 Y81.794 E.00247
G1 X97.2 Y80.2 E.02917
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.734 E.02807
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y81.929 E-.07417
G1 X97.995 Y81.929 E-.68583
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




G1 X97.811 Y81.065 F42000
G1 Z7.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.532202
G1 F1540
M204 S6000
G1 X99.189 Y81.065 E.0341
; WIPE_START
G1 F15000
G1 X97.811 Y81.065 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.443 Y88.671 Z7.72 F42000
G1 X98.977 Y95.106 Z7.72
G1 Z7.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1540
M204 S6000
G1 X98.023 Y95.106 E.01977
G1 X98.023 Y84.894 E.21181
G1 X98.977 Y84.894 E.01977
G1 X98.977 Y95.046 E.21056
M204 S10000
G1 X99.401 Y95.53 F42000
G1 F1540
M204 S6000
G1 X97.599 Y95.53 E.03737
G1 X97.599 Y84.47 E.22941
G1 X99.401 Y84.47 E.03737
G1 X99.401 Y95.47 E.22816
M204 S250
G1 X99.8 Y95.794 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1540
M204 S1000
G1 X99.8 Y95.929 E.00247
G1 X97.2 Y95.929 E.04757
G1 X97.2 Y95.794 E.00247
G1 X97.2 Y84.206 E.21204
G1 X97.2 Y84.071 E.00247
G1 X99.8 Y84.071 E.04757
G1 X99.8 Y84.206 E.00247
G1 X99.8 Y95.734 E.21094
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y95.929 E-.07417
G1 X97.995 Y95.929 E-.68583
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.5 Y94.894 Z7.72 F42000
G1 Z7.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1540
M204 S6000
G1 X98.5 Y85.106 E.25304
; WIPE_START
G1 F15000
G1 X98.5 Y87.106 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.058 Y94.718 Z7.72 F42000
G1 X99.401 Y99.401 Z7.72
G1 Z7.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1540
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y98.47 E.0193
G1 X99.401 Y98.47 E.03737
G1 X99.401 Y99.341 E.01806
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1540
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.206 E.02917
G1 X97.2 Y98.071 E.00247
G1 X99.8 Y98.071 E.04757
G1 X99.8 Y98.206 E.00247
G1 X99.8 Y99.74 E.02807
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.189 Y98.935 Z7.72 F42000
G1 Z7.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.532202
G1 F1540
M204 S6000
G1 X97.811 Y98.935 E.0341
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 7.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X99.189 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/82
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
M73 P83 R2
G3 Z7.72 I1.217 J-.015 P1  F42000
G1 X98.977 Y81.349 Z7.72
G1 Z7.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1583
M204 S6000
G1 X98.023 Y81.349 E.01977
G1 X98.023 Y81.023 E.00676
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y81.289 E.00551
M204 S10000
G1 X99.401 Y81.773 F42000
G1 F1583
M204 S6000
G1 X97.599 Y81.773 E.03737
G1 X97.599 Y80.599 E.02435
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y81.713 E.02311
M204 S250
G1 X99.8 Y81.969 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1583
M204 S1000
G1 X99.8 Y82.173 E.00372
G1 F1560
G1 X97.2 Y82.173 E.04757
M106 S201.45
G1 F1583
G1 X97.2 Y81.969 E.00372
G1 X97.2 Y80.2 E.03237
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y81.909 E.03127
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y82.173 E-.10011
G1 X98.063 Y82.173 E-.65989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.84 I-1.214 J.084 P1  F42000
M106 S255
G1 X98.977 Y95.349 Z7.84
G1 Z7.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P84 R2
G1 F1583
M204 S6000
G1 X98.023 Y95.349 E.01977
G1 X98.023 Y84.651 E.22191
G1 X98.977 Y84.651 E.01977
G1 X98.977 Y95.289 E.22066
M204 S10000
G1 X99.401 Y95.773 F42000
G1 F1583
M204 S6000
G1 X97.599 Y95.773 E.03737
G1 X97.599 Y84.227 E.23951
G1 X99.401 Y84.227 E.03737
G1 X99.401 Y95.713 E.23826
M204 S250
G1 X99.8 Y95.969 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1583
M204 S1000
G1 X99.8 Y96.173 E.00372
G1 F1560
G1 X97.2 Y96.173 E.04757
M106 S201.45
M106 S255
G1 F1583
G1 X97.2 Y95.969 E.00372
G1 X97.2 Y84.031 E.21845
G1 X97.2 Y83.827 E.00372
G1 F1560
G1 X99.8 Y83.827 E.04757
M106 S201.45
G1 F1583
G1 X99.8 Y84.031 E.00372
M106 S255
G1 X99.8 Y95.909 E.21735
; WIPE_START
G1 F2400
M204 S6000
G1 X99.8 Y96.173 E-.10011
G1 X98.063 Y96.173 E-.65989
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




G1 X98.5 Y95.137 F42000
G1 Z7.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1583
M204 S6000
G1 X98.5 Y84.863 E.26563
; WIPE_START
G1 F15000
G1 X98.5 Y86.863 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.8 Y94.49 Z7.84 F42000
G1 X98.977 Y98.977 Z7.84
G1 Z7.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1583
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y98.651 E.00676
G1 X98.977 Y98.651 E.01977
G1 X98.977 Y98.917 E.00551
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1583
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y98.227 E.02435
G1 X99.401 Y98.227 E.03737
G1 X99.401 Y99.341 E.02311
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1583
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y98.031 E.03237
G1 X97.2 Y97.827 E.00372
G1 F1560
G1 X99.8 Y97.827 E.04757
M106 S201.45
G1 F1583
G1 X99.8 Y98.031 E.00372
G1 X99.8 Y99.74 E.03127
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 7.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/82
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.84 I.69 J1.002 P1  F42000
G1 X98.977 Y98.977 Z7.84
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1662
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y98.21 E.0159
G1 X98.023 Y97.81 E.0083
G1 X98.023 Y97.427 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X98.023 Y96.573 E.01773
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1662
M204 S6000
G1 X98.023 Y96.19 E.00793
M106 S201.45
M106 S255
G1 X98.023 Y95.79 E.0083
G1 X98.023 Y84.21 E.2402
G1 X98.023 Y83.81 E.0083
G1 X98.023 Y83.427 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X98.023 Y82.573 E.01773
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1662
M204 S6000
G1 X98.023 Y82.19 E.00793
M106 S201.45
M106 S255
G1 X98.023 Y81.79 E.0083
G1 X98.023 Y81.023 E.0159
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y81.79 E.0159
G1 X98.977 Y82.19 E.0083
G1 X98.977 Y82.573 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X98.977 Y83.427 E.01773
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1662
M204 S6000
G1 X98.977 Y83.81 E.00793
M106 S201.45
M106 S255
G1 X98.977 Y84.21 E.0083
G1 X98.977 Y95.79 E.2402
G1 X98.977 Y96.19 E.0083
G1 X98.977 Y96.573 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X98.977 Y97.427 E.01773
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1662
M204 S6000
G1 X98.977 Y97.81 E.00793
M106 S201.45
M106 S255
G1 X98.977 Y98.21 E.0083
G1 X98.977 Y98.917 E.01466
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1662
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y98.21 E.0247
G1 X97.599 Y97.81 E.0083
G1 X97.599 Y97.427 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X97.599 Y96.573 E.01773
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1662
M204 S6000
G1 X97.599 Y96.19 E.00793
M106 S201.45
M106 S255
G1 X97.599 Y95.79 E.0083
G1 X97.599 Y84.21 E.2402
G1 X97.599 Y83.81 E.0083
G1 X97.599 Y83.427 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X97.599 Y82.573 E.01773
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1662
M204 S6000
G1 X97.599 Y82.19 E.00793
M106 S201.45
M106 S255
G1 X97.599 Y81.79 E.0083
G1 X97.599 Y80.599 E.0247
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y81.79 E.0247
G1 X99.401 Y82.19 E.0083
G1 X99.401 Y82.573 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X99.401 Y83.427 E.01773
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1662
M204 S6000
G1 X99.401 Y83.81 E.00793
M106 S201.45
M106 S255
G1 X99.401 Y84.21 E.0083
G1 X99.401 Y95.79 E.2402
G1 X99.401 Y96.19 E.0083
G1 X99.401 Y96.573 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S1000
G1 X99.401 Y97.427 E.01773
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1662
M204 S6000
G1 X99.401 Y97.81 E.00793
M106 S201.45
M106 S255
G1 X99.401 Y98.21 E.0083
G1 X99.401 Y99.341 E.02346
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1662
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y97.787 E.03683
G1 X97.2 Y97.427 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X97.2 Y96.573 E.01773
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1662
G1 X97.2 Y96.213 E.00659
G1 X97.2 Y83.787 E.22736
G1 X97.2 Y83.427 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X97.2 Y82.573 E.01773
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1662
G1 X97.2 Y82.213 E.00659
G1 X97.2 Y80.2 E.03683
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y82.213 E.03683
M73 P85 R2
G1 X99.8 Y82.573 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X99.8 Y83.427 E.01773
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1662
G1 X99.8 Y83.787 E.00659
G1 X99.8 Y96.213 E.22736
G1 X99.8 Y96.573 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X99.8 Y97.427 E.01773
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1662
G1 X99.8 Y97.787 E.00659
G1 X99.8 Y99.74 E.03573
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z7.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1662
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 7.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/82
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.96 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z7.96
G1 Z7.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z7.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/82
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.08 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z8.08
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 7.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/82
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.2 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z8.2
G1 Z7.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z7.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 8.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/82
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.32 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z8.32
G1 Z8.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z8.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 8.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/82
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.44 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z8.44
G1 Z8.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
M73 P86 R2
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z8.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 8.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/82
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.56 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z8.56
G1 Z8.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




M73 P87 R2
G1 X98.5 Y98.764 F42000
G1 Z8.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/82
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.68 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z8.68
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 8.52
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/82
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.8 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z8.8
G1 Z8.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
; WIPE_END
M73 P88 R2
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




G1 X98.5 Y98.764 F42000
G1 Z8.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 8.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/82
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.92 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z8.92
G1 Z8.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z8.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 8.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/82
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.04 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z9.04
G1 Z8.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
M73 P89 R2
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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
M73 P89 R1
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




G1 X98.5 Y98.764 F42000
G1 Z8.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 8.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/82
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.16 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z9.16
G1 Z8.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z8.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
M73 P90 R1
G1 E-.04 F1800
; layer num/total_layer_count: 74/82
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.28 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z9.28
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/82
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.4 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z9.4
G1 Z9.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




M73 P91 R1
G1 X98.5 Y98.764 F42000
G1 Z9.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
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
G1 X98.977 Y98.977 Z9.52
G1 Z9.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z9.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
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
G1 X98.977 Y98.977 Z9.64
G1 Z9.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
M73 P92 R1
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z9.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
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
G1 X98.977 Y98.977 Z9.76
G1 Z9.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z9.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
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
G1 X98.977 Y98.977 Z9.88
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
M73 P93 R1
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
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
G1 X98.977 Y98.977 Z10
G1 Z9.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z9.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/82
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
M73 P94 R1
G3 Z10.12 I-1.216 J.037 P1  F42000
G1 X98.977 Y98.977 Z10.12
G1 Z9.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1697
M204 S6000
G1 X98.023 Y98.977 E.01977
G1 X98.023 Y81.023 E.37239
G1 X98.977 Y81.023 E.01977
G1 X98.977 Y98.917 E.37115
M204 S10000
G1 X99.401 Y99.401 F42000
G1 F1697
M204 S6000
G1 X97.599 Y99.401 E.03737
G1 X97.599 Y80.599 E.38999
G1 X99.401 Y80.599 E.03737
G1 X99.401 Y99.341 E.38875
M204 S250
G1 X99.8 Y99.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1697
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X98.5 Y98.764 F42000
G1 Z9.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554552
G1 F1697
M204 S6000
G1 X98.5 Y81.236 E.45319
; CHANGE_LAYER
; Z_HEIGHT: 9.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X98.5 Y83.236 E-.76
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
G1 X99.8 Y99.8 Z10.24
M73 P94 R0
G1 Z9.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1942
M204 S1000
G1 X97.2 Y99.8 E.04757
G1 X97.2 Y80.2 E.35864
G1 X99.8 Y80.2 E.04757
G1 X99.8 Y99.74 E.35754
; WIPE_START
G1 F2400
M204 S6000
G1 X97.801 Y99.786 E-.76
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




G1 X99.652 Y98.876 F42000
G1 Z9.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.409032
G1 F1942
M204 S800
G1 X99.045 Y99.483 E.01609
M73 P95 R0
G1 X98.502 Y99.483 E.01016
G1 X99.483 Y98.502 E.026
G1 X99.483 Y97.96 E.01016
G1 X97.96 Y99.483 E.04036
G1 X97.517 Y99.483 E.00832
G1 X97.517 Y99.385 E.00184
G1 X99.483 Y97.418 E.05212
G1 X99.483 Y96.876 E.01016
G1 X97.517 Y98.843 E.05212
G1 X97.517 Y98.301 E.01016
G1 X99.483 Y96.334 E.05212
G1 X99.483 Y95.792 E.01016
G1 X97.517 Y97.759 E.05212
G1 X97.517 Y97.217 E.01016
G1 X99.483 Y95.25 E.05212
G1 X99.483 Y94.708 E.01016
G1 X97.517 Y96.675 E.05212
G1 X97.517 Y96.133 E.01016
G1 X99.483 Y94.166 E.05212
G1 X99.483 Y93.624 E.01016
G1 X97.517 Y95.591 E.05212
G1 X97.517 Y95.049 E.01016
G1 X99.483 Y93.082 E.05212
G1 X99.483 Y92.54 E.01016
G1 X97.517 Y94.507 E.05212
G1 X97.517 Y93.965 E.01016
G1 X99.483 Y91.998 E.05212
G1 X99.483 Y91.456 E.01016
G1 X97.517 Y93.423 E.05212
G1 X97.517 Y92.881 E.01016
G1 X99.483 Y90.914 E.05212
G1 X99.483 Y90.372 E.01016
G1 X97.517 Y92.339 E.05212
G1 X97.517 Y91.797 E.01016
G1 X99.483 Y89.83 E.05212
G1 X99.483 Y89.288 E.01016
G1 X97.517 Y91.255 E.05212
G1 X97.517 Y90.713 E.01016
G1 X99.483 Y88.746 E.05212
G1 X99.483 Y88.204 E.01016
G1 X97.517 Y90.17 E.05212
G1 X97.517 Y89.628 E.01016
G1 X99.483 Y87.662 E.05212
G1 X99.483 Y87.12 E.01016
G1 X97.517 Y89.086 E.05212
G1 X97.517 Y88.544 E.01016
G1 X99.483 Y86.578 E.05212
G1 X99.483 Y86.036 E.01016
G1 X97.517 Y88.002 E.05212
G1 X97.517 Y87.46 E.01016
G1 X99.483 Y85.494 E.05212
G1 X99.483 Y84.951 E.01016
G1 X97.517 Y86.918 E.05212
G1 X97.517 Y86.376 E.01016
G1 X99.483 Y84.409 E.05212
G1 X99.483 Y83.867 E.01016
G1 X97.517 Y85.834 E.05212
G1 X97.517 Y85.292 E.01016
G1 X99.483 Y83.325 E.05212
G1 X99.483 Y82.783 E.01016
G1 X97.517 Y84.75 E.05212
G1 X97.517 Y84.208 E.01016
G1 X99.483 Y82.241 E.05212
G1 X99.483 Y81.699 E.01016
G1 X97.517 Y83.666 E.05212
G1 X97.517 Y83.124 E.01016
M73 P96 R0
G1 X99.483 Y81.157 E.05212
G1 X99.483 Y80.615 E.01016
G1 X97.517 Y82.582 E.05212
G1 X97.517 Y82.04 E.01016
G1 X99.04 Y80.517 E.04037
G1 X98.498 Y80.517 E.01016
G1 X97.517 Y81.498 E.026
G1 X97.517 Y80.956 E.01016
G1 X98.124 Y80.348 E.0161
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F2100
M204 S6000
G1 X97.517 Y80.956 E-.32654
G1 X97.517 Y81.498 E-.20598
G1 X97.94 Y81.075 E-.22749
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

