; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 17m 5s; total estimated time: 23m 45s
; total layer number: 166
; total filament length [mm] : 421.35
; total filament volume [cm^3] : 1013.46
; total filament weight [g] : 1.28
; filament_density: 1.26
; filament_diameter: 1.75
; max_z_height: 20.04
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
M73 P0 R23
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
M73 P2 R23
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA

    M104 S220

    G92 E0
    G1 E50 F523.843
    M400
    M106 P1 S178
    G92 E0
M73 P3 R23
    G1 E5 F523.843
    M109 S200 ; drop nozzle temp, make filament shink a bit
    M104 S180
    G92 E0
M73 P3 R22
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
M73 P22 R18
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
    G29 A1 X85 Y80 I17.162 J20
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
    
M73 P23 R18
    G1 X-13.5 F3000
    M400
    M984 A0.1 E1 S1 F0.748496 H0.4
    M106 P1 S178
    M400 S7
    G1 X0 F18000
M73 P24 R18
    G1 X-13.5 F3000
    G1 X0 F18000 ;wipe and shake
M73 P24 R17
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
; layer num/total_layer_count: 1/166
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 12
G1 X98.186 Y84.132 F42000
M204 S6000
G1 Z.4
M73 P25 R17
G1 Z.24
M73 P26 R17
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X101.488 Y89.984 I-.406 J4.086 E.34513
G3 X95.45 Y95.159 I-3.682 J1.814 E.4752
G1 X95.45 Y84.853 E.45198
G3 X98.12 Y84.124 I2.23 J2.916 E.12444
M204 S6000
G1 X101.461 Y93.104 F42000
G1 F3000
M204 S500
G2 X101.411 Y90.987 I-9.418 J-.836 E.09304
G1 X101.06 Y89.984 E.04662
G1 X101.401 Y89.01 E.04526
G2 X100.963 Y86.323 I-3.735 J-.77 E.12209
G1 X100.963 Y93.696 E.32336
G3 X100.465 Y94.353 I-1.687 J-.763 E.03644
G1 X100.465 Y85.662 E.38114
G2 X99.966 Y85.214 I-1.229 J.868 E.02962
G1 X99.966 Y94.798 E.42029
G1 X99.468 Y95.111 E.02581
G1 X99.468 Y84.901 E.44775
G2 X98.97 Y84.709 I-.671 J.995 E.02363
M73 P27 R17
G1 X98.97 Y95.302 E.46459
G3 X98.471 Y95.44 I-.552 J-1.023 E.02287
G1 X98.471 Y84.57 E.47672
G1 X97.973 Y84.514 E.02199
G1 X97.973 Y95.496 E.48165
M73 P28 R17
G3 X97.475 Y95.479 I-.212 J-1.1 E.02205
G1 X97.475 Y84.531 E.48015
G2 X96.976 Y84.588 I-.126 J1.11 E.02218
G1 X96.976 Y95.423 E.4752
G1 X96.478 Y95.249 E.02315
G1 X96.478 Y84.762 E.45992
G2 X95.98 Y84.997 I.266 J1.209 E.02437
G1 X95.98 Y95.254 E.44982
; WIPE_START
; WIPE_END
G1 E-.8 F1800
M204 S6000
G1 X89.193 Y98.745 Z.64 F42000
G1 X88.795 Y98.95 Z.64
G1 Z.24
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X88.566 Y98.936 E.01003
G3 X88.795 Y95.05 I.234 J-1.936 E.2582
G1 X90.804 Y95.05 E.08808
G3 X90.879 Y98.949 I-.004 J1.95 E.265
G1 X88.855 Y98.95 E.08877
; WIPE_START
G1 X88.566 Y98.936 E-.10971
G1 X88.416 Y98.912 E-.05794
G1 X88.154 Y98.84 E-.10332
G1 X88.01 Y98.783 E-.05857
G1 X87.767 Y98.654 E-.10447
G1 X87.549 Y98.496 E-.10251
G1 X87.435 Y98.393 E-.05839
G1 X87.328 Y98.28 E-.05915
G1 X87.232 Y98.159 E-.05858
G1 X87.162 Y98.056 E-.04736
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X88.105 Y90.482 Z.64 F42000
G1 X88.795 Y84.95 Z.64
G1 Z.24
G1 E.8 F1800
G1 F3000
M204 S500
G1 X88.566 Y84.936 E.01003
G3 X88.795 Y81.05 I.234 J-1.936 E.25819
G1 X90.804 Y81.05 E.08808
G3 X90.879 Y84.949 I-.004 J1.95 E.265
G1 X88.855 Y84.95 E.08877
; WIPE_START
G1 X88.566 Y84.936 E-.10971
G1 X88.416 Y84.912 E-.05794
G1 X88.154 Y84.84 E-.10332
G1 X88.01 Y84.783 E-.05857
G1 X87.767 Y84.654 E-.10447
G1 X87.549 Y84.496 E-.10249
G1 X87.435 Y84.393 E-.0584
G1 X87.328 Y84.28 E-.05915
G1 X87.232 Y84.159 E-.05858
G1 X87.162 Y84.056 E-.04736
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X86.75 Y91.678 Z.64 F42000
G1 X86.595 Y94.54 Z.64
G1 Z.24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X86.595 Y85.458 E.3983
G2 X88.778 Y86.296 I2.227 J-2.541 E.10468
G1 X90.939 Y86.294 E.09479
G2 X93.118 Y85.344 I-.16 J-3.342 E.10655
G1 X93.405 Y85.034 E.01853
G1 X93.405 Y94.973 E.43589
G1 X93.155 Y94.692 E.0165
G2 X90.824 Y93.705 I-2.364 J2.337 E.1139
G1 X88.768 Y93.705 E.09014
G2 X86.895 Y94.309 I.028 J3.291 E.08767
G1 X86.643 Y94.503 E.01394
; WIPE_START
G1 X86.632 Y92.503 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X88.796 Y85.843 Z.64 F42000
G1 Z.24
G1 E.8 F1800
G1 F3000
M204 S500
G1 X90.919 Y85.846 E.09311
G2 X93.523 Y83.837 I-.124 J-2.852 E.15367
G1 X93.617 Y83.464 E.0169
M73 P28 R16
G1 X93.853 Y83.493 E.01042
G1 X93.853 Y96.516 E.57113
G1 X93.615 Y96.544 E.01052
G2 X92.151 Y94.493 I-2.859 J.493 E.11426
G2 X90.817 Y94.153 I-1.359 J2.543 E.06099
G1 X88.777 Y94.153 E.08946
G2 X86.345 Y95.561 I.019 J2.837 E.12897
G1 X86.147 Y95.507 E.00899
G1 X86.147 Y84.497 E.48287
G1 X86.337 Y84.438 E.00872
G2 X88.63 Y85.842 I2.485 J-1.484 E.12264
G1 X88.736 Y85.843 E.00464
; WIPE_START
G1 X90.736 Y85.845 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X93.615 Y82.544 Z.64 F42000
G1 Z.24
G1 E.8 F1800
G1 F3000
M204 S500
G2 X93.188 Y81.448 I-2.934 J.511 E.05192
G1 X92.971 Y81.147 E.01628
G1 X93.853 Y81.147 E.0387
G1 X93.853 Y82.516 E.06005
G1 X93.674 Y82.537 E.00789
; WIPE_START
G1 X93.538 Y82.216 E-.13234
G1 X93.447 Y81.949 E-.10737
G1 X93.33 Y81.692 E-.10719
G1 X93.188 Y81.448 E-.1074
G1 X92.971 Y81.147 E-.14103
G1 X93.404 Y81.147 E-.16467
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X86.345 Y81.561 Z.64 F42000
G1 Z.24
G1 E.8 F1800
G1 F3000
M204 S500
G1 X86.147 Y81.507 E.00899
G1 X86.147 Y81.147 E.01579
G1 X86.625 Y81.147 E.02098
G1 X86.412 Y81.448 E.01617
G1 X86.375 Y81.51 E.00316
; WIPE_START
G1 X86.147 Y81.507 E-.11514
G1 X86.147 Y81.147 E-.1815
G1 X86.625 Y81.147 E-.24114
G1 X86.412 Y81.448 E-.18589
G1 X86.375 Y81.51 E-.03633
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X86.482 Y89.142 Z.64 F42000
G1 X86.619 Y98.853 Z.64
G1 Z.24
G1 E.8 F1800
G1 F3000
M204 S500
G1 X86.147 Y98.853 E.02069
G1 X86.147 Y98.497 E.01562
G1 X86.337 Y98.438 E.00872
G1 X86.585 Y98.803 E.01936
; WIPE_START
G1 X86.147 Y98.853 E-.23314
G1 X86.147 Y98.497 E-.18837
G1 X86.337 Y98.438 E-.10508
G1 X86.585 Y98.803 E-.23341
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X92.966 Y98.853 Z.64 F42000
G1 Z.24
G1 E.8 F1800
G1 F3000
M204 S500
G2 X93.523 Y97.837 I-2.239 J-1.889 E.05114
G1 X93.617 Y97.464 E.0169
G1 X93.853 Y97.493 E.01042
G1 X93.853 Y98.853 E.05963
G1 X93.026 Y98.853 E.03629
; WIPE_START
G1 X93.156 Y98.6 E-.10813
G1 X93.304 Y98.359 E-.10755
G1 X93.425 Y98.105 E-.10698
G1 X93.523 Y97.837 E-.10809
G1 X93.617 Y97.464 E-.14642
G1 X93.853 Y97.493 E-.09027
G1 X93.853 Y97.737 E-.09256
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X90.945 Y90.68 Z.64 F42000
G1 X88.767 Y85.397 Z.64
G1 Z.24
G1 E.8 F1800
G1 F3000
M204 S500
G1 X88.79 Y85.399 E.00101
G1 X90.899 Y85.397 E.09247
G2 X91.954 Y80.897 I-.102 J-2.398 E.27318
G1 X92.008 Y80.698 E.00904
G1 X94.302 Y80.698 E.1006
G1 X94.302 Y99.302 E.81586
G1 X92.007 Y99.302 E.10064
G1 X91.955 Y99.1 E.00913
G2 X90.81 Y94.602 I-1.156 J-2.101 E.27693
G1 X88.786 Y94.602 E.08877
G2 X87.646 Y99.103 I.016 J2.399 E.27695
G1 X87.592 Y99.302 E.00904
G1 X85.698 Y99.302 E.08305
G1 X85.698 Y80.698 E.81586
G1 X87.589 Y80.698 E.08291
G1 X87.646 Y80.891 E.00881
G2 X86.401 Y83.047 I1.2 J2.13 E.11454
G2 X88.511 Y85.381 I2.402 J-.051 E.1504
G1 X88.707 Y85.393 E.00865
; WIPE_START
G1 X88.79 Y85.399 E-.03156
G1 X90.707 Y85.397 E-.72844
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X92.777 Y92.744 Z.64 F42000
G1 X94.75 Y99.75 Z.64
G1 Z.24
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X85.25 Y99.75 E.41663
G1 X85.25 Y80.25 E.85519
G1 X94.75 Y80.25 E.41663
G1 X94.75 Y99.69 E.85256
; WIPE_START
G1 X92.75 Y99.703 E-.76
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




G1 X91.763 Y99.256 F42000
G1 Z.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.501565
G1 F3000
M204 S500
G3 X91.408 Y99.311 I-1.523 J-8.695 E.01583
; LINE_WIDTH: 0.464784
G1 X91.263 Y99.327 E.00588
; LINE_WIDTH: 0.408657
G1 X90.889 Y99.349 E.01309
G1 X88.793 Y99.35 E.07318
G1 X88.522 Y99.342 E.00948
G1 X88.327 Y99.326 E.00682
; LINE_WIDTH: 0.467578
G1 X88.178 Y99.309 E.00612
; LINE_WIDTH: 0.501649
G1 X87.836 Y99.258 E.0152
M204 S6000
G1 X87.142 Y99.057 F42000
; LINE_WIDTH: 0.127089
G1 F3000
M204 S500
G1 X87.067 Y99.03 E.00058
G1 X86.955 Y98.901 E.00127
; WIPE_START
G1 X87.067 Y99.03 E-.52048
G1 X87.142 Y99.057 E-.23952
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X86.188 Y98.25 Z.64 F42000
G1 Z.24
G1 E.8 F1800
; LINE_WIDTH: 0.48238
M73 P29 R16
G1 F3000
M204 S500
G1 X86.13 Y97.938 E.01334
; LINE_WIDTH: 0.447753
G1 X86.112 Y97.822 E.00456
; LINE_WIDTH: 0.415003
G1 X86.097 Y97.72 E.00366
; LINE_WIDTH: 0.374994
G1 X86.072 Y97.499 E.00703
; LINE_WIDTH: 0.318969
G1 X86.05 Y97.059 E.01154
G1 X86.062 Y96.626 E.01132
; LINE_WIDTH: 0.346605
G1 X86.078 Y96.439 E.00542
; LINE_WIDTH: 0.387239
G1 X86.103 Y96.236 E.0067
; LINE_WIDTH: 0.430082
G1 X86.122 Y96.117 E.00445
; LINE_WIDTH: 0.465838
G1 X86.138 Y96.013 E.00428
; LINE_WIDTH: 0.493188
G1 X86.191 Y95.752 E.01151
M204 S6000
G1 X86.371 Y95.051 F42000
; LINE_WIDTH: 0.119476
G1 F3000
M204 S500
G1 X86.483 Y94.943 E.00103
; WIPE_START
G1 X86.371 Y95.051 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X93.459 Y95.413 Z.64 F42000
G1 Z.24
G1 E.8 F1800
; LINE_WIDTH: 0.134254
G1 F3000
M204 S500
G1 X93.629 Y95.657 E.00241
; WIPE_START
G1 X93.459 Y95.413 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X93.61 Y98.303 Z.64 F42000
G1 Z.24
G1 E.8 F1800
; LINE_WIDTH: 0.19351
G1 F3000
M204 S500
G3 X93.524 Y98.629 I-6.698 J-1.598 E.00468
; WIPE_START
G1 X93.61 Y98.303 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X92.897 Y90.704 Z.64 F42000
G1 X92.46 Y86.05 Z.64
G1 Z.24
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.507744
G1 F6300
M204 S500
G1 X93.023 Y86.613 E.03553
G1 X93.023 Y87.259 E.02879
G1 X92.174 Y86.409 E.05359
G1 X92.089 Y86.446 E.00413
G1 X91.687 Y86.568 E.01873
G1 X93.023 Y87.904 E.0843
G1 X93.023 Y88.549 E.02879
G1 X91.134 Y86.659 E.11922
G1 X90.956 Y86.675 E.00795
G1 X90.505 Y86.676 E.02014
G1 X93.023 Y89.194 E.15891
G1 X93.023 Y89.839 E.02879
G1 X89.86 Y86.676 E.19959
G1 X89.215 Y86.676 E.02877
G1 X93.023 Y90.485 E.24027
G1 X93.023 Y91.13 E.02879
G1 X88.563 Y86.669 E.28142
G3 X87.78 Y86.531 I.203 J-3.445 E.03556
G1 X93.023 Y91.775 E.33084
G1 X93.023 Y92.42 E.02879
G1 X86.977 Y86.374 E.38151
G1 X86.977 Y87.019 E.02879
G1 X93.023 Y93.066 E.38151
G1 X93.023 Y93.711 E.02879
G1 X86.977 Y87.664 E.38151
G1 X86.977 Y88.309 E.02879
G1 X92.318 Y93.651 E.33703
G1 X92.29 Y93.637 E.00142
G2 X91.395 Y93.373 I-1.446 J3.253 E.04173
G1 X86.977 Y88.954 E.27878
G1 X86.977 Y89.6 E.02879
G1 X90.705 Y93.328 E.23522
G1 X90.058 Y93.326 E.02885
G1 X86.977 Y90.245 E.19442
G1 X86.977 Y90.89 E.02879
G1 X89.411 Y93.325 E.15361
G1 X88.765 Y93.323 E.02885
G1 X86.977 Y91.535 E.11281
G1 X86.977 Y92.181 E.02879
G1 X88.174 Y93.378 E.07556
G2 X87.657 Y93.506 I.676 J3.846 E.02379
G1 X86.977 Y92.826 E.04292
G1 X86.977 Y93.471 E.02879
G1 X87.349 Y93.844 E.02351
; WIPE_START
G1 X86.977 Y93.471 E-.20023
G1 X86.977 Y92.826 E-.24518
G1 X87.562 Y93.411 E-.31458
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X86.43 Y85.863 Z.64 F42000
G1 X86.188 Y84.25 Z.64
G1 Z.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48237
G1 F3000
M204 S500
G1 X86.13 Y83.938 E.01334
; LINE_WIDTH: 0.447748
G1 X86.112 Y83.822 E.00456
; LINE_WIDTH: 0.414993
G1 X86.097 Y83.72 E.00366
; LINE_WIDTH: 0.374991
G1 X86.072 Y83.499 E.00703
; LINE_WIDTH: 0.31897
G1 X86.05 Y83.059 E.01154
G1 X86.062 Y82.626 E.01132
; LINE_WIDTH: 0.346604
G1 X86.078 Y82.439 E.00542
; LINE_WIDTH: 0.387194
G1 X86.103 Y82.236 E.00669
; LINE_WIDTH: 0.430006
G1 X86.121 Y82.118 E.00445
; LINE_WIDTH: 0.465808
G1 X86.138 Y82.013 E.00429
; LINE_WIDTH: 0.493194
G1 X86.191 Y81.752 E.01151
; WIPE_START
G1 X86.138 Y82.013 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X86.99 Y81.066 Z.64 F42000
G1 Z.24
G1 E.8 F1800
; LINE_WIDTH: 0.122168
G1 F3000
M204 S500
G1 X87.081 Y80.964 E.00094
G1 X87.141 Y80.943 E.00044
M204 S6000
G1 X87.837 Y80.747 F42000
; LINE_WIDTH: 0.514084
G1 F3000
M204 S500
G1 X88.103 Y80.702 E.0122
; LINE_WIDTH: 0.483736
G1 X88.276 Y80.679 E.00736
; LINE_WIDTH: 0.443905
G1 X88.462 Y80.662 E.00719
; LINE_WIDTH: 0.406623
G1 X88.791 Y80.65 E.01141
G1 X90.807 Y80.65 E.07
G1 X91.078 Y80.658 E.00942
G1 X91.259 Y80.672 E.0063
; LINE_WIDTH: 0.464264
G1 X91.407 Y80.689 E.00602
; LINE_WIDTH: 0.500881
G1 X91.764 Y80.742 E.01583
M204 S6000
G1 X92.458 Y80.943 F42000
; LINE_WIDTH: 0.120018
G1 F3000
M204 S500
G1 X92.512 Y80.961 E.00038
G1 X92.589 Y81.048 E.00078
M204 S6000
G1 X93.529 Y81.371 F42000
; LINE_WIDTH: 0.156538
G1 F3000
M204 S500
G1 X93.608 Y81.697 E.00344
; WIPE_START
G1 X93.529 Y81.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X93.629 Y84.359 Z.64 F42000
G1 Z.24
G1 E.8 F1800
; LINE_WIDTH: 0.138707
G1 F3000
M204 S500
G1 X93.426 Y84.64 E.00296
; WIPE_START
G1 X93.629 Y84.359 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X93.18 Y85.651 Z.64 F42000
G1 Z.24
G1 E.8 F1800
; LINE_WIDTH: 0.121356
G1 F3000
M204 S500
G1 X93.044 Y85.746 E.00113
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3000
G1 X93.18 Y85.651 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/166
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 12
M204 S10000
G17
G3 Z.64 I-.58 J1.07 P1  F42000
G1 X96.31 Y87.349 Z.64
G1 Z.36
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.812 Y86.471 I1.481 J.809 E.03523
G1 X97.859 Y86.054 E.0081
G3 X99.302 Y89.696 I-.066 J2.133 E.09565
G1 X99.302 Y90.29 E.01145
G3 X95.651 Y91.836 I-1.508 J1.521 E.16187
G3 X96.294 Y90.294 I2.22 J.021 E.03301
G1 X96.299 Y89.702 E.01141
G3 X97.8 Y86.047 I1.516 J-1.513 E.09696
; WIPE_START
G1 X98.276 Y86.101 E-.18219
G1 X98.729 Y86.259 E-.18224
G1 X99.135 Y86.514 E-.18217
G1 X99.474 Y86.853 E-.18221
G1 X99.518 Y86.923 E-.03119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I-.907 J-.812 P1  F42000
G1 X88.797 Y98.9 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03672
G3 X90.877 Y98.899 I-.004 J1.9 E.10774
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.886 E-.1083
G1 X88.425 Y98.863 E-.05674
G1 X88.17 Y98.793 E-.10052
G1 X88.031 Y98.737 E-.05704
G1 X87.795 Y98.613 E-.10108
G1 X87.581 Y98.458 E-.10065
G1 X87.47 Y98.357 E-.05705
G1 X87.366 Y98.247 E-.05753
G1 X87.272 Y98.129 E-.05718
G1 X87.182 Y97.987 E-.06391
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.117 Y90.412 Z.76 F42000
G1 X88.797 Y84.9 Z.76
G1 Z.36
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.10911
G1 X90.803 Y81.1 E.03672
G3 X90.877 Y84.899 I-.004 J1.9 E.10774
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y84.886 E-.1083
G1 X88.425 Y84.863 E-.05674
G1 X88.17 Y84.793 E-.10052
G1 X88.031 Y84.737 E-.05704
G1 X87.795 Y84.613 E-.10108
G1 X87.581 Y84.458 E-.10065
G1 X87.47 Y84.357 E-.05671
G1 X87.295 Y84.159 E-.10061
G1 X87.207 Y84.036 E-.05768
G1 X87.179 Y83.989 E-.02067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.035 Y91.62 Z.76 F42000
G1 X86.896 Y98.977 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01809
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00448
G2 X86.609 Y98.619 I2.749 J-1.256 E.01236
G1 X86.858 Y98.93 E.00826
; WIPE_START
G1 X86.023 Y98.977 E-.31768
G1 X86.023 Y97.944 E-.39244
G1 X86.152 Y97.919 E-.04989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.826 Y90.472 Z.76 F42000
G1 X88.798 Y86.148 Z.76
G1 Z.36
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.934 Y86.146 E.0443
G2 X93.379 Y84.805 I-.142 J-3.158 E.05991
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.578 J1.805 E.06218
G1 X88.771 Y93.852 E.04253
G2 X86.831 Y94.543 I.039 J3.183 E.04352
G1 X86.448 Y94.875 E.01052
G1 X86.448 Y85.115 E.20246
G1 X86.776 Y85.412 E.00918
G2 X88.738 Y86.147 I2.022 J-2.41 E.04432
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z.76 F42000
G1 X93.977 Y98.977 Z.76
G1 Z.36
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.679 Y98.977 E.02691
G2 X92.055 Y94.582 I-1.892 J-1.973 E.10742
G2 X90.815 Y94.277 I-1.264 J2.459 E.02673
G1 X88.78 Y94.277 E.04222
G2 X86.228 Y96.095 I.025 J2.735 E.06921
G1 X86.023 Y96.054 E.00432
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.575 J-.912 E.0693
G1 X90.914 Y85.722 E.04417
G2 X92.926 Y81.296 I-.117 J-2.724 E.12454
G1 X92.684 Y81.023 E.00755
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.679 Y98.977 E-.4936
G1 X92.891 Y98.747 E-.11863
G1 X93.054 Y98.531 E-.10307
G1 X93.115 Y98.43 E-.04471
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.15 Y91.397 Z.76 F42000
G1 X86.228 Y82.095 Z.76
G1 Z.36
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.053 E.00432
G1 X86.023 Y81.023 E.02136
G1 X86.911 Y81.023 E.01842
G1 X86.675 Y81.296 E.00748
G2 X86.249 Y82.039 I2.27 J1.794 E.01782
; WIPE_START
G1 X86.023 Y82.053 E-.08586
G1 X86.023 Y81.023 E-.3914
G1 X86.768 Y81.023 E-.28274
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z.76 F42000
G1 Z.36
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00037
G1 X90.895 Y85.298 E.04363
G2 X91.501 Y80.806 I-.1 J-2.3 E.13308
G1 X91.54 Y80.599 E.00437
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.547 Y99.401 E.0592
G1 X91.505 Y99.198 E.0043
G2 X92.238 Y98.795 I-1.03 J-2.743 E.01742
G2 X90.809 Y94.701 I-1.439 J-1.794 E.11744
G1 X88.788 Y94.701 E.04191
G2 X88.099 Y99.194 I.018 J2.302 E.13476
G1 X88.06 Y99.401 E.00437
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.523 Y85.283 I.701 J2.189 E.12928
G1 X88.713 Y85.294 E.00396
; WIPE_START
G1 X88.791 Y85.299 E-.02966
G1 X90.713 Y85.298 E-.73034
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.784 Y92.644 Z.76 F42000
G1 X94.8 Y99.8 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.29 Y99.049 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.092173
G1 F15000
M204 S6000
G1 X92.176 Y99.148 E.00049
G1 X92.103 Y99.169 E.00025
M204 S10000
G1 X91.328 Y99.33 F42000
; LINE_WIDTH: 0.528989
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.65 J-9.691 E.01089
G3 X88.787 Y99.35 I-1.088 J-127.927 E.05165
G1 X88.536 Y99.343 E.00617
G1 X88.526 Y99.329 E.00043
; LINE_WIDTH: 0.49813
G1 X88.328 Y99.057 E.00775
; WIPE_START
G1 X88.526 Y99.329 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.27 Y99.104 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; LINE_WIDTH: 0.0860459
G1 F15000
M204 S6000
G2 X87.495 Y99.169 I1.474 J-4.745 E.00069
M204 S10000
G1 X87.429 Y99.189 F42000
; LINE_WIDTH: 0.126014
G1 F15000
M204 S6000
M73 P30 R16
G1 X87.285 Y99.056 E.00096
; LINE_WIDTH: 0.0946693
G1 X87.173 Y98.945 E.00053
M204 S10000
G1 X86.33 Y98.764 F42000
; LINE_WIDTH: 0.109353
G1 F15000
M204 S6000
G1 X86.254 Y98.503 E.00111
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.467992
G1 F15000
M204 S6000
G1 X86.1 Y97.479 E.007
; LINE_WIDTH: 0.499648
G1 X86.085 Y97.468 E.00044
; LINE_WIDTH: 0.527421
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.520674
G3 X86.092 Y96.284 I6.048 J-.471 E.02843
M204 S10000
G1 X86.236 Y95.434 F42000
; LINE_WIDTH: 0.132022
G1 F15000
M204 S6000
G1 X86.329 Y95.324 E.00075
; LINE_WIDTH: 0.101596
G1 X86.483 Y95.158 E.00084
; WIPE_START
G1 X86.329 Y95.324 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.601 Y97.643 Z.76 F42000
G1 X93.764 Y97.695 Z.76
G1 Z.36
G1 E.8 F1800
; LINE_WIDTH: 0.437285
G1 F15000
M204 S6000
G3 X93.486 Y98.764 I-21.592 J-5.048 E.02224
M204 S10000
G1 X93.515 Y98.764 F42000
; LINE_WIDTH: 0.292756
G1 F15000
M204 S6000
G1 X93.632 Y98.182 E.00775
; LINE_WIDTH: 0.273013
G1 X93.649 Y98.085 E.00119
; LINE_WIDTH: 0.238861
G1 X93.666 Y97.988 E.00103
; LINE_WIDTH: 0.20333
G1 X93.685 Y97.883 E.00093
; LINE_WIDTH: 0.167023
G1 X93.703 Y97.737 E.00101
; LINE_WIDTH: 0.130062
G1 X93.722 Y97.587 E.00077
; LINE_WIDTH: 0.095634
G1 X93.739 Y97.349 E.00082
M204 S10000
G1 X93.739 Y96.657 F42000
; LINE_WIDTH: 0.0901895
G1 F15000
M204 S6000
G1 X93.727 Y96.469 E.0006
; LINE_WIDTH: 0.117642
G1 X93.71 Y96.323 E.00066
; LINE_WIDTH: 0.151983
G1 X93.692 Y96.17 E.00095
; LINE_WIDTH: 0.194061
G1 X93.668 Y96.024 E.00122
; LINE_WIDTH: 0.242348
G1 X93.644 Y95.878 E.00157
; LINE_WIDTH: 0.26881
G1 X93.545 Y95.363 E.00624
M204 S10000
G1 X93.524 Y95.369 F42000
; LINE_WIDTH: 0.40333
G1 F15000
M204 S6000
G3 X93.764 Y96.338 I-21.123 J5.758 E.01842
; WIPE_START
G1 X93.524 Y95.369 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.003 Y94.521 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423292
G1 F15000
M204 S6000
G1 X93.204 Y94.319 E.00554
G1 X93.204 Y93.757 E.01093
G1 X92.816 Y94.145 E.01068
G2 X92.469 Y93.93 I-1.527 J2.067 E.00794
G1 X93.204 Y93.195 E.0202
G1 X93.204 Y92.633 E.01093
G1 X92.086 Y93.751 E.03074
G2 X91.662 Y93.613 I-1.407 J3.591 E.00867
G1 X93.204 Y92.07 E.04239
G1 X93.204 Y91.508 E.01093
G1 X91.187 Y93.526 E.05546
G1 X91.003 Y93.509 E.00358
G1 X90.642 Y93.509 E.00703
G1 X93.204 Y90.946 E.07044
G1 X93.204 Y90.384 E.01093
G1 X90.081 Y93.507 E.08586
G1 X89.52 Y93.506 E.0109
G1 X93.204 Y89.821 E.10128
G1 X93.204 Y89.259 E.01093
G1 X88.959 Y93.505 E.1167
G2 X88.37 Y93.532 I-.096 J4.391 E.01147
G1 X93.204 Y88.697 E.13289
G1 X93.204 Y88.135 E.01093
G1 X87.633 Y93.706 E.15315
G2 X86.796 Y94.136 I1.196 J3.358 E.01835
G1 X86.796 Y93.981 E.00301
G1 X93.204 Y87.573 E.17616
G1 X93.204 Y87.01 E.01093
G1 X86.796 Y93.419 E.17616
G1 X86.796 Y92.857 E.01093
G1 X93.204 Y86.448 E.17616
G1 X93.204 Y85.886 E.01093
G1 X86.796 Y92.295 E.17616
G1 X86.796 Y91.733 E.01093
G1 X92.445 Y86.084 E.15528
G3 X91.553 Y86.413 I-1.53 J-2.77 E.01854
G1 X86.796 Y91.17 E.13077
G1 X86.796 Y90.608 E.01093
G1 X90.91 Y86.494 E.11309
G1 X90.347 Y86.495 E.01093
G1 X86.796 Y90.046 E.09762
G1 X86.796 Y89.484 E.01093
G1 X89.785 Y86.495 E.08216
G1 X89.222 Y86.495 E.01093
G1 X86.796 Y88.922 E.06669
G1 X86.796 Y88.359 E.01093
G1 X88.663 Y86.492 E.05132
G3 X88.157 Y86.436 I.149 J-3.624 E.0099
G1 X86.796 Y87.797 E.03742
G1 X86.796 Y87.235 E.01093
G1 X87.71 Y86.321 E.02514
G3 X87.308 Y86.16 I1.228 J-3.668 E.00842
G1 X86.796 Y86.673 E.01408
G1 X86.796 Y86.111 E.01093
G1 X87.073 Y85.833 E.00762
; WIPE_START
G1 X86.796 Y86.111 E-.14898
G1 X86.796 Y86.673 E-.21364
G1 X87.308 Y86.16 E-.27537
G1 X87.391 Y86.2 E-.03486
G1 X87.605 Y86.281 E-.08716
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.445 Y84.794 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.108454
G1 F15000
M204 S6000
G1 X86.236 Y84.551 E.0013
M204 S10000
G1 X86.367 Y83.662 F42000
; LINE_WIDTH: 0.467782
G1 F15000
M204 S6000
G1 X86.1 Y83.479 E.00699
; LINE_WIDTH: 0.499447
G1 X86.085 Y83.468 E.00045
; LINE_WIDTH: 0.527345
G1 X86.069 Y83.457 E.00047
; LINE_WIDTH: 0.520789
G3 X86.093 Y82.284 I5.932 J-.467 E.02843
M204 S10000
G1 X86.254 Y81.498 F42000
; LINE_WIDTH: 0.171987
G1 F15000
M204 S6000
G1 X86.309 Y81.309 E.00141
G1 X86.451 Y81.236 E.00114
M204 S10000
G1 X87.249 Y80.995 F42000
; LINE_WIDTH: 0.102914
G1 F15000
M204 S6000
G1 X87.454 Y80.811 E.00104
M204 S10000
G1 X88.277 Y80.672 F42000
; LINE_WIDTH: 0.52864
G1 F15000
M204 S6000
G1 X88.606 Y80.654 E.0081
G3 X90.813 Y80.65 I1.3 J112.424 E.05426
G1 X91.064 Y80.657 E.00616
G1 X91.074 Y80.671 E.00042
; LINE_WIDTH: 0.498225
G1 X91.272 Y80.943 E.00776
M204 S10000
G1 X92.105 Y80.831 F42000
; LINE_WIDTH: 0.0963898
G1 F15000
M204 S6000
G1 X92.192 Y80.857 E.00031
G1 X92.323 Y80.972 E.0006
; WIPE_START
G1 X92.192 Y80.857 E-.49958
G1 X92.105 Y80.831 E-.26042
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.764 Y82.339 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; LINE_WIDTH: 0.402394
G1 F15000
M204 S6000
G1 X93.496 Y81.236 E.02092
M204 S10000
G1 X93.521 Y81.236 F42000
; LINE_WIDTH: 0.268823
G1 F15000
M204 S6000
G1 X93.644 Y81.878 E.00777
; LINE_WIDTH: 0.242363
G1 X93.668 Y82.024 E.00157
; LINE_WIDTH: 0.194066
G1 X93.692 Y82.17 E.00122
; LINE_WIDTH: 0.151978
G1 X93.71 Y82.323 E.00095
; LINE_WIDTH: 0.117627
G1 X93.727 Y82.469 E.00066
; LINE_WIDTH: 0.0901889
G1 X93.739 Y82.657 E.0006
M204 S10000
G1 X93.739 Y83.349 F42000
; LINE_WIDTH: 0.095634
G1 F15000
M204 S6000
G1 X93.722 Y83.587 E.00082
; LINE_WIDTH: 0.130062
G1 X93.703 Y83.737 E.00077
; LINE_WIDTH: 0.167023
G1 X93.685 Y83.883 E.00101
; LINE_WIDTH: 0.20333
G1 X93.666 Y83.988 E.00093
; LINE_WIDTH: 0.238861
G1 X93.649 Y84.085 E.00103
; LINE_WIDTH: 0.273013
G1 X93.632 Y84.182 E.00119
; LINE_WIDTH: 0.292756
G1 X93.541 Y84.636 E.00604
M204 S10000
G1 X93.34 Y85.258 F42000
; LINE_WIDTH: 0.088246
G1 F15000
M204 S6000
G1 X93.221 Y85.364 E.00049
; CHANGE_LAYER
; Z_HEIGHT: 0.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.34 Y85.258 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/166
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z.76 I-.709 J.989 P1  F42000
G1 X96.332 Y87.401 Z.76
G1 Z.48
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.812 Y86.517 I1.46 J.764 E.03497
G1 X97.859 Y86.1 E.0081
G1 X98.028 Y86.119 E.00327
G3 X99.294 Y89.639 I-.228 J2.07 E.08957
G2 X99.482 Y90.471 I1.362 J.13 E.01672
G3 X99.738 Y92.745 I-1.773 J1.351 E.04633
G3 X96.358 Y90.231 I-1.933 J-.93 E.1457
G1 X96.304 Y89.641 E.01143
G3 X97.8 Y86.093 I1.51 J-1.453 E.09411
; WIPE_START
G1 X98.028 Y86.119 E-.087
G1 X98.709 Y86.3 E-.26805
G1 X99.106 Y86.55 E-.17829
G1 X99.438 Y86.882 E-.17829
G1 X99.506 Y86.99 E-.04836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.905 J-.814 P1  F42000
G1 X88.797 Y98.9 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03671
G3 X90.877 Y98.899 I-.003 J1.9 E.10775
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.886 E-.10827
G1 X88.426 Y98.863 E-.05662
G1 X88.17 Y98.793 E-.10069
G1 X88.035 Y98.739 E-.05522
G1 X87.927 Y98.688 E-.04549
G1 X87.701 Y98.55 E-.10068
G1 X87.582 Y98.458 E-.05707
G1 X87.471 Y98.358 E-.05695
G1 X87.295 Y98.16 E-.1007
G1 X87.207 Y98.036 E-.05754
G1 X87.179 Y97.989 E-.02078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.116 Y90.414 Z.88 F42000
G1 X88.797 Y84.9 Z.88
G1 Z.48
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.10911
G1 X90.803 Y81.1 E.03671
G3 X90.877 Y84.899 I-.003 J1.9 E.10775
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y84.886 E-.10827
G1 X88.426 Y84.863 E-.05662
G1 X88.17 Y84.793 E-.10069
G1 X88.035 Y84.739 E-.05522
G1 X87.927 Y84.688 E-.04549
G1 X87.701 Y84.55 E-.10068
G1 X87.582 Y84.458 E-.05707
G1 X87.471 Y84.358 E-.05696
G1 X87.295 Y84.16 E-.10069
G1 X87.207 Y84.036 E-.05754
G1 X87.179 Y83.989 E-.02078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.039 Y91.62 Z.88 F42000
G1 X86.904 Y98.977 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01826
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00448
G2 X86.642 Y98.662 I2.779 J-1.277 E.01347
G1 X86.865 Y98.93 E.00725
; WIPE_START
G1 X86.023 Y98.977 E-.32034
G1 X86.023 Y97.944 E-.39244
G1 X86.146 Y97.92 E-.04722
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.823 Y90.475 Z.88 F42000
G1 X88.798 Y86.148 Z.88
G1 Z.48
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.147 J-3.169 E.0599
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.578 J1.806 E.06218
G1 X88.772 Y93.852 E.04252
G2 X86.83 Y94.544 I.039 J3.182 E.04353
G1 X86.448 Y94.876 E.01051
G1 X86.448 Y85.115 E.20247
G1 X86.781 Y85.417 E.00933
G2 X88.738 Y86.147 I2.02 J-2.424 E.04416
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z.88 F42000
G1 X93.977 Y98.977 Z.88
G1 Z.48
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.686 Y98.977 E.02677
G2 X93.401 Y97.811 I-2.09 J-2.084 E.02861
G2 X90.815 Y94.277 I-2.6 J-.811 E.10553
G1 X88.78 Y94.277 E.04222
G2 X86.228 Y96.095 I.025 J2.736 E.06921
G1 X86.023 Y96.054 E.00432
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.573 J-.91 E.06931
G1 X90.914 Y85.722 E.04415
G2 X92.926 Y81.295 I-.117 J-2.724 E.12455
G1 X92.685 Y81.023 E.00753
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.686 Y98.977 E-.49087
G1 X92.897 Y98.739 E-.12055
G1 X93.054 Y98.531 E-.09925
G1 X93.122 Y98.42 E-.04933
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.152 Y91.389 Z.88 F42000
G1 X86.228 Y82.095 Z.88
G1 Z.48
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00432
G1 X86.023 Y81.023 E.02137
G1 X86.904 Y81.023 E.01827
G1 X86.642 Y81.338 E.00849
G2 X86.249 Y82.039 I2.315 J1.758 E.01672
; WIPE_START
G1 X86.023 Y82.054 E-.08586
G1 X86.023 Y81.023 E-.39142
G1 X86.767 Y81.023 E-.28272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z.88 F42000
G1 Z.48
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04363
G2 X91.501 Y80.806 I-.1 J-2.3 E.13308
G1 X91.54 Y80.599 E.00437
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.547 Y99.401 E.0592
G1 X91.505 Y99.198 E.0043
G1 X91.815 Y99.064 E.00702
G2 X90.809 Y94.701 I-1.018 J-2.063 E.12777
G1 X88.788 Y94.701 E.04191
G2 X88.099 Y99.194 I.015 J2.302 E.13483
G1 X88.06 Y99.401 E.00437
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.523 Y85.283 I.701 J2.189 E.12928
G1 X88.713 Y85.294 E.00395
; WIPE_START
G1 X88.791 Y85.299 E-.02969
G1 X90.713 Y85.298 E-.73031
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.784 Y92.644 Z.88 F42000
G1 X94.8 Y99.8 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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
G1 X92.332 Y99.02 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0968111
G1 F15000
M204 S6000
G1 X92.193 Y99.143 E.00064
G1 X92.105 Y99.168 E.00032
M204 S10000
G1 X91.328 Y99.33 F42000
; LINE_WIDTH: 0.528977
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.654 J-9.912 E.0109
G3 X88.787 Y99.35 I-1.088 J-127.913 E.05164
G1 X88.536 Y99.343 E.00617
G1 X88.526 Y99.329 E.00042
; LINE_WIDTH: 0.498633
G1 X88.328 Y99.057 E.00777
M204 S10000
G1 X87.441 Y99.189 F42000
; LINE_WIDTH: 0.12007
G1 F15000
M204 S6000
G1 X87.319 Y99.08 E.00075
; LINE_WIDTH: 0.0938317
G1 X87.207 Y98.972 E.00052
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.137429
G1 F15000
M204 S6000
G1 X86.253 Y98.501 E.0015
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.466996
G1 F15000
M204 S6000
G1 X86.101 Y97.479 E.00696
; LINE_WIDTH: 0.498829
G1 X86.085 Y97.468 E.00045
; LINE_WIDTH: 0.527158
G1 X86.069 Y97.457 E.00048
; LINE_WIDTH: 0.520139
G3 X86.09 Y96.284 I6.156 J-.475 E.0284
M204 S10000
G1 X86.236 Y95.434 F42000
; LINE_WIDTH: 0.12976
G1 F15000
M204 S6000
G1 X86.373 Y95.277 E.00106
; LINE_WIDTH: 0.0955842
G1 X86.451 Y95.192 E.00039
; LINE_WIDTH: 0.0806452
G1 X86.478 Y95.163 E.00011
; WIPE_START
G1 X86.451 Y95.192 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.082 Y94.161 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426132
M73 P31 R16
G1 F15000
M204 S6000
G1 X86.796 Y93.875 E.00793
G1 X86.796 Y93.309 E.01108
G1 X87.321 Y93.834 E.01454
G3 X87.727 Y93.673 I1.211 J2.475 E.00855
G1 X86.796 Y92.742 E.02578
G1 X86.796 Y92.176 E.01108
G1 X88.18 Y93.561 E.03834
G3 X88.693 Y93.507 I.604 J3.289 E.0101
G1 X86.796 Y91.61 E.05253
G1 X86.796 Y91.044 E.01108
G1 X89.257 Y93.506 E.06815
G1 X89.825 Y93.507 E.01111
G1 X86.796 Y90.477 E.08386
G1 X86.796 Y89.911 E.01108
G1 X90.392 Y93.508 E.09957
G1 X90.96 Y93.509 E.01111
G1 X86.796 Y89.345 E.11528
G1 X86.796 Y88.779 E.01108
G1 X91.619 Y93.602 E.13354
G3 X92.57 Y93.987 I-.837 J3.437 E.02014
G1 X86.796 Y88.213 E.15985
G1 X86.796 Y87.646 E.01108
G1 X93.204 Y94.055 E.17742
G1 X93.204 Y93.489 E.01108
G1 X86.796 Y87.08 E.17742
G1 X86.796 Y86.514 E.01108
G1 X93.204 Y92.923 E.17742
G1 X93.204 Y92.357 E.01108
G1 X86.796 Y85.948 E.17742
G1 X86.796 Y85.864 E.00164
G2 X87.746 Y86.331 I2.012 J-2.891 E.0208
G1 X93.204 Y91.79 E.15112
G1 X93.204 Y91.224 E.01108
G1 X88.459 Y86.478 E.13138
G2 X89.042 Y86.495 I.439 J-4.989 E.01143
G1 X93.204 Y90.658 E.11523
G1 X93.204 Y90.092 E.01108
G1 X89.608 Y86.495 E.09957
G1 X90.174 Y86.495 E.01108
G1 X93.204 Y89.525 E.0839
G1 X93.204 Y88.959 E.01108
G1 X90.74 Y86.494 E.06824
G2 X91.268 Y86.466 I.103 J-2.983 E.01037
G1 X91.276 Y86.464 E.00016
G1 X93.204 Y88.393 E.0534
G1 X93.204 Y87.827 E.01108
G1 X91.743 Y86.366 E.04045
G2 X92.161 Y86.217 I-.522 J-2.136 E.0087
G1 X93.204 Y87.261 E.02888
G1 X93.204 Y86.694 E.01108
G1 X92.54 Y86.03 E.0184
G2 X92.883 Y85.807 I-.946 J-1.831 E.00803
G1 X93.382 Y86.305 E.01381
M204 S10000
G1 X93.179 Y85.406 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0936916
G1 F15000
M204 S6000
G1 X93.34 Y85.268 E.0007
M204 S10000
G1 X93.541 Y84.636 F42000
; LINE_WIDTH: 0.292728
G1 F15000
M204 S6000
G1 X93.632 Y84.182 E.00604
; LINE_WIDTH: 0.272958
G1 X93.649 Y84.085 E.00119
; LINE_WIDTH: 0.238772
G1 X93.666 Y83.988 E.00103
; LINE_WIDTH: 0.203203
G1 X93.685 Y83.883 E.00093
; LINE_WIDTH: 0.166856
G1 X93.703 Y83.737 E.00102
; LINE_WIDTH: 0.129873
G1 X93.722 Y83.586 E.00077
; LINE_WIDTH: 0.0955376
G1 X93.739 Y83.348 E.00081
M204 S10000
G1 X93.739 Y82.658 F42000
; LINE_WIDTH: 0.0902513
G1 F15000
M204 S6000
G1 X93.727 Y82.468 E.0006
; LINE_WIDTH: 0.117752
G1 X93.71 Y82.322 E.00066
; LINE_WIDTH: 0.152099
G1 X93.692 Y82.169 E.00095
; LINE_WIDTH: 0.194121
G1 X93.668 Y82.024 E.00121
; LINE_WIDTH: 0.242315
G1 X93.644 Y81.878 E.00156
; LINE_WIDTH: 0.268729
G1 X93.521 Y81.236 E.00777
M204 S10000
G1 X93.496 Y81.236 F42000
; LINE_WIDTH: 0.402093
G1 F15000
M204 S6000
G1 X93.764 Y82.339 E.02089
; WIPE_START
G1 X93.496 Y81.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.327 Y80.977 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.0969761
G1 F15000
M204 S6000
G1 X92.14 Y80.811 E.00087
M204 S10000
G1 X91.272 Y80.943 F42000
; LINE_WIDTH: 0.498617
G1 F15000
M204 S6000
G1 X91.074 Y80.671 E.00777
; LINE_WIDTH: 0.528645
G1 X91.064 Y80.657 E.00042
G1 X90.813 Y80.65 E.00616
G2 X88.606 Y80.654 I-.907 J112.432 E.05426
G1 X88.277 Y80.672 E.0081
M204 S10000
G1 X87.443 Y80.811 F42000
; LINE_WIDTH: 0.125931
G1 F15000
M204 S6000
G1 X87.358 Y80.886 E.00055
; LINE_WIDTH: 0.100155
G1 X87.213 Y81.022 E.00072
M204 S10000
G1 X86.09 Y82.284 F42000
; LINE_WIDTH: 0.52014
G1 F15000
M204 S6000
G2 X86.069 Y83.457 I6.135 J.698 E.0284
; LINE_WIDTH: 0.527158
G1 X86.085 Y83.468 E.00048
; LINE_WIDTH: 0.498829
G1 X86.101 Y83.479 E.00045
; LINE_WIDTH: 0.466996
G1 X86.367 Y83.662 E.00696
M204 S10000
G1 X86.236 Y84.552 F42000
; LINE_WIDTH: 0.108433
G1 F15000
M204 S6000
G1 X86.445 Y84.794 E.0013
; WIPE_START
G1 X86.236 Y84.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.344 Y90.984 Z.88 F42000
G1 X93.764 Y96.339 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.403065
G1 F15000
M204 S6000
G2 X93.524 Y95.369 I-21.467 J4.809 E.01842
M204 S10000
G1 X93.545 Y95.363 F42000
; LINE_WIDTH: 0.268729
G1 F15000
M204 S6000
G1 X93.644 Y95.878 E.00624
; LINE_WIDTH: 0.24232
G1 X93.668 Y96.024 E.00156
; LINE_WIDTH: 0.194136
G1 X93.692 Y96.169 E.00121
; LINE_WIDTH: 0.152114
G1 X93.71 Y96.322 E.00095
; LINE_WIDTH: 0.117757
G1 X93.727 Y96.468 E.00066
; LINE_WIDTH: 0.0902411
G1 X93.739 Y96.658 E.0006
M204 S10000
G1 X93.74 Y97.359 F42000
; LINE_WIDTH: 0.101305
G1 F15000
M204 S6000
G1 X93.716 Y97.641 E.00104
; LINE_WIDTH: 0.139658
G1 X93.699 Y97.77 E.00073
; LINE_WIDTH: 0.173076
G1 X93.683 Y97.896 E.00091
; LINE_WIDTH: 0.190619
G1 X93.681 Y97.903 E.00006
; LINE_WIDTH: 0.216413
G1 X93.657 Y98.043 E.00132
; LINE_WIDTH: 0.265734
G1 X93.632 Y98.183 E.00167
; LINE_WIDTH: 0.293056
G1 X93.515 Y98.764 E.00775
M204 S10000
G1 X93.486 Y98.764 F42000
; LINE_WIDTH: 0.43743
G1 F15000
M204 S6000
G2 X93.764 Y97.695 I-21.643 J-6.206 E.02224
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.486 Y98.764 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/166
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z.88 I1.179 J.303 P1  F42000
G1 X96.363 Y87.556 Z.88
G1 Z.6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.778 Y86.618 I1.446 J.644 E.03454
G1 X97.802 Y86.199 E.0081
G3 X99.179 Y89.615 I-.011 J1.99 E.09072
G2 X99.438 Y90.505 I1.187 J.137 E.01835
G3 X99.763 Y92.505 I-1.688 J1.301 E.04069
G3 X96.584 Y90.083 I-1.97 J-.712 E.15139
G2 X95.965 Y88.964 I-8.168 J3.786 E.02468
G3 X97.743 Y86.195 I1.845 J-.771 E.0745
; WIPE_START
G1 X98.413 Y86.299 E-.25757
G1 X99.018 Y86.609 E-.25837
G1 X99.344 Y86.926 E-.1727
G1 X99.445 Y87.084 E-.07137
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I-.904 J-.815 P1  F42000
G1 X88.797 Y98.9 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03671
G3 X90.877 Y98.899 I-.003 J1.9 E.10775
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.886 E-.10833
G1 X88.426 Y98.863 E-.05661
G1 X88.313 Y98.837 E-.04377
G1 X88.064 Y98.752 E-.10016
G1 X87.828 Y98.633 E-.10026
G1 X87.702 Y98.551 E-.05728
G1 X87.582 Y98.458 E-.05749
G1 X87.47 Y98.357 E-.0574
G1 X87.366 Y98.247 E-.05745
G1 X87.272 Y98.13 E-.05722
G1 X87.182 Y97.987 E-.06404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.117 Y90.412 Z1 F42000
G1 X88.797 Y84.9 Z1
G1 Z.6
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.10911
G1 X90.803 Y81.1 E.03671
G3 X90.877 Y84.899 I-.003 J1.9 E.10775
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y84.886 E-.10833
G1 X88.426 Y84.863 E-.05661
G1 X88.313 Y84.837 E-.04377
G1 X88.064 Y84.752 E-.10016
G1 X87.828 Y84.633 E-.10026
G1 X87.702 Y84.551 E-.05729
G1 X87.582 Y84.458 E-.05749
G1 X87.47 Y84.357 E-.0574
G1 X87.366 Y84.247 E-.05745
G1 X87.272 Y84.13 E-.05722
G1 X87.182 Y83.987 E-.06403
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.036 Y91.618 Z1 F42000
G1 X86.896 Y98.977 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01809
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00447
G2 X86.61 Y98.62 I2.758 J-1.26 E.01239
G1 X86.858 Y98.93 E.00824
; WIPE_START
G1 X86.023 Y98.977 E-.31773
G1 X86.023 Y97.944 E-.39243
G1 X86.152 Y97.919 E-.04985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.826 Y90.472 Z1 F42000
G1 X88.798 Y86.148 Z1
G1 Z.6
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.147 J-3.169 E.0599
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.578 J1.806 E.06218
G1 X88.772 Y93.852 E.04252
G2 X86.782 Y94.583 I.039 J3.18 E.04481
G1 X86.448 Y94.885 E.00935
G1 X86.448 Y85.115 E.20265
G1 X86.782 Y85.417 E.00934
G2 X88.738 Y86.147 I2.017 J-2.418 E.04415
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z1 F42000
G1 X93.977 Y98.977 Z1
G1 Z.6
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.678 Y98.977 E.02693
G2 X91.13 Y94.296 I-1.887 J-1.972 E.12761
G2 X90.815 Y94.277 I-.319 J2.62 E.00654
G1 X88.78 Y94.277 E.04222
G2 X86.229 Y96.094 I.025 J2.734 E.06918
G1 X86.023 Y96.054 E.00434
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.575 J-.912 E.0693
G1 X90.914 Y85.722 E.04415
G2 X92.926 Y81.296 I-.117 J-2.724 E.12454
G1 X92.684 Y81.023 E.00755
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.678 Y98.977 E-.49385
G1 X92.891 Y98.748 E-.11867
G1 X93.055 Y98.53 E-.1035
G1 X93.115 Y98.431 E-.04398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.15 Y91.398 Z1 F42000
G1 X86.229 Y82.094 Z1
G1 Z.6
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00434
G1 X86.023 Y81.023 E.02137
G1 X86.904 Y81.023 E.01827
G1 X86.641 Y81.338 E.0085
G2 X86.25 Y82.038 I2.298 J1.744 E.01669
; WIPE_START
G1 X86.023 Y82.054 E-.08633
G1 X86.023 Y81.023 E-.39148
G1 X86.766 Y81.023 E-.28219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z1 F42000
G1 Z.6
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04363
G2 X91.502 Y80.807 I-.099 J-2.3 E.13305
G1 X91.541 Y80.599 E.00439
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.547 Y99.401 E.0592
G1 X91.505 Y99.198 E.0043
G1 X91.816 Y99.064 E.00702
G2 X90.809 Y94.701 I-1.019 J-2.063 E.12777
G1 X88.788 Y94.701 E.04191
G2 X88.098 Y99.193 I.015 J2.301 E.1348
G1 X88.059 Y99.401 E.00439
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.523 Y85.283 I.701 J2.189 E.12928
G1 X88.713 Y85.294 E.00396
; WIPE_START
G1 X88.791 Y85.299 E-.02969
G1 X90.713 Y85.298 E-.73031
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.784 Y92.644 Z1 F42000
G1 X94.8 Y99.8 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.285 Y99.053 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0912856
G1 F15000
M204 S6000
G1 X92.175 Y99.149 E.00047
G1 X92.105 Y99.168 E.00023
M204 S10000
G1 X91.328 Y99.33 F42000
; LINE_WIDTH: 0.528984
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.653 J-9.881 E.0109
G3 X88.787 Y99.35 I-1.088 J-127.753 E.05164
G1 X88.536 Y99.343 E.00619
G1 X88.526 Y99.33 E.0004
; LINE_WIDTH: 0.499922
G1 X88.327 Y99.057 E.00783
M204 S10000
G1 X87.43 Y99.189 F42000
; LINE_WIDTH: 0.132002
G1 F15000
M204 S6000
G1 X87.319 Y99.088 E.00078
; LINE_WIDTH: 0.10075
G1 X87.174 Y98.946 E.00075
M204 S10000
G1 X86.33 Y98.764 F42000
; LINE_WIDTH: 0.111754
G1 F15000
M204 S6000
G1 X86.254 Y98.502 E.00115
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.46831
G1 F15000
M204 S6000
G1 X86.1 Y97.479 E.00701
; LINE_WIDTH: 0.499906
G1 X86.085 Y97.468 E.00044
; LINE_WIDTH: 0.527498
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.520074
G3 X86.09 Y96.283 I6.165 J-.475 E.02841
M204 S10000
G1 X86.236 Y95.448 F42000
; LINE_WIDTH: 0.109041
G1 F15000
M204 S6000
G1 X86.448 Y95.203 E.00132
; WIPE_START
G1 X86.236 Y95.448 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.55 Y97.629 Z1 F42000
G1 X93.764 Y97.694 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.437121
G1 F15000
M204 S6000
G3 X93.486 Y98.764 I-21.469 J-5.008 E.02226
M204 S10000
G1 X93.515 Y98.764 F42000
; LINE_WIDTH: 0.292971
G1 F15000
M204 S6000
G1 X93.632 Y98.183 E.00775
; LINE_WIDTH: 0.265833
G1 X93.657 Y98.044 E.00165
; LINE_WIDTH: 0.216832
G1 X93.681 Y97.905 E.00132
; LINE_WIDTH: 0.191204
G1 X93.682 Y97.898 E.00006
; LINE_WIDTH: 0.173543
G1 X93.699 Y97.772 E.00092
; LINE_WIDTH: 0.139889
G1 X93.716 Y97.641 E.00074
; LINE_WIDTH: 0.101356
G1 X93.74 Y97.359 E.00105
M204 S10000
G1 X93.739 Y96.658 F42000
; LINE_WIDTH: 0.0901768
G1 F15000
M204 S6000
G1 X93.727 Y96.469 E.0006
; LINE_WIDTH: 0.117618
G1 X93.71 Y96.323 E.00066
; LINE_WIDTH: 0.151989
G1 X93.692 Y96.17 E.00095
; LINE_WIDTH: 0.194106
G1 X93.668 Y96.024 E.00122
; LINE_WIDTH: 0.24247
G1 X93.644 Y95.878 E.00157
; LINE_WIDTH: 0.26896
G1 X93.545 Y95.363 E.00624
M204 S10000
G1 X93.525 Y95.369 F42000
; LINE_WIDTH: 0.403416
G1 F15000
M204 S6000
G3 X93.764 Y96.337 I-29.891 J7.897 E.01842
; WIPE_START
G1 X93.525 Y95.369 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.003 Y94.521 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423242
G1 F15000
M204 S6000
G1 X93.204 Y94.319 E.00553
G1 X93.204 Y93.757 E.01092
G1 X92.818 Y94.144 E.01063
G2 X92.469 Y93.93 I-1.539 J2.117 E.00795
G1 X93.204 Y93.195 E.0202
G1 X93.204 Y92.633 E.01092
G1 X92.087 Y93.751 E.03072
G2 X91.663 Y93.613 I-1.506 J3.909 E.00867
G1 X93.204 Y92.071 E.04238
G1 X93.204 Y91.509 E.01092
G1 X91.187 Y93.526 E.05544
G1 X91.003 Y93.509 E.00359
G1 X90.642 Y93.509 E.00702
G1 X93.204 Y90.946 E.07042
G1 X93.204 Y90.384 E.01092
G1 X90.081 Y93.507 E.08583
G1 X89.521 Y93.506 E.0109
G1 X93.204 Y89.822 E.10125
G1 X93.204 Y89.26 E.01092
G1 X88.96 Y93.505 E.11666
G2 X88.371 Y93.532 I-.097 J4.372 E.01146
G1 X93.204 Y88.698 E.13285
G1 X93.204 Y88.136 E.01092
G1 X87.634 Y93.706 E.15309
G2 X86.796 Y94.135 I1.081 J3.144 E.01837
G1 X86.796 Y93.982 E.00297
G1 X93.204 Y87.574 E.17614
G1 X93.204 Y87.012 E.01092
G1 X86.796 Y93.42 E.17614
G1 X86.796 Y92.858 E.01092
G1 X93.204 Y86.449 E.17614
G1 X93.204 Y85.887 E.01092
G1 X86.796 Y92.296 E.17614
G1 X86.796 Y91.734 E.01092
G1 X92.449 Y86.08 E.15539
G1 X92.345 Y86.138 E.00233
G3 X91.555 Y86.413 I-1.687 J-3.583 E.01628
G1 X86.796 Y91.172 E.1308
G1 X86.796 Y90.61 E.01092
G1 X90.911 Y86.494 E.11311
G1 X90.349 Y86.495 E.01093
G1 X86.796 Y90.048 E.09765
G1 X86.796 Y89.485 E.01092
G1 X89.786 Y86.495 E.08219
G1 X89.224 Y86.495 E.01093
G1 X86.796 Y88.923 E.06673
G1 X86.796 Y88.361 E.01092
G1 X88.664 Y86.492 E.05136
G3 X88.159 Y86.436 I.146 J-3.61 E.0099
G1 X86.796 Y87.799 E.03746
G1 X86.796 Y87.237 E.01092
G1 X87.711 Y86.321 E.02517
G3 X87.309 Y86.161 I1.091 J-3.328 E.00842
G1 X86.796 Y86.675 E.01412
G1 X86.796 Y86.113 E.01092
G1 X87.074 Y85.834 E.00765
; WIPE_START
G1 X86.796 Y86.113 E-.14966
G1 X86.796 Y86.675 E-.21361
G1 X87.309 Y86.161 E-.27606
G1 X87.444 Y86.223 E-.05633
G1 X87.603 Y86.281 E-.06435
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.443 Y84.79 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.105155
G1 F15000
M204 S6000
G1 X86.287 Y84.614 E.00091
G1 X86.254 Y84.502 E.00045
M204 S10000
G1 X86.367 Y83.662 F42000
; LINE_WIDTH: 0.46831
G1 F15000
M204 S6000
G1 X86.1 Y83.479 E.00701
; LINE_WIDTH: 0.499906
G1 X86.085 Y83.468 E.00044
; LINE_WIDTH: 0.527498
G1 X86.069 Y83.457 E.00047
; LINE_WIDTH: 0.520074
G3 X86.09 Y82.283 I6.165 J-.475 E.02841
M204 S10000
G1 X86.253 Y81.499 F42000
; LINE_WIDTH: 0.137447
G1 F15000
M204 S6000
G1 X86.331 Y81.236 E.0015
M204 S10000
G1 X87.21 Y81.026 F42000
; LINE_WIDTH: 0.0939508
G1 F15000
M204 S6000
G1 X87.323 Y80.918 E.00052
; LINE_WIDTH: 0.120155
G1 X87.442 Y80.811 E.00074
M204 S10000
G1 X88.277 Y80.672 F42000
; LINE_WIDTH: 0.528652
G1 F15000
M204 S6000
G1 X88.606 Y80.654 E.00811
G3 X90.813 Y80.65 I1.299 J112.347 E.05426
G1 X91.064 Y80.658 E.00618
G1 X91.074 Y80.67 E.0004
; LINE_WIDTH: 0.499922
G1 X91.273 Y80.943 E.00783
M204 S10000
G1 X92.139 Y80.811 F42000
; LINE_WIDTH: 0.0973366
G1 F15000
M204 S6000
G1 X92.327 Y80.977 E.00087
; WIPE_START
G1 X92.139 Y80.811 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.764 Y82.338 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.402493
G1 F15000
M204 S6000
G1 X93.496 Y81.236 E.02089
M204 S10000
G1 X93.521 Y81.236 F42000
; LINE_WIDTH: 0.26896
G1 F15000
M204 S6000
G1 X93.644 Y81.878 E.00777
; LINE_WIDTH: 0.24247
G1 X93.668 Y82.024 E.00157
; LINE_WIDTH: 0.194106
G1 X93.692 Y82.17 E.00122
; LINE_WIDTH: 0.151989
G1 X93.71 Y82.323 E.00095
; LINE_WIDTH: 0.117618
G1 X93.727 Y82.469 E.00066
; LINE_WIDTH: 0.0901769
G1 X93.739 Y82.658 E.0006
M204 S10000
G1 X93.74 Y83.359 F42000
; LINE_WIDTH: 0.101356
G1 F15000
M204 S6000
G1 X93.716 Y83.641 E.00105
; LINE_WIDTH: 0.139889
G1 X93.699 Y83.772 E.00074
; LINE_WIDTH: 0.173543
G1 X93.682 Y83.898 E.00092
; LINE_WIDTH: 0.191204
G1 X93.681 Y83.905 E.00006
; LINE_WIDTH: 0.216828
G1 X93.657 Y84.044 E.00132
; LINE_WIDTH: 0.265819
G1 X93.632 Y84.183 E.00165
; LINE_WIDTH: 0.292938
G1 X93.541 Y84.636 E.00603
; CHANGE_LAYER
; Z_HEIGHT: 0.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.632 Y84.183 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/166
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1 I-.933 J.781 P1  F42000
G1 X96.468 Y87.572 Z1
G1 Z.72
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.89 Y86.726 I1.33 J.618 E.03388
G1 X97.914 Y86.306 E.0081
G3 X99.059 Y89.589 I-.159 J1.897 E.08447
G2 X99.343 Y90.548 I.872 J.264 E.02042
G3 X99.589 Y92.691 I-1.627 J1.273 E.04375
G3 X96.506 Y90.294 I-1.786 J-.884 E.13617
G1 X96.568 Y90.083 E.00425
G1 X96.491 Y89.563 E.01013
G3 X97.855 Y86.303 I1.327 J-1.36 E.08747
; WIPE_START
G1 X98.511 Y86.434 E-.25433
G1 X98.903 Y86.65 E-.17012
G1 X99.233 Y86.951 E-.16966
G1 X99.477 Y87.313 E-.16589
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.12 I-.895 J-.825 P1  F42000
G1 X88.797 Y98.9 Z1.12
G1 Z.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03671
G3 X90.877 Y98.899 I-.003 J1.9 E.10776
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.886 E-.10825
G1 X88.425 Y98.863 E-.05671
G1 X88.17 Y98.793 E-.1007
G1 X88.038 Y98.74 E-.05406
G1 X87.927 Y98.688 E-.0467
G1 X87.701 Y98.55 E-.10045
G1 X87.582 Y98.458 E-.05718
G1 X87.47 Y98.357 E-.05725
G1 X87.367 Y98.248 E-.05699
G1 X87.207 Y98.036 E-.10098
G1 X87.179 Y97.989 E-.02073
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.116 Y90.414 Z1.12 F42000
G1 X88.797 Y84.9 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.10911
G1 X90.803 Y81.1 E.03671
G3 X90.877 Y84.899 I-.003 J1.9 E.10776
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y84.886 E-.10825
M73 P32 R16
G1 X88.425 Y84.863 E-.05671
G1 X88.17 Y84.793 E-.1007
G1 X88.038 Y84.74 E-.05406
G1 X87.927 Y84.688 E-.0467
G1 X87.701 Y84.55 E-.10045
G1 X87.582 Y84.458 E-.05718
G1 X87.471 Y84.358 E-.05688
G1 X87.294 Y84.159 E-.10092
G1 X87.207 Y84.036 E-.05742
G1 X87.179 Y83.989 E-.02073
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.037 Y91.62 Z1.12 F42000
G1 X86.899 Y98.977 Z1.12
G1 Z.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01817
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00448
G2 X86.639 Y98.658 I2.768 J-1.271 E.01337
G1 X86.861 Y98.93 E.0073
; WIPE_START
G1 X86.023 Y98.977 E-.31888
G1 X86.023 Y97.944 E-.39243
G1 X86.149 Y97.92 E-.0487
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.825 Y90.473 Z1.12 F42000
G1 X88.798 Y86.148 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.147 J-3.168 E.0599
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.578 J1.806 E.06218
G1 X88.772 Y93.852 E.04252
G2 X86.829 Y94.544 I.038 J3.18 E.04356
G1 X86.448 Y94.876 E.01049
G1 X86.448 Y85.115 E.20248
G1 X86.781 Y85.417 E.00933
G2 X88.738 Y86.147 I2.019 J-2.423 E.04416
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z1.12 F42000
G1 X93.977 Y98.977 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.686 Y98.977 E.02677
G2 X93.4 Y97.815 I-2.09 J-2.084 E.02854
G2 X90.815 Y94.277 I-2.599 J-.815 E.10561
G1 X88.78 Y94.277 E.04222
G2 X86.228 Y96.095 I.025 J2.736 E.06921
G1 X86.023 Y96.054 E.00432
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.573 J-.91 E.06931
G1 X90.914 Y85.722 E.04415
G2 X92.926 Y81.295 I-.116 J-2.723 E.12457
G1 X92.684 Y81.023 E.00753
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.686 Y98.977 E-.49087
G1 X92.897 Y98.739 E-.12075
G1 X93.055 Y98.53 E-.09938
G1 X93.122 Y98.42 E-.049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.152 Y91.389 Z1.12 F42000
G1 X86.228 Y82.095 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00432
G1 X86.023 Y81.023 E.02137
G1 X86.907 Y81.023 E.01833
G1 X86.672 Y81.299 E.00752
G2 X86.249 Y82.039 I2.267 J1.788 E.01773
; WIPE_START
G1 X86.023 Y82.054 E-.08587
G1 X86.023 Y81.023 E-.39142
G1 X86.767 Y81.023 E-.28271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z1.12 F42000
G1 Z.72
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04363
G2 X91.501 Y80.806 I-.1 J-2.3 E.13308
G1 X91.541 Y80.599 E.00437
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.541 Y99.401 E.05932
G1 X91.506 Y99.188 E.00448
G2 X90.809 Y94.701 I-.708 J-2.188 E.13468
G1 X88.788 Y94.701 E.04191
G2 X88.099 Y99.194 I.015 J2.302 E.13483
G1 X88.059 Y99.401 E.00437
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05108
G1 X88.098 Y80.811 E.00446
G2 X88.523 Y85.283 I.702 J2.189 E.12927
G1 X88.713 Y85.294 E.00395
; WIPE_START
G1 X88.791 Y85.299 E-.02968
G1 X90.713 Y85.298 E-.73032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.784 Y92.644 Z1.12 F42000
G1 X94.8 Y99.8 Z1.12
G1 Z.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.332 Y99.02 F42000
G1 Z.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0968159
G1 F15000
M204 S6000
G1 X92.194 Y99.143 E.00064
G1 X92.105 Y99.168 E.00032
M204 S10000
G1 X91.327 Y99.33 F42000
; LINE_WIDTH: 0.528975
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.651 J-9.852 E.01086
G3 X88.787 Y99.35 I-1.088 J-127.914 E.05164
G1 X88.536 Y99.343 E.00617
G1 X88.526 Y99.329 E.00041
; LINE_WIDTH: 0.498864
G1 X88.328 Y99.057 E.00778
M204 S10000
G1 X87.435 Y99.189 F42000
; LINE_WIDTH: 0.125782
G1 F15000
M204 S6000
G1 X87.318 Y99.083 E.00077
; LINE_WIDTH: 0.0970956
G1 X87.189 Y98.958 E.00062
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.137316
G1 F15000
M204 S6000
G1 X86.253 Y98.501 E.0015
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.46923
G1 F15000
M204 S6000
G1 X86.1 Y97.478 E.00703
; LINE_WIDTH: 0.500568
G1 X86.084 Y97.467 E.00043
; LINE_WIDTH: 0.527717
G1 X86.069 Y97.457 E.00046
; LINE_WIDTH: 0.520043
G3 X86.09 Y96.283 I6.152 J-.476 E.0284
M204 S10000
G1 X86.236 Y95.435 F42000
; LINE_WIDTH: 0.131349
G1 F15000
M204 S6000
G1 X86.329 Y95.325 E.00074
; LINE_WIDTH: 0.101244
G1 X86.481 Y95.16 E.00083
; WIPE_START
G1 X86.329 Y95.325 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.618 Y93.704 Z1.12 F42000
G1 Z.72
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422912
G1 F15000
M204 S6000
G1 X86.95 Y94.036 E.00911
G3 X87.311 Y93.836 I1.44 J2.178 E.00803
G1 X86.796 Y93.32 E.01417
G1 X86.796 Y92.758 E.01091
G1 X87.715 Y93.678 E.02524
G3 X88.163 Y93.564 I1.146 J3.586 E.00898
G1 X86.796 Y92.197 E.03755
G1 X86.796 Y91.635 E.01091
G1 X88.669 Y93.508 E.05144
G3 X89.228 Y93.505 I.313 J6.67 E.01086
G1 X86.796 Y91.073 E.06679
G1 X86.796 Y90.512 E.01091
G1 X89.791 Y93.507 E.08225
G1 X90.354 Y93.508 E.01093
G1 X86.796 Y89.95 E.09771
G1 X86.796 Y89.388 E.01091
G1 X90.916 Y93.509 E.11316
G3 X91.557 Y93.588 I-.004 J2.678 E.01256
G1 X86.796 Y88.827 E.13075
G1 X86.796 Y88.265 E.01091
G1 X92.448 Y93.918 E.15523
G3 X93.204 Y94.465 I-1.514 J2.887 E.01819
G1 X93.204 Y94.112 E.00685
G1 X86.796 Y87.703 E.176
G1 X86.796 Y87.142 E.01091
G1 X93.204 Y93.55 E.176
G1 X93.204 Y92.989 E.01091
G1 X86.796 Y86.58 E.176
G1 X86.796 Y86.018 E.01091
G1 X93.204 Y92.427 E.176
G1 X93.204 Y91.865 E.01091
G1 X87.636 Y86.297 E.15291
G2 X88.371 Y86.47 I1.16 J-3.285 E.01468
G1 X93.204 Y91.304 E.13274
G1 X93.204 Y90.742 E.01091
G1 X88.958 Y86.495 E.11662
G1 X89.519 Y86.495 E.0109
G1 X93.204 Y90.18 E.10121
G1 X93.204 Y89.619 E.01091
G1 X90.08 Y86.495 E.08579
G1 X90.642 Y86.494 E.0109
G1 X93.204 Y89.057 E.07038
G1 X93.204 Y88.495 E.01091
G1 X91.182 Y86.473 E.05553
G1 X91.285 Y86.464 E.00201
G1 X91.659 Y86.388 E.0074
G1 X93.204 Y87.934 E.04244
G1 X93.204 Y87.372 E.01091
G1 X92.083 Y86.251 E.03078
G2 X92.465 Y86.071 I-.712 J-2.007 E.00821
G1 X93.204 Y86.81 E.0203
G1 X93.204 Y86.249 E.01091
G1 X92.814 Y85.858 E.01073
G2 X93.125 Y85.607 I-2.234 J-3.093 E.00776
G1 X93.382 Y85.865 E.00706
; WIPE_START
G1 X93.125 Y85.607 E-.13815
G1 X92.993 Y85.723 E-.06662
G1 X92.814 Y85.858 E-.0853
G1 X93.204 Y86.249 E-.21001
G1 X93.204 Y86.81 E-.21344
G1 X93.118 Y86.724 E-.04648
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.541 Y84.636 Z1.12 F42000
G1 Z.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.293387
G1 F15000
M204 S6000
G1 X93.632 Y84.184 E.00603
; LINE_WIDTH: 0.266304
G1 X93.656 Y84.046 E.00165
; LINE_WIDTH: 0.217416
G1 X93.681 Y83.907 E.00132
; LINE_WIDTH: 0.191847
G1 X93.682 Y83.9 E.00006
; LINE_WIDTH: 0.174005
G1 X93.699 Y83.773 E.00093
; LINE_WIDTH: 0.140026
G1 X93.716 Y83.641 E.00074
; LINE_WIDTH: 0.101346
G1 X93.74 Y83.359 E.00105
M204 S10000
G1 X93.739 Y82.658 F42000
; LINE_WIDTH: 0.0901571
G1 F15000
M204 S6000
G1 X93.727 Y82.469 E.00059
; LINE_WIDTH: 0.117595
G1 X93.71 Y82.323 E.00066
; LINE_WIDTH: 0.151968
G1 X93.692 Y82.17 E.00095
; LINE_WIDTH: 0.194062
G1 X93.668 Y82.024 E.00122
; LINE_WIDTH: 0.242389
G1 X93.644 Y81.878 E.00157
; LINE_WIDTH: 0.268862
G1 X93.521 Y81.236 E.00777
M204 S10000
G1 X93.496 Y81.236 F42000
; LINE_WIDTH: 0.402436
G1 F15000
M204 S6000
G1 X93.764 Y82.339 E.02091
; WIPE_START
G1 X93.496 Y81.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.327 Y80.977 Z1.12 F42000
G1 Z.72
G1 E.8 F1800
; LINE_WIDTH: 0.0969596
G1 F15000
M204 S6000
G1 X92.14 Y80.811 E.00087
M204 S10000
M73 P32 R15
G1 X91.272 Y80.943 F42000
; LINE_WIDTH: 0.498864
G1 F15000
M204 S6000
G1 X91.074 Y80.671 E.00778
; LINE_WIDTH: 0.528653
G1 X91.064 Y80.657 E.00041
G1 X90.813 Y80.65 E.00616
G2 X88.606 Y80.654 I-.907 J112.431 E.05426
G1 X88.277 Y80.672 E.00812
M204 S10000
G1 X87.449 Y80.811 F42000
; LINE_WIDTH: 0.106603
G1 F15000
M204 S6000
G1 X87.229 Y81.011 E.00117
M204 S10000
G1 X86.452 Y81.236 F42000
; LINE_WIDTH: 0.172045
G1 F15000
M204 S6000
G1 X86.309 Y81.309 E.00115
G1 X86.253 Y81.498 E.00141
M204 S10000
G1 X86.09 Y82.283 F42000
; LINE_WIDTH: 0.520045
G1 F15000
M204 S6000
G2 X86.069 Y83.457 I6.129 J.697 E.0284
; LINE_WIDTH: 0.527708
G1 X86.084 Y83.467 E.00046
; LINE_WIDTH: 0.500578
G1 X86.1 Y83.478 E.00043
; LINE_WIDTH: 0.469228
G1 X86.367 Y83.662 E.00703
M204 S10000
G1 X86.236 Y84.551 F42000
; LINE_WIDTH: 0.108446
G1 F15000
M204 S6000
G1 X86.445 Y84.794 E.0013
; WIPE_START
G1 X86.236 Y84.551 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.344 Y90.984 Z1.12 F42000
G1 X93.764 Y96.339 Z1.12
G1 Z.72
G1 E.8 F1800
; LINE_WIDTH: 0.403367
G1 F15000
M204 S6000
G2 X93.523 Y95.37 I-16.612 J3.625 E.01844
M204 S10000
G1 X93.546 Y95.363 F42000
; LINE_WIDTH: 0.268862
G1 F15000
M204 S6000
G1 X93.644 Y95.878 E.00624
; LINE_WIDTH: 0.242389
G1 X93.668 Y96.024 E.00157
; LINE_WIDTH: 0.194062
G1 X93.692 Y96.17 E.00122
; LINE_WIDTH: 0.151968
G1 X93.71 Y96.323 E.00095
; LINE_WIDTH: 0.117595
G1 X93.727 Y96.469 E.00066
; LINE_WIDTH: 0.0901573
G1 X93.739 Y96.658 E.00059
M204 S10000
G1 X93.74 Y97.359 F42000
; LINE_WIDTH: 0.101346
G1 F15000
M204 S6000
G1 X93.716 Y97.641 E.00105
; LINE_WIDTH: 0.140031
G1 X93.699 Y97.773 E.00074
; LINE_WIDTH: 0.17402
G1 X93.682 Y97.9 E.00093
; LINE_WIDTH: 0.191847
G1 X93.681 Y97.907 E.00006
; LINE_WIDTH: 0.217431
G1 X93.656 Y98.046 E.00132
; LINE_WIDTH: 0.266309
G1 X93.632 Y98.184 E.00165
; LINE_WIDTH: 0.293368
G1 X93.514 Y98.764 E.00775
M204 S10000
G1 X93.486 Y98.764 F42000
; LINE_WIDTH: 0.437315
G1 F15000
M204 S6000
G2 X93.764 Y97.695 I-21.553 J-6.181 E.02224
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.486 Y98.764 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/166
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.12 I1.173 J.324 P1  F42000
G1 X96.578 Y87.579 Z1.12
G1 Z.84
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.973 Y86.831 I1.245 J.648 E.03241
G1 X98.073 Y86.424 E.0081
G1 X98.22 Y86.46 E.00291
G3 X98.788 Y89.689 I-.424 J1.739 E.07991
G1 X98.917 Y90.283 E.01172
G3 X96.631 Y90.327 I-1.114 J1.526 E.18151
G1 X96.727 Y90.131 E.00421
G1 X96.679 Y89.571 E.01084
G3 X98.016 Y86.409 I1.133 J-1.385 E.08863
; WIPE_START
G1 X98.22 Y86.46 E-.07976
G1 X98.818 Y86.714 E-.2469
G1 X99.141 Y87 E-.16416
G1 X99.387 Y87.355 E-.16413
G1 X99.485 Y87.614 E-.10504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.24 I-.884 J-.837 P1  F42000
G1 X88.797 Y98.9 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.797 Y95.1 I.003 J-1.9 E.10913
G1 X90.803 Y95.1 E.0367
G3 X90.877 Y98.899 I-.003 J1.9 E.10776
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.887 E-.10822
G1 X88.426 Y98.863 E-.05672
G1 X88.17 Y98.793 E-.10078
G1 X88.039 Y98.741 E-.05346
G1 X87.797 Y98.614 E-.10397
G1 X87.583 Y98.459 E-.10031
G1 X87.496 Y98.382 E-.04392
G1 X87.391 Y98.275 E-.0571
G1 X87.294 Y98.159 E-.0574
G1 X87.207 Y98.036 E-.05728
G1 X87.179 Y97.989 E-.02084
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.116 Y90.414 Z1.24 F42000
G1 X88.797 Y84.9 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.797 Y81.1 I.003 J-1.9 E.10912
G1 X90.803 Y81.1 E.0367
G3 X90.877 Y84.899 I-.003 J1.9 E.10775
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y84.887 E-.10822
G1 X88.426 Y84.863 E-.05671
G1 X88.17 Y84.793 E-.10078
G1 X88.039 Y84.741 E-.05347
G1 X87.797 Y84.614 E-.10397
G1 X87.583 Y84.459 E-.10031
G1 X87.496 Y84.382 E-.04392
G1 X87.391 Y84.275 E-.0571
G1 X87.294 Y84.159 E-.0574
G1 X87.207 Y84.036 E-.05727
G1 X87.179 Y83.989 E-.02083
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.039 Y91.62 Z1.24 F42000
G1 X86.904 Y98.977 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01827
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00447
G2 X86.641 Y98.662 I2.782 J-1.278 E.01347
G1 X86.866 Y98.93 E.00726
; WIPE_START
G1 X86.023 Y98.977 E-.32049
G1 X86.023 Y97.944 E-.39243
G1 X86.145 Y97.921 E-.04708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.823 Y90.475 Z1.24 F42000
G1 X88.798 Y86.148 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.147 J-3.169 E.0599
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.579 J1.806 E.06218
G1 X88.778 Y93.852 E.04238
G2 X86.825 Y94.547 I.032 J3.18 E.0438
G1 X86.448 Y94.876 E.01038
G1 X86.448 Y85.12 E.20236
G1 X86.787 Y85.421 E.00941
G2 X88.738 Y86.147 I2.011 J-2.418 E.04401
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z1.24 F42000
G1 X93.977 Y98.977 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.678 Y98.977 E.02693
G2 X90.815 Y94.277 I-1.882 J-1.973 E.1342
G1 X88.785 Y94.277 E.04212
G2 X86.228 Y96.095 I.02 J2.736 E.06931
G1 X86.023 Y96.054 E.00432
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.573 J-.91 E.06931
G1 X90.914 Y85.722 E.04415
G2 X92.925 Y81.295 I-.117 J-2.724 E.12457
G1 X92.684 Y81.023 E.00752
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.678 Y98.977 E-.49397
G1 X92.89 Y98.748 E-.11862
G1 X93.054 Y98.531 E-.10337
G1 X93.114 Y98.432 E-.04404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.15 Y91.398 Z1.24 F42000
G1 X86.228 Y82.095 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00433
G1 X86.023 Y81.023 E.02137
G1 X86.904 Y81.023 E.01827
G1 X86.641 Y81.338 E.0085
G2 X86.249 Y82.039 I2.335 J1.767 E.0167
; WIPE_START
G1 X86.023 Y82.054 E-.08599
G1 X86.023 Y81.023 E-.39146
G1 X86.767 Y81.023 E-.28255
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04363
G2 X91.501 Y80.806 I-.099 J-2.3 E.13309
G1 X91.541 Y80.599 E.00437
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.541 Y99.401 E.05932
G1 X91.502 Y99.193 E.00438
M73 P33 R15
G2 X90.809 Y94.701 I-.706 J-2.191 E.13483
G1 X88.791 Y94.701 E.04185
G2 X88.099 Y99.194 I.012 J2.302 E.13488
G1 X88.059 Y99.401 E.00437
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.523 Y85.283 I.701 J2.189 E.12929
G1 X88.713 Y85.294 E.00395
; WIPE_START
G1 X88.791 Y85.299 E-.0297
G1 X90.713 Y85.298 E-.7303
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z1.24 F42000
G1 X94.8 Y99.8 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.283 Y99.054 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0910782
G1 F15000
M204 S6000
G1 X92.174 Y99.149 E.00046
G1 X92.105 Y99.168 E.00023
M204 S10000
G1 X91.325 Y99.33 F42000
; LINE_WIDTH: 0.528952
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.649 J-9.856 E.01081
G3 X88.787 Y99.35 I-1.088 J-128.073 E.05164
G1 X88.536 Y99.343 E.00617
G1 X88.526 Y99.329 E.00041
; LINE_WIDTH: 0.499256
G1 X88.328 Y99.057 E.00779
M204 S10000
G1 X87.441 Y99.189 F42000
; LINE_WIDTH: 0.119527
G1 F15000
M204 S6000
G1 X87.32 Y99.08 E.00075
; LINE_WIDTH: 0.0935289
G1 X87.209 Y98.973 E.00051
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.137576
G1 F15000
M204 S6000
G1 X86.253 Y98.501 E.0015
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.467978
G1 F15000
M204 S6000
G1 X86.1 Y97.479 E.00699
; LINE_WIDTH: 0.499643
G1 X86.085 Y97.468 E.00044
; LINE_WIDTH: 0.527418
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.520053
G3 X86.09 Y96.284 I6.168 J-.475 E.0284
M204 S10000
G1 X86.253 Y95.499 F42000
; LINE_WIDTH: 0.130974
G1 F15000
M204 S6000
G1 X86.292 Y95.367 E.0007
G1 X86.371 Y95.28 E.00061
; LINE_WIDTH: 0.0959599
G1 X86.45 Y95.192 E.0004
; LINE_WIDTH: 0.0806988
G1 X86.478 Y95.164 E.00011
; WIPE_START
G1 X86.45 Y95.192 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.671 Y97.664 Z1.24 F42000
G1 X93.764 Y97.696 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.437351
G1 F15000
M204 S6000
G3 X93.486 Y98.764 I-22.053 J-5.176 E.02222
M204 S10000
G1 X93.515 Y98.764 F42000
; LINE_WIDTH: 0.293081
G1 F15000
M204 S6000
G1 X93.632 Y98.183 E.00775
; LINE_WIDTH: 0.273271
G1 X93.649 Y98.086 E.0012
; LINE_WIDTH: 0.238999
G1 X93.666 Y97.988 E.00103
; LINE_WIDTH: 0.203345
G1 X93.685 Y97.883 E.00093
; LINE_WIDTH: 0.16705
G1 X93.703 Y97.738 E.00101
; LINE_WIDTH: 0.130236
G1 X93.721 Y97.588 E.00077
; LINE_WIDTH: 0.0957533
G1 X93.739 Y97.35 E.00082
M204 S10000
G1 X93.739 Y96.658 F42000
; LINE_WIDTH: 0.0901986
G1 F15000
M204 S6000
G1 X93.727 Y96.469 E.0006
; LINE_WIDTH: 0.11768
G1 X93.71 Y96.323 E.00066
; LINE_WIDTH: 0.15209
G1 X93.692 Y96.169 E.00095
; LINE_WIDTH: 0.194195
G1 X93.668 Y96.023 E.00122
; LINE_WIDTH: 0.242487
G1 X93.644 Y95.878 E.00157
; LINE_WIDTH: 0.268956
G1 X93.545 Y95.363 E.00623
M204 S10000
G1 X93.525 Y95.369 F42000
; LINE_WIDTH: 0.403591
G1 F15000
M204 S6000
G3 X93.764 Y96.338 I-31.206 J8.213 E.01843
; WIPE_START
G1 X93.525 Y95.369 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.003 Y94.521 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423242
G1 F15000
M204 S6000
G1 X93.204 Y94.319 E.00554
G1 X93.204 Y93.757 E.01092
G1 X92.817 Y94.144 E.01064
G2 X92.47 Y93.93 I-1.711 J2.382 E.00794
G1 X93.204 Y93.195 E.0202
G1 X93.204 Y92.633 E.01092
G1 X92.086 Y93.751 E.03073
G2 X91.663 Y93.613 I-1.457 J3.74 E.00867
G1 X93.204 Y92.071 E.04238
G1 X93.204 Y91.508 E.01092
G1 X91.187 Y93.526 E.05545
G1 X91.004 Y93.509 E.00358
G1 X90.642 Y93.509 E.00702
G1 X93.204 Y90.946 E.07042
G1 X93.204 Y90.384 E.01092
G1 X90.081 Y93.507 E.08584
G1 X89.52 Y93.506 E.0109
G1 X93.204 Y89.822 E.10125
G1 X93.204 Y89.26 E.01092
G1 X88.96 Y93.505 E.11667
G2 X88.371 Y93.531 I-.104 J4.262 E.01146
G1 X93.204 Y88.698 E.13284
G1 X93.204 Y88.136 E.01092
G1 X87.634 Y93.706 E.1531
G2 X86.796 Y94.135 I1.23 J3.437 E.01836
G1 X86.796 Y93.982 E.00297
G1 X93.204 Y87.574 E.17614
G1 X93.204 Y87.011 E.01092
G1 X86.796 Y93.42 E.17614
G1 X86.796 Y92.858 E.01092
G1 X93.204 Y86.449 E.17614
G1 X93.204 Y85.887 E.01092
G1 X86.796 Y92.296 E.17614
G1 X86.796 Y91.734 E.01092
G1 X92.449 Y86.08 E.15539
G1 X92.344 Y86.138 E.00234
G3 X91.555 Y86.413 I-1.674 J-3.547 E.01627
G1 X86.796 Y91.172 E.1308
G1 X86.796 Y90.61 E.01092
G1 X90.911 Y86.494 E.11311
G1 X90.348 Y86.495 E.01093
G1 X86.796 Y90.047 E.09765
G1 X86.796 Y89.485 E.01092
G1 X89.786 Y86.495 E.08219
G1 X89.223 Y86.495 E.01093
G1 X86.796 Y88.923 E.06673
G1 X86.796 Y88.361 E.01092
G1 X88.664 Y86.492 E.05136
G3 X88.158 Y86.436 I.146 J-3.614 E.0099
G1 X86.796 Y87.799 E.03746
G1 X86.796 Y87.237 E.01092
G1 X87.711 Y86.321 E.02517
G3 X87.309 Y86.161 I1.164 J-3.507 E.00841
G1 X86.796 Y86.675 E.01412
G1 X86.796 Y86.112 E.01092
G1 X87.074 Y85.834 E.00765
; WIPE_START
G1 X86.796 Y86.112 E-.1496
G1 X86.796 Y86.675 E-.21361
G1 X87.309 Y86.161 E-.27611
G1 X87.403 Y86.205 E-.03924
G1 X87.603 Y86.28 E-.08144
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.462 Y84.817 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0924335
G1 F15000
M204 S6000
G1 X86.379 Y84.724 E.00041
; LINE_WIDTH: 0.124066
G1 X86.236 Y84.559 E.00105
M204 S10000
G1 X86.367 Y83.662 F42000
; LINE_WIDTH: 0.467992
G1 F15000
M204 S6000
G1 X86.1 Y83.479 E.007
; LINE_WIDTH: 0.499653
G1 X86.085 Y83.468 E.00044
; LINE_WIDTH: 0.527423
G1 X86.069 Y83.457 E.00047
; LINE_WIDTH: 0.520054
G3 X86.09 Y82.283 I6.165 J-.475 E.0284
M204 S10000
G1 X86.253 Y81.499 F42000
; LINE_WIDTH: 0.137171
G1 F15000
M204 S6000
G1 X86.331 Y81.236 E.00149
M204 S10000
G1 X87.212 Y81.023 F42000
; LINE_WIDTH: 0.0960688
G1 F15000
M204 S6000
G1 X87.334 Y80.907 E.00058
; LINE_WIDTH: 0.122229
G1 X87.442 Y80.811 E.00068
M204 S10000
G1 X88.277 Y80.671 F42000
; LINE_WIDTH: 0.52852
G1 F15000
M204 S6000
G1 X88.648 Y80.652 E.00913
G3 X90.813 Y80.65 I1.212 J118.077 E.05323
G1 X91.064 Y80.657 E.00616
G1 X91.074 Y80.671 E.00041
; LINE_WIDTH: 0.499155
G1 X91.272 Y80.943 E.00779
M204 S10000
G1 X92.14 Y80.811 F42000
; LINE_WIDTH: 0.0969396
G1 F15000
M204 S6000
G1 X92.326 Y80.977 E.00087
; WIPE_START
G1 X92.14 Y80.811 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.764 Y82.338 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.40269
G1 F15000
M204 S6000
G1 X93.496 Y81.236 E.02091
M204 S10000
G1 X93.521 Y81.236 F42000
; LINE_WIDTH: 0.268956
G1 F15000
M204 S6000
G1 X93.644 Y81.878 E.00777
; LINE_WIDTH: 0.242487
G1 X93.668 Y82.023 E.00157
; LINE_WIDTH: 0.194195
G1 X93.692 Y82.169 E.00122
; LINE_WIDTH: 0.15209
G1 X93.71 Y82.323 E.00095
; LINE_WIDTH: 0.11768
G1 X93.727 Y82.469 E.00066
; LINE_WIDTH: 0.0901988
G1 X93.739 Y82.658 E.0006
M204 S10000
G1 X93.739 Y83.35 F42000
; LINE_WIDTH: 0.0957533
G1 F15000
M204 S6000
G1 X93.721 Y83.588 E.00082
; LINE_WIDTH: 0.130236
G1 X93.703 Y83.738 E.00077
; LINE_WIDTH: 0.16705
G1 X93.685 Y83.883 E.00101
; LINE_WIDTH: 0.203309
G1 X93.666 Y83.988 E.00093
; LINE_WIDTH: 0.238888
G1 X93.649 Y84.085 E.00103
; LINE_WIDTH: 0.273086
G1 X93.632 Y84.183 E.00119
; LINE_WIDTH: 0.29287
G1 X93.541 Y84.636 E.00603
; CHANGE_LAYER
; Z_HEIGHT: 0.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.632 Y84.183 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/166
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.24 I-.93 J.785 P1  F42000
G1 X96.622 Y87.727 Z1.24
G1 Z.96
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.935 Y86.928 I1.198 J.491 E.03172
G1 X98.014 Y86.516 E.0081
G3 X98.632 Y89.685 I-.239 J1.691 E.08151
G1 X98.759 Y90.285 E.01183
G3 X96.806 Y90.316 I-.953 J1.515 E.17696
G2 X96.87 Y89.885 I-.369 J-.276 E.00876
G2 X96.266 Y88.894 I-6.168 J3.087 E.02239
G3 X97.956 Y86.505 I1.543 J-.701 E.0681
; WIPE_START
G1 X98.549 Y86.682 E-.23508
G1 X99.049 Y87.049 E-.2361
G1 X99.29 Y87.388 E-.15785
G1 X99.414 Y87.71 E-.13098
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.36 I-.883 J-.838 P1  F42000
G1 X88.797 Y98.9 Z1.36
G1 Z.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03671
G3 X90.877 Y98.899 I-.003 J1.9 E.10775
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.574 Y98.887 E-.10788
G1 X88.461 Y98.87 E-.04349
G1 X88.314 Y98.837 E-.05694
G1 X88.064 Y98.752 E-.10067
G1 X87.828 Y98.633 E-.10026
G1 X87.702 Y98.55 E-.05733
G1 X87.582 Y98.458 E-.05747
G1 X87.47 Y98.357 E-.05726
G1 X87.294 Y98.159 E-.10078
G1 X87.207 Y98.036 E-.05726
G1 X87.179 Y97.989 E-.02066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.116 Y90.414 Z1.36 F42000
G1 X88.797 Y84.9 Z1.36
G1 Z.96
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.10911
G1 X90.803 Y81.1 E.03671
G3 X90.877 Y84.899 I-.003 J1.9 E.10775
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.574 Y84.887 E-.10788
G1 X88.461 Y84.87 E-.04349
G1 X88.314 Y84.837 E-.05694
G1 X88.064 Y84.752 E-.10067
G1 X87.828 Y84.633 E-.10026
G1 X87.702 Y84.55 E-.05733
G1 X87.582 Y84.458 E-.05747
G1 X87.47 Y84.357 E-.05726
G1 X87.294 Y84.159 E-.10078
G1 X87.207 Y84.036 E-.05726
G1 X87.179 Y83.989 E-.02066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.037 Y91.62 Z1.36 F42000
G1 X86.899 Y98.977 Z1.36
G1 Z.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01817
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.104 E.00447
G2 X86.639 Y98.658 I2.771 J-1.272 E.01339
G1 X86.861 Y98.93 E.00729
; WIPE_START
G1 X86.023 Y98.977 E-.3189
G1 X86.023 Y97.944 E-.39243
G1 X86.149 Y97.92 E-.04867
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.825 Y90.473 Z1.36 F42000
G1 X88.798 Y86.148 Z1.36
G1 Z.96
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.141 J-3.157 E.05992
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.58 J1.809 E.06217
G1 X88.772 Y93.852 E.04252
G2 X86.782 Y94.583 I.038 J3.179 E.04481
G1 X86.448 Y94.884 E.00934
G1 X86.448 Y85.115 E.20264
G1 X86.781 Y85.417 E.00933
G2 X88.738 Y86.147 I2.017 J-2.417 E.04417
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z1.36 F42000
G1 X93.977 Y98.977 Z1.36
G1 Z.96
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.679 Y98.977 E.02691
G2 X93.42 Y96.251 I-1.91 J-1.983 E.06151
G2 X90.815 Y94.277 I-2.619 J.749 E.07271
G1 X88.78 Y94.277 E.04222
G2 X86.23 Y96.095 I.024 J2.731 E.06919
G1 X86.023 Y96.056 E.00436
G1 X86.023 Y83.944 E.25123
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.575 J-.912 E.0693
G1 X90.914 Y85.722 E.04415
G2 X92.925 Y81.295 I-.118 J-2.724 E.12455
G1 X92.684 Y81.023 E.00753
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.679 Y98.977 E-.49356
G1 X92.891 Y98.747 E-.1189
G1 X93.054 Y98.531 E-.10282
G1 X93.115 Y98.43 E-.04473
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.151 Y91.397 Z1.36 F42000
G1 X86.23 Y82.095 Z1.36
G1 Z.96
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.056 E.00436
G1 X86.023 Y81.023 E.02141
G1 X86.904 Y81.023 E.01827
G1 X86.642 Y81.338 E.00849
G2 X86.251 Y82.039 I2.192 J1.682 E.01671
; WIPE_START
G1 X86.023 Y82.056 E-.08652
G1 X86.023 Y81.023 E-.39221
G1 X86.764 Y81.023 E-.28128
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z1.36 F42000
G1 Z.96
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04363
G2 X91.502 Y80.807 I-.098 J-2.3 E.13308
G1 X91.541 Y80.599 E.00439
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.547 Y99.401 E.0592
G1 X91.505 Y99.198 E.0043
G1 X91.816 Y99.063 E.00703
G2 X90.809 Y94.701 I-1.019 J-2.062 E.12776
G1 X88.788 Y94.701 E.04191
G2 X88.098 Y99.193 I.015 J2.301 E.1348
G1 X88.059 Y99.401 E.00439
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.526 Y85.283 I.701 J2.189 E.12935
G1 X88.714 Y85.294 E.00389
; WIPE_START
G1 X88.791 Y85.299 E-.02967
G1 X90.713 Y85.298 E-.73033
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.784 Y92.644 Z1.36 F42000
G1 X94.8 Y99.8 Z1.36
G1 Z.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.283 Y99.057 F42000
G1 Z.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0915896
G1 F15000
M204 S6000
G1 X92.177 Y99.148 E.00045
G1 X92.105 Y99.168 E.00024
M204 S10000
G1 X91.328 Y99.33 F42000
; LINE_WIDTH: 0.528996
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.653 J-9.867 E.0109
G3 X88.787 Y99.35 I-1.088 J-127.59 E.05164
G1 X88.536 Y99.343 E.00619
G1 X88.528 Y99.332 E.00032
; LINE_WIDTH: 0.506724
G1 X88.326 Y99.058 E.008
M204 S10000
G1 X87.436 Y99.189 F42000
; LINE_WIDTH: 0.126382
G1 F15000
M204 S6000
G1 X87.32 Y99.085 E.00076
; LINE_WIDTH: 0.0974933
G1 X87.189 Y98.958 E.00064
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.137116
G1 F15000
M204 S6000
G1 X86.253 Y98.501 E.00149
M204 S10000
G1 X86.09 Y97.715 F42000
; LINE_WIDTH: 0.522287
G1 F15000
M204 S6000
G3 X86.09 Y96.285 I6.449 J-.715 E.0348
M204 S10000
G1 X86.236 Y95.447 F42000
; LINE_WIDTH: 0.109432
G1 F15000
M204 S6000
G1 X86.449 Y95.201 E.00133
; WIPE_START
G1 X86.236 Y95.447 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.078 Y94.163 Z1.36 F42000
G1 Z.96
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426622
G1 F15000
M204 S6000
M73 P34 R15
G1 X86.796 Y93.881 E.00783
G1 X86.796 Y93.314 E.01111
G1 X87.317 Y93.835 E.01446
G3 X87.723 Y93.675 I1.21 J2.468 E.00857
G1 X86.796 Y92.747 E.02572
G1 X86.796 Y92.18 E.01111
G1 X88.177 Y93.562 E.0383
G3 X88.69 Y93.507 I.604 J3.253 E.01011
G1 X86.796 Y91.613 E.05251
G1 X86.796 Y91.046 E.01111
G1 X89.255 Y93.505 E.06817
G1 X89.823 Y93.507 E.01114
G1 X86.796 Y90.479 E.08392
G1 X86.796 Y89.912 E.01111
G1 X90.391 Y93.508 E.09967
G1 X90.96 Y93.509 E.01114
G1 X86.796 Y89.345 E.11542
G1 X86.796 Y88.778 E.01111
G1 X91.62 Y93.603 E.13372
G3 X92.571 Y93.987 I-.821 J3.4 E.02019
G1 X86.796 Y88.211 E.16009
G1 X86.796 Y87.645 E.01111
G1 X93.204 Y94.053 E.17764
G1 X93.204 Y93.486 E.01111
G1 X86.796 Y87.078 E.17764
G1 X86.796 Y86.511 E.01111
G1 X93.204 Y92.92 E.17764
G1 X93.204 Y92.353 E.01111
G1 X86.796 Y85.944 E.17764
G1 X86.796 Y85.865 E.00155
G2 X87.752 Y86.334 I2.017 J-2.904 E.02096
G1 X93.204 Y91.786 E.15112
G1 X93.204 Y91.219 E.01111
G1 X88.464 Y86.479 E.13138
G1 X88.597 Y86.491 E.0026
G1 X89.044 Y86.491 E.00877
G1 X93.204 Y90.652 E.11532
G1 X93.204 Y90.085 E.01111
G1 X89.612 Y86.492 E.09958
G1 X90.179 Y86.493 E.01113
G1 X93.204 Y89.518 E.08385
G1 X93.204 Y88.951 E.01111
G1 X90.747 Y86.494 E.06811
G2 X91.268 Y86.466 I.105 J-2.865 E.01023
G1 X91.283 Y86.463 E.00031
G1 X93.204 Y88.384 E.05325
G1 X93.204 Y87.817 E.01111
G1 X91.75 Y86.363 E.04031
G2 X92.168 Y86.214 I-.511 J-2.099 E.00872
G1 X93.204 Y87.25 E.02872
G1 X93.204 Y86.683 E.01111
G1 X92.548 Y86.027 E.01819
G2 X92.889 Y85.801 I-1.244 J-2.239 E.00802
G1 X93.382 Y86.294 E.01367
M204 S10000
G1 X93.223 Y85.361 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879227
G1 F15000
M204 S6000
G1 X93.34 Y85.257 E.00048
M204 S10000
G1 X93.541 Y84.636 F42000
; LINE_WIDTH: 0.292937
G1 F15000
M204 S6000
G1 X93.632 Y84.183 E.00603
; LINE_WIDTH: 0.273167
G1 X93.649 Y84.086 E.00119
; LINE_WIDTH: 0.238977
G1 X93.666 Y83.988 E.00103
; LINE_WIDTH: 0.203405
G1 X93.685 Y83.883 E.00093
; LINE_WIDTH: 0.16741
G1 X93.703 Y83.74 E.001
; LINE_WIDTH: 0.131137
G1 X93.721 Y83.593 E.00076
; LINE_WIDTH: 0.0963418
G1 X93.74 Y83.358 E.00081
M204 S10000
G1 X93.739 Y82.658 F42000
; LINE_WIDTH: 0.0902405
G1 F15000
M204 S6000
G1 X93.727 Y82.468 E.0006
; LINE_WIDTH: 0.117737
G1 X93.71 Y82.322 E.00066
; LINE_WIDTH: 0.152096
G1 X93.692 Y82.169 E.00095
; LINE_WIDTH: 0.194171
G1 X93.668 Y82.024 E.00122
; LINE_WIDTH: 0.242452
G1 X93.644 Y81.878 E.00157
; LINE_WIDTH: 0.268907
G1 X93.521 Y81.236 E.00777
M204 S10000
G1 X93.496 Y81.236 F42000
; LINE_WIDTH: 0.402601
G1 F15000
M204 S6000
G1 X93.764 Y82.338 E.02091
; WIPE_START
G1 X93.496 Y81.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.326 Y80.976 Z1.36 F42000
G1 Z.96
G1 E.8 F1800
; LINE_WIDTH: 0.097015
G1 F15000
M204 S6000
G1 X92.14 Y80.811 E.00087
M204 S10000
G1 X91.274 Y80.942 F42000
; LINE_WIDTH: 0.506747
G1 F15000
M204 S6000
G1 X91.072 Y80.668 E.008
; LINE_WIDTH: 0.528653
G1 X91.064 Y80.658 E.00032
G1 X90.813 Y80.65 E.00618
G2 X88.607 Y80.654 I-.909 J112.376 E.05424
G1 X88.277 Y80.672 E.00813
M204 S10000
G1 X87.442 Y80.811 F42000
; LINE_WIDTH: 0.120174
G1 F15000
M204 S6000
G1 X87.323 Y80.918 E.00074
; LINE_WIDTH: 0.0939577
G1 X87.21 Y81.026 E.00052
M204 S10000
G1 X86.331 Y81.236 F42000
; LINE_WIDTH: 0.137293
G1 F15000
M204 S6000
G1 X86.253 Y81.499 E.0015
M204 S10000
G1 X86.09 Y82.285 F42000
; LINE_WIDTH: 0.522286
G1 F15000
M204 S6000
G2 X86.09 Y83.715 I6.451 J.715 E.0348
M204 S10000
G1 X86.236 Y84.552 F42000
; LINE_WIDTH: 0.108494
G1 F15000
M204 S6000
G1 X86.445 Y84.794 E.0013
; WIPE_START
G1 X86.236 Y84.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.344 Y90.984 Z1.36 F42000
G1 X93.764 Y96.337 Z1.36
G1 Z.96
G1 E.8 F1800
; LINE_WIDTH: 0.403491
G1 F15000
M204 S6000
G2 X93.524 Y95.37 I-19.535 J4.347 E.01842
M204 S10000
G1 X93.545 Y95.363 F42000
; LINE_WIDTH: 0.268885
G1 F15000
M204 S6000
G1 X93.644 Y95.878 E.00624
; LINE_WIDTH: 0.242426
G1 X93.668 Y96.024 E.00157
; LINE_WIDTH: 0.194133
G1 X93.692 Y96.17 E.00122
; LINE_WIDTH: 0.152065
G1 X93.71 Y96.322 E.00095
; LINE_WIDTH: 0.117727
G1 X93.727 Y96.468 E.00066
; LINE_WIDTH: 0.0902401
G1 X93.739 Y96.658 E.0006
M204 S10000
G1 X93.74 Y97.358 F42000
; LINE_WIDTH: 0.0963418
G1 F15000
M204 S6000
G1 X93.721 Y97.593 E.00081
; LINE_WIDTH: 0.131137
G1 X93.703 Y97.74 E.00076
; LINE_WIDTH: 0.16741
G1 X93.685 Y97.883 E.001
; LINE_WIDTH: 0.203405
G1 X93.666 Y97.988 E.00093
; LINE_WIDTH: 0.238977
G1 X93.649 Y98.086 E.00103
; LINE_WIDTH: 0.273167
G1 X93.632 Y98.183 E.00119
; LINE_WIDTH: 0.292937
G1 X93.515 Y98.764 E.00775
M204 S10000
G1 X93.486 Y98.764 F42000
; LINE_WIDTH: 0.437251
G1 F15000
M204 S6000
G2 X93.764 Y97.695 I-21.503 J-6.17 E.02223
; CHANGE_LAYER
; Z_HEIGHT: 1.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.486 Y98.764 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/166
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.36 I1.168 J.343 P1  F42000
G1 X96.664 Y87.933 Z1.36
G1 Z1.08
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.855 Y87.024 I1.157 J.281 E.03123
G1 X97.91 Y86.607 E.0081
G3 X98.618 Y89.554 I-.125 J1.588 E.07718
G1 X98.499 Y89.762 E.00462
G1 X98.729 Y90.334 E.0119
G3 X99.336 Y92.618 I-.997 J1.487 E.04973
G3 X97.064 Y90.253 I-1.531 J-.802 E.12621
G2 X96.962 Y89.541 I-1.704 J-.12 E.01398
G3 X97.851 Y86.6 I.859 J-1.345 E.07973
; WIPE_START
G1 X98.439 Y86.742 E-.22985
G1 X98.942 Y87.083 E-.23091
G1 X99.185 Y87.408 E-.15443
G1 X99.328 Y87.762 E-.14482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.48 I-.884 J-.836 P1  F42000
G1 X88.797 Y98.9 Z1.48
G1 Z1.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.1091
G1 X90.803 Y95.1 E.03671
G3 X90.877 Y98.899 I-.003 J1.9 E.10776
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.887 E-.10819
G1 X88.426 Y98.863 E-.05669
G1 X88.17 Y98.793 E-.10062
G1 X88.042 Y98.742 E-.05258
G1 X87.927 Y98.688 E-.04829
G1 X87.796 Y98.613 E-.05721
G1 X87.672 Y98.529 E-.05686
G1 X87.47 Y98.357 E-.10062
G1 X87.294 Y98.159 E-.10072
G1 X87.207 Y98.036 E-.05731
G1 X87.179 Y97.989 E-.0209
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.116 Y90.414 Z1.48 F42000
G1 X88.797 Y84.9 Z1.48
G1 Z1.08
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.1091
G1 X90.803 Y81.1 E.03671
G3 X90.877 Y84.899 I-.004 J1.9 E.10772
G1 X88.857 Y84.9 E.03696
; WIPE_START
M204 S6000
G1 X88.573 Y84.886 E-.1083
G1 X88.426 Y84.863 E-.05659
G1 X88.17 Y84.793 E-.10062
G1 X88.042 Y84.742 E-.05258
G1 X87.927 Y84.688 E-.04829
G1 X87.796 Y84.613 E-.05721
G1 X87.672 Y84.529 E-.05686
G1 X87.47 Y84.357 E-.10062
G1 X87.294 Y84.159 E-.10072
G1 X87.207 Y84.036 E-.05731
G1 X87.179 Y83.989 E-.0209
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.038 Y91.62 Z1.48 F42000
G1 X86.903 Y98.977 Z1.48
G1 Z1.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01824
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00447
G2 X86.641 Y98.661 I2.778 J-1.276 E.01346
G1 X86.864 Y98.93 E.00726
; WIPE_START
G1 X86.023 Y98.977 E-.32006
G1 X86.023 Y97.944 E-.39244
G1 X86.146 Y97.92 E-.0475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.823 Y90.474 Z1.48 F42000
G1 X88.798 Y86.148 Z1.48
G1 Z1.08
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.936 Y86.146 E.04434
G2 X93.379 Y84.805 I-.15 J-3.169 E.05985
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.579 J1.806 E.06218
G1 X88.772 Y93.852 E.04253
G2 X86.783 Y94.582 I.039 J3.18 E.0448
G1 X86.448 Y94.884 E.00935
G1 X86.448 Y85.115 E.20264
G1 X86.776 Y85.412 E.00917
G2 X88.738 Y86.147 I2.022 J-2.409 E.04432
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z1.48 F42000
G1 X93.977 Y98.977 Z1.48
G1 Z1.08
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.679 Y98.977 E.02691
G2 X93.084 Y95.514 I-1.897 J-1.977 E.07838
G2 X90.815 Y94.277 I-2.289 J1.498 E.05583
G1 X88.78 Y94.277 E.04222
G2 X86.228 Y96.095 I.025 J2.734 E.06921
G1 X86.023 Y96.054 E.00433
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.575 J-.912 E.0693
G1 X90.916 Y85.722 E.04419
G2 X92.925 Y81.295 I-.12 J-2.724 E.12451
G1 X92.684 Y81.023 E.00753
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.679 Y98.977 E-.49358
G1 X92.891 Y98.747 E-.11873
G1 X93.054 Y98.531 E-.10278
G1 X93.115 Y98.43 E-.04491
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.15 Y91.397 Z1.48 F42000
G1 X86.228 Y82.095 Z1.48
G1 Z1.08
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00432
G1 X86.023 Y81.023 E.02137
G1 X86.904 Y81.023 E.01827
G1 X86.641 Y81.338 E.0085
G2 X86.249 Y82.039 I2.32 J1.76 E.01671
; WIPE_START
G1 X86.023 Y82.054 E-.08587
G1 X86.023 Y81.023 E-.39142
G1 X86.767 Y81.023 E-.28272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z1.48 F42000
G1 Z1.08
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.896 Y85.298 E.04365
G2 X91.501 Y80.806 I-.101 J-2.3 E.13306
G1 X91.54 Y80.599 E.00437
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.541 Y99.401 E.05932
G1 X91.506 Y99.188 E.00448
G2 X90.809 Y94.701 I-.708 J-2.188 E.13468
G1 X88.788 Y94.701 E.04191
G2 X88.099 Y99.194 I.015 J2.302 E.13483
G1 X88.06 Y99.401 E.00437
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.523 Y85.283 I.701 J2.189 E.12928
G1 X88.713 Y85.294 E.00395
; WIPE_START
G1 X88.791 Y85.299 E-.02972
G1 X90.713 Y85.298 E-.73028
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z1.48 F42000
G1 X94.8 Y99.8 Z1.48
G1 Z1.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.29 Y99.05 F42000
G1 Z1.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0918067
G1 F15000
M204 S6000
G1 X92.177 Y99.148 E.00048
G1 X92.105 Y99.168 E.00024
M204 S10000
G1 X91.327 Y99.33 F42000
; LINE_WIDTH: 0.528974
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.652 J-9.888 E.01086
G3 X88.787 Y99.35 I-1.088 J-127.914 E.05164
G1 X88.536 Y99.343 E.00617
G1 X88.526 Y99.329 E.00041
; LINE_WIDTH: 0.499315
G1 X88.328 Y99.057 E.0078
M204 S10000
G1 X87.439 Y99.189 F42000
; LINE_WIDTH: 0.116073
G1 F15000
M204 S6000
G1 X87.288 Y99.052 E.0009
; LINE_WIDTH: 0.0892008
G1 X87.205 Y98.97 E.00036
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.137662
G1 F15000
M204 S6000
G1 X86.253 Y98.501 E.0015
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.467977
G1 F15000
M204 S6000
G1 X86.1 Y97.479 E.007
; LINE_WIDTH: 0.49961
G1 X86.085 Y97.468 E.00044
; LINE_WIDTH: 0.527403
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.520266
G3 X86.091 Y96.284 I6.137 J-.474 E.02841
M204 S10000
G1 X86.236 Y95.446 F42000
; LINE_WIDTH: 0.109606
G1 F15000
M204 S6000
G1 X86.45 Y95.2 E.00134
; WIPE_START
G1 X86.236 Y95.446 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.549 Y97.632 Z1.48 F42000
G1 X93.764 Y97.696 Z1.48
G1 Z1.08
G1 E.8 F1800
; LINE_WIDTH: 0.437511
G1 F15000
M204 S6000
G3 X93.486 Y98.764 I-22.187 J-5.21 E.02222
M204 S10000
G1 X93.515 Y98.764 F42000
; LINE_WIDTH: 0.293091
G1 F15000
M204 S6000
G1 X93.632 Y98.183 E.00775
; LINE_WIDTH: 0.273239
G1 X93.649 Y98.086 E.0012
; LINE_WIDTH: 0.238916
G1 X93.666 Y97.988 E.00103
; LINE_WIDTH: 0.203209
G1 X93.685 Y97.882 E.00093
; LINE_WIDTH: 0.166814
G1 X93.703 Y97.737 E.00101
; LINE_WIDTH: 0.129871
G1 X93.722 Y97.586 E.00077
; LINE_WIDTH: 0.0955475
G1 X93.739 Y97.348 E.00082
M204 S10000
G1 X93.739 Y96.658 F42000
; LINE_WIDTH: 0.0901884
G1 F15000
M204 S6000
G1 X93.727 Y96.469 E.0006
; LINE_WIDTH: 0.117592
G1 X93.71 Y96.323 E.00066
; LINE_WIDTH: 0.15183
G1 X93.692 Y96.17 E.00095
; LINE_WIDTH: 0.19383
G1 X93.668 Y96.025 E.00122
; LINE_WIDTH: 0.242098
G1 X93.644 Y95.879 E.00156
; LINE_WIDTH: 0.268524
G1 X93.546 Y95.362 E.00624
M204 S10000
G1 X93.524 Y95.37 F42000
; LINE_WIDTH: 0.403128
G1 F15000
M204 S6000
G3 X93.764 Y96.338 I-20.914 J5.704 E.01842
; WIPE_START
G1 X93.524 Y95.37 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.003 Y94.521 Z1.48 F42000
G1 Z1.08
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423302
G1 F15000
M204 S6000
G1 X93.204 Y94.319 E.00554
G1 X93.204 Y93.757 E.01093
G1 X92.816 Y94.145 E.01068
G2 X92.469 Y93.93 I-1.531 J2.075 E.00794
G1 X93.204 Y93.195 E.0202
G1 X93.204 Y92.632 E.01093
G1 X92.086 Y93.751 E.03074
G2 X91.662 Y93.612 I-1.457 J3.744 E.00867
G1 X93.204 Y92.07 E.04239
G1 X93.204 Y91.508 E.01093
G1 X91.187 Y93.526 E.05547
G1 X91.004 Y93.509 E.00357
G1 X90.642 Y93.509 E.00703
G1 X93.204 Y90.946 E.07045
G1 X93.204 Y90.384 E.01093
G1 X90.081 Y93.507 E.08587
G1 X89.52 Y93.506 E.0109
G1 X93.204 Y89.821 E.10129
G1 X93.204 Y89.259 E.01093
G1 X88.959 Y93.505 E.11671
G2 X88.369 Y93.532 I-.097 J4.322 E.01147
G1 X93.204 Y88.697 E.1329
G1 X93.204 Y88.135 E.01093
G1 X87.633 Y93.707 E.15316
G2 X86.796 Y94.135 I1.083 J3.146 E.01834
G1 X86.796 Y93.981 E.00299
G1 X93.204 Y87.572 E.17617
G1 X93.204 Y87.01 E.01093
G1 X86.796 Y93.419 E.17617
G1 X86.796 Y92.857 E.01093
G1 X93.204 Y86.448 E.17617
G1 X93.204 Y85.886 E.01093
G1 X86.796 Y92.295 E.17617
G1 X86.796 Y91.732 E.01093
G1 X92.446 Y86.082 E.15532
G1 X92.345 Y86.138 E.00225
G3 X91.553 Y86.413 I-1.675 J-3.55 E.01633
G1 X86.796 Y91.17 E.13077
G1 X86.796 Y90.608 E.01093
G1 X90.909 Y86.494 E.11308
G1 X90.347 Y86.495 E.01094
G1 X86.796 Y90.046 E.09762
G1 X86.796 Y89.484 E.01093
G1 X89.784 Y86.495 E.08215
G1 X89.222 Y86.495 E.01094
G1 X86.796 Y88.921 E.06669
G1 X86.796 Y88.359 E.01093
G1 X88.662 Y86.492 E.05131
G3 X88.157 Y86.436 I.15 J-3.63 E.0099
G1 X86.796 Y87.797 E.03741
G1 X86.796 Y87.235 E.01093
G1 X87.71 Y86.32 E.02513
G3 X87.308 Y86.16 I1.161 J-3.492 E.00841
G1 X86.796 Y86.672 E.01408
G1 X86.796 Y86.11 E.01093
G1 X87.073 Y85.833 E.00761
; WIPE_START
G1 X86.796 Y86.11 E-.14882
G1 X86.796 Y86.672 E-.21364
G1 X87.308 Y86.16 E-.27533
G1 X87.407 Y86.207 E-.04147
G1 X87.605 Y86.281 E-.08074
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.445 Y84.794 Z1.48 F42000
G1 Z1.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.108433
G1 F15000
M204 S6000
G1 X86.236 Y84.552 E.0013
M204 S10000
G1 X86.367 Y83.662 F42000
; LINE_WIDTH: 0.467977
G1 F15000
M204 S6000
G1 X86.1 Y83.479 E.007
; LINE_WIDTH: 0.49961
G1 X86.085 Y83.468 E.00044
; LINE_WIDTH: 0.527403
G1 X86.069 Y83.457 E.00047
; LINE_WIDTH: 0.520262
G3 X86.091 Y82.284 I6.139 J-.474 E.02841
M204 S10000
G1 X86.253 Y81.498 F42000
; LINE_WIDTH: 0.139751
G1 F15000
M204 S6000
G1 X86.331 Y81.236 E.00153
M204 S10000
G1 X87.212 Y81.023 F42000
; LINE_WIDTH: 0.09653
M73 P35 R15
G1 F15000
M204 S6000
G1 X87.337 Y80.905 E.00059
; LINE_WIDTH: 0.122673
G1 X87.442 Y80.811 E.00067
M204 S10000
G1 X88.277 Y80.673 F42000
; LINE_WIDTH: 0.528655
G1 F15000
M204 S6000
G1 X88.605 Y80.654 E.00808
G3 X90.813 Y80.65 I1.302 J112.317 E.05428
G1 X91.064 Y80.657 E.00616
G1 X91.074 Y80.671 E.00042
; LINE_WIDTH: 0.498668
G1 X91.272 Y80.943 E.00778
M204 S10000
G1 X92.105 Y80.831 F42000
; LINE_WIDTH: 0.0963723
G1 F15000
M204 S6000
G1 X92.192 Y80.857 E.00031
G1 X92.323 Y80.972 E.0006
; WIPE_START
G1 X92.192 Y80.857 E-.49964
G1 X92.105 Y80.831 E-.26036
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.764 Y82.338 Z1.48 F42000
G1 Z1.08
G1 E.8 F1800
; LINE_WIDTH: 0.4023
G1 F15000
M204 S6000
G1 X93.496 Y81.236 E.02089
M204 S10000
G1 X93.522 Y81.236 F42000
; LINE_WIDTH: 0.268703
G1 F15000
M204 S6000
G1 X93.644 Y81.878 E.00777
; LINE_WIDTH: 0.24223
G1 X93.668 Y82.024 E.00157
; LINE_WIDTH: 0.193865
G1 X93.692 Y82.171 E.00122
; LINE_WIDTH: 0.151817
G1 X93.71 Y82.323 E.00095
; LINE_WIDTH: 0.117587
G1 X93.727 Y82.469 E.00066
; LINE_WIDTH: 0.0901882
G1 X93.739 Y82.658 E.0006
M204 S10000
G1 X93.739 Y83.348 F42000
; LINE_WIDTH: 0.0955475
G1 F15000
M204 S6000
G1 X93.722 Y83.586 E.00082
; LINE_WIDTH: 0.129871
G1 X93.703 Y83.737 E.00077
; LINE_WIDTH: 0.166814
G1 X93.685 Y83.882 E.00101
; LINE_WIDTH: 0.203209
G1 X93.666 Y83.988 E.00093
; LINE_WIDTH: 0.238916
G1 X93.649 Y84.086 E.00103
; LINE_WIDTH: 0.273239
G1 X93.632 Y84.183 E.0012
; LINE_WIDTH: 0.293091
G1 X93.541 Y84.636 E.00603
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.632 Y84.183 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/166
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.48 I-.834 J.886 P1  F42000
G1 X97.068 Y87.419 Z1.48
G1 Z1.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.804 Y87.124 I1.125 J1.739 E.01537
G1 X97.859 Y86.708 E.0081
G1 X97.986 Y86.724 E.00248
G3 X97.056 Y86.899 I-.206 J1.467 E.16088
G3 X97.8 Y86.7 I.744 J1.289 E.01502
; WIPE_START
G1 X97.986 Y86.724 E-.07131
G1 X98.544 Y86.899 E-.22225
G1 X98.852 Y87.136 E-.14765
G1 X99.161 Y87.617 E-.21731
G1 X99.219 Y87.878 E-.10148
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I-.973 J-.731 P1  F42000
G1 X97.071 Y90.739 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.964 Y90.525 I.725 J1.054 E.0181
G1 X98.065 Y90.117 E.0081
G1 X98.25 Y90.163 E.00368
G3 X97.19 Y90.203 I-.47 J1.649 E.18681
G3 X98.007 Y90.103 I.61 J1.609 E.01603
; WIPE_START
G1 X98.25 Y90.163 E-.09509
G1 X98.778 Y90.395 E-.21891
G1 X99.088 Y90.67 E-.15765
G1 X99.324 Y91.012 E-.15767
G1 X99.446 Y91.334 E-.13068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I-.705 J-.992 P1  F42000
G1 X88.797 Y98.9 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03671
G3 X90.875 Y98.899 I-.003 J1.9 E.10779
G1 X88.857 Y98.9 E.03691
; WIPE_START
M204 S6000
G1 X88.573 Y98.887 E-.10822
G1 X88.426 Y98.863 E-.05671
G1 X88.184 Y98.797 E-.09522
G1 X88.063 Y98.752 E-.04892
G1 X87.827 Y98.632 E-.10058
G1 X87.701 Y98.55 E-.05699
G1 X87.582 Y98.458 E-.05729
G1 X87.47 Y98.357 E-.0574
G1 X87.366 Y98.247 E-.05758
G1 X87.272 Y98.129 E-.05727
G1 X87.182 Y97.987 E-.06385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.117 Y90.412 Z1.6 F42000
G1 X88.797 Y84.9 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.10911
G1 X90.803 Y81.1 E.03671
G3 X90.875 Y84.899 I-.003 J1.9 E.10779
G1 X88.857 Y84.9 E.03691
; WIPE_START
M204 S6000
G1 X88.573 Y84.887 E-.10822
G1 X88.426 Y84.863 E-.05671
G1 X88.184 Y84.797 E-.09522
G1 X88.063 Y84.752 E-.04892
G1 X87.827 Y84.632 E-.10058
G1 X87.701 Y84.55 E-.05699
G1 X87.582 Y84.458 E-.05729
G1 X87.47 Y84.357 E-.0574
G1 X87.366 Y84.247 E-.05757
G1 X87.272 Y84.129 E-.05719
G1 X87.182 Y83.987 E-.06392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.036 Y91.619 Z1.6 F42000
G1 X86.896 Y98.977 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01809
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00447
G2 X86.61 Y98.62 I2.778 J-1.273 E.01239
G1 X86.858 Y98.93 E.00824
; WIPE_START
G1 X86.023 Y98.977 E-.3177
G1 X86.023 Y97.944 E-.39243
G1 X86.152 Y97.919 E-.04987
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.826 Y90.472 Z1.6 F42000
G1 X88.798 Y86.148 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.919 Y86.146 E.04398
G2 X93.379 Y84.805 I-.125 J-3.155 E.06022
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.58 J1.81 E.06217
G1 X88.772 Y93.852 E.04252
G2 X86.781 Y94.583 I.039 J3.18 E.04484
G1 X86.448 Y94.885 E.00933
G1 X86.448 Y85.115 E.20266
G1 X86.781 Y85.417 E.00934
G2 X88.738 Y86.147 I2.017 J-2.418 E.04416
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z1.6 F42000
G1 X93.977 Y98.977 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.679 Y98.977 E.02691
G2 X93.221 Y95.749 I-1.902 J-1.978 E.07273
G2 X90.815 Y94.277 I-2.42 J1.252 E.06149
G1 X88.78 Y94.277 E.04222
G2 X86.228 Y96.095 I.025 J2.736 E.06921
G1 X86.023 Y96.054 E.00432
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.575 J-.912 E.0693
G1 X90.904 Y85.722 E.04394
G2 X92.925 Y81.295 I-.106 J-2.724 E.12478
G1 X92.684 Y81.023 E.00753
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.679 Y98.977 E-.49357
G1 X92.891 Y98.747 E-.11877
G1 X93.054 Y98.53 E-.10301
G1 X93.115 Y98.43 E-.04465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.15 Y91.397 Z1.6 F42000
G1 X86.228 Y82.095 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00432
G1 X86.023 Y81.023 E.02137
G1 X86.904 Y81.023 E.01827
G1 X86.642 Y81.338 E.0085
G2 X86.249 Y82.039 I2.335 J1.768 E.01671
; WIPE_START
G1 X86.023 Y82.054 E-.08588
G1 X86.023 Y81.023 E-.39142
G1 X86.767 Y81.023 E-.28269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.889 Y85.298 E.0435
G2 X91.501 Y80.808 I-.093 J-2.299 E.13318
G1 X91.539 Y80.599 E.0044
G1 X94.401 Y80.599 E.05935
G1 X94.401 Y99.401 E.38999
G1 X91.547 Y99.401 E.05919
G1 X91.505 Y99.198 E.0043
G2 X92.239 Y98.794 I-1.033 J-2.749 E.01744
G2 X90.809 Y94.701 I-1.439 J-1.794 E.11742
G1 X88.788 Y94.701 E.04191
G2 X88.099 Y99.192 I.014 J2.301 E.1348
G1 X88.061 Y99.401 E.0044
G1 X85.599 Y99.401 E.05106
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00446
G2 X88.523 Y85.283 I.701 J2.189 E.12929
G1 X88.713 Y85.294 E.00395
; WIPE_START
G1 X88.791 Y85.299 E-.02972
G1 X90.713 Y85.298 E-.73028
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z1.6 F42000
G1 X94.8 Y99.8 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.29 Y99.049 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0921714
G1 F15000
M204 S6000
G1 X92.177 Y99.148 E.00049
G1 X92.103 Y99.169 E.00025
M204 S10000
G1 X91.327 Y99.325 F42000
; LINE_WIDTH: 0.529319
G1 F15000
M204 S6000
G1 X90.882 Y99.349 E.01099
G3 X88.787 Y99.35 I-1.085 J-128.133 E.05158
G1 X88.537 Y99.343 E.00617
G1 X88.526 Y99.329 E.00042
; LINE_WIDTH: 0.498718
G1 X88.327 Y99.057 E.0078
M204 S10000
G1 X87.43 Y99.189 F42000
; LINE_WIDTH: 0.13204
G1 F15000
M204 S6000
G1 X87.318 Y99.088 E.00078
; LINE_WIDTH: 0.100733
G1 X87.173 Y98.945 E.00075
M204 S10000
G1 X86.33 Y98.764 F42000
; LINE_WIDTH: 0.117086
G1 F15000
M204 S6000
G1 X86.254 Y98.502 E.00122
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.468272
G1 F15000
M204 S6000
G1 X86.1 Y97.479 E.007
; LINE_WIDTH: 0.499826
G1 X86.085 Y97.468 E.00044
; LINE_WIDTH: 0.527474
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.520049
G3 X86.09 Y96.283 I6.164 J-.475 E.0284
M204 S10000
G1 X86.236 Y95.448 F42000
; LINE_WIDTH: 0.108526
G1 F15000
M204 S6000
G1 X86.446 Y95.206 E.0013
; WIPE_START
G1 X86.236 Y95.448 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.524 Y95.37 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.40302
G1 F15000
M204 S6000
G3 X93.764 Y96.339 I-18.63 J5.144 E.01843
M204 S10000
G1 X93.71 Y96.323 F42000
; LINE_WIDTH: 0.117579
G1 F15000
M204 S6000
G1 X93.727 Y96.469 E.00066
; LINE_WIDTH: 0.0901772
G1 X93.739 Y96.658 E.0006
M204 S10000
G1 X93.71 Y96.323 F42000
; LINE_WIDTH: 0.15184
G1 F15000
M204 S6000
G1 X93.692 Y96.17 E.00095
; LINE_WIDTH: 0.193849
G1 X93.668 Y96.025 E.00122
; LINE_WIDTH: 0.242104
G1 X93.644 Y95.879 E.00156
; LINE_WIDTH: 0.268527
G1 X93.546 Y95.362 E.00624
M204 S10000
G1 X93.739 Y97.348 F42000
; LINE_WIDTH: 0.095546
G1 F15000
M204 S6000
G1 X93.722 Y97.586 E.00082
; LINE_WIDTH: 0.129891
G1 X93.703 Y97.737 E.00077
; LINE_WIDTH: 0.16688
G1 X93.685 Y97.883 E.00101
; LINE_WIDTH: 0.203235
G1 X93.666 Y97.988 E.00093
; LINE_WIDTH: 0.238826
G1 X93.649 Y98.085 E.00103
; LINE_WIDTH: 0.273035
G1 X93.632 Y98.183 E.00119
; LINE_WIDTH: 0.292817
G1 X93.515 Y98.764 E.00775
M204 S10000
G1 X93.486 Y98.764 F42000
; LINE_WIDTH: 0.437582
G1 F15000
M204 S6000
G2 X93.764 Y97.695 I-21.628 J-6.199 E.02225
; WIPE_START
G1 X93.486 Y98.764 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.336 Y91.133 Z1.6 F42000
G1 X93.223 Y85.361 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.0879539
G1 F15000
M204 S6000
G1 X93.34 Y85.257 E.00048
M204 S10000
G1 X93.541 Y84.636 F42000
; LINE_WIDTH: 0.292855
G1 F15000
M204 S6000
G1 X93.632 Y84.183 E.00603
; LINE_WIDTH: 0.273096
G1 X93.649 Y84.085 E.00119
; LINE_WIDTH: 0.238918
G1 X93.666 Y83.988 E.00103
; LINE_WIDTH: 0.203358
G1 X93.685 Y83.883 E.00093
; LINE_WIDTH: 0.166979
G1 X93.703 Y83.737 E.00102
; LINE_WIDTH: 0.129938
G1 X93.722 Y83.586 E.00077
; LINE_WIDTH: 0.0955573
G1 X93.739 Y83.348 E.00082
M204 S10000
G1 X93.739 Y82.657 F42000
; LINE_WIDTH: 0.0901227
G1 F15000
M204 S6000
G1 X93.727 Y82.47 E.00059
; LINE_WIDTH: 0.117493
G1 X93.71 Y82.324 E.00066
; LINE_WIDTH: 0.151825
G1 X93.692 Y82.17 E.00095
; LINE_WIDTH: 0.193858
G1 X93.668 Y82.025 E.00121
; LINE_WIDTH: 0.242094
G1 X93.644 Y81.879 E.00156
; LINE_WIDTH: 0.268502
G1 X93.522 Y81.236 E.00777
M204 S10000
G1 X93.496 Y81.236 F42000
; LINE_WIDTH: 0.40199
G1 F15000
M204 S6000
G1 X93.764 Y82.338 E.02087
; WIPE_START
G1 X93.496 Y81.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.326 Y80.977 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.0972878
G1 F15000
M204 S6000
G1 X92.139 Y80.811 E.00087
M204 S10000
G1 X91.273 Y80.943 F42000
; LINE_WIDTH: 0.498718
G1 F15000
M204 S6000
G1 X91.074 Y80.671 E.0078
; LINE_WIDTH: 0.528633
G1 X91.063 Y80.657 E.00042
G1 X90.813 Y80.65 E.00616
G2 X88.607 Y80.654 I-.908 J112.866 E.05423
G1 X88.277 Y80.672 E.00813
M204 S10000
G1 X87.442 Y80.811 F42000
; LINE_WIDTH: 0.120078
G1 F15000
M204 S6000
G1 X87.323 Y80.918 E.00074
; LINE_WIDTH: 0.0938983
G1 X87.21 Y81.026 E.00052
M204 S10000
G1 X86.331 Y81.236 F42000
; LINE_WIDTH: 0.137619
G1 F15000
M204 S6000
G1 X86.253 Y81.499 E.0015
M204 S10000
G1 X86.091 Y82.284 F42000
; LINE_WIDTH: 0.520643
G1 F15000
M204 S6000
G2 X86.069 Y83.457 I6.05 J.701 E.02843
; LINE_WIDTH: 0.527749
G1 X86.084 Y83.467 E.00046
; LINE_WIDTH: 0.5007
G1 X86.099 Y83.478 E.00043
; LINE_WIDTH: 0.469402
G1 X86.367 Y83.662 E.00704
M204 S10000
G1 X86.254 Y84.502 F42000
; LINE_WIDTH: 0.106524
G1 F15000
M204 S6000
G1 X86.287 Y84.614 E.00046
G1 X86.443 Y84.791 E.00093
; WIPE_START
G1 X86.287 Y84.614 E-.50858
G1 X86.254 Y84.502 E-.25142
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.811 Y86.598 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X86.811 Y85.892 E.01465
G2 X87.674 Y86.326 I2.075 J-3.056 E.02011
G1 X86.811 Y87.19 E.02534
G1 X86.811 Y86.811 E.00786
G1 X93.189 Y93.189 E.18712
G1 X93.189 Y92.81 E.00786
G1 X92.213 Y93.787 E.02864
G2 X90.493 Y93.493 I-1.457 J3.351 E.03654
G1 X86.811 Y89.81 E.10803
G1 X86.811 Y90.19 E.00786
G1 X90.491 Y86.509 E.10795
G1 X89.51 Y86.51 E.02034
G1 X93.189 Y90.19 E.10793
G1 X93.189 Y89.81 E.00786
G1 X89.509 Y93.491 E.10797
G2 X87.676 Y93.675 I-.439 J4.84 E.03845
G1 X86.811 Y92.81 E.02538
G1 X86.811 Y93.189 E.00786
G1 X93.189 Y86.811 E.18712
G1 X93.189 Y87.19 E.00786
G1 X92.212 Y86.212 E.02868
G2 X93.041 Y85.702 I-1.388 J-3.186 E.02025
G1 X93.189 Y85.87 E.00465
G1 X93.189 Y86.366 E.01029
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F16200
G1 X93.189 Y85.87 E-.18854
G1 X93.041 Y85.702 E-.08521
G1 X92.212 Y86.212 E-.36973
G1 X92.429 Y86.429 E-.11652
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/166
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.6 I-.279 J1.185 P1  F42000
G1 X97.097 Y87.529 Z1.6
G1 Z1.32
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.784 Y87.225 I.714 J.685 E.01486
G1 X97.813 Y86.806 E.0081
G3 X97.569 Y86.826 I-.008 J1.376 E.16198
G1 X97.754 Y86.802 E.0036
; WIPE_START
G1 X98.294 Y86.9 E-.20875
G1 X98.764 Y87.191 E-.2102
G1 X99.066 Y87.649 E-.20823
G1 X99.143 Y87.99 E-.13281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.72 I-.974 J-.729 P1  F42000
G1 X97.077 Y90.751 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.963 Y90.539 I1 J2.211 E.01767
G1 X98.063 Y90.131 E.0081
G1 X98.123 Y90.145 E.00118
G3 X97.195 Y90.215 I-.341 J1.667 E.18794
G3 X98.006 Y90.117 I.605 J1.596 E.01591
; WIPE_START
G1 X98.123 Y90.145 E-.04569
G1 X98.405 Y90.215 E-.11072
G1 X98.77 Y90.407 E-.15643
G1 X99.078 Y90.679 E-.15639
G1 X99.312 Y91.018 E-.15645
G1 X99.437 Y91.349 E-.13432
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.72 I-.704 J-.992 P1  F42000
G1 X88.797 Y98.9 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03671
G3 X90.877 Y98.899 I-.003 J1.9 E.10776
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.886 E-.10829
G1 X88.425 Y98.863 E-.05667
G1 X88.17 Y98.793 E-.10051
G1 X88.044 Y98.743 E-.05152
G1 X87.927 Y98.688 E-.04934
G1 X87.796 Y98.613 E-.05715
G1 X87.581 Y98.458 E-.10095
G1 X87.47 Y98.357 E-.05701
G1 X87.366 Y98.247 E-.05755
G1 X87.272 Y98.129 E-.05711
G1 X87.182 Y97.987 E-.0639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.117 Y90.412 Z1.72 F42000
G1 X88.797 Y84.9 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.10911
G1 X90.803 Y81.1 E.03671
G3 X90.877 Y84.899 I-.003 J1.9 E.10776
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y84.886 E-.10829
G1 X88.425 Y84.863 E-.05667
G1 X88.17 Y84.793 E-.10051
G1 X88.044 Y84.743 E-.05152
G1 X87.927 Y84.688 E-.04934
G1 X87.796 Y84.613 E-.05715
G1 X87.581 Y84.458 E-.10095
G1 X87.47 Y84.357 E-.05701
G1 X87.366 Y84.247 E-.05755
G1 X87.272 Y84.129 E-.05711
G1 X87.182 Y83.987 E-.06389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.036 Y91.618 Z1.72 F42000
G1 X86.896 Y98.977 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01809
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00447
G2 X86.61 Y98.62 I2.782 J-1.275 E.01239
G1 X86.858 Y98.93 E.00823
; WIPE_START
G1 X86.023 Y98.977 E-.31768
G1 X86.023 Y97.944 E-.39243
G1 X86.152 Y97.919 E-.04989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.826 Y90.472 Z1.72 F42000
G1 X88.798 Y86.148 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.147 J-3.169 E.05991
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.579 J1.807 E.06218
G1 X88.772 Y93.852 E.04252
G2 X86.781 Y94.584 I.039 J3.18 E.04485
G1 X86.448 Y94.885 E.00933
G1 X86.448 Y85.115 E.20267
G1 X86.776 Y85.412 E.00918
G2 X88.738 Y86.147 I2.022 J-2.41 E.04432
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z1.72 F42000
G1 X93.977 Y98.977 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.677 Y98.977 E.02695
G2 X90.815 Y94.277 I-1.882 J-1.973 E.1342
G1 X88.78 Y94.277 E.04222
G2 X86.228 Y96.095 I.025 J2.736 E.06921
G1 X86.023 Y96.053 E.00432
G1 X86.023 Y83.944 E.25118
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.575 J-.913 E.0693
G1 X90.914 Y85.722 E.04415
G2 X92.925 Y81.295 I-.115 J-2.723 E.1246
G1 X92.684 Y81.023 E.00752
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.677 Y98.977 E-.49419
G1 X92.889 Y98.749 E-.11814
G1 X93.054 Y98.53 E-.10405
G1 X93.114 Y98.432 E-.04362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.149 Y91.399 Z1.72 F42000
G1 X86.228 Y82.095 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.053 E.00432
M73 P36 R15
G1 X86.023 Y81.023 E.02136
G1 X86.904 Y81.023 E.01827
G1 X86.641 Y81.338 E.0085
G2 X86.249 Y82.039 I2.324 J1.762 E.01671
; WIPE_START
G1 X86.023 Y82.053 E-.08587
G1 X86.023 Y81.023 E-.3914
G1 X86.768 Y81.023 E-.28274
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04363
G2 X91.501 Y80.806 I-.099 J-2.3 E.13309
G1 X91.54 Y80.599 E.00437
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.541 Y99.401 E.05933
G1 X91.502 Y99.193 E.00439
G2 X90.809 Y94.701 I-.706 J-2.191 E.13483
G1 X88.788 Y94.701 E.04191
G2 X88.099 Y99.194 I.015 J2.302 E.13483
G1 X88.06 Y99.401 E.00437
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.523 Y85.283 I.701 J2.189 E.12928
G1 X88.713 Y85.294 E.00395
; WIPE_START
G1 X88.791 Y85.299 E-.02974
G1 X90.713 Y85.298 E-.73026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z1.72 F42000
G1 X94.8 Y99.8 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.279 Y99.057 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0906522
G1 F15000
M204 S6000
G1 X92.173 Y99.149 E.00045
G1 X92.105 Y99.168 E.00022
M204 S10000
G1 X91.324 Y99.33 F42000
; LINE_WIDTH: 0.528948
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.648 J-9.821 E.0108
G3 X88.787 Y99.35 I-1.088 J-127.911 E.05164
G1 X88.536 Y99.343 E.00617
G1 X88.526 Y99.329 E.00042
; LINE_WIDTH: 0.498839
G1 X88.328 Y99.057 E.00778
M204 S10000
G1 X87.429 Y99.189 F42000
; LINE_WIDTH: 0.126022
G1 F15000
M204 S6000
G1 X87.285 Y99.056 E.00096
; LINE_WIDTH: 0.094666
G1 X87.173 Y98.945 E.00053
M204 S10000
G1 X86.33 Y98.764 F42000
; LINE_WIDTH: 0.117995
G1 F15000
M204 S6000
G1 X86.254 Y98.502 E.00123
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.467426
G1 F15000
M204 S6000
G1 X86.101 Y97.479 E.00698
; LINE_WIDTH: 0.499169
G1 X86.085 Y97.468 E.00045
; LINE_WIDTH: 0.52727
G1 X86.069 Y97.457 E.00048
; LINE_WIDTH: 0.520314
G3 X86.091 Y96.284 I6.132 J-.474 E.02841
M204 S10000
G1 X86.236 Y95.448 F42000
; LINE_WIDTH: 0.108345
G1 F15000
M204 S6000
G1 X86.445 Y95.206 E.00129
; WIPE_START
G1 X86.236 Y95.448 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.764 Y96.339 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.403474
G1 F15000
M204 S6000
G2 X93.523 Y95.37 I-17.598 J3.864 E.01845
M204 S10000
G1 X93.545 Y95.363 F42000
; LINE_WIDTH: 0.269119
G1 F15000
M204 S6000
G1 X93.644 Y95.877 E.00623
; LINE_WIDTH: 0.242588
G1 X93.668 Y96.023 E.00157
; LINE_WIDTH: 0.194179
G1 X93.692 Y96.169 E.00122
; LINE_WIDTH: 0.152048
G1 X93.71 Y96.323 E.00095
; LINE_WIDTH: 0.117704
G1 X93.727 Y96.469 E.00066
; LINE_WIDTH: 0.0902204
G1 X93.739 Y96.658 E.0006
M204 S10000
G1 X93.739 Y97.352 F42000
; LINE_WIDTH: 0.0958543
G1 F15000
M204 S6000
G1 X93.721 Y97.589 E.00082
; LINE_WIDTH: 0.130342
G1 X93.703 Y97.738 E.00077
; LINE_WIDTH: 0.166982
G1 X93.685 Y97.882 E.00101
; LINE_WIDTH: 0.203106
G1 X93.667 Y97.987 E.00092
; LINE_WIDTH: 0.238583
G1 X93.649 Y98.084 E.00103
; LINE_WIDTH: 0.272683
G1 X93.632 Y98.181 E.00119
; LINE_WIDTH: 0.292399
G1 X93.515 Y98.764 E.00775
M204 S10000
G1 X93.486 Y98.764 F42000
; LINE_WIDTH: 0.437003
G1 F15000
M204 S6000
G2 X93.764 Y97.694 I-21.037 J-6.04 E.02225
M204 S10000
G1 X93.764 Y82.339 F42000
; LINE_WIDTH: 0.402558
G1 F15000
M204 S6000
G1 X93.496 Y81.236 E.02092
M204 S10000
G1 X93.521 Y81.236 F42000
; LINE_WIDTH: 0.269119
G1 F15000
M204 S6000
G1 X93.644 Y81.877 E.00777
; LINE_WIDTH: 0.242588
G1 X93.668 Y82.023 E.00157
; LINE_WIDTH: 0.194179
G1 X93.692 Y82.169 E.00122
; LINE_WIDTH: 0.152048
G1 X93.71 Y82.323 E.00095
; LINE_WIDTH: 0.117704
G1 X93.727 Y82.469 E.00066
; LINE_WIDTH: 0.0902205
G1 X93.739 Y82.658 E.0006
M204 S10000
G1 X93.739 Y83.352 F42000
; LINE_WIDTH: 0.0958543
G1 F15000
M204 S6000
G1 X93.721 Y83.589 E.00082
; LINE_WIDTH: 0.130342
G1 X93.703 Y83.738 E.00077
; LINE_WIDTH: 0.166982
G1 X93.685 Y83.882 E.00101
; LINE_WIDTH: 0.203106
G1 X93.667 Y83.987 E.00092
; LINE_WIDTH: 0.238583
G1 X93.649 Y84.084 E.00103
; LINE_WIDTH: 0.272683
G1 X93.632 Y84.181 E.00119
; LINE_WIDTH: 0.292394
G1 X93.541 Y84.636 E.00604
; WIPE_START
G1 X93.632 Y84.181 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.189 Y86.092 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X93.189 Y85.57 E.01083
G3 X92.213 Y86.213 I-2.39 J-2.567 E.02436
G1 X93.189 Y87.19 E.02864
G1 X93.189 Y86.811 E.00786
G1 X86.811 Y93.189 E.18712
G1 X86.811 Y92.81 E.00786
G1 X87.676 Y93.675 E.02538
G3 X89.509 Y93.491 I1.394 J4.651 E.03845
G1 X93.189 Y89.81 E.10797
G1 X93.189 Y90.19 E.00786
G1 X89.51 Y86.51 E.10793
G1 X90.491 Y86.509 E.02034
G1 X86.811 Y90.19 E.10795
G1 X86.811 Y89.81 E.00786
G1 X90.493 Y93.493 E.10803
G3 X92.214 Y93.786 I.261 J3.663 E.03654
G1 X93.189 Y92.81 E.02863
G1 X93.189 Y93.189 E.00786
G1 X86.811 Y86.811 E.18712
G1 X86.811 Y87.19 E.00786
G1 X87.675 Y86.325 E.02535
G3 X86.811 Y85.891 I1.154 J-3.372 E.02013
G1 X86.811 Y86.598 E.01468
; WIPE_START
G1 X86.811 Y85.891 E-.26887
G1 X87.675 Y86.325 E-.36758
G1 X87.445 Y86.555 E-.12355
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.442 Y84.79 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10673
G1 F15000
M204 S6000
G1 X86.287 Y84.614 E.00093
G1 X86.254 Y84.502 E.00046
M204 S10000
G1 X86.367 Y83.662 F42000
; LINE_WIDTH: 0.467447
G1 F15000
M204 S6000
G1 X86.101 Y83.479 E.00698
; LINE_WIDTH: 0.499192
G1 X86.085 Y83.468 E.00045
; LINE_WIDTH: 0.52728
G1 X86.069 Y83.457 E.00048
; LINE_WIDTH: 0.520317
G3 X86.091 Y82.284 I6.13 J-.474 E.02841
M204 S10000
G1 X86.253 Y81.498 F42000
; LINE_WIDTH: 0.139917
G1 F15000
M204 S6000
G1 X86.331 Y81.236 E.00153
M204 S10000
G1 X87.21 Y81.026 F42000
; LINE_WIDTH: 0.093908
G1 F15000
M204 S6000
G1 X87.323 Y80.918 E.00052
; LINE_WIDTH: 0.120112
G1 X87.442 Y80.811 E.00074
M204 S10000
G1 X88.277 Y80.673 F42000
; LINE_WIDTH: 0.528658
G1 F15000
M204 S6000
G1 X88.605 Y80.654 E.00808
G3 X90.813 Y80.65 I1.302 J112.284 E.05429
G1 X91.064 Y80.657 E.00617
G1 X91.074 Y80.671 E.00042
; LINE_WIDTH: 0.49882
G1 X91.272 Y80.943 E.00778
M204 S10000
G1 X92.105 Y80.831 F42000
; LINE_WIDTH: 0.096347
G1 F15000
M204 S6000
G1 X92.192 Y80.857 E.00031
G1 X92.323 Y80.972 E.0006
; CHANGE_LAYER
; Z_HEIGHT: 1.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X92.192 Y80.857 E-.49969
G1 X92.105 Y80.831 E-.26031
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/166
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.72 I-.979 J.723 P1  F42000
G1 X97.11 Y87.607 Z1.72
G1 Z1.44
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.74 Y87.286 I1.101 J1.383 E.01372
G1 X97.768 Y86.867 E.0081
G3 X97.355 Y86.936 I.009 J1.318 E.15149
G1 X97.709 Y86.863 E.00697
; WIPE_START
G1 X98.07 Y86.887 E-.13752
G1 X98.411 Y87.008 E-.13749
G1 X98.707 Y87.217 E-.13751
G1 X98.935 Y87.498 E-.1375
G1 X99.079 Y87.83 E-.1375
G1 X99.105 Y88.019 E-.07249
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.84 I-.967 J-.739 P1  F42000
G1 X96.85 Y90.968 Z1.84
G1 Z1.44
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.651 Y90.551 I1.49 J1.884 E.0175
G1 X97.654 Y90.131 E.0081
G3 X97.199 Y90.228 I.121 J1.682 E.19526
G1 X97.595 Y90.13 E.00786
; WIPE_START
G1 X98.019 Y90.134 E-.161
G1 X98.401 Y90.228 E-.14951
G1 X98.762 Y90.418 E-.15519
G1 X99.068 Y90.688 E-.15517
G1 X99.276 Y90.99 E-.13913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.84 I-.733 J-.971 P1  F42000
G1 X88.797 Y98.9 Z1.84
G1 Z1.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.1091
G1 X90.803 Y95.1 E.03671
G3 X90.877 Y98.899 I-.005 J1.9 E.10769
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.886 E-.10825
G1 X88.426 Y98.863 E-.0566
G1 X88.17 Y98.793 E-.1006
G1 X88.046 Y98.744 E-.05098
G1 X87.927 Y98.688 E-.0498
G1 X87.7 Y98.55 E-.10082
G1 X87.582 Y98.459 E-.05664
G1 X87.484 Y98.371 E-.04997
G1 X87.391 Y98.275 E-.05095
G1 X87.295 Y98.159 E-.0572
G1 X87.207 Y98.036 E-.0574
G1 X87.179 Y97.989 E-.02079
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.116 Y90.414 Z1.84 F42000
G1 X88.797 Y84.9 Z1.84
G1 Z1.44
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.1091
G1 X90.803 Y81.1 E.03671
G3 X90.877 Y84.899 I-.005 J1.9 E.10769
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y84.886 E-.10825
G1 X88.426 Y84.863 E-.0566
G1 X88.17 Y84.793 E-.10061
G1 X88.046 Y84.744 E-.05098
G1 X87.927 Y84.688 E-.0498
G1 X87.796 Y84.613 E-.05731
G1 X87.672 Y84.529 E-.05707
G1 X87.484 Y84.371 E-.09307
G1 X87.391 Y84.275 E-.05095
G1 X87.295 Y84.159 E-.0572
G1 X87.207 Y84.036 E-.0574
G1 X87.179 Y83.989 E-.02077
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.039 Y91.62 Z1.84 F42000
G1 X86.904 Y98.977 Z1.84
G1 Z1.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01827
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00447
G2 X86.642 Y98.662 I2.782 J-1.279 E.01348
G1 X86.866 Y98.93 E.00725
; WIPE_START
G1 X86.023 Y98.977 E-.32051
G1 X86.023 Y97.944 E-.39244
G1 X86.145 Y97.921 E-.04706
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.823 Y90.475 Z1.84 F42000
G1 X88.798 Y86.148 Z1.84
G1 Z1.44
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.136 J-3.149 E.05993
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.579 J1.807 E.06217
G1 X88.772 Y93.852 E.04253
G2 X86.827 Y94.546 I.039 J3.181 E.04361
G1 X86.448 Y94.876 E.01043
G1 X86.448 Y85.117 E.20242
G2 X86.935 Y85.537 I3.469 J-3.535 E.01335
G2 X88.738 Y86.147 I1.876 J-2.573 E.0401
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z1.84 F42000
G1 X93.977 Y98.977 Z1.84
G1 Z1.44
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.686 Y98.977 E.02676
G2 X93.404 Y97.801 I-2.092 J-2.085 E.02885
G2 X90.815 Y94.277 I-2.604 J-.8 E.1053
G1 X88.78 Y94.277 E.04222
G2 X86.228 Y96.095 I.025 J2.736 E.06921
G1 X86.023 Y96.054 E.00432
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.575 J-.912 E.0693
G1 X90.914 Y85.722 E.04415
G2 X92.926 Y81.295 I-.119 J-2.725 E.12452
G1 X92.684 Y81.023 E.00754
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.686 Y98.977 E-.49085
G1 X92.897 Y98.739 E-.12093
G1 X93.054 Y98.53 E-.09905
G1 X93.122 Y98.42 E-.04917
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.152 Y91.389 Z1.84 F42000
G1 X86.228 Y82.095 Z1.84
G1 Z1.44
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00432
G1 X86.023 Y81.023 E.02137
G1 X86.904 Y81.023 E.01827
G1 X86.642 Y81.338 E.0085
G2 X86.249 Y82.039 I2.322 J1.761 E.01672
; WIPE_START
G1 X86.023 Y82.054 E-.08587
G1 X86.023 Y81.023 E-.39143
G1 X86.767 Y81.023 E-.2827
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z1.84 F42000
G1 Z1.44
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04363
G2 X91.501 Y80.806 I-.099 J-2.3 E.1331
G1 X91.54 Y80.599 E.00437
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.541 Y99.401 E.05932
G1 X91.506 Y99.188 E.00448
G2 X90.809 Y94.701 I-.705 J-2.188 E.13478
G1 X88.788 Y94.701 E.04191
G2 X88.099 Y99.194 I.014 J2.302 E.13484
G1 X88.06 Y99.401 E.00437
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.523 Y85.283 I.701 J2.189 E.12928
G1 X88.713 Y85.294 E.00395
; WIPE_START
G1 X88.791 Y85.299 E-.02974
G1 X90.713 Y85.298 E-.73026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z1.84 F42000
G1 X94.8 Y99.8 Z1.84
G1 Z1.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.332 Y99.02 F42000
G1 Z1.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0968532
G1 F15000
M204 S6000
G1 X92.194 Y99.143 E.00064
G1 X92.105 Y99.168 E.00032
M204 S10000
G1 X91.327 Y99.33 F42000
; LINE_WIDTH: 0.528973
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.652 J-9.898 E.01086
G3 X88.787 Y99.35 I-1.088 J-127.426 E.05164
G1 X88.536 Y99.343 E.00617
G1 X88.526 Y99.329 E.00041
; LINE_WIDTH: 0.49912
G1 X88.328 Y99.057 E.00779
M204 S10000
G1 X87.441 Y99.189 F42000
; LINE_WIDTH: 0.119387
G1 F15000
M204 S6000
G1 X87.32 Y99.079 E.00075
; LINE_WIDTH: 0.093437
G1 X87.21 Y98.974 E.0005
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.137628
G1 F15000
M204 S6000
G1 X86.253 Y98.501 E.0015
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.468229
G1 F15000
M204 S6000
M73 P36 R14
G1 X86.1 Y97.479 E.007
; LINE_WIDTH: 0.499816
G1 X86.085 Y97.468 E.00044
; LINE_WIDTH: 0.527469
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.520648
G3 X86.091 Y96.284 I6.073 J-.472 E.02843
M204 S10000
G1 X86.254 Y95.499 F42000
; LINE_WIDTH: 0.131574
G1 F15000
M204 S6000
G1 X86.292 Y95.367 E.00071
G1 X86.373 Y95.278 E.00062
; LINE_WIDTH: 0.0957605
G1 X86.45 Y95.192 E.0004
; LINE_WIDTH: 0.0806826
G1 X86.479 Y95.163 E.00011
; WIPE_START
G1 X86.45 Y95.192 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.541 Y95.364 Z1.84 F42000
G1 Z1.44
G1 E.8 F1800
; LINE_WIDTH: 0.288437
G1 F15000
M204 S6000
G3 X93.65 Y95.916 I-11.266 J2.501 E.00723
; LINE_WIDTH: 0.238431
M73 P37 R14
G1 X93.667 Y96.013 E.00102
; LINE_WIDTH: 0.204537
G1 X93.683 Y96.109 E.00086
; LINE_WIDTH: 0.167941
G1 X93.703 Y96.263 E.00108
; LINE_WIDTH: 0.13041
G1 X93.721 Y96.409 E.00075
; LINE_WIDTH: 0.0958051
G1 X93.739 Y96.652 E.00083
M204 S10000
G1 X93.739 Y97.348 F42000
; LINE_WIDTH: 0.0955262
G1 F15000
M204 S6000
G1 X93.722 Y97.586 E.00082
; LINE_WIDTH: 0.129862
G1 X93.703 Y97.737 E.00077
; LINE_WIDTH: 0.16687
G1 X93.685 Y97.883 E.00102
; LINE_WIDTH: 0.203217
G1 X93.666 Y97.988 E.00093
; LINE_WIDTH: 0.238772
G1 X93.649 Y98.085 E.00103
; LINE_WIDTH: 0.272946
G1 X93.632 Y98.182 E.00119
; LINE_WIDTH: 0.292709
G1 X93.515 Y98.764 E.00775
M204 S10000
G1 X93.486 Y98.764 F42000
; LINE_WIDTH: 0.437413
G1 F15000
M204 S6000
G2 X93.764 Y97.694 I-21.292 J-6.109 E.02226
; WIPE_START
G1 X93.558 Y98.508 E-.57709
G1 X93.486 Y98.764 E-.18291
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.516 Y91.132 Z1.84 F42000
G1 X93.541 Y84.636 Z1.84
G1 Z1.44
G1 E.8 F1800
; LINE_WIDTH: 0.292709
G1 F15000
M204 S6000
G1 X93.632 Y84.182 E.00604
; LINE_WIDTH: 0.272946
G1 X93.649 Y84.085 E.00119
; LINE_WIDTH: 0.238772
G1 X93.666 Y83.988 E.00103
; LINE_WIDTH: 0.203217
G1 X93.685 Y83.883 E.00093
; LINE_WIDTH: 0.16687
G1 X93.703 Y83.737 E.00102
; LINE_WIDTH: 0.129862
G1 X93.722 Y83.586 E.00077
; LINE_WIDTH: 0.0955262
G1 X93.739 Y83.348 E.00082
M204 S10000
G1 X93.739 Y82.652 F42000
; LINE_WIDTH: 0.095805
G1 F15000
M204 S6000
G1 X93.721 Y82.409 E.00083
; LINE_WIDTH: 0.13041
G1 X93.703 Y82.263 E.00075
; LINE_WIDTH: 0.167941
G1 X93.683 Y82.109 E.00108
; LINE_WIDTH: 0.204537
G1 X93.667 Y82.013 E.00086
; LINE_WIDTH: 0.238431
G1 X93.65 Y81.916 E.00102
; LINE_WIDTH: 0.289077
G2 X93.515 Y81.236 I-14.005 J2.41 E.00893
M204 S10000
G1 X93.494 Y81.236 F42000
; LINE_WIDTH: 0.419055
G1 F15000
M204 S6000
G1 X93.764 Y82.322 E.02152
; WIPE_START
G1 X93.494 Y81.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.323 Y80.972 Z1.84 F42000
G1 Z1.44
G1 E.8 F1800
; LINE_WIDTH: 0.096373
G1 F15000
M204 S6000
G1 X92.192 Y80.857 E.0006
G1 X92.105 Y80.831 E.00031
M204 S10000
G1 X91.272 Y80.943 F42000
; LINE_WIDTH: 0.499149
G1 F15000
M204 S6000
G1 X91.074 Y80.671 E.00779
; LINE_WIDTH: 0.528661
G1 X91.064 Y80.657 E.00041
G1 X90.813 Y80.65 E.00617
G2 X88.605 Y80.654 I-.905 J112.251 E.0543
G1 X88.277 Y80.673 E.00807
M204 S10000
G1 X87.443 Y80.811 F42000
; LINE_WIDTH: 0.123139
G1 F15000
M204 S6000
G1 X87.34 Y80.902 E.00065
; LINE_WIDTH: 0.0971301
G1 X87.213 Y81.023 E.00061
M204 S10000
G1 X86.331 Y81.236 F42000
; LINE_WIDTH: 0.139559
G1 F15000
M204 S6000
G1 X86.253 Y81.498 E.00152
M204 S10000
G1 X86.091 Y82.284 F42000
; LINE_WIDTH: 0.520648
G1 F15000
M204 S6000
G2 X86.069 Y83.457 I6.05 J.701 E.02843
; LINE_WIDTH: 0.527469
G1 X86.085 Y83.468 E.00047
; LINE_WIDTH: 0.499816
G1 X86.1 Y83.479 E.00044
; LINE_WIDTH: 0.468229
G1 X86.367 Y83.662 E.007
M204 S10000
G1 X86.236 Y84.555 F42000
; LINE_WIDTH: 0.128581
G1 F15000
M204 S6000
G1 X86.295 Y84.627 E.00047
; LINE_WIDTH: 0.103197
G1 X86.453 Y84.805 E.0009
; WIPE_START
G1 X86.295 Y84.627 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.811 Y86.598 Z1.84 F42000
G1 Z1.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X86.811 Y85.891 E.01468
G2 X87.675 Y86.325 I2.02 J-2.94 E.02013
G1 X86.811 Y87.19 E.02535
G1 X86.811 Y86.811 E.00786
G1 X93.189 Y93.189 E.18712
G1 X93.189 Y92.81 E.00786
G1 X92.214 Y93.786 E.02863
G2 X90.493 Y93.493 I-1.459 J3.368 E.03654
G1 X86.811 Y89.81 E.10803
G1 X86.811 Y90.19 E.00786
G1 X90.491 Y86.509 E.10795
G1 X89.51 Y86.51 E.02034
G1 X93.189 Y90.19 E.10793
G1 X93.189 Y89.81 E.00786
G1 X89.509 Y93.491 E.10797
G2 X87.676 Y93.675 I-.44 J4.833 E.03845
G1 X86.811 Y92.81 E.02538
G1 X86.811 Y93.189 E.00786
G1 X93.189 Y86.811 E.18712
G1 X93.189 Y87.19 E.00786
G1 X92.212 Y86.212 E.02868
G2 X93.189 Y85.571 I-1.385 J-3.178 E.02437
G1 X93.189 Y86.093 E.01082
; CHANGE_LAYER
; Z_HEIGHT: 1.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F16200
G1 X93.189 Y85.571 E-.1983
G1 X92.64 Y85.991 E-.26279
G1 X92.212 Y86.212 E-.18318
G1 X92.427 Y86.427 E-.11573
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/166
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.84 I-.3 J1.179 P1  F42000
G1 X97.118 Y87.62 Z1.84
G1 Z1.56
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.741 Y87.301 I1.083 J1.35 E.01357
G1 X97.769 Y86.882 E.0081
G1 X97.864 Y86.889 E.00183
G3 X97.36 Y86.951 I-.095 J1.303 E.14844
G1 X97.71 Y86.878 E.00689
; WIPE_START
G1 X97.864 Y86.889 E-.05855
G1 X98.404 Y87.022 E-.21135
G1 X98.696 Y87.229 E-.13585
G1 X98.922 Y87.506 E-.13588
G1 X99.064 Y87.834 E-.13585
G1 X99.094 Y88.049 E-.08251
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.96 I-.984 J-.716 P1  F42000
G1 X97.09 Y90.803 Z1.96
G1 Z1.56
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.959 Y90.59 I.735 J1.118 E.01759
G1 X98.037 Y90.177 E.0081
G3 X97.664 Y90.166 I-.235 J1.631 E.19231
G1 X97.979 Y90.166 E.00608
; WIPE_START
G1 X98.368 Y90.257 E-.15157
G1 X98.728 Y90.441 E-.1536
G1 X99.031 Y90.706 E-.15309
G1 X99.262 Y91.036 E-.15307
G1 X99.402 Y91.401 E-.14867
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.96 I-.703 J-.994 P1  F42000
G1 X88.797 Y98.9 Z1.96
G1 Z1.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.797 Y95.1 I.003 J-1.9 E.10912
G1 X90.803 Y95.1 E.0367
G3 X90.877 Y98.899 I-.003 J1.9 E.10776
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.887 E-.10825
G1 X88.426 Y98.863 E-.05664
G1 X88.17 Y98.793 E-.10065
G1 X88.03 Y98.737 E-.05742
G1 X87.895 Y98.671 E-.05713
G1 X87.672 Y98.529 E-.10037
G1 X87.47 Y98.357 E-.10078
G1 X87.366 Y98.247 E-.05757
G1 X87.272 Y98.129 E-.05724
G1 X87.187 Y98.004 E-.05759
G1 X87.178 Y97.989 E-.00636
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.115 Y90.415 Z1.96 F42000
G1 X88.797 Y84.9 Z1.96
G1 Z1.56
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.797 Y81.1 I.003 J-1.9 E.10912
G1 X90.803 Y81.1 E.0367
G3 X90.877 Y84.899 I-.005 J1.9 E.10769
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y84.887 E-.10825
G1 X88.426 Y84.863 E-.05664
G1 X88.17 Y84.793 E-.10065
G1 X88.03 Y84.737 E-.05742
G1 X87.895 Y84.671 E-.05713
G1 X87.686 Y84.539 E-.09365
G1 X87.581 Y84.458 E-.0505
G1 X87.47 Y84.357 E-.05706
G1 X87.366 Y84.247 E-.05757
G1 X87.272 Y84.129 E-.05724
G1 X87.187 Y84.004 E-.05759
G1 X87.179 Y83.99 E-.00629
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.035 Y91.621 Z1.96 F42000
G1 X86.896 Y98.977 Z1.96
G1 Z1.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01809
G1 X86.023 Y97.945 E.0214
G1 X86.232 Y97.906 E.0044
G1 X86.289 Y98.057 E.00334
G2 X86.609 Y98.619 I2.802 J-1.222 E.01344
G1 X86.858 Y98.93 E.00826
; WIPE_START
G1 X86.023 Y98.977 E-.31769
G1 X86.023 Y97.945 E-.39213
G1 X86.153 Y97.921 E-.05019
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.826 Y90.474 Z1.96 F42000
G1 X88.798 Y86.148 Z1.96
G1 Z1.56
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.136 J-3.149 E.05993
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.58 J1.809 E.06217
G1 X88.778 Y93.852 E.04238
G2 X86.781 Y94.584 I.032 J3.18 E.04499
G1 X86.448 Y94.885 E.00932
G1 X86.448 Y85.115 E.20267
G1 X86.779 Y85.414 E.00926
G2 X88.738 Y86.147 I2.023 J-2.423 E.04423
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z1.96 F42000
G1 X93.977 Y98.977 Z1.96
G1 Z1.56
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.679 Y98.977 E.02691
G2 X92.746 Y95.093 I-1.895 J-1.975 E.08958
G2 X90.815 Y94.277 I-1.955 J1.932 E.04461
G1 X88.785 Y94.277 E.04212
G2 X86.228 Y96.095 I.021 J2.737 E.0693
G1 X86.023 Y96.054 E.00432
G1 X86.023 Y83.945 E.25117
G1 X86.232 Y83.906 E.0044
G2 X88.785 Y85.724 I2.571 J-.91 E.06924
G1 X90.914 Y85.722 E.04415
G2 X92.925 Y81.295 I-.119 J-2.725 E.12452
G1 X92.684 Y81.023 E.00753
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.679 Y98.977 E-.49359
G1 X92.891 Y98.747 E-.11869
G1 X93.054 Y98.531 E-.10304
G1 X93.115 Y98.43 E-.04468
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.15 Y91.397 Z1.96 F42000
G1 X86.228 Y82.095 Z1.96
G1 Z1.56
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00432
G1 X86.023 Y81.023 E.02137
G1 X86.899 Y81.023 E.01817
G1 X86.638 Y81.342 E.00854
G2 X86.249 Y82.039 I2.308 J1.748 E.0166
; WIPE_START
G1 X86.023 Y82.054 E-.08586
G1 X86.023 Y81.023 E-.39144
G1 X86.767 Y81.023 E-.2827
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z1.96 F42000
G1 Z1.56
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04363
G2 X91.501 Y80.806 I-.101 J-2.3 E.13304
G1 X91.54 Y80.599 E.00437
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.541 Y99.401 E.05932
G1 X91.506 Y99.188 E.00448
G2 X90.809 Y94.701 I-.708 J-2.188 E.13468
G1 X88.791 Y94.701 E.04185
G2 X88.099 Y99.194 I.015 J2.302 E.13482
G1 X88.059 Y99.401 E.00437
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00446
G2 X88.523 Y85.283 I.701 J2.189 E.12928
G1 X88.713 Y85.294 E.00395
; WIPE_START
G1 X88.791 Y85.299 E-.02974
G1 X90.713 Y85.298 E-.73026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z1.96 F42000
G1 X94.8 Y99.8 Z1.96
G1 Z1.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.29 Y99.05 F42000
G1 Z1.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0917782
G1 F15000
M204 S6000
G1 X92.176 Y99.148 E.00048
G1 X92.105 Y99.168 E.00024
M204 S10000
G1 X91.327 Y99.33 F42000
; LINE_WIDTH: 0.528972
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.651 J-9.87 E.01086
G3 X88.787 Y99.35 I-1.088 J-127.913 E.05164
G1 X88.536 Y99.343 E.00617
G1 X88.526 Y99.329 E.00042
; LINE_WIDTH: 0.498603
G1 X88.328 Y99.057 E.00777
; WIPE_START
G1 X88.526 Y99.329 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.271 Y99.105 Z1.96 F42000
G1 Z1.56
G1 E.8 F1800
; LINE_WIDTH: 0.0878376
G1 F15000
M204 S6000
G2 X87.495 Y99.169 I2.056 J-6.801 E.00071
M204 S10000
G1 X87.429 Y99.189 F42000
; LINE_WIDTH: 0.125987
G1 F15000
M204 S6000
G1 X87.285 Y99.056 E.00096
; LINE_WIDTH: 0.0946382
G1 X87.173 Y98.945 E.00053
M204 S10000
G1 X86.329 Y98.764 F42000
; LINE_WIDTH: 0.0997263
G1 F15000
M204 S6000
G3 X86.256 Y98.502 I6.542 J-1.974 E.00098
M204 S10000
G1 X86.368 Y97.666 F42000
; LINE_WIDTH: 0.471942
G1 F15000
M204 S6000
G1 X86.098 Y97.479 E.00715
; LINE_WIDTH: 0.502667
G1 X86.084 Y97.469 E.00042
; LINE_WIDTH: 0.528595
G1 X86.069 Y97.458 E.00044
; LINE_WIDTH: 0.520048
G3 X86.09 Y96.284 I6.126 J-.478 E.02844
M204 S10000
G1 X86.236 Y95.448 F42000
; LINE_WIDTH: 0.10827
G1 F15000
M204 S6000
G1 X86.445 Y95.206 E.00129
; WIPE_START
G1 X86.236 Y95.448 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.764 Y96.339 Z1.96 F42000
G1 Z1.56
G1 E.8 F1800
; LINE_WIDTH: 0.403325
G1 F15000
M204 S6000
G1 X93.523 Y95.37 E.01845
M204 S10000
G1 X93.545 Y95.363 F42000
; LINE_WIDTH: 0.269112
G1 F15000
M204 S6000
G1 X93.644 Y95.877 E.00623
; LINE_WIDTH: 0.242613
G1 X93.668 Y96.023 E.00157
; LINE_WIDTH: 0.194254
G1 X93.692 Y96.169 E.00122
; LINE_WIDTH: 0.152116
G1 X93.71 Y96.322 E.00095
; LINE_WIDTH: 0.117718
G1 X93.727 Y96.468 E.00066
; LINE_WIDTH: 0.0902202
G1 X93.739 Y96.658 E.0006
M204 S10000
G1 X93.74 Y97.358 F42000
; LINE_WIDTH: 0.0963418
G1 F15000
M204 S6000
G1 X93.721 Y97.593 E.00081
; LINE_WIDTH: 0.131055
G1 X93.703 Y97.739 E.00076
; LINE_WIDTH: 0.167159
G1 X93.685 Y97.882 E.00099
; LINE_WIDTH: 0.20308
G1 X93.667 Y97.987 E.00093
; LINE_WIDTH: 0.238656
G1 X93.649 Y98.085 E.00103
; LINE_WIDTH: 0.272859
G1 X93.632 Y98.182 E.00119
; LINE_WIDTH: 0.292634
G1 X93.515 Y98.764 E.00775
M204 S10000
G1 X93.486 Y98.764 F42000
; LINE_WIDTH: 0.43728
G1 F15000
M204 S6000
G2 X93.764 Y97.694 I-21.268 J-6.103 E.02225
M204 S10000
G1 X93.764 Y82.339 F42000
; LINE_WIDTH: 0.402356
G1 F15000
M204 S6000
G1 X93.496 Y81.236 E.0209
M204 S10000
G1 X93.521 Y81.236 F42000
; LINE_WIDTH: 0.268937
G1 F15000
M204 S6000
G1 X93.644 Y81.878 E.00777
; LINE_WIDTH: 0.242491
G1 X93.668 Y82.023 E.00157
; LINE_WIDTH: 0.19421
G1 X93.692 Y82.169 E.00122
; LINE_WIDTH: 0.152115
G1 X93.71 Y82.322 E.00095
; LINE_WIDTH: 0.117718
G1 X93.727 Y82.468 E.00066
; LINE_WIDTH: 0.0902202
G1 X93.739 Y82.658 E.0006
M204 S10000
G1 X93.74 Y83.358 F42000
; LINE_WIDTH: 0.0963418
G1 F15000
M204 S6000
G1 X93.721 Y83.593 E.00081
; LINE_WIDTH: 0.131055
G1 X93.703 Y83.739 E.00076
; LINE_WIDTH: 0.167159
G1 X93.685 Y83.882 E.00099
; LINE_WIDTH: 0.20308
G1 X93.667 Y83.987 E.00093
; LINE_WIDTH: 0.238656
G1 X93.649 Y84.085 E.00103
; LINE_WIDTH: 0.272859
G1 X93.632 Y84.182 E.00119
; LINE_WIDTH: 0.292634
G1 X93.541 Y84.636 E.00604
; WIPE_START
G1 X93.632 Y84.182 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.189 Y86.093 Z1.96 F42000
G1 Z1.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X93.189 Y85.571 E.01082
G3 X92.212 Y86.212 I-2.362 J-2.536 E.02437
G1 X93.189 Y87.19 E.02868
G1 X93.189 Y86.811 E.00786
G1 X86.811 Y93.189 E.18712
G1 X86.811 Y92.81 E.00786
G1 X87.676 Y93.675 E.02538
G3 X89.509 Y93.491 I1.409 J4.803 E.03843
G1 X93.189 Y89.81 E.10797
G1 X93.189 Y90.19 E.00786
G1 X89.51 Y86.51 E.10793
G1 X90.491 Y86.509 E.02034
G1 X86.811 Y90.19 E.10795
G1 X86.811 Y89.81 E.00786
G1 X90.493 Y93.493 E.10803
G3 X92.214 Y93.786 I.215 J3.942 E.0365
G1 X93.189 Y92.81 E.02861
G1 X93.189 Y93.189 E.00786
G1 X86.811 Y86.811 E.18712
G1 X86.811 Y87.19 E.00786
G1 X87.675 Y86.325 E.02535
G3 X86.811 Y85.891 I1.175 J-3.417 E.02012
G1 X86.811 Y86.598 E.01467
; WIPE_START
G1 X86.811 Y85.891 E-.26868
G1 X87.675 Y86.325 E-.3675
G1 X87.444 Y86.556 E-.12382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.442 Y84.79 Z1.96 F42000
G1 Z1.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.100717
G1 F15000
M204 S6000
G1 X86.287 Y84.614 E.00086
G1 X86.256 Y84.502 E.00042
M204 S10000
G1 X86.368 Y83.666 F42000
; LINE_WIDTH: 0.471963
G1 F15000
M204 S6000
G1 X86.098 Y83.479 E.00715
; LINE_WIDTH: 0.502685
G1 X86.084 Y83.469 E.00042
; LINE_WIDTH: 0.528603
G1 X86.069 Y83.458 E.00044
; LINE_WIDTH: 0.520081
G3 X86.09 Y82.284 I6.165 J-.477 E.02844
M204 S10000
G1 X87.189 Y81.043 F42000
; LINE_WIDTH: 0.0975585
G1 F15000
M204 S6000
G1 X87.32 Y80.915 E.00064
; LINE_WIDTH: 0.126534
G1 X87.436 Y80.811 E.00076
M204 S10000
G1 X88.277 Y80.671 F42000
; LINE_WIDTH: 0.528518
G1 F15000
M204 S6000
G1 X88.648 Y80.652 E.00912
G3 X90.813 Y80.65 I1.212 J118.219 E.05323
G1 X91.064 Y80.657 E.00616
G1 X91.074 Y80.671 E.00042
; LINE_WIDTH: 0.498567
G1 X91.272 Y80.943 E.00777
M204 S10000
G1 X92.105 Y80.831 F42000
; LINE_WIDTH: 0.0943386
G1 F15000
M204 S6000
G1 X92.192 Y80.857 E.00031
G1 X92.326 Y80.977 E.0006
; CHANGE_LAYER
; Z_HEIGHT: 1.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X92.192 Y80.857 E-.50449
G1 X92.105 Y80.831 E-.25551
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/166
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z1.96 I-.979 J.722 P1  F42000
G1 X97.123 Y87.636 Z1.96
G1 Z1.68
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.742 Y87.317 I1.066 J1.307 E.01351
G1 X97.77 Y86.898 E.0081
G1 X97.987 Y86.913 E.00418
G3 X96.636 Y88.779 I-.197 J1.28 E.10206
G3 X96.794 Y87.37 I.843 J-.619 E.03004
G3 X97.711 Y86.894 I1.081 J.964 E.02037
; WIPE_START
G1 X97.987 Y86.913 E-.1049
G1 X98.397 Y87.036 E-.16267
G1 X98.685 Y87.24 E-.13423
G1 X98.908 Y87.514 E-.13423
G1 X99.049 Y87.838 E-.13422
G1 X99.081 Y88.072 E-.08975
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.08 I-.989 J-.709 P1  F42000
G1 X97.083 Y90.861 Z2.08
G1 Z1.68
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.924 Y90.629 I.724 J.983 E.01719
G1 X98.003 Y90.216 E.0081
G3 X97.763 Y90.205 I-.194 J1.594 E.18988
G1 X97.945 Y90.205 E.00351
; WIPE_START
G1 X98.331 Y90.288 E-.15009
G1 X98.689 Y90.466 E-.15198
G1 X98.991 Y90.724 E-.15087
G1 X99.221 Y91.048 E-.15087
G1 X99.365 Y91.418 E-.15098
G1 X99.366 Y91.432 E-.00521
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.08 I-.702 J-.994 P1  F42000
G1 X88.797 Y98.9 Z2.08
G1 Z1.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.007 J-1.9 E.10894
G1 X90.803 Y95.1 E.03671
G3 X90.877 Y98.899 I-.005 J1.9 E.1077
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.887 E-.1082
G1 X88.426 Y98.863 E-.05662
G1 X88.189 Y98.799 E-.09314
G1 X88.064 Y98.752 E-.05095
G1 X87.828 Y98.632 E-.10054
G1 X87.701 Y98.55 E-.05726
G1 X87.582 Y98.458 E-.05722
G1 X87.47 Y98.357 E-.05755
G1 X87.367 Y98.247 E-.05712
G1 X87.207 Y98.035 E-.10087
M73 P38 R14
G1 X87.179 Y97.989 E-.02055
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.116 Y90.414 Z2.08 F42000
G1 X88.797 Y84.9 Z2.08
G1 Z1.68
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.007 J-1.9 E.10894
G1 X90.803 Y81.1 E.03671
G3 X90.877 Y84.899 I-.005 J1.9 E.1077
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y84.887 E-.1082
G1 X88.426 Y84.863 E-.05672
G1 X88.189 Y84.799 E-.09303
G1 X88.064 Y84.752 E-.05095
G1 X87.828 Y84.632 E-.10054
G1 X87.701 Y84.55 E-.05723
G1 X87.582 Y84.458 E-.05725
G1 X87.47 Y84.357 E-.05755
G1 X87.367 Y84.247 E-.05712
G1 X87.207 Y84.035 E-.10087
G1 X87.179 Y83.989 E-.02054
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.036 Y91.62 Z2.08 F42000
G1 X86.897 Y98.977 Z2.08
G1 Z1.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01812
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00448
G2 X86.624 Y98.639 I2.787 J-1.281 E.01288
G1 X86.86 Y98.93 E.00776
; WIPE_START
G1 X86.023 Y98.977 E-.31819
G1 X86.023 Y97.944 E-.39245
G1 X86.151 Y97.919 E-.04936
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.826 Y90.473 Z2.08 F42000
G1 X88.798 Y86.148 Z2.08
G1 Z1.68
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.136 J-3.149 E.05993
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.58 J1.81 E.06217
G1 X88.772 Y93.852 E.04253
G2 X86.784 Y94.581 I.039 J3.18 E.04476
G1 X86.448 Y94.883 E.00938
G1 X86.448 Y85.115 E.20262
G1 X86.781 Y85.417 E.00934
G2 X88.738 Y86.147 I2.018 J-2.418 E.04416
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z2.08 F42000
G1 X93.977 Y98.977 Z2.08
G1 Z1.68
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.679 Y98.977 E.02691
G2 X93.208 Y95.726 I-1.901 J-1.978 E.07326
G2 X90.815 Y94.277 I-2.407 J1.273 E.06095
G1 X88.78 Y94.277 E.04222
G2 X86.23 Y96.095 I.023 J2.73 E.06919
G1 X86.023 Y96.055 E.00436
G1 X86.023 Y83.944 E.25122
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.575 J-.912 E.0693
G1 X90.914 Y85.722 E.04415
G2 X92.926 Y81.296 I-.119 J-2.725 E.12451
G1 X92.684 Y81.023 E.00754
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.679 Y98.977 E-.49357
G1 X92.891 Y98.746 E-.11899
G1 X93.054 Y98.531 E-.10277
G1 X93.115 Y98.43 E-.04467
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.151 Y91.397 Z2.08 F42000
G1 X86.23 Y82.095 Z2.08
G1 Z1.68
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.055 E.00436
G1 X86.023 Y81.023 E.0214
G1 X86.904 Y81.023 E.01827
G1 X86.642 Y81.338 E.00849
G2 X86.25 Y82.039 I2.223 J1.7 E.01671
; WIPE_START
G1 X86.023 Y82.055 E-.08646
G1 X86.023 Y81.023 E-.39199
G1 X86.764 Y81.023 E-.28155
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z2.08 F42000
G1 Z1.68
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04363
G2 X91.501 Y80.808 I-.097 J-2.299 E.13311
G1 X91.539 Y80.599 E.0044
G1 X94.401 Y80.599 E.05936
G1 X94.401 Y99.401 E.38999
G1 X91.541 Y99.401 E.05932
G1 X91.506 Y99.188 E.00448
G2 X90.809 Y94.701 I-.705 J-2.188 E.13478
G1 X88.788 Y94.701 E.04191
G2 X88.099 Y99.192 I.014 J2.301 E.1348
G1 X88.061 Y99.401 E.0044
G1 X85.599 Y99.401 E.05107
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.523 Y85.283 I.701 J2.189 E.12929
G1 X88.713 Y85.294 E.00395
; WIPE_START
G1 X88.791 Y85.299 E-.02974
G1 X90.713 Y85.298 E-.73026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z2.08 F42000
G1 X94.8 Y99.8 Z2.08
G1 Z1.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.284 Y99.057 F42000
G1 Z1.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0926089
G1 F15000
M204 S6000
G1 X92.177 Y99.148 E.00046
G1 X92.104 Y99.169 E.00025
M204 S10000
G1 X91.327 Y99.33 F42000
; LINE_WIDTH: 0.52896
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.652 J-9.869 E.01086
G3 X88.787 Y99.35 I-1.087 J-127.983 E.05164
G1 X88.537 Y99.343 E.00616
G1 X88.526 Y99.329 E.00043
; LINE_WIDTH: 0.498242
G1 X88.327 Y99.057 E.00778
M204 S10000
G1 X87.432 Y99.189 F42000
; LINE_WIDTH: 0.129714
G1 F15000
M204 S6000
G1 X87.319 Y99.087 E.00077
; LINE_WIDTH: 0.0993847
G1 X87.18 Y98.95 E.0007
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.135655
G1 F15000
M204 S6000
G1 X86.253 Y98.501 E.00147
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.46808
G1 F15000
M204 S6000
G1 X86.1 Y97.479 E.007
; LINE_WIDTH: 0.499652
G1 X86.085 Y97.468 E.00044
; LINE_WIDTH: 0.527421
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.519965
G3 X86.09 Y96.284 I6.121 J-.476 E.02838
M204 S10000
G1 X86.236 Y95.445 F42000
; LINE_WIDTH: 0.128642
G1 F15000
M204 S6000
G1 X86.295 Y95.373 E.00047
; LINE_WIDTH: 0.103257
G1 X86.453 Y95.195 E.0009
; WIPE_START
G1 X86.295 Y95.373 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.541 Y95.364 Z2.08 F42000
G1 Z1.68
G1 E.8 F1800
; LINE_WIDTH: 0.288163
G1 F15000
M204 S6000
G3 X93.65 Y95.917 I-11.581 J2.557 E.00723
; LINE_WIDTH: 0.238257
G1 X93.667 Y96.013 E.00102
; LINE_WIDTH: 0.20442
G1 X93.684 Y96.109 E.00085
; LINE_WIDTH: 0.167887
G1 X93.703 Y96.263 E.00108
; LINE_WIDTH: 0.130447
G1 X93.721 Y96.409 E.00075
; LINE_WIDTH: 0.09585
G1 X93.739 Y96.652 E.00083
M204 S10000
G1 X93.739 Y97.348 F42000
; LINE_WIDTH: 0.0955558
G1 F15000
M204 S6000
G1 X93.722 Y97.587 E.00082
; LINE_WIDTH: 0.129931
G1 X93.703 Y97.737 E.00077
; LINE_WIDTH: 0.166965
G1 X93.685 Y97.883 E.00102
; LINE_WIDTH: 0.203319
G1 X93.666 Y97.988 E.00093
; LINE_WIDTH: 0.238873
G1 X93.649 Y98.085 E.00103
; LINE_WIDTH: 0.273046
G1 X93.632 Y98.183 E.00119
; LINE_WIDTH: 0.292823
G1 X93.515 Y98.764 E.00775
M204 S10000
G1 X93.486 Y98.764 F42000
; LINE_WIDTH: 0.437413
G1 F15000
M204 S6000
G2 X93.764 Y97.695 I-21.731 J-6.228 E.02223
; WIPE_START
G1 X93.486 Y98.764 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.516 Y91.132 Z2.08 F42000
G1 X93.541 Y84.636 Z2.08
G1 Z1.68
G1 E.8 F1800
; LINE_WIDTH: 0.292823
G1 F15000
M204 S6000
G1 X93.632 Y84.183 E.00603
; LINE_WIDTH: 0.273046
G1 X93.649 Y84.085 E.00119
; LINE_WIDTH: 0.238873
G1 X93.666 Y83.988 E.00103
; LINE_WIDTH: 0.203319
G1 X93.685 Y83.883 E.00093
; LINE_WIDTH: 0.166965
G1 X93.703 Y83.737 E.00102
; LINE_WIDTH: 0.129931
G1 X93.722 Y83.587 E.00077
; LINE_WIDTH: 0.0955558
G1 X93.739 Y83.348 E.00082
M204 S10000
G1 X93.739 Y82.652 F42000
; LINE_WIDTH: 0.09585
G1 F15000
M204 S6000
G1 X93.721 Y82.409 E.00084
; LINE_WIDTH: 0.130447
G1 X93.703 Y82.263 E.00075
; LINE_WIDTH: 0.167887
G1 X93.684 Y82.109 E.00108
; LINE_WIDTH: 0.20442
G1 X93.667 Y82.013 E.00085
; LINE_WIDTH: 0.238257
G1 X93.65 Y81.917 E.00102
; LINE_WIDTH: 0.288798
G2 X93.516 Y81.236 I-14.393 J2.48 E.00893
M204 S10000
G1 X93.494 Y81.236 F42000
; LINE_WIDTH: 0.417136
G1 F15000
M204 S6000
G1 X93.764 Y82.322 E.02143
; WIPE_START
G1 X93.494 Y81.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.326 Y80.977 Z2.08 F42000
G1 Z1.68
G1 E.8 F1800
; LINE_WIDTH: 0.0973086
G1 F15000
M204 S6000
G1 X92.139 Y80.811 E.00087
M204 S10000
G1 X91.273 Y80.943 F42000
; LINE_WIDTH: 0.498208
G1 F15000
M204 S6000
G1 X91.074 Y80.671 E.00778
; LINE_WIDTH: 0.528659
G1 X91.063 Y80.657 E.00043
G1 X90.813 Y80.65 E.00615
G2 X88.604 Y80.654 I-.904 J112.123 E.05431
G1 X88.277 Y80.673 E.00806
M204 S10000
G1 X87.442 Y80.811 F42000
; LINE_WIDTH: 0.120089
G1 F15000
M204 S6000
G1 X87.323 Y80.918 E.00074
; LINE_WIDTH: 0.0938847
G1 X87.21 Y81.026 E.00052
M204 S10000
G1 X86.331 Y81.236 F42000
; LINE_WIDTH: 0.137363
G1 F15000
M204 S6000
G1 X86.253 Y81.499 E.0015
M204 S10000
G1 X86.09 Y82.284 F42000
; LINE_WIDTH: 0.519965
G1 F15000
M204 S6000
G2 X86.069 Y83.457 I6.099 J.696 E.02838
; LINE_WIDTH: 0.527421
G1 X86.085 Y83.468 E.00047
; LINE_WIDTH: 0.499652
G1 X86.1 Y83.479 E.00044
; LINE_WIDTH: 0.46808
G1 X86.367 Y83.662 E.007
M204 S10000
G1 X86.236 Y84.551 F42000
; LINE_WIDTH: 0.108708
G1 F15000
M204 S6000
G1 X86.443 Y84.791 E.00129
; WIPE_START
G1 X86.236 Y84.551 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.811 Y86.598 Z2.08 F42000
G1 Z1.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X86.811 Y85.892 E.01465
G2 X87.674 Y86.326 I2.085 J-3.073 E.0201
G1 X86.811 Y87.19 E.02533
G1 X86.811 Y86.811 E.00786
G1 X93.189 Y93.189 E.18712
G1 X93.189 Y92.81 E.00786
G1 X92.213 Y93.787 E.02864
G2 X90.493 Y93.493 I-1.457 J3.352 E.03654
G1 X86.811 Y89.81 E.10803
G1 X86.811 Y90.19 E.00786
G1 X90.491 Y86.509 E.10795
G1 X89.51 Y86.51 E.02034
G1 X93.189 Y90.19 E.10793
G1 X93.189 Y89.81 E.00786
G1 X89.509 Y93.491 E.10797
G2 X87.676 Y93.675 I-.44 J4.831 E.03845
G1 X86.811 Y92.81 E.02538
G1 X86.811 Y93.189 E.00786
G1 X93.189 Y86.811 E.18712
G1 X93.189 Y87.19 E.00786
G1 X92.212 Y86.212 E.02868
G2 X93.189 Y85.57 I-1.372 J-3.156 E.02438
G1 X93.189 Y86.092 E.01082
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F16200
G1 X93.189 Y85.57 E-.1982
G1 X92.678 Y85.967 E-.24582
G1 X92.212 Y86.212 E-.20025
G1 X92.427 Y86.427 E-.11573
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/166
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.08 I-.303 J1.179 P1  F42000
G1 X97.118 Y87.635 Z2.08
G1 Z1.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.752 Y87.338 I.796 J.876 E.01371
G1 X97.781 Y86.919 E.0081
G3 X96.815 Y89.027 I.003 J1.276 E.09855
G3 X96.957 Y87.245 I.629 J-.846 E.04111
G3 X97.722 Y86.915 I.902 J1.041 E.01631
; WIPE_START
G1 X98.05 Y86.938 E-.12504
G1 X98.398 Y87.062 E-.14034
G1 X98.667 Y87.252 E-.12515
G1 X98.888 Y87.523 E-.13277
G1 X99.028 Y87.843 E-.13293
G1 X99.066 Y88.114 E-.10376
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I-.994 J-.702 P1  F42000
G1 X97.09 Y90.911 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.895 Y90.669 I1.034 J1.979 E.0163
G1 X97.974 Y90.256 E.0081
G3 X97.524 Y90.265 I-.193 J1.546 E.17997
G1 X97.916 Y90.245 E.00756
; WIPE_START
G1 X98.294 Y90.32 E-.14654
G1 X98.651 Y90.491 E-.15044
G1 X98.951 Y90.742 E-.14867
G1 X99.179 Y91.059 E-.14866
G1 X99.323 Y91.424 E-.1487
G1 X99.328 Y91.468 E-.01699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I-.702 J-.994 P1  F42000
G1 X88.797 Y98.9 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03671
G3 X90.877 Y98.899 I-.003 J1.9 E.10776
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.886 E-.1083
G1 X88.426 Y98.863 E-.05652
G1 X88.171 Y98.793 E-.1003
G1 X88.063 Y98.752 E-.0439
G1 X87.827 Y98.632 E-.10053
G1 X87.701 Y98.55 E-.05716
G1 X87.582 Y98.458 E-.05739
G1 X87.471 Y98.358 E-.05683
G1 X87.294 Y98.159 E-.10097
G1 X87.207 Y98.036 E-.05718
G1 X87.179 Y97.989 E-.02093
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.116 Y90.414 Z2.2 F42000
G1 X88.797 Y84.9 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.10911
G1 X90.803 Y81.1 E.03671
G3 X90.877 Y84.899 I-.003 J1.9 E.10776
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y84.886 E-.10829
G1 X88.426 Y84.863 E-.05652
G1 X88.171 Y84.793 E-.1003
G1 X88.063 Y84.752 E-.0439
G1 X87.827 Y84.632 E-.10053
G1 X87.701 Y84.55 E-.0571
G1 X87.582 Y84.458 E-.05745
G1 X87.471 Y84.358 E-.05683
G1 X87.294 Y84.159 E-.10097
G1 X87.207 Y84.036 E-.05718
G1 X87.179 Y83.989 E-.02094
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.039 Y91.62 Z2.2 F42000
G1 X86.904 Y98.977 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01827
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.104 E.00447
G2 X86.641 Y98.662 I2.784 J-1.279 E.01348
G1 X86.866 Y98.93 E.00726
; WIPE_START
G1 X86.023 Y98.977 E-.3205
G1 X86.023 Y97.944 E-.39245
G1 X86.145 Y97.921 E-.04706
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.823 Y90.475 Z2.2 F42000
G1 X88.798 Y86.148 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.147 J-3.169 E.0599
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.58 J1.81 E.06217
G1 X88.772 Y93.852 E.04252
G2 X86.828 Y94.546 I.039 J3.181 E.0436
G1 X86.448 Y94.876 E.01044
G1 X86.448 Y85.115 E.20247
G1 X86.781 Y85.416 E.00932
G2 X88.738 Y86.147 I2.018 J-2.417 E.04417
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z2.2 F42000
G1 X93.977 Y98.977 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.686 Y98.977 E.02676
G2 X93.404 Y97.801 I-2.092 J-2.085 E.02884
G2 X90.815 Y94.277 I-2.605 J-.799 E.10528
G1 X88.78 Y94.277 E.04222
G2 X86.228 Y96.095 I.025 J2.736 E.06921
G1 X86.023 Y96.054 E.00432
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.575 J-.912 E.0693
G1 X90.914 Y85.722 E.04415
G2 X92.925 Y81.295 I-.116 J-2.723 E.12458
G1 X92.684 Y81.023 E.00753
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.686 Y98.977 E-.49086
G1 X92.897 Y98.738 E-.12094
G1 X93.054 Y98.53 E-.09905
G1 X93.122 Y98.42 E-.04915
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.152 Y91.389 Z2.2 F42000
G1 X86.228 Y82.095 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00432
G1 X86.023 Y81.023 E.02137
G1 X86.904 Y81.023 E.01827
G1 X86.641 Y81.338 E.0085
G2 X86.249 Y82.039 I2.312 J1.756 E.01671
; WIPE_START
G1 X86.023 Y82.054 E-.08586
G1 X86.023 Y81.023 E-.39143
G1 X86.767 Y81.023 E-.28272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04363
G2 X91.501 Y80.808 I-.098 J-2.299 E.13308
G1 X91.539 Y80.599 E.0044
G1 X94.401 Y80.599 E.05936
G1 X94.401 Y99.401 E.38999
G1 X91.541 Y99.401 E.05932
G1 X91.506 Y99.188 E.00448
G2 X90.809 Y94.701 I-.708 J-2.188 E.13468
G1 X88.788 Y94.701 E.04191
G2 X88.098 Y99.193 I.014 J2.301 E.13482
G1 X88.06 Y99.401 E.00439
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.523 Y85.283 I.701 J2.189 E.12929
G1 X88.713 Y85.294 E.00395
; WIPE_START
G1 X88.791 Y85.299 E-.02978
G1 X90.713 Y85.298 E-.73022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z2.2 F42000
G1 X94.8 Y99.8 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
; WIPE_END
M73 P39 R14
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




G1 X92.332 Y99.02 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0968417
G1 F15000
M204 S6000
G1 X92.194 Y99.143 E.00064
G1 X92.105 Y99.168 E.00032
M204 S10000
G1 X91.327 Y99.33 F42000
; LINE_WIDTH: 0.528978
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.652 J-9.893 E.01086
G3 X88.787 Y99.35 I-1.088 J-127.585 E.05164
G1 X88.536 Y99.343 E.00619
G1 X88.526 Y99.33 E.0004
; LINE_WIDTH: 0.499981
G1 X88.327 Y99.057 E.00783
M204 S10000
G1 X87.442 Y99.189 F42000
; LINE_WIDTH: 0.120131
G1 F15000
M204 S6000
G1 X87.322 Y99.082 E.00074
; LINE_WIDTH: 0.0938983
G1 X87.209 Y98.974 E.00052
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.137689
G1 F15000
M204 S6000
G1 X86.253 Y98.501 E.0015
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.468162
G1 F15000
M204 S6000
G1 X86.1 Y97.479 E.007
; LINE_WIDTH: 0.49978
G1 X86.085 Y97.468 E.00044
; LINE_WIDTH: 0.527464
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.520661
G3 X86.091 Y96.284 I6.068 J-.472 E.02843
M204 S10000
G1 X86.236 Y95.434 F42000
; LINE_WIDTH: 0.129516
G1 F15000
M204 S6000
G1 X86.374 Y95.277 E.00106
; LINE_WIDTH: 0.0954604
G1 X86.45 Y95.192 E.00039
; LINE_WIDTH: 0.0806556
G1 X86.478 Y95.164 E.00011
; WIPE_START
G1 X86.45 Y95.192 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.764 Y96.339 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.403251
G1 F15000
M204 S6000
G2 X93.523 Y95.37 I-17.96 J3.95 E.01844
M204 S10000
G1 X93.546 Y95.362 F42000
; LINE_WIDTH: 0.268723
G1 F15000
M204 S6000
G1 X93.644 Y95.878 E.00624
; LINE_WIDTH: 0.242321
G1 X93.668 Y96.024 E.00156
; LINE_WIDTH: 0.194098
G1 X93.692 Y96.169 E.00122
; LINE_WIDTH: 0.152035
G1 X93.71 Y96.323 E.00095
; LINE_WIDTH: 0.117672
G1 X93.727 Y96.469 E.00066
; LINE_WIDTH: 0.0902003
G1 X93.739 Y96.658 E.0006
M204 S10000
G1 X93.739 Y97.353 F42000
; LINE_WIDTH: 0.0959753
G1 F15000
M204 S6000
G1 X93.721 Y97.59 E.00082
; LINE_WIDTH: 0.130575
G1 X93.703 Y97.739 E.00077
; LINE_WIDTH: 0.167188
G1 X93.685 Y97.883 E.00101
; LINE_WIDTH: 0.203348
G1 X93.666 Y97.988 E.00093
; LINE_WIDTH: 0.238883
G1 X93.649 Y98.085 E.00103
; LINE_WIDTH: 0.273037
G1 X93.632 Y98.182 E.00119
; LINE_WIDTH: 0.292781
G1 X93.515 Y98.764 E.00775
M204 S10000
G1 X93.486 Y98.764 F42000
; LINE_WIDTH: 0.436967
G1 F15000
M204 S6000
G2 X93.764 Y97.694 I-20.985 J-6.027 E.02225
M204 S10000
G1 X93.764 Y82.339 F42000
; LINE_WIDTH: 0.40231
G1 F15000
M204 S6000
G1 X93.496 Y81.236 E.02091
M204 S10000
G1 X93.521 Y81.236 F42000
; LINE_WIDTH: 0.268732
G1 F15000
M204 S6000
G1 X93.644 Y81.878 E.00777
; LINE_WIDTH: 0.242322
G1 X93.668 Y82.024 E.00156
; LINE_WIDTH: 0.19414
G1 X93.692 Y82.169 E.00121
; LINE_WIDTH: 0.15209
G1 X93.71 Y82.323 E.00095
; LINE_WIDTH: 0.11768
G1 X93.727 Y82.469 E.00066
; LINE_WIDTH: 0.0901897
G1 X93.739 Y82.658 E.0006
M204 S10000
G1 X93.739 Y83.353 F42000
; LINE_WIDTH: 0.0959852
G1 F15000
M204 S6000
G1 X93.721 Y83.59 E.00082
; LINE_WIDTH: 0.130553
G1 X93.703 Y83.738 E.00077
; LINE_WIDTH: 0.16708
G1 X93.685 Y83.882 E.001
; LINE_WIDTH: 0.203215
G1 X93.666 Y83.988 E.00093
; LINE_WIDTH: 0.238797
G1 X93.649 Y84.085 E.00103
; LINE_WIDTH: 0.272999
G1 X93.632 Y84.182 E.00119
; LINE_WIDTH: 0.292766
G1 X93.541 Y84.636 E.00604
M204 S10000
G1 X93.34 Y85.268 F42000
; LINE_WIDTH: 0.0937871
G1 F15000
M204 S6000
G1 X93.179 Y85.407 E.00071
M204 S10000
G1 X93.189 Y86.417 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X93.189 Y85.937 E.00995
G1 X92.988 Y85.745 E.00577
G3 X92.212 Y86.212 I-3.875 J-5.561 E.01881
G1 X93.189 Y87.19 E.02868
G1 X93.189 Y86.811 E.00786
G1 X86.811 Y93.189 E.18712
G1 X86.811 Y92.81 E.00786
G1 X87.676 Y93.675 E.02538
G3 X89.509 Y93.491 I1.394 J4.65 E.03845
G1 X93.189 Y89.81 E.10797
G1 X93.189 Y90.19 E.00786
G1 X89.51 Y86.51 E.10793
G1 X90.491 Y86.509 E.02034
G1 X86.811 Y90.19 E.10795
G1 X86.811 Y89.81 E.00786
G1 X90.493 Y93.493 E.10803
G3 X92.213 Y93.787 I.263 J3.646 E.03654
G1 X93.189 Y92.81 E.02864
G1 X93.189 Y93.189 E.00786
G1 X86.811 Y86.811 E.18712
G1 X86.811 Y87.19 E.00786
G1 X87.675 Y86.325 E.02535
G3 X86.811 Y85.892 I1.181 J-3.435 E.02011
G1 X86.811 Y86.598 E.01465
; WIPE_START
G1 X86.811 Y85.892 E-.26836
G1 X87.675 Y86.325 E-.36735
G1 X87.444 Y86.557 E-.12429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.445 Y84.794 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.108433
G1 F15000
M204 S6000
G1 X86.236 Y84.552 E.0013
M204 S10000
G1 X86.367 Y83.662 F42000
; LINE_WIDTH: 0.468162
G1 F15000
M204 S6000
G1 X86.1 Y83.479 E.007
; LINE_WIDTH: 0.49978
G1 X86.085 Y83.468 E.00044
; LINE_WIDTH: 0.527464
G1 X86.069 Y83.457 E.00047
; LINE_WIDTH: 0.520662
G1 X86.05 Y83.064 E.00951
G1 X86.052 Y82.846 E.00529
G1 X86.091 Y82.284 E.01363
M204 S10000
G1 X87.212 Y81.023 F42000
; LINE_WIDTH: 0.0979403
G1 F15000
M204 S6000
G1 X87.344 Y80.898 E.00064
; LINE_WIDTH: 0.124029
G1 X87.442 Y80.811 E.00063
M204 S10000
G1 X88.277 Y80.673 F42000
; LINE_WIDTH: 0.528658
G1 F15000
M204 S6000
G1 X88.604 Y80.654 E.00805
G3 X90.813 Y80.65 I1.304 J111.879 E.05431
G1 X91.063 Y80.657 E.00615
G1 X91.074 Y80.672 E.00044
; LINE_WIDTH: 0.49752
G1 X91.273 Y80.943 E.00776
M204 S10000
G1 X92.14 Y80.811 F42000
; LINE_WIDTH: 0.0971615
G1 F15000
M204 S6000
G1 X92.326 Y80.977 E.00087
; CHANGE_LAYER
; Z_HEIGHT: 1.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X92.14 Y80.811 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/166
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.2 I-.982 J.719 P1  F42000
G1 X97.111 Y87.595 Z2.2
G1 Z1.92
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.804 Y87.387 I.852 J1.579 E.01406
G1 X97.833 Y86.968 E.0081
G3 X97.069 Y89.208 I-.055 J1.231 E.08811
G3 X97.323 Y87.063 I.367 J-1.044 E.05763
G3 X97.774 Y86.964 I.541 J1.395 E.00894
; WIPE_START
G1 X98.326 Y87.081 E-.2144
G1 X98.613 Y87.271 E-.13068
G1 X98.835 Y87.53 E-.12973
G1 X98.977 Y87.847 E-.13196
G1 X99.026 Y88.189 E-.13119
G1 X99.018 Y88.246 E-.02204
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.32 I-.988 J-.71 P1  F42000
G1 X96.916 Y91.171 Z2.32
G1 Z1.92
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X96.916 Y91.171 E0
G3 X97.869 Y90.721 I1.038 J.964 E.0208
G1 X97.938 Y90.307 E.0081
G3 X97.531 Y90.321 I-.15 J1.5 E.17466
G1 X97.879 Y90.299 E.00674
; WIPE_START
G1 X98.255 Y90.367 E-.1452
G1 X98.596 Y90.524 E-.14255
G1 X98.899 Y90.769 E-.14822
G1 X99.123 Y91.074 E-.14366
G1 X99.266 Y91.431 E-.1461
G1 X99.277 Y91.521 E-.03428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.32 I-.701 J-.995 P1  F42000
G1 X88.797 Y98.9 Z2.32
G1 Z1.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03671
G3 X90.877 Y98.899 I-.003 J1.9 E.10776
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.886 E-.10821
G1 X88.426 Y98.863 E-.05663
G1 X88.192 Y98.8 E-.09204
G1 X88.064 Y98.752 E-.05187
G1 X87.827 Y98.632 E-.10073
G1 X87.701 Y98.55 E-.05728
G1 X87.582 Y98.458 E-.05723
G1 X87.471 Y98.358 E-.05695
G1 X87.294 Y98.159 E-.10084
G1 X87.207 Y98.036 E-.05754
G1 X87.179 Y97.989 E-.02069
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.116 Y90.414 Z2.32 F42000
G1 X88.797 Y84.9 Z2.32
G1 Z1.92
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.10911
G1 X90.803 Y81.1 E.03671
G3 X90.877 Y84.899 I-.003 J1.9 E.10776
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y84.886 E-.10829
G1 X88.426 Y84.863 E-.05655
G1 X88.192 Y84.8 E-.09204
G1 X88.064 Y84.752 E-.05187
G1 X87.827 Y84.632 E-.10073
G1 X87.701 Y84.55 E-.05728
G1 X87.582 Y84.458 E-.05723
G1 X87.471 Y84.358 E-.05695
G1 X87.295 Y84.159 E-.10083
G1 X87.207 Y84.036 E-.05755
G1 X87.179 Y83.989 E-.02068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.039 Y91.62 Z2.32 F42000
G1 X86.904 Y98.977 Z2.32
G1 Z1.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01827
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00447
G2 X86.642 Y98.662 I2.778 J-1.276 E.01348
G1 X86.866 Y98.93 E.00725
; WIPE_START
G1 X86.023 Y98.977 E-.32052
G1 X86.023 Y97.944 E-.39245
G1 X86.145 Y97.921 E-.04703
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.823 Y90.475 Z2.32 F42000
G1 X88.798 Y86.148 Z2.32
G1 Z1.92
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.147 J-3.169 E.0599
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.58 J1.808 E.06217
G1 X88.772 Y93.852 E.04253
G2 X86.83 Y94.544 I.039 J3.182 E.04354
G1 X86.448 Y94.876 E.0105
G1 X86.448 Y85.115 E.20247
G1 X86.781 Y85.417 E.00933
G2 X88.738 Y86.147 I2.017 J-2.418 E.04416
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z2.32 F42000
G1 X93.977 Y98.977 Z2.32
G1 Z1.92
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.679 Y98.977 E.02691
G2 X93.21 Y95.729 I-1.901 J-1.978 E.07319
G2 X90.815 Y94.277 I-2.408 J1.27 E.06102
G1 X88.78 Y94.277 E.04222
G2 X86.228 Y96.095 I.026 J2.737 E.0692
G1 X86.023 Y96.054 E.00432
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.575 J-.912 E.0693
G1 X90.914 Y85.722 E.04415
G2 X92.925 Y81.295 I-.116 J-2.723 E.12458
G1 X92.684 Y81.023 E.00753
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.679 Y98.977 E-.49358
G1 X92.891 Y98.747 E-.11885
G1 X93.054 Y98.531 E-.10291
G1 X93.115 Y98.43 E-.04466
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.15 Y91.397 Z2.32 F42000
G1 X86.228 Y82.095 Z2.32
G1 Z1.92
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00432
G1 X86.023 Y81.023 E.02137
G1 X86.905 Y81.023 E.01829
G1 X86.655 Y81.321 E.00806
G2 X86.249 Y82.039 I2.286 J1.768 E.01717
; WIPE_START
G1 X86.023 Y82.054 E-.08586
G1 X86.023 Y81.023 E-.39142
G1 X86.767 Y81.023 E-.28272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z2.32 F42000
G1 Z1.92
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04363
G2 X91.501 Y80.808 I-.099 J-2.299 E.13306
G1 X91.539 Y80.599 E.0044
G1 X94.401 Y80.599 E.05937
G1 X94.401 Y99.401 E.38999
G1 X91.541 Y99.401 E.05932
G1 X91.506 Y99.188 E.00448
G2 X90.809 Y94.701 I-.708 J-2.188 E.13468
G1 X88.788 Y94.701 E.04191
G2 X88.099 Y99.192 I.014 J2.301 E.1348
G1 X88.061 Y99.401 E.0044
G1 X85.599 Y99.401 E.05107
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.523 Y85.283 I.701 J2.189 E.12928
G1 X88.713 Y85.294 E.00395
; WIPE_START
G1 X88.791 Y85.299 E-.02978
G1 X90.713 Y85.298 E-.73022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z2.32 F42000
G1 X94.8 Y99.8 Z2.32
G1 Z1.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.291 Y99.048 F42000
G1 Z1.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0918169
G1 F15000
M204 S6000
G1 X92.177 Y99.148 E.00049
G1 X92.105 Y99.168 E.00024
M204 S10000
G1 X91.327 Y99.33 F42000
; LINE_WIDTH: 0.528966
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.652 J-9.894 E.01086
G3 X88.787 Y99.35 I-1.088 J-127.912 E.05164
G1 X88.537 Y99.343 E.00615
G1 X88.526 Y99.328 E.00044
; LINE_WIDTH: 0.497897
G1 X88.327 Y99.057 E.00777
M204 S10000
G1 X87.442 Y99.189 F42000
; LINE_WIDTH: 0.120026
G1 F15000
M204 S6000
G1 X87.322 Y99.082 E.00074
; LINE_WIDTH: 0.0938311
G1 X87.21 Y98.974 E.00052
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.137278
G1 F15000
M204 S6000
G1 X86.253 Y98.501 E.0015
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.467582
G1 F15000
M204 S6000
G1 X86.101 Y97.479 E.00698
; LINE_WIDTH: 0.499289
G1 X86.085 Y97.468 E.00045
; LINE_WIDTH: 0.527299
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.520023
G3 X86.09 Y96.283 I6.117 J-.476 E.0284
M204 S10000
G1 X86.236 Y95.435 F42000
; LINE_WIDTH: 0.131976
G1 F15000
M204 S6000
G1 X86.327 Y95.327 E.00073
; LINE_WIDTH: 0.101817
G1 X86.479 Y95.162 E.00084
; WIPE_START
G1 X86.327 Y95.327 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.511 Y93.717 Z2.32 F42000
G1 Z1.92
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.367194
G1 F12000
M204 S6000
G1 X88.017 Y93.561 E.00884
G1 X88.526 Y93.492 E.00858
G1 X88.768 Y93.474 E.00405
G1 X91.002 Y93.479 E.03729
G1 X91.503 Y93.545 E.00843
G1 X92.085 Y93.72 E.01015
G1 X92.631 Y93.996 E.01022
G1 X92.927 Y94.189 E.0059
; LINE_WIDTH: 0.386469
G1 X92.988 Y94.209 E.00112
; LINE_WIDTH: 0.427902
G1 X93.048 Y94.229 E.00125
; LINE_WIDTH: 0.469336
G1 X93.108 Y94.25 E.00138
G1 X93.13 Y94.18 E.00158
; LINE_WIDTH: 0.427902
G1 X93.152 Y94.11 E.00144
; LINE_WIDTH: 0.367388
G1 X93.174 Y94.041 E.00122
G1 X93.174 Y85.959 E.13499
G1 X93.168 Y85.897 E.00104
G1 X93.001 Y85.776 E.00344
G1 X92.419 Y86.13 E.01139
G1 X91.634 Y86.422 E.01399
M73 P40 R14
G1 X90.929 Y86.525 E.01189
G1 X88.779 Y86.526 E.03591
G1 X88.114 Y86.451 E.01118
G1 X87.516 Y86.277 E.01041
G1 X87.003 Y86.044 E.0094
; LINE_WIDTH: 0.400187
G1 X86.944 Y86.034 E.00111
; LINE_WIDTH: 0.449177
G1 X86.884 Y86.023 E.00126
; LINE_WIDTH: 0.455686
G1 X86.865 Y86.089 E.00143
; LINE_WIDTH: 0.419712
G1 X86.846 Y86.154 E.00131
; LINE_WIDTH: 0.365912
G1 X86.826 Y86.219 E.00113
G1 X86.826 Y93.781 E.12576
; LINE_WIDTH: 0.383799
G1 X86.846 Y93.846 E.00119
; LINE_WIDTH: 0.419892
G1 X86.865 Y93.911 E.00131
; LINE_WIDTH: 0.455986
G1 X86.884 Y93.977 E.00143
G1 X86.945 Y93.962 E.00131
; LINE_WIDTH: 0.419892
G1 X87.005 Y93.947 E.0012
; LINE_WIDTH: 0.368018
G1 X87.066 Y93.932 E.00104
G1 X87.457 Y93.743 E.00727
M204 S10000
G1 X92.795 Y91.902 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X92.795 Y90.205 E.0352
G1 X89.902 Y93.098 E.08486
G1 X90.098 Y93.098 E.00406
G1 X87.205 Y90.205 E.08487
G1 X87.205 Y89.795 E.0085
G1 X90.096 Y86.904 E.08481
G1 X89.904 Y86.904 E.00398
G1 X92.795 Y89.795 E.0848
G1 X92.795 Y88.098 E.0352
M204 S10000
G1 X90.874 Y86.904 F42000
G1 F16200
M204 S6000
G2 X92.511 Y86.512 I-.093 J-4.005 E.03519
G1 X92.795 Y86.795 E.00832
G1 X92.795 Y87.205 E.0085
G1 X87.205 Y92.795 E.16398
G1 X87.205 Y93.205 E.0085
G1 X87.366 Y93.366 E.00474
G3 X89.03 Y93.096 I1.465 J3.761 E.03521
; WIPE_START
G1 X88.213 Y93.138 E-.31067
G1 X87.366 Y93.366 E-.33317
G1 X87.205 Y93.205 E-.08682
G1 X87.205 Y93.127 E-.02934
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.541 Y95.364 Z2.32 F42000
G1 Z1.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.287981
G1 F15000
M204 S6000
G3 X93.65 Y95.917 I-11.663 J2.572 E.00723
; LINE_WIDTH: 0.238167
G1 X93.667 Y96.013 E.00101
; LINE_WIDTH: 0.204377
G1 X93.684 Y96.11 E.00085
; LINE_WIDTH: 0.167877
G1 X93.703 Y96.263 E.00108
; LINE_WIDTH: 0.130456
G1 X93.721 Y96.409 E.00075
; LINE_WIDTH: 0.0958617
G1 X93.739 Y96.652 E.00084
M204 S10000
G1 X93.739 Y97.348 F42000
; LINE_WIDTH: 0.0955771
G1 F15000
M204 S6000
G1 X93.722 Y97.587 E.00082
; LINE_WIDTH: 0.129926
G1 X93.703 Y97.737 E.00077
; LINE_WIDTH: 0.166866
G1 X93.685 Y97.882 E.00101
; LINE_WIDTH: 0.203219
G1 X93.666 Y97.988 E.00093
; LINE_WIDTH: 0.238857
G1 X93.649 Y98.085 E.00103
; LINE_WIDTH: 0.273113
G1 X93.632 Y98.183 E.0012
; LINE_WIDTH: 0.292912
G1 X93.515 Y98.764 E.00775
M204 S10000
G1 X93.486 Y98.764 F42000
; LINE_WIDTH: 0.437318
G1 F15000
M204 S6000
G2 X93.764 Y97.695 I-21.273 J-6.107 E.02224
; WIPE_START
G1 X93.558 Y98.508 E-.57687
G1 X93.486 Y98.764 E-.18313
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.802 Y91.62 Z2.32 F42000
G1 X89.031 Y86.905 Z2.32
G1 Z1.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G3 X87.368 Y86.632 I-.194 J-4.021 E.0352
G1 X87.205 Y86.795 E.00479
G1 X87.205 Y87.205 E.0085
G1 X92.795 Y92.795 E.16398
G1 X92.795 Y93.205 E.0085
G1 X92.51 Y93.49 E.00837
G1 X92.466 Y93.469 E.001
G2 X90.873 Y93.1 I-1.638 J3.442 E.03418
M204 S10000
G1 X93.192 Y85.394 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0922415
G1 F15000
M204 S6000
G1 X93.34 Y85.265 E.00064
M204 S10000
G1 X93.541 Y84.636 F42000
; LINE_WIDTH: 0.292912
G1 F15000
M204 S6000
G1 X93.632 Y84.183 E.00603
; LINE_WIDTH: 0.273129
G1 X93.649 Y84.085 E.0012
; LINE_WIDTH: 0.238907
G1 X93.666 Y83.988 E.00103
; LINE_WIDTH: 0.203303
G1 X93.685 Y83.883 E.00093
; LINE_WIDTH: 0.166946
G1 X93.703 Y83.737 E.00101
; LINE_WIDTH: 0.129953
G1 X93.722 Y83.587 E.00077
; LINE_WIDTH: 0.0955771
G1 X93.739 Y83.348 E.00082
M204 S10000
G1 X93.739 Y82.652 F42000
; LINE_WIDTH: 0.0958619
G1 F15000
M204 S6000
G1 X93.721 Y82.409 E.00084
; LINE_WIDTH: 0.130481
G1 X93.703 Y82.263 E.00075
; LINE_WIDTH: 0.16795
G1 X93.684 Y82.109 E.00108
; LINE_WIDTH: 0.204449
G1 X93.667 Y82.013 E.00085
; LINE_WIDTH: 0.238218
G1 X93.65 Y81.917 E.00101
; LINE_WIDTH: 0.288642
G2 X93.516 Y81.236 I-14.466 J2.492 E.00893
M204 S10000
G1 X93.494 Y81.236 F42000
; LINE_WIDTH: 0.415179
G1 F15000
M204 S6000
G1 X93.764 Y82.323 E.02134
; WIPE_START
G1 X93.494 Y81.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.327 Y80.977 Z2.32 F42000
G1 Z1.92
G1 E.8 F1800
; LINE_WIDTH: 0.0973101
G1 F15000
M204 S6000
G1 X92.139 Y80.811 E.00087
M204 S10000
G1 X91.273 Y80.943 F42000
; LINE_WIDTH: 0.497454
G1 F15000
M204 S6000
G1 X91.074 Y80.672 E.00776
; LINE_WIDTH: 0.52866
G1 X91.063 Y80.657 E.00044
G1 X90.813 Y80.65 E.00615
G2 X88.604 Y80.654 I-.904 J112.377 E.05431
G1 X88.277 Y80.673 E.00805
M204 S10000
G1 X87.444 Y80.811 F42000
; LINE_WIDTH: 0.108537
G1 F15000
M204 S6000
G1 X87.218 Y81.019 E.00124
M204 S10000
G1 X86.09 Y82.284 F42000
; LINE_WIDTH: 0.520021
G1 F15000
M204 S6000
G2 X86.069 Y83.457 I6.097 J.697 E.02839
; LINE_WIDTH: 0.527307
G1 X86.085 Y83.468 E.00047
; LINE_WIDTH: 0.499306
G1 X86.101 Y83.479 E.00045
; LINE_WIDTH: 0.467556
G1 X86.367 Y83.662 E.00698
M204 S10000
G1 X86.236 Y84.552 F42000
; LINE_WIDTH: 0.108518
G1 F15000
M204 S6000
G1 X86.446 Y84.794 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 2.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.236 Y84.552 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/166
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.32 I-.321 J1.174 P1  F42000
G1 X97.151 Y87.533 Z2.32
G1 Z2.04
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.869 Y87.437 I1.086 J5.404 E.01398
G1 X97.898 Y87.018 E.0081
G3 X97.372 Y89.306 I-.117 J1.177 E.07744
G3 X96.286 Y87.829 I.122 J-1.226 E.03982
G3 X97.591 Y87.033 I1.192 J.485 E.03155
G1 X97.839 Y87.014 E.0048
; WIPE_START
G1 X98.262 Y87.107 E-.16463
G1 X98.478 Y87.231 E-.0945
G1 X98.781 Y87.538 E-.16403
G1 X98.927 Y87.852 E-.13135
G1 X98.964 Y88.095 E-.09343
G1 X98.938 Y88.389 E-.11207
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.44 I-1.004 J-.687 P1  F42000
G1 X97.091 Y91.089 Z2.44
G1 Z2.04
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X97.094 Y91.085 E.00009
G3 X97.84 Y90.798 I.71 J.732 E.01583
G1 X97.869 Y90.379 E.0081
G3 X97.187 Y93.109 I-.075 J1.431 E.0974
G3 X96.384 Y91.58 I.148 J-1.054 E.03884
G3 X97.81 Y90.375 I1.426 J.241 E.03912
; WIPE_START
G1 X98.18 Y90.425 E-.14188
G1 X98.525 Y90.569 E-.142
G1 X98.926 Y90.927 E-.20452
G1 X99.19 Y91.441 E-.21947
G1 X99.208 Y91.577 E-.05214
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.44 I-.7 J-.995 P1  F42000
G1 X88.797 Y98.9 Z2.44
G1 Z2.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.007 J-1.9 E.10894
G1 X90.803 Y95.1 E.03671
G3 X90.877 Y98.899 I-.003 J1.9 E.10775
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.886 E-.10821
G1 X88.426 Y98.863 E-.05655
G1 X88.17 Y98.793 E-.10087
G1 X88.052 Y98.747 E-.0481
G1 X87.927 Y98.688 E-.0526
G1 X87.701 Y98.55 E-.10058
G1 X87.582 Y98.458 E-.05694
G1 X87.47 Y98.357 E-.0574
G1 X87.366 Y98.247 E-.05745
G1 X87.272 Y98.129 E-.05746
G1 X87.182 Y97.987 E-.06382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.117 Y90.412 Z2.44 F42000
G1 X88.797 Y84.9 Z2.44
G1 Z2.04
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.007 J-1.9 E.10894
G1 X90.803 Y81.1 E.03671
G3 X90.875 Y84.899 I-.003 J1.9 E.10779
G1 X88.857 Y84.9 E.03691
; WIPE_START
M204 S6000
G1 X88.573 Y84.886 E-.10823
G1 X88.426 Y84.863 E-.05654
G1 X88.17 Y84.793 E-.10087
G1 X88.052 Y84.747 E-.0481
G1 X87.927 Y84.688 E-.0526
G1 X87.701 Y84.55 E-.10058
G1 X87.582 Y84.458 E-.05694
G1 X87.47 Y84.357 E-.0574
G1 X87.366 Y84.247 E-.05746
G1 X87.272 Y84.129 E-.05746
G1 X87.182 Y83.987 E-.06381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.036 Y91.619 Z2.44 F42000
G1 X86.896 Y98.977 Z2.44
G1 Z2.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01809
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00447
G2 X86.61 Y98.621 I2.795 J-1.283 E.01241
G1 X86.858 Y98.93 E.00822
; WIPE_START
G1 X86.023 Y98.977 E-.3177
G1 X86.023 Y97.944 E-.39243
G1 X86.152 Y97.919 E-.04987
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.826 Y90.472 Z2.44 F42000
G1 X88.798 Y86.148 Z2.44
G1 Z2.04
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.918 Y86.146 E.04398
G2 X93.379 Y84.805 I-.125 J-3.155 E.06022
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.2131
G1 X93.379 Y95.195 E.0038
G2 X90.822 Y93.852 I-2.584 J1.814 E.06222
G1 X88.772 Y93.852 E.04252
G2 X86.784 Y94.581 I.038 J3.179 E.04475
G1 X86.448 Y94.882 E.00937
G1 X86.448 Y85.115 E.2026
G1 X86.782 Y85.417 E.00934
G2 X88.738 Y86.147 I2.019 J-2.424 E.04415
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z2.44 F42000
G1 X93.977 Y98.977 Z2.44
G1 Z2.04
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.679 Y98.977 E.02691
G2 X92.549 Y94.911 I-1.894 J-1.974 E.09512
G2 X90.815 Y94.277 I-1.751 J2.098 E.03907
G1 X88.78 Y94.277 E.04222
G2 X86.229 Y96.095 I.024 J2.732 E.06919
G1 X86.023 Y96.055 E.00435
G1 X86.023 Y83.944 E.25121
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.573 J-.91 E.06931
G1 X90.904 Y85.722 E.04394
G2 X92.893 Y81.255 I-.106 J-2.724 E.12583
G1 X92.681 Y81.023 E.00651
G1 X93.977 Y81.023 E.02687
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.679 Y98.977 E-.4936
G1 X92.891 Y98.747 E-.11876
G1 X93.055 Y98.53 E-.10328
G1 X93.115 Y98.43 E-.04436
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.151 Y91.397 Z2.44 F42000
G1 X86.229 Y82.095 Z2.44
G1 Z2.04
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.055 E.00435
G1 X86.023 Y81.023 E.02139
G1 X86.904 Y81.023 E.01827
G1 X86.641 Y81.338 E.0085
G2 X86.25 Y82.038 I2.241 J1.711 E.0167
; WIPE_START
G1 X86.023 Y82.055 E-.08643
G1 X86.023 Y81.023 E-.39187
G1 X86.765 Y81.023 E-.2817
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z2.44 F42000
G1 Z2.04
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.889 Y85.298 E.0435
G2 X91.502 Y80.807 I-.093 J-2.3 E.13319
G1 X91.541 Y80.599 E.00438
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.547 Y99.401 E.0592
G1 X91.505 Y99.198 E.0043
G1 X91.816 Y99.064 E.00702
G2 X90.809 Y94.701 I-1.019 J-2.063 E.12777
G1 X88.788 Y94.701 E.04191
G2 X88.098 Y99.193 I.015 J2.302 E.13481
G1 X88.059 Y99.401 E.00438
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00446
G2 X88.523 Y85.283 I.701 J2.189 E.12929
G1 X88.713 Y85.294 E.00394
; WIPE_START
G1 X88.791 Y85.299 E-.02978
G1 X90.713 Y85.298 E-.73022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z2.44 F42000
G1 X94.8 Y99.8 Z2.44
G1 Z2.04
G1 E.8 F1800
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.291 Y99.048 F42000
G1 Z2.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0917923
G1 F15000
M204 S6000
G1 X92.176 Y99.148 E.00049
G1 X92.105 Y99.168 E.00024
M204 S10000
G1 X91.328 Y99.33 F42000
; LINE_WIDTH: 0.528975
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.653 J-9.89 E.0109
G3 X88.787 Y99.35 I-1.087 J-128.308 E.05164
G1 X88.536 Y99.343 E.00618
G1 X88.526 Y99.33 E.0004
; LINE_WIDTH: 0.499848
G1 X88.327 Y99.057 E.00782
; WIPE_START
G1 X88.526 Y99.33 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.271 Y99.106 Z2.44 F42000
G1 Z2.04
G1 E.8 F1800
; LINE_WIDTH: 0.0839621
G1 F15000
M204 S6000
G2 X87.495 Y99.169 I1.738 J-5.752 E.00066
M204 S10000
G1 X87.429 Y99.189 F42000
; LINE_WIDTH: 0.131419
G1 F15000
M204 S6000
G1 X87.316 Y99.085 E.00079
; LINE_WIDTH: 0.100299
G1 X87.173 Y98.945 E.00073
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.124531
G1 F15000
M204 S6000
G1 X86.254 Y98.502 E.00132
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.467598
G1 F15000
M204 S6000
G1 X86.101 Y97.479 E.00698
; LINE_WIDTH: 0.499308
G1 X86.085 Y97.468 E.00045
; LINE_WIDTH: 0.527319
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.519976
G3 X86.09 Y96.284 I6.122 J-.476 E.02838
M204 S10000
G1 X86.236 Y95.444 F42000
; LINE_WIDTH: 0.129423
G1 F15000
M204 S6000
G1 X86.295 Y95.373 E.00047
; LINE_WIDTH: 0.103705
G1 X86.455 Y95.192 E.00092
; WIPE_START
G1 X86.295 Y95.373 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.583 Y97.638 Z2.44 F42000
G1 X93.764 Y97.694 Z2.44
G1 Z2.04
G1 E.8 F1800
; LINE_WIDTH: 0.436983
G1 F15000
M204 S6000
G3 X93.486 Y98.764 I-21.557 J-5.036 E.02223
M204 S10000
G1 X93.515 Y98.764 F42000
; LINE_WIDTH: 0.292838
G1 F15000
M204 S6000
G1 X93.632 Y98.183 E.00775
; LINE_WIDTH: 0.273077
G1 X93.649 Y98.085 E.00119
; LINE_WIDTH: 0.238899
G1 X93.666 Y97.988 E.00103
; LINE_WIDTH: 0.203338
G1 X93.685 Y97.883 E.00093
; LINE_WIDTH: 0.166979
G1 X93.703 Y97.737 E.00102
; LINE_WIDTH: 0.129938
G1 X93.722 Y97.586 E.00077
; LINE_WIDTH: 0.0955573
G1 X93.739 Y97.348 E.00082
M204 S10000
G1 X93.739 Y96.652 F42000
; LINE_WIDTH: 0.0958533
G1 F15000
M204 S6000
G1 X93.721 Y96.409 E.00083
; LINE_WIDTH: 0.130476
G1 X93.703 Y96.263 E.00075
; LINE_WIDTH: 0.167938
G1 X93.684 Y96.109 E.00108
; LINE_WIDTH: 0.204656
G1 X93.666 Y96.012 E.00086
; LINE_WIDTH: 0.238862
G1 X93.649 Y95.915 E.00103
; LINE_WIDTH: 0.289358
G2 X93.541 Y95.364 I-11.186 J1.916 E.00723
; WIPE_START
G1 X93.649 Y95.915 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.84 Y94.369 Z2.44 F42000
G1 Z2.04
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40343
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X93.177 Y94.032 E.0248
G1 X93.177 Y93.391 E.0334
G1 X92.597 Y93.97 E.04266
G2 X92.172 Y93.754 I-2.136 J3.678 E.02485
G1 X93.177 Y92.75 E.07398
G1 X93.177 Y92.109 E.0334
G1 X91.694 Y93.591 E.1092
G1 X91.581 Y93.565 E.00604
G2 X91.149 Y93.494 I-.851 J3.859 E.02279
G1 X93.177 Y91.467 E.14931
G1 X93.177 Y90.826 E.0334
G1 X90.522 Y93.48 E.19551
G1 X89.882 Y93.479 E.03332
G1 X93.177 Y90.185 E.24263
G1 X93.177 Y89.544 E.0334
G1 X89.243 Y93.478 E.28976
G2 X88.596 Y93.483 I-.256 J7.748 E.0337
G1 X93.177 Y88.902 E.3374
G1 X93.177 Y88.261 E.0334
G1 X87.822 Y93.615 E.39437
G1 X87.772 Y93.629 E.00272
G2 X87.243 Y93.837 I1.559 J4.72 E.02961
G1 X86.823 Y94.065 E.02488
G1 X86.823 Y93.973 E.00481
G1 X93.177 Y87.62 E.46793
G1 X93.177 Y86.979 E.0334
G1 X86.823 Y93.332 E.46793
G1 X86.823 Y92.69 E.0334
G1 X93.177 Y86.337 E.46793
G1 X93.177 Y85.874 E.02411
G1 X93.093 Y85.78 E.00658
G1 X86.823 Y92.049 E.46176
G1 X86.823 Y91.408 E.0334
G1 X91.88 Y86.352 E.37241
G1 X91.698 Y86.41 E.00995
G3 X91.078 Y86.512 I-.931 J-3.716 E.03272
G1 X86.823 Y90.767 E.31339
G1 X86.823 Y90.125 E.0334
G1 X90.426 Y86.522 E.26538
G1 X89.785 Y86.523 E.03342
G1 X86.823 Y89.484 E.21812
G1 X86.823 Y88.843 E.0334
G1 X89.143 Y86.523 E.17086
G3 X88.514 Y86.511 I-.198 J-6.1 E.03279
G1 X86.823 Y88.202 E.12451
G1 X86.823 Y87.56 E.0334
G1 X87.962 Y86.422 E.08386
G3 X87.478 Y86.265 I1.408 J-5.181 E.02653
G1 X86.823 Y86.919 E.04818
G1 X86.823 Y86.278 E.0334
G1 X87.195 Y85.906 E.02738
M106 S201.45
; WIPE_START
G1 X86.823 Y86.278 E-.19976
G1 X86.823 Y86.919 E-.24367
G1 X87.413 Y86.33 E-.31657
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.443 Y84.791 Z2.44 F42000
G1 Z2.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.108642
; LAYER_HEIGHT: 0.12
G1 F15000
M204 S6000
G1 X86.287 Y84.614 E.00096
G1 X86.254 Y84.502 E.00047
M204 S10000
G1 X86.367 Y83.662 F42000
; LINE_WIDTH: 0.467598
G1 F15000
M204 S6000
G1 X86.101 Y83.479 E.00698
; LINE_WIDTH: 0.499308
G1 X86.085 Y83.468 E.00045
; LINE_WIDTH: 0.527319
G1 X86.069 Y83.457 E.00047
; LINE_WIDTH: 0.519977
G3 X86.09 Y82.284 I6.122 J-.476 E.02838
M204 S10000
G1 X86.253 Y81.499 F42000
; LINE_WIDTH: 0.137411
G1 F15000
M204 S6000
G1 X86.331 Y81.236 E.0015
M204 S10000
G1 X87.21 Y81.026 F42000
; LINE_WIDTH: 0.0938364
G1 F15000
M204 S6000
G1 X87.322 Y80.918 E.00052
; LINE_WIDTH: 0.120062
G1 X87.442 Y80.811 E.00074
M204 S10000
G1 X88.277 Y80.673 F42000
; LINE_WIDTH: 0.528673
G1 F15000
M204 S6000
G1 X88.604 Y80.654 E.00805
G3 X90.813 Y80.65 I1.305 J111.965 E.05432
G1 X91.064 Y80.657 E.00617
G1 X91.074 Y80.671 E.0004
; LINE_WIDTH: 0.499731
G1 X91.273 Y80.943 E.00782
M204 S10000
G1 X92.105 Y80.831 F42000
; LINE_WIDTH: 0.0913669
G1 F15000
M204 S6000
G1 X92.182 Y80.853 E.00026
G1 X92.296 Y80.953 E.00049
; WIPE_START
G1 X92.182 Y80.853 E-.49823
G1 X92.105 Y80.831 E-.26177
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.764 Y82.306 Z2.44 F42000
G1 Z2.04
G1 E.8 F1800
; LINE_WIDTH: 0.437257
G1 F15000
M204 S6000
G2 X93.486 Y81.236 I-21.51 J5.024 E.02225
M204 S10000
G1 X93.515 Y81.236 F42000
; LINE_WIDTH: 0.290018
G1 F15000
M204 S6000
G3 X93.649 Y81.915 I-13.659 J3.053 E.00894
; LINE_WIDTH: 0.238862
G1 X93.666 Y82.012 E.00103
; LINE_WIDTH: 0.204656
G1 X93.684 Y82.109 E.00086
; LINE_WIDTH: 0.167938
G1 X93.703 Y82.263 E.00108
; LINE_WIDTH: 0.130476
G1 X93.721 Y82.409 E.00075
; LINE_WIDTH: 0.0958533
G1 X93.739 Y82.652 E.00083
M204 S10000
G1 X93.739 Y83.348 F42000
; LINE_WIDTH: 0.0955573
G1 F15000
M204 S6000
M73 P41 R14
G1 X93.722 Y83.586 E.00082
; LINE_WIDTH: 0.129938
G1 X93.703 Y83.737 E.00077
; LINE_WIDTH: 0.166979
G1 X93.685 Y83.883 E.00102
; LINE_WIDTH: 0.203338
G1 X93.666 Y83.988 E.00093
; LINE_WIDTH: 0.238899
G1 X93.649 Y84.085 E.00103
; LINE_WIDTH: 0.273077
G1 X93.632 Y84.183 E.00119
; LINE_WIDTH: 0.292838
G1 X93.541 Y84.636 E.00603
M204 S10000
G1 X93.34 Y85.257 F42000
; LINE_WIDTH: 0.0879024
G1 F15000
M204 S6000
G1 X93.223 Y85.361 E.00047
; CHANGE_LAYER
; Z_HEIGHT: 2.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.34 Y85.257 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/166
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.44 I-.726 J.977 P1  F42000
G1 X96.728 Y87.774 Z2.44
G1 Z2.16
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.34 Y87.468 I1.095 J1.422 E.01327
G1 X97.353 Y87.048 E.0081
G1 X97.52 Y87.053 E.00323
G3 X98.5 Y87.308 I.02 J1.93 E.01974
G3 X97.689 Y89.309 I-.712 J.876 E.05542
G3 X96.221 Y87.821 I-.219 J-1.252 E.0473
G3 X97.293 Y87.046 I1.169 J.487 E.02685
; WIPE_START
G1 X97.52 Y87.053 E-.08623
G1 X98.209 Y87.141 E-.26379
G1 X98.5 Y87.308 E-.12751
G1 X98.728 Y87.554 E-.12755
G1 X98.874 Y87.856 E-.12754
G1 X98.885 Y87.928 E-.02739
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.56 I-1.066 J-.587 P1  F42000
G1 X97.07 Y91.223 Z2.56
G1 Z2.16
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X97.261 Y91.039 E.00512
G3 X97.77 Y90.873 I.594 J.96 E.01042
G1 X97.799 Y90.454 E.0081
G3 X97.595 Y93.152 I.005 J1.357 E.08633
G3 X96.233 Y91.746 I-.214 J-1.155 E.04459
G3 X97.052 Y90.674 I3.644 J1.936 E.02611
G3 X97.74 Y90.45 I.897 J1.585 E.01405
; WIPE_START
G1 X98.104 Y90.483 E-.13894
G1 X98.389 Y90.584 E-.11484
G1 X98.742 Y90.825 E-.16232
G1 X98.972 Y91.115 E-.14085
G1 X99.115 Y91.451 E-.13844
G1 X99.138 Y91.619 E-.06461
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.56 I-.701 J-.995 P1  F42000
G1 X88.797 Y98.9 Z2.56
G1 Z2.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.797 Y95.1 I.003 J-1.9 E.10912
G1 X90.803 Y95.1 E.0367
G3 X90.877 Y98.899 I-.003 J1.9 E.10775
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.887 E-.10823
G1 X88.426 Y98.863 E-.05659
G1 X88.17 Y98.793 E-.10061
G1 X88.053 Y98.747 E-.04777
G1 X87.927 Y98.688 E-.05312
G1 X87.796 Y98.613 E-.05723
G1 X87.672 Y98.529 E-.05697
G1 X87.478 Y98.365 E-.0964
G1 X87.391 Y98.275 E-.04764
G1 X87.295 Y98.159 E-.05722
G1 X87.207 Y98.036 E-.05756
G1 X87.179 Y97.989 E-.02066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.116 Y90.414 Z2.56 F42000
G1 X88.797 Y84.9 Z2.56
G1 Z2.16
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.797 Y81.1 I.003 J-1.9 E.10912
G1 X90.803 Y81.1 E.0367
G3 X90.877 Y84.899 I-.003 J1.9 E.10775
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y84.887 E-.10823
G1 X88.426 Y84.863 E-.05659
G1 X88.17 Y84.793 E-.10061
G1 X88.053 Y84.747 E-.04777
G1 X87.927 Y84.688 E-.05312
G1 X87.701 Y84.55 E-.10057
G1 X87.582 Y84.459 E-.05694
G1 X87.478 Y84.365 E-.05309
G1 X87.391 Y84.275 E-.04764
G1 X87.295 Y84.159 E-.05722
G1 X87.207 Y84.036 E-.05756
G1 X87.179 Y83.989 E-.02067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.039 Y91.62 Z2.56 F42000
G1 X86.904 Y98.977 Z2.56
G1 Z2.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01827
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00448
G2 X86.642 Y98.662 I2.782 J-1.279 E.01347
G1 X86.866 Y98.93 E.00725
; WIPE_START
M73 P41 R13
G1 X86.023 Y98.977 E-.32053
G1 X86.023 Y97.944 E-.39243
G1 X86.145 Y97.921 E-.04704
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.823 Y90.475 Z2.56 F42000
G1 X88.798 Y86.148 Z2.56
G1 Z2.16
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.147 J-3.169 E.05991
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.58 J1.808 E.06217
G1 X88.778 Y93.852 E.04238
G2 X86.785 Y94.58 I.031 J3.178 E.04488
G1 X86.448 Y94.882 E.00938
G1 X86.448 Y85.116 E.20257
G1 X86.783 Y85.418 E.00936
G2 X88.738 Y86.147 I2.017 J-2.422 E.04412
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z2.56 F42000
G1 X93.977 Y98.977 Z2.56
G1 Z2.16
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.679 Y98.977 E.02691
G2 X92.746 Y95.093 I-1.895 J-1.975 E.08958
G2 X90.815 Y94.277 I-1.952 J1.927 E.04462
G1 X88.785 Y94.277 E.04212
G2 X86.229 Y96.094 I.021 J2.736 E.06929
G1 X86.023 Y96.054 E.00434
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.573 J-.91 E.06931
G1 X90.914 Y85.722 E.04415
G2 X92.926 Y81.296 I-.116 J-2.723 E.12456
G1 X92.685 Y81.023 E.00755
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.679 Y98.977 E-.49359
G1 X92.891 Y98.747 E-.11875
G1 X93.055 Y98.53 E-.1032
G1 X93.115 Y98.43 E-.04447
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.15 Y91.397 Z2.56 F42000
G1 X86.228 Y82.095 Z2.56
G1 Z2.16
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00432
G1 X86.023 Y81.023 E.02137
G1 X86.904 Y81.023 E.01827
G1 X86.642 Y81.338 E.00849
G2 X86.249 Y82.039 I2.331 J1.766 E.01672
; WIPE_START
G1 X86.023 Y82.054 E-.08589
G1 X86.023 Y81.023 E-.39145
G1 X86.767 Y81.023 E-.28266
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04363
G2 X91.502 Y80.807 I-.099 J-2.3 E.13307
G1 X91.541 Y80.599 E.00438
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.541 Y99.401 E.05932
G1 X91.506 Y99.188 E.00448
G2 X90.809 Y94.701 I-.708 J-2.188 E.13468
G1 X88.791 Y94.701 E.04185
G2 X88.098 Y99.193 I.012 J2.302 E.13487
G1 X88.059 Y99.401 E.00438
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.523 Y85.283 I.701 J2.189 E.12929
G1 X88.713 Y85.294 E.00395
; WIPE_START
G1 X88.791 Y85.299 E-.02978
G1 X90.713 Y85.298 E-.73022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z2.56 F42000
G1 X94.8 Y99.8 Z2.56
G1 Z2.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.29 Y99.05 F42000
G1 Z2.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0917858
G1 F15000
M204 S6000
G1 X92.176 Y99.148 E.00048
G1 X92.105 Y99.168 E.00024
M204 S10000
G1 X91.327 Y99.33 F42000
; LINE_WIDTH: 0.528972
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.65 J-9.829 E.01086
G3 X88.787 Y99.35 I-1.087 J-127.983 E.05164
G1 X88.536 Y99.343 E.00618
G1 X88.526 Y99.33 E.0004
; LINE_WIDTH: 0.499781
G1 X88.327 Y99.057 E.00782
M204 S10000
G1 X87.441 Y99.189 F42000
; LINE_WIDTH: 0.11427
G1 F15000
M204 S6000
G1 X87.289 Y99.051 E.00089
; LINE_WIDTH: 0.0882053
G1 X87.211 Y98.975 E.00033
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.137419
G1 F15000
M204 S6000
G1 X86.253 Y98.501 E.0015
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.468311
G1 F15000
M204 S6000
G1 X86.1 Y97.479 E.00701
; LINE_WIDTH: 0.499892
G1 X86.085 Y97.468 E.00044
; LINE_WIDTH: 0.527502
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.520063
G3 X86.09 Y96.283 I6.161 J-.475 E.0284
M204 S10000
G1 X86.236 Y95.444 F42000
; LINE_WIDTH: 0.129956
G1 F15000
M204 S6000
G1 X86.294 Y95.373 E.00047
; LINE_WIDTH: 0.104058
G1 X86.456 Y95.191 E.00093
; WIPE_START
G1 X86.294 Y95.373 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.078 Y94.163 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426292
G1 F15000
M204 S6000
G1 X86.796 Y93.881 E.00782
G1 X86.796 Y93.315 E.01109
G1 X87.316 Y93.835 E.01442
G3 X87.722 Y93.675 I1.213 J2.473 E.00856
G1 X86.796 Y92.748 E.02567
G1 X86.796 Y92.182 E.01109
G1 X88.176 Y93.562 E.03823
G3 X88.687 Y93.507 I.641 J3.556 E.01008
G1 X86.796 Y91.615 E.05239
G1 X86.796 Y91.049 E.01109
G1 X89.252 Y93.505 E.06804
G1 X89.82 Y93.507 E.01112
G1 X86.796 Y90.482 E.08376
G1 X86.796 Y89.916 E.01109
G1 X90.388 Y93.508 E.09948
G1 X90.955 Y93.509 E.01112
G1 X86.796 Y89.35 E.11521
G1 X86.796 Y88.783 E.01109
G1 X91.614 Y93.601 E.13344
G3 X92.56 Y93.981 I-.816 J3.401 E.02005
G1 X86.796 Y88.217 E.15965
G1 X86.796 Y87.65 E.01109
G1 X93.204 Y94.059 E.17749
G1 X93.204 Y93.493 E.01109
G1 X86.796 Y87.084 E.17749
G1 X86.796 Y86.517 E.01109
G1 X93.204 Y92.926 E.17749
G1 X93.204 Y92.36 E.01109
G1 X86.796 Y85.951 E.17749
G1 X86.796 Y85.864 E.0017
G2 X87.741 Y86.33 I2.025 J-2.918 E.02073
G1 X93.204 Y91.793 E.1513
G1 X93.204 Y91.227 E.01109
G1 X88.456 Y86.478 E.13152
G2 X89.04 Y86.495 I.441 J-4.98 E.01145
G1 X93.204 Y90.66 E.11535
G1 X93.204 Y90.094 E.01109
G1 X89.606 Y86.495 E.09967
G1 X90.172 Y86.495 E.01109
G1 X93.204 Y89.527 E.08399
G1 X93.204 Y88.961 E.01109
G1 X90.738 Y86.494 E.06831
G2 X91.275 Y86.465 I.103 J-3.033 E.01055
G1 X93.204 Y88.394 E.05344
G1 X93.204 Y87.828 E.01109
G1 X91.742 Y86.366 E.0405
G2 X92.161 Y86.218 I-.871 J-3.131 E.0087
G1 X93.204 Y87.262 E.02891
G1 X93.204 Y86.695 E.01109
G1 X92.539 Y86.03 E.01842
G2 X92.883 Y85.807 I-.948 J-1.834 E.00803
G1 X93.382 Y86.306 E.01382
M204 S10000
G1 X93.183 Y85.404 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0936264
G1 F15000
M204 S6000
G1 X93.34 Y85.268 E.00069
M204 S10000
G1 X93.541 Y84.636 F42000
; LINE_WIDTH: 0.292851
G1 F15000
M204 S6000
G1 X93.632 Y84.183 E.00603
; LINE_WIDTH: 0.273105
G1 X93.649 Y84.085 E.00119
; LINE_WIDTH: 0.238932
G1 X93.666 Y83.988 E.00103
; LINE_WIDTH: 0.203376
G1 X93.685 Y83.883 E.00093
; LINE_WIDTH: 0.167003
G1 X93.703 Y83.737 E.00102
; LINE_WIDTH: 0.129958
G1 X93.722 Y83.587 E.00077
; LINE_WIDTH: 0.0955672
G1 X93.739 Y83.348 E.00082
M204 S10000
G1 X93.739 Y82.656 F42000
; LINE_WIDTH: 0.0903781
G1 F15000
M204 S6000
G1 X93.727 Y82.467 E.0006
; LINE_WIDTH: 0.117909
G1 X93.71 Y82.322 E.00066
; LINE_WIDTH: 0.152045
G1 X93.692 Y82.17 E.00095
; LINE_WIDTH: 0.194027
G1 X93.668 Y82.024 E.00122
; LINE_WIDTH: 0.242337
G1 X93.644 Y81.878 E.00157
; LINE_WIDTH: 0.268817
G1 X93.521 Y81.236 E.00777
M204 S10000
G1 X93.496 Y81.236 F42000
; LINE_WIDTH: 0.402535
G1 F15000
M204 S6000
G1 X93.764 Y82.338 E.0209
; WIPE_START
G1 X93.496 Y81.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.327 Y80.977 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
; LINE_WIDTH: 0.0970168
G1 F15000
M204 S6000
G1 X92.14 Y80.811 E.00087
M204 S10000
G1 X91.273 Y80.943 F42000
; LINE_WIDTH: 0.499781
G1 F15000
M204 S6000
G1 X91.074 Y80.67 E.00782
; LINE_WIDTH: 0.528521
G1 X91.064 Y80.657 E.0004
G1 X90.813 Y80.65 E.00617
G2 X88.648 Y80.652 I-.954 J118.279 E.05323
G1 X88.277 Y80.671 E.00913
M204 S10000
G1 X87.443 Y80.811 F42000
; LINE_WIDTH: 0.119986
G1 F15000
M204 S6000
G1 X87.323 Y80.918 E.00074
; LINE_WIDTH: 0.0938372
G1 X87.21 Y81.026 E.00052
M204 S10000
G1 X86.331 Y81.236 F42000
; LINE_WIDTH: 0.137301
G1 F15000
M204 S6000
G1 X86.253 Y81.499 E.0015
M204 S10000
G1 X86.09 Y82.284 F42000
; LINE_WIDTH: 0.520049
G1 F15000
M204 S6000
G2 X86.069 Y83.457 I6.143 J.698 E.0284
; LINE_WIDTH: 0.527502
G1 X86.085 Y83.468 E.00047
; LINE_WIDTH: 0.499892
G1 X86.1 Y83.479 E.00044
; LINE_WIDTH: 0.468311
G1 X86.367 Y83.662 E.00701
M204 S10000
G1 X86.236 Y84.553 F42000
; LINE_WIDTH: 0.109464
G1 F15000
M204 S6000
G1 X86.45 Y84.8 E.00134
; WIPE_START
G1 X86.236 Y84.553 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.345 Y90.985 Z2.56 F42000
G1 X93.764 Y96.338 Z2.56
G1 Z2.16
G1 E.8 F1800
; LINE_WIDTH: 0.403456
G1 F15000
M204 S6000
G2 X93.525 Y95.369 I-24.888 J5.648 E.01843
M204 S10000
G1 X93.545 Y95.363 F42000
; LINE_WIDTH: 0.268817
G1 F15000
M204 S6000
G1 X93.644 Y95.878 E.00624
; LINE_WIDTH: 0.242337
G1 X93.668 Y96.024 E.00157
; LINE_WIDTH: 0.194027
G1 X93.692 Y96.17 E.00122
; LINE_WIDTH: 0.152045
G1 X93.71 Y96.322 E.00095
; LINE_WIDTH: 0.117909
G1 X93.727 Y96.467 E.00066
; LINE_WIDTH: 0.0903781
G1 X93.739 Y96.656 E.0006
M204 S10000
G1 X93.739 Y97.348 F42000
; LINE_WIDTH: 0.0955573
G1 F15000
M204 S6000
G1 X93.722 Y97.587 E.00082
; LINE_WIDTH: 0.129948
G1 X93.703 Y97.737 E.00077
; LINE_WIDTH: 0.167012
G1 X93.685 Y97.883 E.00102
; LINE_WIDTH: 0.203371
G1 X93.666 Y97.988 E.00093
; LINE_WIDTH: 0.238919
G1 X93.649 Y98.085 E.00103
; LINE_WIDTH: 0.273083
G1 X93.632 Y98.183 E.00119
; LINE_WIDTH: 0.292832
G1 X93.515 Y98.764 E.00775
M204 S10000
G1 X93.486 Y98.764 F42000
; LINE_WIDTH: 0.437177
G1 F15000
M204 S6000
G2 X93.764 Y97.696 I-21.661 J-6.211 E.02222
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.486 Y98.764 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/166
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.56 I1.094 J.533 P1  F42000
G1 X97.113 Y91.323 Z2.56
G1 Z2.28
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.754 Y90.965 I.723 J.543 E.01458
G1 X97.783 Y90.546 E.0081
G3 X97.942 Y93.067 I.012 J1.265 E.07401
G3 X96.116 Y92.06 I-.541 J-1.178 E.04672
G3 X96.76 Y91.094 I1.083 J.024 E.02363
G3 X97.724 Y90.542 I1.033 J.686 E.0222
; WIPE_START
G1 X98.068 Y90.568 E-.13099
G1 X98.374 Y90.677 E-.12372
G1 X98.654 Y90.87 E-.12901
G1 X98.881 Y91.141 E-.13447
G1 X99.024 Y91.465 E-.13452
G1 X99.063 Y91.744 E-.10729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.68 I1.043 J-.626 P1  F42000
G1 X96.67 Y87.758 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.274 Y87.459 I1.099 J1.459 E.01307
G1 X97.287 Y87.039 E.0081
G1 X97.452 Y87.044 E.00319
G3 X98.782 Y87.872 I.021 J1.449 E.0319
G3 X97.989 Y89.217 I-1.031 J.298 E.03372
G3 X96.104 Y88.124 I-.514 J-1.285 E.04834
G3 X97.228 Y87.037 I1.19 J.106 E.03285
; WIPE_START
G1 X97.452 Y87.044 E-.08534
G1 X97.979 Y87.155 E-.20438
G1 X98.418 Y87.362 E-.18444
G1 X98.64 Y87.589 E-.12074
G1 X98.782 Y87.872 E-.12036
G1 X98.801 Y87.988 E-.04473
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.68 I-.897 J-.822 P1  F42000
G1 X88.797 Y98.9 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03671
G3 X90.877 Y98.899 I-.003 J1.9 E.10776
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y98.886 E-.10827
G1 X88.425 Y98.863 E-.05668
G1 X88.17 Y98.793 E-.10053
G1 X88.055 Y98.748 E-.04716
G1 X87.927 Y98.688 E-.0536
G1 X87.796 Y98.613 E-.05734
G1 X87.581 Y98.458 E-.10058
G1 X87.471 Y98.358 E-.05676
G1 X87.294 Y98.159 E-.10096
G1 X87.207 Y98.036 E-.05728
G1 X87.179 Y97.989 E-.02084
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.116 Y90.414 Z2.68 F42000
G1 X88.797 Y84.9 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.10911
G1 X90.803 Y81.1 E.03671
G3 X90.877 Y84.899 I-.003 J1.9 E.10776
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.573 Y84.886 E-.10827
G1 X88.425 Y84.863 E-.05668
G1 X88.17 Y84.793 E-.10053
G1 X88.055 Y84.748 E-.04716
G1 X87.927 Y84.688 E-.0536
G1 X87.701 Y84.55 E-.10071
G1 X87.582 Y84.458 E-.05696
G1 X87.471 Y84.358 E-.05701
G1 X87.294 Y84.159 E-.10096
G1 X87.207 Y84.036 E-.05728
G1 X87.179 Y83.989 E-.02083
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.039 Y91.62 Z2.68 F42000
G1 X86.904 Y98.977 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01827
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00448
G2 X86.641 Y98.662 I2.783 J-1.279 E.01346
G1 X86.866 Y98.93 E.00726
; WIPE_START
G1 X86.023 Y98.977 E-.3205
G1 X86.023 Y97.944 E-.39243
G1 X86.145 Y97.921 E-.04708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.823 Y90.475 Z2.68 F42000
G1 X88.798 Y86.148 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.147 J-3.169 E.05991
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.58 J1.808 E.06217
G1 X88.772 Y93.852 E.04252
G2 X86.83 Y94.544 I.039 J3.182 E.04354
G1 X86.448 Y94.876 E.0105
G1 X86.448 Y85.115 E.20247
G1 X86.781 Y85.417 E.00934
G2 X88.738 Y86.147 I2.02 J-2.425 E.04416
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z2.68 F42000
G1 X93.977 Y98.977 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.679 Y98.977 E.02691
G2 X93.409 Y96.215 I-1.909 J-1.982 E.06229
G2 X90.815 Y94.277 I-2.608 J.785 E.07193
G1 X88.78 Y94.277 E.04222
G2 X86.228 Y96.095 I.026 J2.737 E.0692
G1 X86.023 Y96.054 E.00432
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.573 J-.91 E.0693
G1 X90.914 Y85.722 E.04415
G2 X92.925 Y81.295 I-.116 J-2.723 E.12458
G1 X92.684 Y81.023 E.00753
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.679 Y98.977 E-.49356
G1 X92.891 Y98.747 E-.11891
G1 X93.055 Y98.53 E-.10302
M73 P42 R13
G1 X93.115 Y98.43 E-.04451
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.15 Y91.397 Z2.68 F42000
G1 X86.228 Y82.095 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00432
G1 X86.023 Y81.023 E.02137
G1 X86.905 Y81.023 E.01828
G1 X86.652 Y81.325 E.00816
G2 X86.249 Y82.039 I2.291 J1.764 E.01706
; WIPE_START
G1 X86.023 Y82.054 E-.08586
G1 X86.023 Y81.023 E-.39143
G1 X86.767 Y81.023 E-.28271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04363
G2 X91.502 Y80.807 I-.099 J-2.3 E.13306
G1 X91.541 Y80.599 E.00438
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.541 Y99.401 E.05932
G1 X91.506 Y99.188 E.00448
G2 X90.809 Y94.701 I-.708 J-2.188 E.13469
G1 X88.788 Y94.701 E.04191
G2 X88.098 Y99.193 I.014 J2.301 E.13483
G1 X88.06 Y99.401 E.00438
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.523 Y85.283 I.701 J2.189 E.12929
G1 X88.713 Y85.294 E.00395
; WIPE_START
G1 X88.791 Y85.299 E-.02981
G1 X90.713 Y85.298 E-.73019
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z2.68 F42000
G1 X94.8 Y99.8 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.291 Y99.048 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0918732
G1 F15000
M204 S6000
G1 X92.177 Y99.148 E.00049
G1 X92.105 Y99.168 E.00024
M204 S10000
G1 X91.327 Y99.33 F42000
; LINE_WIDTH: 0.528969
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.652 J-9.883 E.01086
G3 X88.787 Y99.35 I-1.087 J-127.983 E.05164
G1 X88.536 Y99.343 E.00618
G1 X88.526 Y99.329 E.0004
; LINE_WIDTH: 0.499628
G1 X88.327 Y99.057 E.00781
M204 S10000
G1 X87.441 Y99.189 F42000
; LINE_WIDTH: 0.115726
G1 F15000
M204 S6000
G1 X87.297 Y99.058 E.00086
; LINE_WIDTH: 0.0896297
G1 X87.21 Y98.974 E.00038
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.137576
G1 F15000
M204 S6000
G1 X86.253 Y98.501 E.0015
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.467958
G1 F15000
M204 S6000
G1 X86.1 Y97.479 E.00699
; LINE_WIDTH: 0.499611
G1 X86.085 Y97.468 E.00044
; LINE_WIDTH: 0.527404
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.520652
G3 X86.091 Y96.284 I6.072 J-.472 E.02843
M204 S10000
G1 X86.236 Y95.435 F42000
; LINE_WIDTH: 0.13213
G1 F15000
M204 S6000
G1 X86.326 Y95.328 E.00073
; LINE_WIDTH: 0.101995
G1 X86.478 Y95.162 E.00084
; WIPE_START
G1 X86.326 Y95.328 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.599 Y97.643 Z2.68 F42000
G1 X93.764 Y97.696 Z2.68
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.43726
G1 F15000
M204 S6000
G3 X93.486 Y98.764 I-21.864 J-5.123 E.02223
M204 S10000
G1 X93.515 Y98.764 F42000
; LINE_WIDTH: 0.292823
G1 F15000
M204 S6000
G1 X93.632 Y98.183 E.00775
; LINE_WIDTH: 0.273052
G1 X93.649 Y98.085 E.00119
; LINE_WIDTH: 0.238876
G1 X93.666 Y97.988 E.00103
; LINE_WIDTH: 0.203318
G1 X93.685 Y97.883 E.00093
; LINE_WIDTH: 0.16696
G1 X93.703 Y97.737 E.00102
; LINE_WIDTH: 0.129958
G1 X93.722 Y97.587 E.00077
; LINE_WIDTH: 0.0955771
G1 X93.739 Y97.348 E.00082
M204 S10000
G1 X93.739 Y96.652 F42000
; LINE_WIDTH: 0.0957413
G1 F15000
M204 S6000
G1 X93.721 Y96.41 E.00083
; LINE_WIDTH: 0.129027
G1 X93.704 Y96.273 E.0007
; LINE_WIDTH: 0.163946
G1 X93.686 Y96.129 E.00098
; LINE_WIDTH: 0.203759
G1 X93.665 Y96.001 E.00113
; LINE_WIDTH: 0.266068
G2 X93.545 Y95.363 I-14.186 J2.333 E.00763
M204 S10000
G1 X93.525 Y95.369 F42000
; LINE_WIDTH: 0.403366
G1 F15000
M204 S6000
G3 X93.764 Y96.338 I-24.237 J6.516 E.01842
; WIPE_START
G1 X93.525 Y95.369 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.003 Y94.521 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423242
G1 F15000
M204 S6000
G1 X93.204 Y94.319 E.00554
G1 X93.204 Y93.757 E.01092
G1 X92.817 Y94.144 E.01064
G2 X92.47 Y93.93 I-1.714 J2.387 E.00794
G1 X93.204 Y93.195 E.0202
G1 X93.204 Y92.633 E.01092
G1 X92.087 Y93.751 E.03072
G2 X91.663 Y93.613 I-1.483 J3.831 E.00867
G1 X93.204 Y92.071 E.04238
G1 X93.204 Y91.509 E.01092
G1 X91.187 Y93.526 E.05544
G1 X91.004 Y93.509 E.00358
G1 X90.642 Y93.509 E.00702
G1 X93.204 Y90.946 E.07042
G1 X93.204 Y90.384 E.01092
G1 X90.081 Y93.507 E.08583
G1 X89.52 Y93.506 E.0109
G1 X93.204 Y89.822 E.10125
G1 X93.204 Y89.26 E.01092
G1 X88.96 Y93.505 E.11667
G2 X88.37 Y93.532 I-.1 J4.201 E.01148
G1 X93.204 Y88.698 E.13287
G1 X93.204 Y88.136 E.01092
G1 X87.634 Y93.706 E.15309
G2 X86.796 Y94.136 I1.186 J3.343 E.01837
G1 X86.796 Y93.982 E.00299
G1 X93.204 Y87.574 E.17614
G1 X93.204 Y87.011 E.01092
G1 X86.796 Y93.42 E.17614
G1 X86.796 Y92.858 E.01092
G1 X93.204 Y86.449 E.17614
G1 X93.204 Y85.905 E.01059
G1 X93.167 Y85.936 E.00095
G1 X93.162 Y85.93 E.00017
G1 X86.796 Y92.296 E.17497
G1 X86.796 Y91.734 E.01092
G1 X92.449 Y86.08 E.15539
G1 X92.345 Y86.138 E.00233
G3 X91.556 Y86.412 I-1.506 J-3.071 E.01627
G1 X86.796 Y91.172 E.13082
G1 X86.796 Y90.61 E.01092
G1 X90.911 Y86.494 E.11311
G1 X90.348 Y86.495 E.01093
G1 X86.796 Y90.047 E.09765
G1 X86.796 Y89.485 E.01092
G1 X89.786 Y86.495 E.08219
G1 X89.223 Y86.495 E.01093
G1 X86.796 Y88.923 E.06673
G1 X86.796 Y88.361 E.01092
G1 X88.664 Y86.492 E.05136
G3 X88.158 Y86.436 I.147 J-3.622 E.0099
G1 X86.796 Y87.799 E.03746
G1 X86.796 Y87.237 E.01092
G1 X87.711 Y86.321 E.02517
G3 X87.31 Y86.161 I1.085 J-3.302 E.00841
G1 X86.796 Y86.675 E.01413
G1 X86.796 Y86.113 E.01092
G1 X87.074 Y85.834 E.00765
; WIPE_START
G1 X86.796 Y86.113 E-.14962
G1 X86.796 Y86.675 E-.21361
G1 X87.31 Y86.161 E-.27625
G1 X87.425 Y86.215 E-.04857
G1 X87.603 Y86.281 E-.07196
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.446 Y84.794 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10849
G1 F15000
M204 S6000
G1 X86.236 Y84.552 E.0013
M204 S10000
G1 X86.367 Y83.662 F42000
; LINE_WIDTH: 0.467983
G1 F15000
M204 S6000
G1 X86.1 Y83.479 E.00699
; LINE_WIDTH: 0.499658
G1 X86.085 Y83.468 E.00044
; LINE_WIDTH: 0.527424
G1 X86.069 Y83.457 E.00047
; LINE_WIDTH: 0.520653
G3 X86.091 Y82.284 I6.073 J-.472 E.02843
M204 S10000
G1 X87.215 Y81.02 F42000
; LINE_WIDTH: 0.10009
G1 F15000
M204 S6000
G1 X87.361 Y80.884 E.00072
; LINE_WIDTH: 0.125577
G1 X87.444 Y80.811 E.00054
M204 S10000
G1 X88.277 Y80.673 F42000
; LINE_WIDTH: 0.528683
G1 F15000
M204 S6000
G1 X88.603 Y80.654 E.00802
G3 X90.813 Y80.65 I1.308 J111.901 E.05435
G1 X91.064 Y80.657 E.00617
G1 X91.074 Y80.671 E.0004
; LINE_WIDTH: 0.499628
G1 X91.273 Y80.943 E.00781
M204 S10000
G1 X92.14 Y80.811 F42000
; LINE_WIDTH: 0.0969274
G1 F15000
M204 S6000
G1 X92.326 Y80.977 E.00087
; WIPE_START
G1 X92.14 Y80.811 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.764 Y82.336 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.403201
G1 F15000
M204 S6000
G1 X93.496 Y81.236 E.02091
M204 S10000
G1 X93.518 Y81.236 F42000
; LINE_WIDTH: 0.272476
G1 F15000
M204 S6000
G3 X93.662 Y81.986 I-16.555 J3.56 E.00922
; LINE_WIDTH: 0.208333
G1 X93.684 Y82.114 E.00116
; LINE_WIDTH: 0.167076
G1 X93.703 Y82.265 E.00105
; LINE_WIDTH: 0.130202
G1 X93.721 Y82.409 E.00074
; LINE_WIDTH: 0.09585
G1 X93.739 Y82.652 E.00084
M204 S10000
G1 X93.739 Y83.348 F42000
; LINE_WIDTH: 0.0955771
G1 F15000
M204 S6000
G1 X93.722 Y83.587 E.00082
; LINE_WIDTH: 0.129977
G1 X93.703 Y83.737 E.00077
; LINE_WIDTH: 0.16698
G1 X93.685 Y83.883 E.00102
; LINE_WIDTH: 0.203327
G1 X93.666 Y83.988 E.00093
; LINE_WIDTH: 0.238864
G1 X93.649 Y84.085 E.00103
; LINE_WIDTH: 0.273018
G1 X93.632 Y84.182 E.00119
; LINE_WIDTH: 0.292762
G1 X93.541 Y84.636 E.00604
M204 S10000
G1 X93.34 Y85.268 F42000
; LINE_WIDTH: 0.0938472
G1 F15000
M204 S6000
G1 X93.178 Y85.407 E.00071
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.34 Y85.268 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/166
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.68 I-.735 J.97 P1  F42000
G1 X96.61 Y87.745 Z2.68
G1 Z2.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.209 Y87.45 I1.104 J1.488 E.01294
G1 X97.222 Y87.031 E.0081
G1 X97.384 Y87.035 E.00314
G3 X98.74 Y88.188 I-.006 J1.38 E.03727
G3 X97.175 Y89.28 I-1.295 J-.189 E.04121
G3 X96.086 Y87.817 I.119 J-1.225 E.03956
G3 X97.163 Y87.029 I1.172 J.471 E.02709
; WIPE_START
G1 X97.384 Y87.035 E-.08431
G1 X97.913 Y87.146 E-.20537
G1 X98.329 Y87.411 E-.18734
G1 X98.549 Y87.62 E-.11517
G1 X98.666 Y87.835 E-.09298
G1 X98.706 Y88.027 E-.07483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-1.101 J-.518 P1  F42000
G1 X97.133 Y91.376 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X97.565 Y91.123 I-1.571 J-3.183 E.00965
G3 X97.793 Y91.083 I.193 J.429 E.00451
G1 X97.821 Y90.664 E.0081
G3 X98.199 Y92.9 I-.047 J1.158 E.06088
G3 X96.099 Y92.37 I-.837 J-1.108 E.04789
G3 X97.028 Y90.969 I1.123 J-.263 E.03629
G3 X97.762 Y90.66 I.832 J.951 E.01563
; WIPE_START
G1 X98.248 Y90.753 E-.18782
G1 X98.535 Y90.926 E-.12724
G1 X98.76 Y91.174 E-.1274
G1 X98.903 Y91.478 E-.12746
G1 X98.952 Y91.811 E-.12788
G1 X98.915 Y91.97 E-.06221
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-.688 J-1.004 P1  F42000
G1 X88.797 Y98.9 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03671
G3 X90.882 Y98.898 I-.003 J1.9 E.10767
G1 X88.857 Y98.9 E.03705
; WIPE_START
M204 S6000
G1 X88.573 Y98.887 E-.10821
G1 X88.433 Y98.864 E-.05369
G1 X88.171 Y98.793 E-.10351
G1 X88.056 Y98.748 E-.04669
G1 X87.927 Y98.688 E-.05402
G1 X87.796 Y98.613 E-.0573
G1 X87.581 Y98.458 E-.1009
G1 X87.47 Y98.357 E-.05698
G1 X87.366 Y98.247 E-.05743
G1 X87.272 Y98.13 E-.05725
G1 X87.182 Y97.987 E-.06401
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.117 Y90.412 Z2.8 F42000
G1 X88.797 Y84.9 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.10911
G1 X90.803 Y81.1 E.03671
G3 X90.882 Y84.898 I-.003 J1.9 E.10767
G1 X88.857 Y84.9 E.03705
; WIPE_START
M204 S6000
G1 X88.573 Y84.887 E-.10821
G1 X88.433 Y84.864 E-.05369
G1 X88.171 Y84.793 E-.10351
G1 X88.056 Y84.748 E-.04669
G1 X87.927 Y84.688 E-.05402
G1 X87.7 Y84.55 E-.10096
G1 X87.582 Y84.458 E-.05697
G1 X87.47 Y84.357 E-.05723
G1 X87.366 Y84.247 E-.05746
G1 X87.272 Y84.13 E-.05725
G1 X87.182 Y83.987 E-.06401
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.036 Y91.619 Z2.8 F42000
G1 X86.896 Y98.977 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01809
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00447
G2 X86.611 Y98.622 I2.807 J-1.29 E.01243
G1 X86.858 Y98.93 E.0082
; WIPE_START
G1 X86.023 Y98.977 E-.31771
G1 X86.023 Y97.944 E-.39244
G1 X86.152 Y97.919 E-.04985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.826 Y90.473 Z2.8 F42000
G1 X88.798 Y86.148 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.927 Y86.146 E.04415
G2 X93.379 Y84.805 I-.133 J-3.155 E.06004
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.58 J1.809 E.06217
G1 X88.772 Y93.852 E.04253
G2 X86.786 Y94.579 I.038 J3.176 E.0447
G1 X86.448 Y94.88 E.00939
G1 X86.448 Y85.115 E.20256
G1 X86.781 Y85.416 E.00932
G2 X88.738 Y86.147 I2.02 J-2.424 E.04417
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.546 Z2.8 F42000
G1 X93.977 Y98.977 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.686 Y98.977 E.02676
G2 X93.404 Y97.801 I-2.092 J-2.085 E.02884
G2 X90.815 Y94.277 I-2.606 J-.799 E.10527
G1 X88.78 Y94.277 E.04222
G2 X86.229 Y96.094 I.026 J2.735 E.06918
G1 X86.023 Y96.054 E.00434
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.573 J-.91 E.06931
G1 X90.912 Y85.722 E.04411
G2 X92.922 Y81.291 I-.114 J-2.723 E.12472
G1 X92.684 Y81.023 E.00742
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.686 Y98.977 E-.49085
G1 X92.897 Y98.739 E-.12083
G1 X93.054 Y98.531 E-.09908
G1 X93.122 Y98.42 E-.04924
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.153 Y91.388 Z2.8 F42000
G1 X86.229 Y82.094 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00434
G1 X86.023 Y81.023 E.02137
G1 X86.904 Y81.023 E.01827
G1 X86.641 Y81.338 E.0085
G2 X86.25 Y82.038 I2.317 J1.755 E.01669
; WIPE_START
G1 X86.023 Y82.054 E-.08622
G1 X86.023 Y81.023 E-.39147
G1 X86.766 Y81.023 E-.28231
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.897 Y85.298 E.04367
G2 X91.502 Y80.807 I-.101 J-2.3 E.13302
G1 X91.541 Y80.599 E.00438
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.547 Y99.401 E.0592
G1 X91.505 Y99.198 E.0043
G1 X91.816 Y99.064 E.00702
G2 X90.809 Y94.701 I-1.019 J-2.063 E.12777
G1 X88.788 Y94.701 E.04191
G2 X88.098 Y99.193 I.015 J2.301 E.13481
G1 X88.059 Y99.401 E.00438
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05108
G1 X88.098 Y80.811 E.00445
G2 X88.524 Y85.283 I.701 J2.189 E.1293
G1 X88.713 Y85.294 E.00393
; WIPE_START
G1 X88.791 Y85.299 E-.02981
G1 X90.713 Y85.298 E-.73019
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z2.8 F42000
G1 X94.8 Y99.8 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.332 Y99.02 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.09685
G1 F15000
M204 S6000
G1 X92.194 Y99.143 E.00064
G1 X92.105 Y99.168 E.00032
M204 S10000
G1 X91.327 Y99.325 F42000
; LINE_WIDTH: 0.529473
G1 F15000
M204 S6000
G1 X90.89 Y99.349 E.0108
G3 X88.787 Y99.35 I-1.101 J-127.929 E.05178
G1 X88.536 Y99.343 E.00619
G1 X88.526 Y99.33 E.00039
; LINE_WIDTH: 0.50089
G1 X88.327 Y99.057 E.00785
M204 S10000
G1 X87.429 Y99.189 F42000
; LINE_WIDTH: 0.127062
G1 F15000
M204 S6000
G1 X87.292 Y99.062 E.00092
; LINE_WIDTH: 0.0958088
G1 X87.173 Y98.945 E.00057
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.127899
G1 F15000
M204 S6000
G1 X86.253 Y98.502 E.00137
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.468173
G1 F15000
M204 S6000
G1 X86.1 Y97.479 E.007
; LINE_WIDTH: 0.499804
G1 X86.085 Y97.468 E.00044
; LINE_WIDTH: 0.527463
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.520065
G3 X86.09 Y96.283 I6.168 J-.475 E.02841
M204 S10000
G1 X86.236 Y95.441 F42000
; LINE_WIDTH: 0.123747
G1 F15000
M204 S6000
G1 X86.379 Y95.276 E.00105
; LINE_WIDTH: 0.0923077
G1 X86.461 Y95.184 E.0004
; WIPE_START
G1 X86.379 Y95.276 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.078 Y94.163 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426622
G1 F15000
M204 S6000
G1 X86.796 Y93.881 E.00783
M73 P43 R13
G1 X86.796 Y93.314 E.01111
G1 X87.317 Y93.835 E.01446
G3 X87.723 Y93.674 I1.238 J2.533 E.00857
G1 X86.796 Y92.747 E.02571
G1 X86.796 Y92.18 E.01111
G1 X88.177 Y93.561 E.03829
G3 X88.69 Y93.507 I.637 J3.61 E.01012
G1 X86.796 Y91.613 E.05251
G1 X86.796 Y91.046 E.01111
G1 X89.255 Y93.506 E.06817
G1 X89.823 Y93.507 E.01114
G1 X86.796 Y90.479 E.08392
G1 X86.796 Y89.912 E.01111
G1 X90.392 Y93.508 E.09967
G1 X90.96 Y93.509 E.01114
G1 X86.796 Y89.345 E.11542
G1 X86.796 Y88.778 E.01111
G1 X91.62 Y93.603 E.13372
G3 X92.572 Y93.988 I-.823 J3.403 E.02021
G1 X86.796 Y88.211 E.16012
G1 X86.796 Y87.644 E.01111
G1 X93.204 Y94.053 E.17764
G1 X93.204 Y93.486 E.01111
G1 X86.796 Y87.078 E.17764
G1 X86.796 Y86.511 E.01111
G1 X93.204 Y92.919 E.17764
G1 X93.204 Y92.353 E.01111
G1 X86.796 Y85.944 E.17764
G1 X86.796 Y85.864 E.00156
G2 X87.752 Y86.334 I2.024 J-2.916 E.02097
G1 X93.204 Y91.786 E.15112
G1 X93.204 Y91.219 E.01111
G1 X88.464 Y86.479 E.13138
G1 X88.597 Y86.491 E.0026
G1 X89.044 Y86.491 E.00877
G1 X93.204 Y90.652 E.11532
G1 X93.204 Y90.085 E.01111
G1 X89.612 Y86.492 E.09959
G1 X90.179 Y86.493 E.01113
G1 X93.204 Y89.518 E.08385
G1 X93.204 Y88.951 E.01111
G1 X90.747 Y86.494 E.06812
G2 X91.282 Y86.462 I.067 J-3.368 E.01051
G1 X93.204 Y88.384 E.05329
G1 X93.204 Y87.817 E.01111
G1 X91.751 Y86.364 E.04029
G2 X92.168 Y86.214 I-.537 J-2.163 E.00871
G1 X93.204 Y87.25 E.02871
G1 X93.204 Y86.683 E.01111
G1 X92.548 Y86.027 E.01819
G2 X92.889 Y85.801 I-1.243 J-2.238 E.00802
G1 X93.382 Y86.294 E.01367
M204 S10000
G1 X93.223 Y85.361 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0878963
G1 F15000
M204 S6000
G1 X93.34 Y85.257 E.00047
M204 S10000
G1 X93.541 Y84.636 F42000
; LINE_WIDTH: 0.292752
G1 F15000
M204 S6000
G1 X93.632 Y84.182 E.00604
; LINE_WIDTH: 0.273009
G1 X93.649 Y84.085 E.00119
; LINE_WIDTH: 0.238851
G1 X93.666 Y83.988 E.00103
; LINE_WIDTH: 0.203313
G1 X93.685 Y83.883 E.00093
; LINE_WIDTH: 0.166993
G1 X93.703 Y83.737 E.00101
; LINE_WIDTH: 0.130009
G1 X93.722 Y83.587 E.00077
; LINE_WIDTH: 0.0956083
G1 X93.739 Y83.348 E.00082
M204 S10000
G1 X93.739 Y82.652 F42000
; LINE_WIDTH: 0.0958928
G1 F15000
M204 S6000
G1 X93.721 Y82.409 E.00084
; LINE_WIDTH: 0.130533
G1 X93.703 Y82.263 E.00075
; LINE_WIDTH: 0.167984
G1 X93.683 Y82.109 E.00108
; LINE_WIDTH: 0.204673
G1 X93.666 Y82.012 E.00086
; LINE_WIDTH: 0.238824
G1 X93.649 Y81.915 E.00103
; LINE_WIDTH: 0.289912
G2 X93.515 Y81.236 I-13.69 J2.355 E.00894
M204 S10000
G1 X93.486 Y81.236 F42000
; LINE_WIDTH: 0.437583
G1 F15000
M204 S6000
G3 X93.764 Y82.305 I-21.409 J6.141 E.02226
; WIPE_START
G1 X93.558 Y81.491 E-.57734
G1 X93.486 Y81.236 E-.18266
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.323 Y80.973 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0944006
G1 F15000
M204 S6000
G1 X92.192 Y80.857 E.00059
G1 X92.105 Y80.831 E.0003
M204 S10000
G1 X91.273 Y80.943 F42000
; LINE_WIDTH: 0.500911
G1 F15000
M204 S6000
G1 X91.074 Y80.67 E.00785
; LINE_WIDTH: 0.528687
G1 X91.064 Y80.657 E.00039
G1 X90.813 Y80.65 E.00617
G2 X88.603 Y80.654 I-.902 J112.147 E.05435
G1 X88.277 Y80.674 E.00802
M204 S10000
G1 X87.442 Y80.811 F42000
; LINE_WIDTH: 0.12015
G1 F15000
M204 S6000
G1 X87.323 Y80.918 E.00074
; LINE_WIDTH: 0.0939445
G1 X87.21 Y81.026 E.00052
M204 S10000
G1 X86.331 Y81.236 F42000
; LINE_WIDTH: 0.137735
G1 F15000
M204 S6000
G1 X86.253 Y81.499 E.0015
M204 S10000
G1 X86.09 Y82.283 F42000
; LINE_WIDTH: 0.520065
G1 F15000
M204 S6000
G2 X86.069 Y83.457 I6.145 J.698 E.0284
; LINE_WIDTH: 0.527463
G1 X86.085 Y83.468 E.00047
; LINE_WIDTH: 0.499804
G1 X86.1 Y83.479 E.00044
; LINE_WIDTH: 0.468173
G1 X86.367 Y83.662 E.007
M204 S10000
G1 X86.255 Y84.501 F42000
; LINE_WIDTH: 0.109413
G1 F15000
M204 S6000
G1 X86.286 Y84.614 E.00048
G1 X86.442 Y84.79 E.00096
; WIPE_START
G1 X86.286 Y84.614 E-.50767
G1 X86.255 Y84.501 E-.25233
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.344 Y90.946 Z2.8 F42000
G1 X93.764 Y96.339 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.403246
G1 F15000
M204 S6000
G2 X93.523 Y95.37 I-17.676 J3.886 E.01843
M204 S10000
G1 X93.546 Y95.363 F42000
; LINE_WIDTH: 0.268787
G1 F15000
M204 S6000
G1 X93.644 Y95.878 E.00624
; LINE_WIDTH: 0.242322
G1 X93.668 Y96.024 E.00157
; LINE_WIDTH: 0.194023
G1 X93.692 Y96.17 E.00122
; LINE_WIDTH: 0.151972
G1 X93.71 Y96.323 E.00095
; LINE_WIDTH: 0.117652
G1 X93.727 Y96.469 E.00066
; LINE_WIDTH: 0.090199
G1 X93.739 Y96.658 E.0006
M204 S10000
G1 X93.74 Y97.358 F42000
; LINE_WIDTH: 0.0963845
G1 F15000
M204 S6000
G1 X93.721 Y97.593 E.00082
; LINE_WIDTH: 0.131188
G1 X93.703 Y97.74 E.00076
; LINE_WIDTH: 0.167398
G1 X93.685 Y97.883 E.001
; LINE_WIDTH: 0.203343
G1 X93.666 Y97.988 E.00093
; LINE_WIDTH: 0.238865
G1 X93.649 Y98.085 E.00103
; LINE_WIDTH: 0.273006
G1 X93.632 Y98.182 E.00119
; LINE_WIDTH: 0.292762
G1 X93.515 Y98.764 E.00775
M204 S10000
G1 X93.486 Y98.764 F42000
; LINE_WIDTH: 0.437395
G1 F15000
M204 S6000
G2 X93.764 Y97.695 I-21.569 J-6.187 E.02223
; CHANGE_LAYER
; Z_HEIGHT: 2.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.486 Y98.764 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/166
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.8 I1.102 J.516 P1  F42000
G1 X96.926 Y91.417 Z2.8
G1 Z2.52
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G2 X97.61 Y91.236 I-.294 J-2.488 E.01369
G1 X97.802 Y91.204 E.00376
G1 X97.859 Y90.788 E.0081
G3 X98.325 Y92.73 I-.087 J1.048 E.05075
G3 X95.933 Y92.073 I-1.032 J-.928 E.05916
G3 X97.289 Y90.927 I1.349 J.221 E.03725
G3 X97.801 Y90.779 I.489 J.73 E.01043
; WIPE_START
G1 X98.106 Y90.827 E-.11745
G1 X98.407 Y90.976 E-.12769
G1 X98.64 Y91.213 E-.12613
G1 X98.783 Y91.497 E-.121
G1 X98.832 Y91.81 E-.12014
G1 X98.783 Y92.126 E-.1217
G1 X98.752 Y92.187 E-.0259
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.92 I1.091 J-.54 P1  F42000
G1 X96.547 Y87.736 Z2.92
G1 Z2.52
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.144 Y87.442 I1.105 J1.492 E.01289
G1 X97.156 Y87.022 E.0081
G1 X97.316 Y87.027 E.00308
G3 X98.566 Y88.506 I.036 J1.237 E.04287
G3 X96.171 Y88.715 I-1.261 J-.621 E.05559
G3 X96.416 Y87.274 I.775 J-.609 E.03174
G3 X97.097 Y87.02 I.804 J1.116 E.01418
; WIPE_START
G1 X97.316 Y87.027 E-.08315
G1 X97.848 Y87.138 E-.20649
G1 X98.167 Y87.328 E-.14133
G1 X98.412 Y87.584 E-.13439
G1 X98.575 Y87.91 E-.13866
G1 X98.6 Y88.055 E-.05597
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.92 I-.903 J-.816 P1  F42000
G1 X88.797 Y98.9 Z2.92
G1 Z2.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03671
G3 X90.876 Y98.899 I-.003 J1.9 E.10776
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.797 Y98.9 E-.02282
G1 X88.573 Y98.887 E-.08542
G1 X88.426 Y98.863 E-.05665
G1 X88.171 Y98.793 E-.10047
G1 X88.057 Y98.749 E-.04624
G1 X87.927 Y98.688 E-.05465
G1 X87.797 Y98.614 E-.05699
G1 X87.582 Y98.458 E-.10075
G1 X87.475 Y98.362 E-.05463
G1 X87.294 Y98.159 E-.10322
G1 X87.207 Y98.036 E-.05747
G1 X87.179 Y97.989 E-.0207
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.116 Y90.414 Z2.92 F42000
G1 X88.797 Y84.9 Z2.92
G1 Z2.52
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.10911
G1 X90.803 Y81.1 E.03671
G3 X90.876 Y84.899 I-.003 J1.9 E.10776
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.797 Y84.9 E-.02282
G1 X88.573 Y84.887 E-.08542
G1 X88.426 Y84.863 E-.05664
G1 X88.171 Y84.793 E-.10048
G1 X88.057 Y84.749 E-.04624
G1 X87.927 Y84.688 E-.05465
G1 X87.797 Y84.614 E-.05699
G1 X87.582 Y84.458 E-.10075
G1 X87.475 Y84.362 E-.05463
G1 X87.294 Y84.159 E-.10322
G1 X87.207 Y84.036 E-.05747
G1 X87.179 Y83.989 E-.02069
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.039 Y91.62 Z2.92 F42000
G1 X86.904 Y98.977 Z2.92
G1 Z2.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01827
G1 X86.023 Y97.946 E.02137
G1 X86.229 Y97.906 E.00434
G1 X86.315 Y98.117 E.00473
G2 X86.641 Y98.662 I2.769 J-1.285 E.0132
G1 X86.866 Y98.93 E.00726
; WIPE_START
G1 X86.023 Y98.977 E-.32049
G1 X86.023 Y97.946 E-.39148
G1 X86.147 Y97.922 E-.04803
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.824 Y90.476 Z2.92 F42000
G1 X88.798 Y86.148 Z2.92
G1 Z2.52
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.147 J-3.169 E.05991
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.58 J1.809 E.06217
G1 X88.772 Y93.852 E.04252
G2 X86.781 Y94.583 I.038 J3.179 E.04484
G1 X86.448 Y94.885 E.00934
G1 X86.448 Y85.115 E.20265
G1 X86.782 Y85.417 E.00934
G2 X88.738 Y86.147 I2.018 J-2.423 E.04414
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z2.92 F42000
G1 X93.977 Y98.977 Z2.92
G1 Z2.52
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.679 Y98.977 E.02691
G2 X93.405 Y96.199 I-1.909 J-1.982 E.06263
G2 X90.815 Y94.277 I-2.605 J.803 E.07158
G1 X88.78 Y94.277 E.04222
G2 X86.23 Y96.096 I.021 J2.725 E.06921
G1 X86.023 Y96.056 E.00437
G1 X86.023 Y83.946 E.25119
G1 X86.229 Y83.906 E.00434
G2 X88.785 Y85.724 I2.576 J-.916 E.0693
G1 X90.914 Y85.722 E.04415
G2 X92.926 Y81.295 I-.116 J-2.723 E.12457
G1 X92.684 Y81.023 E.00754
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.679 Y98.977 E-.49357
G1 X92.891 Y98.747 E-.11878
G1 X93.054 Y98.531 E-.1029
G1 X93.115 Y98.43 E-.04474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.151 Y91.397 Z2.92 F42000
G1 X86.23 Y82.096 Z2.92
G1 Z2.52
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.056 E.00437
G1 X86.023 Y81.023 E.02142
G1 X86.896 Y81.023 E.0181
G1 X86.609 Y81.381 E.00951
G2 X86.251 Y82.039 I2.208 J1.628 E.01559
; WIPE_START
G1 X86.023 Y82.056 E-.08661
G1 X86.023 Y81.023 E-.39242
G1 X86.763 Y81.023 E-.28096
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z2.92 F42000
G1 Z2.52
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04362
G2 X91.502 Y80.807 I-.099 J-2.3 E.13306
G1 X91.54 Y80.599 E.00438
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.541 Y99.401 E.05932
G1 X91.506 Y99.188 E.00448
G2 X90.809 Y94.701 I-.708 J-2.188 E.13468
G1 X88.788 Y94.701 E.04191
G2 X88.098 Y99.193 I.015 J2.301 E.1348
G1 X88.06 Y99.401 E.00438
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05108
G1 X88.098 Y80.811 E.00445
G2 X88.524 Y85.283 I.701 J2.189 E.12929
G1 X88.713 Y85.294 E.00394
; WIPE_START
G1 X88.791 Y85.299 E-.0298
G1 X90.713 Y85.298 E-.7302
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z2.92 F42000
G1 X94.8 Y99.8 Z2.92
G1 Z2.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.283 Y99.057 F42000
G1 Z2.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0917454
G1 F15000
M204 S6000
G1 X92.177 Y99.148 E.00045
G1 X92.105 Y99.168 E.00024
M204 S10000
G1 X91.327 Y99.33 F42000
; LINE_WIDTH: 0.528972
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.652 J-9.896 E.01086
G3 X88.787 Y99.35 I-1.087 J-127.977 E.05163
G1 X88.536 Y99.343 E.00618
G1 X88.526 Y99.33 E.00039
; LINE_WIDTH: 0.500238
G1 X88.327 Y99.057 E.00784
M204 S10000
G1 X87.441 Y99.189 F42000
; LINE_WIDTH: 0.119418
G1 F15000
M204 S6000
G1 X87.319 Y99.079 E.00075
; LINE_WIDTH: 0.0934265
G1 X87.209 Y98.973 E.0005
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.137392
G1 F15000
M204 S6000
G1 X86.253 Y98.501 E.0015
M204 S10000
G1 X86.09 Y97.717 F42000
; LINE_WIDTH: 0.522318
G1 F15000
M204 S6000
G3 X86.09 Y96.285 I6.449 J-.716 E.03483
M204 S10000
G1 X86.256 Y95.498 F42000
; LINE_WIDTH: 0.100906
G1 F15000
M204 S6000
G1 X86.287 Y95.386 E.00042
G1 X86.442 Y95.21 E.00086
; WIPE_START
G1 X86.287 Y95.386 E-.50954
G1 X86.256 Y95.498 E-.25046
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.581 Y97.641 Z2.92 F42000
G1 X93.764 Y97.695 Z2.92
G1 Z2.52
G1 E.8 F1800
; LINE_WIDTH: 0.437268
G1 F15000
M204 S6000
G3 X93.486 Y98.764 I-21.654 J-5.066 E.02223
M204 S10000
G1 X93.515 Y98.764 F42000
; LINE_WIDTH: 0.292889
G1 F15000
M204 S6000
G1 X93.632 Y98.183 E.00775
; LINE_WIDTH: 0.273088
G1 X93.649 Y98.085 E.0012
; LINE_WIDTH: 0.238858
G1 X93.666 Y97.988 E.00103
; LINE_WIDTH: 0.203246
G1 X93.685 Y97.883 E.00093
; LINE_WIDTH: 0.166899
G1 X93.703 Y97.737 E.00101
; LINE_WIDTH: 0.129911
G1 X93.722 Y97.587 E.00077
; LINE_WIDTH: 0.0955573
G1 X93.739 Y97.348 E.00082
M204 S10000
G1 X93.739 Y96.652 F42000
; LINE_WIDTH: 0.0958615
G1 F15000
M204 S6000
G1 X93.721 Y96.409 E.00083
; LINE_WIDTH: 0.130452
G1 X93.703 Y96.263 E.00075
; LINE_WIDTH: 0.167877
G1 X93.684 Y96.109 E.00108
; LINE_WIDTH: 0.20433
G1 X93.667 Y96.014 E.00085
; LINE_WIDTH: 0.238011
G1 X93.65 Y95.918 E.00101
; LINE_WIDTH: 0.287632
G2 X93.542 Y95.364 I-12.227 J2.1 E.00723
; WIPE_START
G1 X93.65 Y95.918 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.003 Y94.521 Z2.92 F42000
G1 Z2.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423242
G1 F15000
M204 S6000
G1 X93.204 Y94.319 E.00554
G1 X93.204 Y93.757 E.01092
G1 X92.817 Y94.144 E.01064
G2 X92.47 Y93.93 I-1.71 J2.381 E.00794
G1 X93.204 Y93.195 E.0202
G1 X93.204 Y92.633 E.01092
G1 X92.087 Y93.751 E.03072
M73 P44 R13
G2 X91.663 Y93.613 I-1.497 J3.876 E.00867
G1 X93.204 Y92.071 E.04238
G1 X93.204 Y91.508 E.01092
G1 X91.187 Y93.526 E.05545
G1 X91.003 Y93.509 E.00358
G1 X90.642 Y93.509 E.00702
G1 X93.204 Y90.946 E.07042
G1 X93.204 Y90.384 E.01092
G1 X90.081 Y93.507 E.08584
G1 X89.52 Y93.506 E.0109
G1 X93.204 Y89.822 E.10125
G1 X93.204 Y89.26 E.01092
G1 X88.96 Y93.505 E.11667
G2 X88.37 Y93.532 I-.1 J4.202 E.01148
G1 X93.204 Y88.698 E.13287
G1 X93.204 Y88.136 E.01092
G1 X87.634 Y93.706 E.15309
G2 X86.796 Y94.135 I1.083 J3.148 E.01837
G1 X86.796 Y93.982 E.00297
G1 X93.204 Y87.574 E.17614
G1 X93.204 Y87.011 E.01092
G1 X86.796 Y93.42 E.17614
G1 X86.796 Y92.858 E.01092
G1 X93.204 Y86.449 E.17614
G1 X93.204 Y85.908 E.01053
G1 X93.184 Y85.925 E.00051
G1 X93.176 Y85.915 E.00025
G1 X86.796 Y92.296 E.17536
G1 X86.796 Y91.734 E.01092
G1 X92.449 Y86.08 E.15539
G1 X92.344 Y86.138 E.00233
G3 X91.555 Y86.412 I-1.519 J-3.102 E.01628
G1 X86.796 Y91.172 E.1308
G1 X86.796 Y90.61 E.01092
G1 X90.911 Y86.494 E.11311
G1 X90.348 Y86.495 E.01093
G1 X86.796 Y90.047 E.09765
G1 X86.796 Y89.485 E.01092
G1 X89.786 Y86.495 E.08219
G1 X89.223 Y86.495 E.01093
G1 X86.796 Y88.923 E.06673
G1 X86.796 Y88.361 E.01092
G1 X88.664 Y86.492 E.05136
G3 X88.158 Y86.436 I.146 J-3.614 E.0099
G1 X86.796 Y87.799 E.03746
G1 X86.796 Y87.237 E.01092
G1 X87.711 Y86.321 E.02517
G3 X87.31 Y86.161 I1.074 J-3.273 E.00841
G1 X86.796 Y86.675 E.01413
G1 X86.796 Y86.112 E.01092
G1 X87.074 Y85.834 E.00765
; WIPE_START
G1 X86.796 Y86.112 E-.1496
G1 X86.796 Y86.675 E-.21361
G1 X87.31 Y86.161 E-.27624
G1 X87.429 Y86.217 E-.05031
G1 X87.603 Y86.281 E-.07024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.448 Y84.797 Z2.92 F42000
G1 Z2.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109083
G1 F15000
M204 S6000
G1 X86.236 Y84.553 E.00132
M204 S10000
G1 X86.09 Y83.717 F42000
; LINE_WIDTH: 0.522316
G1 F15000
M204 S6000
G3 X86.09 Y82.285 I6.449 J-.716 E.03483
M204 S10000
G1 X86.256 Y81.498 F42000
; LINE_WIDTH: 0.102325
G1 F15000
M204 S6000
G3 X86.33 Y81.236 I7.227 J1.902 E.00102
M204 S10000
G1 X87.174 Y81.054 F42000
; LINE_WIDTH: 0.100652
G1 F15000
M204 S6000
G1 X87.319 Y80.912 E.00074
; LINE_WIDTH: 0.131893
G1 X87.43 Y80.811 E.00078
M204 S10000
G1 X88.277 Y80.674 F42000
; LINE_WIDTH: 0.528686
G1 F15000
M204 S6000
G1 X88.603 Y80.654 E.00802
G3 X90.813 Y80.65 I1.307 J111.947 E.05435
G1 X91.064 Y80.657 E.00617
G1 X91.074 Y80.67 E.00039
; LINE_WIDTH: 0.500238
G1 X91.273 Y80.943 E.00784
M204 S10000
G1 X92.14 Y80.811 F42000
; LINE_WIDTH: 0.0969578
G1 F15000
M204 S6000
G1 X92.327 Y80.977 E.00087
; WIPE_START
G1 X92.14 Y80.811 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.764 Y82.328 Z2.92 F42000
G1 Z2.52
G1 E.8 F1800
; LINE_WIDTH: 0.410439
G1 F15000
M204 S6000
G1 X93.495 Y81.236 E.02117
M204 S10000
G1 X93.516 Y81.236 F42000
; LINE_WIDTH: 0.288256
G1 F15000
M204 S6000
G3 X93.65 Y81.918 I-14.912 J3.278 E.00892
; LINE_WIDTH: 0.238011
G1 X93.667 Y82.014 E.00101
; LINE_WIDTH: 0.20433
G1 X93.684 Y82.109 E.00085
; LINE_WIDTH: 0.167877
G1 X93.703 Y82.263 E.00108
; LINE_WIDTH: 0.130452
G1 X93.721 Y82.409 E.00075
; LINE_WIDTH: 0.0958614
G1 X93.739 Y82.652 E.00083
M204 S10000
G1 X93.739 Y83.348 F42000
; LINE_WIDTH: 0.0955573
G1 F15000
M204 S6000
G1 X93.722 Y83.587 E.00082
; LINE_WIDTH: 0.129911
G1 X93.703 Y83.737 E.00077
; LINE_WIDTH: 0.166899
G1 X93.685 Y83.883 E.00101
; LINE_WIDTH: 0.203246
G1 X93.666 Y83.988 E.00093
; LINE_WIDTH: 0.238858
G1 X93.649 Y84.085 E.00103
; LINE_WIDTH: 0.273088
G1 X93.632 Y84.183 E.0012
; LINE_WIDTH: 0.292889
G1 X93.541 Y84.636 E.00604
M204 S10000
G1 X93.34 Y85.266 F42000
; LINE_WIDTH: 0.0929356
G1 F15000
M204 S6000
G1 X93.188 Y85.399 E.00066
; CHANGE_LAYER
; Z_HEIGHT: 2.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.34 Y85.266 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/166
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z2.92 I-.75 J.958 P1  F42000
G1 X96.464 Y87.712 Z2.92
G1 Z2.64
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.079 Y87.434 I1.396 J2.271 E.01304
G1 X97.091 Y87.014 E.0081
G1 X97.246 Y87.018 E.003
G3 X98.499 Y88.5 I.049 J1.23 E.04309
G3 X96.273 Y88.882 I-1.251 J-.613 E.05079
G3 X96.337 Y87.269 I.51 J-.787 E.03745
G3 X97.032 Y87.012 I.837 J1.196 E.01444
; WIPE_START
G1 X97.246 Y87.018 E-.08157
G1 X97.782 Y87.129 E-.208
G1 X98.102 Y87.319 E-.14131
G1 X98.347 Y87.575 E-.13465
G1 X98.499 Y87.874 E-.12727
G1 X98.528 Y88.048 E-.06719
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.04 I-1.078 J-.565 P1  F42000
G1 X96.724 Y91.491 Z3.04
G1 Z2.64
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.4 Y91.351 I.602 J1.209 E.01345
G1 X97.495 Y90.942 E.0081
G2 X98.08 Y91 I.909 J-6.236 E.01134
G3 X98.452 Y92.455 I-.392 J.875 E.03325
G3 X95.891 Y92.384 I-1.261 J-.735 E.06024
G3 X96.683 Y91.031 I1.108 J-.26 E.03335
G3 X97.438 Y90.929 I.585 J1.475 E.01482
; WIPE_START
G1 X98.08 Y91 E-.24575
G1 X98.484 Y91.294 E-.1897
G1 X98.614 Y91.541 E-.10618
G1 X98.63 Y92.077 E-.2038
G1 X98.614 Y92.111 E-.01457
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.04 I-.692 J-1.001 P1  F42000
G1 X88.797 Y98.9 Z3.04
G1 Z2.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03671
G3 X90.877 Y98.899 I-.003 J1.9 E.10776
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.797 Y98.9 E-.02282
G1 X88.573 Y98.887 E-.0854
G1 X88.425 Y98.863 E-.05709
G1 X88.279 Y98.827 E-.05704
G1 X88.03 Y98.737 E-.10059
G1 X87.796 Y98.613 E-.10058
G1 X87.672 Y98.529 E-.057
G1 X87.47 Y98.357 E-.10076
G1 X87.366 Y98.247 E-.05741
G1 X87.275 Y98.134 E-.05531
G1 X87.182 Y97.987 E-.066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.117 Y90.412 Z3.04 F42000
G1 X88.797 Y84.9 Z3.04
G1 Z2.64
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.10911
G1 X90.803 Y81.1 E.03671
G3 X90.877 Y84.899 I-.003 J1.9 E.10776
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.797 Y84.9 E-.02282
G1 X88.573 Y84.887 E-.0854
G1 X88.425 Y84.863 E-.05709
G1 X88.279 Y84.827 E-.05704
G1 X88.03 Y84.737 E-.10059
G1 X87.796 Y84.613 E-.10058
G1 X87.672 Y84.529 E-.057
G1 X87.47 Y84.357 E-.10076
G1 X87.366 Y84.247 E-.05741
G1 X87.275 Y84.134 E-.05531
G1 X87.182 Y83.987 E-.06599
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.036 Y91.618 Z3.04 F42000
G1 X86.896 Y98.977 Z3.04
G1 Z2.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.0181
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00448
G2 X86.615 Y98.627 I2.8 J-1.288 E.01256
G1 X86.859 Y98.93 E.00806
; WIPE_START
G1 X86.023 Y98.977 E-.31784
G1 X86.023 Y97.944 E-.39245
G1 X86.152 Y97.919 E-.04971
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.826 Y90.473 Z3.04 F42000
G1 X88.798 Y86.148 Z3.04
G1 Z2.64
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.933 Y86.146 E.04428
G2 X93.379 Y84.805 I-.141 J-3.158 E.05992
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.58 J1.809 E.06217
G1 X88.772 Y93.852 E.04252
G2 X86.83 Y94.543 I.039 J3.183 E.04353
G1 X86.448 Y94.876 E.01051
G1 X86.448 Y85.115 E.20247
G1 X86.775 Y85.411 E.00917
G2 X88.738 Y86.147 I2.022 J-2.408 E.04433
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z3.04 F42000
G1 X93.977 Y98.977 Z3.04
G1 Z2.64
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.679 Y98.977 E.02691
G2 X93.22 Y95.749 I-1.898 J-1.978 E.07275
G2 X90.815 Y94.277 I-2.42 J1.253 E.06148
G1 X88.78 Y94.277 E.04222
G2 X86.228 Y96.095 I.025 J2.736 E.06921
G1 X86.023 Y96.054 E.00432
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.575 J-.912 E.0693
G1 X90.914 Y85.722 E.04415
G2 X92.926 Y81.295 I-.116 J-2.723 E.12457
G1 X92.685 Y81.023 E.00754
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.679 Y98.977 E-.49358
G1 X92.891 Y98.747 E-.11875
G1 X93.054 Y98.53 E-.10305
G1 X93.115 Y98.43 E-.04462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.15 Y91.397 Z3.04 F42000
G1 X86.228 Y82.095 Z3.04
G1 Z2.64
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00432
G1 X86.023 Y81.023 E.02137
G1 X86.904 Y81.023 E.01827
G1 X86.642 Y81.337 E.00849
G2 X86.249 Y82.039 I2.335 J1.769 E.01672
; WIPE_START
G1 X86.023 Y82.054 E-.08589
G1 X86.023 Y81.023 E-.39142
G1 X86.767 Y81.023 E-.28269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z3.04 F42000
G1 Z2.64
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.895 Y85.298 E.04362
G2 X91.502 Y80.807 I-.099 J-2.3 E.13306
G1 X91.541 Y80.599 E.00438
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.541 Y99.401 E.05932
G1 X91.506 Y99.188 E.00448
G2 X90.809 Y94.701 I-.708 J-2.188 E.13468
G1 X88.788 Y94.701 E.04191
G2 X87.869 Y99.103 I.012 J2.3 E.1297
G1 X88.099 Y99.194 E.00512
G1 X88.059 Y99.401 E.00436
G1 X85.599 Y99.401 E.05102
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00446
G2 X88.524 Y85.283 I.701 J2.189 E.12929
G1 X88.713 Y85.294 E.00394
; WIPE_START
G1 X88.791 Y85.299 E-.02982
G1 X90.713 Y85.298 E-.73018
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z3.04 F42000
G1 X94.8 Y99.8 Z3.04
G1 Z2.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.29 Y99.05 F42000
G1 Z2.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0918004
G1 F15000
M204 S6000
G1 X92.177 Y99.148 E.00048
G1 X92.105 Y99.168 E.00024
M204 S10000
G1 X91.327 Y99.33 F42000
; LINE_WIDTH: 0.528969
G1 F15000
M204 S6000
G3 X90.886 Y99.349 I-.652 J-9.875 E.01086
G3 X88.787 Y99.35 I-1.087 J-127.492 E.05163
G1 X88.536 Y99.343 E.00618
G1 X88.526 Y99.33 E.0004
; LINE_WIDTH: 0.499853
G1 X88.328 Y99.057 E.00781
; WIPE_START
G1 X88.526 Y99.33 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.272 Y99.105 Z3.04 F42000
G1 Z2.64
G1 E.8 F1800
; LINE_WIDTH: 0.0859267
G1 F15000
M204 S6000
G2 X87.495 Y99.169 I1.616 J-5.283 E.00068
M204 S10000
G1 X87.43 Y99.189 F42000
; LINE_WIDTH: 0.1253
G1 F15000
M204 S6000
G1 X87.285 Y99.056 E.00096
; LINE_WIDTH: 0.0942754
G1 X87.175 Y98.947 E.00052
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.130652
G1 F15000
M204 S6000
G1 X86.253 Y98.501 E.00141
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.467841
G1 F15000
M204 S6000
G1 X86.1 Y97.479 E.00699
; LINE_WIDTH: 0.499503
G1 X86.085 Y97.468 E.00045
; LINE_WIDTH: 0.527369
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.520653
G3 X86.091 Y96.284 I6.066 J-.472 E.02843
M204 S10000
G1 X86.254 Y95.499 F42000
; LINE_WIDTH: 0.131096
G1 F15000
M204 S6000
G1 X86.292 Y95.367 E.00071
G1 X86.372 Y95.279 E.00061
; LINE_WIDTH: 0.0958553
G1 X86.451 Y95.192 E.0004
; LINE_WIDTH: 0.0806411
G1 X86.479 Y95.163 E.00011
; WIPE_START
G1 X86.451 Y95.192 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.082 Y94.161 Z3.04 F42000
G1 Z2.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426442
G1 F15000
M204 S6000
G1 X86.796 Y93.874 E.00795
G1 X86.796 Y93.307 E.0111
G1 X87.322 Y93.833 E.01457
G3 X87.728 Y93.673 I1.208 J2.469 E.00857
G1 X86.796 Y92.741 E.02583
G1 X86.796 Y92.174 E.0111
G1 X88.182 Y93.56 E.0384
G3 X88.695 Y93.507 I.636 J3.652 E.01013
G1 X86.796 Y91.607 E.05264
G1 X86.796 Y91.041 E.0111
G1 X89.26 Y93.506 E.06829
G1 X89.828 Y93.507 E.01113
G1 X86.796 Y90.474 E.08403
G1 X86.796 Y89.907 E.0111
G1 X90.396 Y93.508 E.09976
G1 X90.964 Y93.509 E.01113
G1 X86.796 Y89.341 E.11549
G1 X86.796 Y88.774 E.0111
G1 X91.626 Y93.604 E.13381
G3 X92.582 Y93.994 I-.832 J3.411 E.02031
G1 X86.796 Y88.207 E.16031
G1 X86.796 Y87.641 E.0111
G1 X93.204 Y94.049 E.17756
G1 X93.204 Y93.483 E.0111
G1 X86.796 Y87.074 E.17756
G1 X86.796 Y86.507 E.0111
G1 X93.204 Y92.916 E.17756
G1 X93.204 Y92.349 E.0111
G1 X86.796 Y85.941 E.17756
G1 X86.796 Y85.863 E.00153
G2 X87.757 Y86.336 I2.004 J-2.861 E.02108
G1 X93.204 Y91.783 E.15092
G1 X93.204 Y91.216 E.0111
G1 X88.467 Y86.479 E.13124
G2 X89.05 Y86.495 I.434 J-5.065 E.01143
G1 X93.204 Y90.65 E.11509
G1 X93.204 Y90.083 E.0111
G1 X89.617 Y86.495 E.0994
G1 X90.183 Y86.495 E.01109
G1 X93.204 Y89.516 E.08371
G1 X93.204 Y88.95 E.0111
G1 X90.749 Y86.494 E.06802
G2 X91.285 Y86.464 I.098 J-3.027 E.01052
G1 X93.204 Y88.383 E.05317
G1 X93.204 Y87.816 E.0111
G1 X91.751 Y86.363 E.04026
G2 X92.169 Y86.214 I-.878 J-3.125 E.0087
G1 X93.204 Y87.25 E.02869
G1 X93.204 Y86.683 E.0111
G1 X92.549 Y86.027 E.01817
G2 X92.889 Y85.801 I-1.247 J-2.244 E.00802
G1 X93.382 Y86.294 E.01366
M204 S10000
G1 X93.223 Y85.361 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879418
G1 F15000
M204 S6000
G1 X93.34 Y85.257 E.00048
M204 S10000
G1 X93.54 Y84.635 F42000
; LINE_WIDTH: 0.29533
G1 F15000
M204 S6000
G1 X93.631 Y84.189 E.00601
; LINE_WIDTH: 0.270208
G1 X93.653 Y84.063 E.00153
; LINE_WIDTH: 0.223598
G1 X93.677 Y83.93 E.00131
; LINE_WIDTH: 0.18112
G1 X93.696 Y83.79 E.00107
; LINE_WIDTH: 0.142871
G1 X93.715 Y83.645 E.00084
; LINE_WIDTH: 0.101711
G1 X93.74 Y83.359 E.00107
M204 S10000
G1 X93.739 Y82.658 F42000
; LINE_WIDTH: 0.0901867
G1 F15000
M204 S6000
G1 X93.727 Y82.469 E.0006
; LINE_WIDTH: 0.117622
G1 X93.71 Y82.323 E.00066
; LINE_WIDTH: 0.151964
G1 X93.692 Y82.17 E.00095
; LINE_WIDTH: 0.194027
G1 X93.668 Y82.024 E.00122
; LINE_WIDTH: 0.242324
G1 X93.644 Y81.878 E.00157
; LINE_WIDTH: 0.26879
G1 X93.521 Y81.236 E.00777
M204 S10000
G1 X93.496 Y81.236 F42000
; LINE_WIDTH: 0.402295
G1 F15000
M204 S6000
G1 X93.764 Y82.339 E.02091
; WIPE_START
G1 X93.496 Y81.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.324 Y80.972 Z3.04 F42000
G1 Z2.64
G1 E.8 F1800
; LINE_WIDTH: 0.0964103
G1 F15000
M204 S6000
G1 X92.192 Y80.857 E.0006
G1 X92.105 Y80.831 E.00031
M204 S10000
G1 X91.273 Y80.943 F42000
; LINE_WIDTH: 0.500516
G1 F15000
M204 S6000
G1 X91.074 Y80.67 E.00785
; LINE_WIDTH: 0.528686
G1 X91.064 Y80.657 E.00039
G1 X90.813 Y80.65 E.00618
G2 X88.603 Y80.654 I-.904 J111.575 E.05434
G1 X88.277 Y80.674 E.00802
M204 S10000
G1 X87.442 Y80.811 F42000
; LINE_WIDTH: 0.126223
G1 F15000
M204 S6000
G1 X87.357 Y80.886 E.00055
; LINE_WIDTH: 0.10031
G1 X87.212 Y81.023 E.00073
M204 S10000
G1 X86.331 Y81.236 F42000
; LINE_WIDTH: 0.137659
G1 F15000
M204 S6000
G1 X86.253 Y81.499 E.0015
M204 S10000
G1 X86.091 Y82.284 F42000
; LINE_WIDTH: 0.520661
G1 F15000
M204 S6000
G1 X86.052 Y82.845 E.01363
G1 X86.05 Y83.064 E.0053
G1 X86.069 Y83.457 E.0095
; LINE_WIDTH: 0.527369
G1 X86.085 Y83.468 E.00047
; LINE_WIDTH: 0.499503
G1 X86.1 Y83.479 E.00045
; LINE_WIDTH: 0.467841
G1 X86.367 Y83.662 E.00699
M204 S10000
G1 X86.236 Y84.551 F42000
; LINE_WIDTH: 0.109296
G1 F15000
M204 S6000
G1 X86.441 Y84.79 E.00129
; WIPE_START
G1 X86.236 Y84.551 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.344 Y90.984 Z3.04 F42000
G1 X93.764 Y96.339 Z3.04
G1 Z2.64
G1 E.8 F1800
; LINE_WIDTH: 0.403241
G1 F15000
M204 S6000
G2 X93.524 Y95.369 I-23.555 J5.313 E.01844
M204 S10000
G1 X93.545 Y95.363 F42000
; LINE_WIDTH: 0.26879
G1 F15000
M204 S6000
G1 X93.644 Y95.878 E.00624
; LINE_WIDTH: 0.242324
G1 X93.668 Y96.024 E.00157
; LINE_WIDTH: 0.194027
G1 X93.692 Y96.17 E.00122
; LINE_WIDTH: 0.151964
G1 X93.71 Y96.323 E.00095
; LINE_WIDTH: 0.117622
G1 X93.727 Y96.469 E.00066
; LINE_WIDTH: 0.0901872
G1 X93.739 Y96.658 E.0006
M204 S10000
G1 X93.74 Y97.358 F42000
; LINE_WIDTH: 0.0963943
G1 F15000
M204 S6000
G1 X93.721 Y97.593 E.00082
; LINE_WIDTH: 0.131198
G1 X93.703 Y97.74 E.00076
; LINE_WIDTH: 0.167388
G1 X93.685 Y97.883 E.001
; LINE_WIDTH: 0.203341
G1 X93.666 Y97.988 E.00093
; LINE_WIDTH: 0.238899
G1 X93.649 Y98.085 E.00103
; LINE_WIDTH: 0.273077
G1 X93.632 Y98.183 E.00119
; LINE_WIDTH: 0.292851
G1 X93.515 Y98.764 E.00775
M204 S10000
G1 X93.486 Y98.764 F42000
; LINE_WIDTH: 0.437346
G1 F15000
M204 S6000
G2 X93.764 Y97.696 I-22.038 J-6.311 E.02221
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.486 Y98.764 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/166
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.04 I1.115 J.487 P1  F42000
G1 X96.66 Y91.492 Z3.04
G1 Z2.76
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.33 Y91.356 I.55 J.994 E.01339
G1 X97.427 Y90.947 E.0081
G3 X98.48 Y91.738 I-.054 J1.167 E.02695
G3 X96.475 Y93.013 I-1.307 J.158 E.05709
G3 X96.492 Y91.106 I.281 J-.951 E.04939
G3 X97.37 Y90.933 I.733 J1.404 E.0175
; WIPE_START
G1 X97.739 Y91.021 E-.14415
G1 X98.117 Y91.224 E-.16296
G1 X98.308 Y91.377 E-.09297
G1 X98.48 Y91.738 E-.15193
G1 X98.45 Y92.285 E-.20799
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.16 I1.11 J-.499 P1  F42000
G1 X96.385 Y87.688 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.014 Y87.426 I.768 J.957 E.0133
G1 X97.025 Y87.006 E.0081
G1 X97.176 Y87.01 E.0029
G3 X98.434 Y88.491 I.046 J1.236 E.04309
G3 X96.381 Y89.012 I-1.247 J-.607 E.04645
G3 X96.232 Y87.262 I.324 J-.909 E.04256
G3 X96.966 Y87.004 I1.033 J1.771 E.01508
; WIPE_START
G1 X97.176 Y87.01 E-.07968
G1 X97.717 Y87.121 E-.20986
G1 X98.036 Y87.311 E-.14124
G1 X98.281 Y87.567 E-.13462
G1 X98.434 Y87.865 E-.12726
G1 X98.462 Y88.04 E-.06734
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.16 I-.909 J-.809 P1  F42000
G1 X88.797 Y98.9 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.007 J-1.9 E.10893
G1 X90.803 Y95.1 E.03671
G3 X90.875 Y98.899 I-.003 J1.9 E.10779
G1 X88.857 Y98.9 E.03691
; WIPE_START
M204 S6000
M73 P45 R13
G1 X88.797 Y98.9 E-.02283
G1 X88.573 Y98.887 E-.08543
G1 X88.426 Y98.863 E-.05674
G1 X88.201 Y98.803 E-.08815
G1 X88.064 Y98.752 E-.05562
G1 X87.928 Y98.688 E-.0572
G1 X87.702 Y98.551 E-.10055
G1 X87.581 Y98.458 E-.05779
G1 X87.47 Y98.357 E-.05721
G1 X87.294 Y98.159 E-.10061
G1 X87.205 Y98.033 E-.05852
G1 X87.179 Y97.989 E-.01935
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.116 Y90.414 Z3.16 F42000
G1 X88.797 Y84.9 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.007 J-1.9 E.10893
G1 X90.803 Y81.1 E.03671
G3 X90.875 Y84.899 I-.003 J1.9 E.10779
G1 X88.857 Y84.9 E.03691
; WIPE_START
M204 S6000
G1 X88.797 Y84.9 E-.02282
G1 X88.573 Y84.886 E-.08558
G1 X88.426 Y84.863 E-.05659
G1 X88.201 Y84.803 E-.08815
G1 X88.064 Y84.752 E-.05562
G1 X87.928 Y84.688 E-.05721
G1 X87.702 Y84.551 E-.10055
G1 X87.581 Y84.458 E-.05779
G1 X87.47 Y84.357 E-.05721
G1 X87.294 Y84.159 E-.10061
G1 X87.205 Y84.033 E-.05852
G1 X87.179 Y83.989 E-.01935
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.037 Y91.62 Z3.16 F42000
G1 X86.9 Y98.977 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01818
G1 X86.023 Y97.944 E.02142
G1 X86.23 Y97.904 E.00437
G1 X86.31 Y98.105 E.00447
G2 X86.639 Y98.658 I2.768 J-1.27 E.01339
G1 X86.862 Y98.93 E.00729
; WIPE_START
G1 X86.023 Y98.977 E-.31911
G1 X86.023 Y97.944 E-.39244
G1 X86.149 Y97.92 E-.04846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.825 Y90.474 Z3.16 F42000
G1 X88.798 Y86.148 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.919 Y86.146 E.04398
G2 X93.379 Y84.805 I-.131 J-3.167 E.0602
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.58 J1.809 E.06217
G1 X88.772 Y93.852 E.04252
G2 X86.83 Y94.544 I.039 J3.183 E.04354
G1 X86.448 Y94.876 E.0105
G1 X86.448 Y85.115 E.20248
G1 X86.781 Y85.416 E.00932
G2 X88.738 Y86.147 I2.019 J-2.419 E.04418
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z3.16 F42000
G1 X93.977 Y98.977 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.679 Y98.977 E.02691
G2 X93.22 Y95.748 I-1.899 J-1.978 E.07276
G2 X90.815 Y94.277 I-2.42 J1.253 E.06147
G1 X88.78 Y94.277 E.04222
G2 X86.228 Y96.095 I.026 J2.737 E.0692
G1 X86.023 Y96.054 E.00432
G1 X86.023 Y83.944 E.25119
G1 X86.23 Y83.904 E.00437
G2 X88.785 Y85.724 I2.575 J-.912 E.0693
G1 X90.904 Y85.722 E.04394
G2 X92.925 Y81.295 I-.107 J-2.724 E.12477
G1 X92.684 Y81.023 E.00753
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.679 Y98.977 E-.49358
G1 X92.891 Y98.747 E-.11875
G1 X93.054 Y98.53 E-.10303
G1 X93.115 Y98.43 E-.04464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.15 Y91.397 Z3.16 F42000
G1 X86.228 Y82.095 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00432
G1 X86.023 Y81.023 E.02137
G1 X86.904 Y81.023 E.01827
G1 X86.647 Y81.331 E.00831
G2 X86.249 Y82.039 I2.296 J1.758 E.0169
; WIPE_START
G1 X86.023 Y82.054 E-.08587
G1 X86.023 Y81.023 E-.39143
G1 X86.767 Y81.023 E-.2827
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.889 Y85.298 E.0435
G2 X91.502 Y80.807 I-.093 J-2.3 E.13318
G1 X91.541 Y80.599 E.00438
G1 X94.401 Y80.599 E.05933
G1 X94.401 Y99.401 E.38999
G1 X91.547 Y99.401 E.05919
G1 X91.505 Y99.198 E.0043
G1 X91.816 Y99.063 E.00702
G2 X90.809 Y94.701 I-1.019 J-2.062 E.12776
G1 X88.788 Y94.701 E.04191
G2 X88.1 Y99.192 I.014 J2.3 E.13481
G1 X88.062 Y99.401 E.00441
G1 X85.599 Y99.401 E.05108
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.523 Y85.283 I.701 J2.189 E.12928
G1 X88.713 Y85.294 E.00395
; WIPE_START
G1 X88.791 Y85.299 E-.02985
G1 X90.713 Y85.298 E-.73015
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z3.16 F42000
G1 X94.8 Y99.8 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.29 Y99.05 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0917991
G1 F15000
M204 S6000
G1 X92.177 Y99.148 E.00048
G1 X92.105 Y99.168 E.00024
M204 S10000
G1 X91.327 Y99.325 F42000
; LINE_WIDTH: 0.529307
G1 F15000
M204 S6000
G1 X90.882 Y99.349 E.01099
G3 X88.787 Y99.35 I-1.085 J-127.973 E.05158
G1 X88.537 Y99.343 E.00615
G1 X88.526 Y99.328 E.00045
; LINE_WIDTH: 0.497169
G1 X88.327 Y99.057 E.00775
M204 S10000
G1 X87.437 Y99.189 F42000
; LINE_WIDTH: 0.125555
G1 F15000
M204 S6000
G1 X87.321 Y99.085 E.00076
; LINE_WIDTH: 0.0970432
G1 X87.192 Y98.96 E.00063
M204 S10000
G1 X86.331 Y98.764 F42000
; LINE_WIDTH: 0.134667
G1 F15000
M204 S6000
G1 X86.253 Y98.502 E.00146
M204 S10000
G1 X86.367 Y97.662 F42000
; LINE_WIDTH: 0.467988
G1 F15000
M204 S6000
G1 X86.1 Y97.479 E.007
; LINE_WIDTH: 0.499609
G1 X86.085 Y97.468 E.00044
; LINE_WIDTH: 0.527403
G1 X86.069 Y97.457 E.00047
; LINE_WIDTH: 0.52
G3 X86.09 Y96.284 I6.086 J-.477 E.0284
M204 S10000
M73 P45 R12
G1 X86.236 Y95.435 F42000
; LINE_WIDTH: 0.132243
G1 F15000
M204 S6000
G1 X86.326 Y95.329 E.00072
; LINE_WIDTH: 0.099446
G1 X86.478 Y95.163 E.00081
; WIPE_START
G1 X86.326 Y95.329 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.599 Y97.642 Z3.16 F42000
G1 X93.764 Y97.695 Z3.16
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.437183
G1 F15000
M204 S6000
G3 X93.486 Y98.764 I-21.518 J-5.029 E.02224
M204 S10000
G1 X93.515 Y98.764 F42000
; LINE_WIDTH: 0.292544
G1 F15000
M204 S6000
G1 X93.632 Y98.182 E.00775
; LINE_WIDTH: 0.272823
G1 X93.649 Y98.085 E.00119
; LINE_WIDTH: 0.238699
G1 X93.666 Y97.988 E.00103
; LINE_WIDTH: 0.203196
G1 X93.685 Y97.883 E.00093
; LINE_WIDTH: 0.167258
G1 X93.703 Y97.74 E.001
; LINE_WIDTH: 0.131016
G1 X93.721 Y97.593 E.00076
; LINE_WIDTH: 0.0962845
G1 X93.74 Y97.357 E.00082
M204 S10000
G1 X93.739 Y96.658 F42000
; LINE_WIDTH: 0.0901869
G1 F15000
M204 S6000
G1 X93.727 Y96.469 E.0006
; LINE_WIDTH: 0.117632
G1 X93.71 Y96.323 E.00066
; LINE_WIDTH: 0.151994
G1 X93.692 Y96.17 E.00095
; LINE_WIDTH: 0.194105
G1 X93.668 Y96.024 E.00122
; LINE_WIDTH: 0.24243
G1 X93.644 Y95.878 E.00157
; LINE_WIDTH: 0.268898
G1 X93.545 Y95.363 E.00624
M204 S10000
G1 X93.524 Y95.37 F42000
; LINE_WIDTH: 0.40345
G1 F15000
M204 S6000
G3 X93.764 Y96.338 I-20.748 J5.666 E.01842
; WIPE_START
G1 X93.524 Y95.37 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.003 Y94.521 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423242
G1 F15000
M204 S6000
G1 X93.204 Y94.319 E.00554
G1 X93.204 Y93.757 E.01092
G1 X92.816 Y94.145 E.01067
G2 X92.47 Y93.93 I-1.539 J2.088 E.00794
G1 X93.204 Y93.195 E.0202
G1 X93.204 Y92.633 E.01092
G1 X92.087 Y93.751 E.03072
G2 X91.663 Y93.613 I-1.497 J3.878 E.00867
G1 X93.204 Y92.071 E.04238
G1 X93.204 Y91.508 E.01092
G1 X91.187 Y93.526 E.05545
G1 X91.004 Y93.509 E.00357
G1 X90.642 Y93.509 E.00703
G1 X93.204 Y90.946 E.07042
G1 X93.204 Y90.384 E.01092
G1 X90.081 Y93.507 E.08584
G1 X89.52 Y93.506 E.0109
G1 X93.204 Y89.822 E.10125
G1 X93.204 Y89.26 E.01092
G1 X88.959 Y93.505 E.11667
G2 X88.37 Y93.532 I-.099 J4.221 E.01148
G1 X93.204 Y88.698 E.13287
G1 X93.204 Y88.136 E.01092
G1 X87.634 Y93.706 E.1531
G2 X86.796 Y94.136 I1.194 J3.358 E.01837
G1 X86.796 Y93.982 E.00299
G1 X93.204 Y87.574 E.17614
G1 X93.204 Y87.011 E.01092
G1 X86.796 Y93.42 E.17614
G1 X86.796 Y92.858 E.01092
G1 X93.204 Y86.449 E.17614
G1 X93.204 Y85.908 E.01052
G1 X93.182 Y85.927 E.00057
G1 X93.174 Y85.918 E.00025
G1 X86.796 Y92.296 E.1753
G1 X86.796 Y91.734 E.01092
G1 X92.449 Y86.08 E.15539
G1 X92.345 Y86.138 E.00232
G3 X91.557 Y86.411 I-1.616 J-3.398 E.01625
G1 X86.796 Y91.172 E.13085
G1 X86.796 Y90.61 E.01092
G1 X90.911 Y86.494 E.11311
G1 X90.348 Y86.495 E.01093
G1 X86.796 Y90.047 E.09765
G1 X86.796 Y89.485 E.01092
G1 X89.786 Y86.495 E.08219
G1 X89.223 Y86.495 E.01093
G1 X86.796 Y88.923 E.06673
G1 X86.796 Y88.361 E.01092
G1 X88.664 Y86.492 E.05136
G3 X88.158 Y86.436 I.146 J-3.613 E.0099
G1 X86.796 Y87.799 E.03746
G1 X86.796 Y87.237 E.01092
G1 X87.71 Y86.322 E.02514
G3 X87.31 Y86.16 I1.407 J-4.069 E.0084
G1 X86.796 Y86.675 E.01413
G1 X86.796 Y86.112 E.01092
G1 X87.074 Y85.834 E.00765
; WIPE_START
G1 X86.796 Y86.112 E-.14956
G1 X86.796 Y86.675 E-.21361
G1 X87.31 Y86.16 E-.27627
G1 X87.445 Y86.224 E-.05692
G1 X87.602 Y86.282 E-.06364
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.445 Y84.793 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.108589
G1 F15000
M204 S6000
G1 X86.236 Y84.551 E.0013
M204 S10000
G1 X86.367 Y83.662 F42000
; LINE_WIDTH: 0.467988
G1 F15000
M204 S6000
G1 X86.1 Y83.479 E.007
; LINE_WIDTH: 0.499609
G1 X86.085 Y83.468 E.00044
; LINE_WIDTH: 0.527403
G1 X86.069 Y83.457 E.00047
; LINE_WIDTH: 0.52
G3 X86.09 Y82.284 I6.086 J-.477 E.0284
M204 S10000
G1 X87.214 Y81.022 F42000
; LINE_WIDTH: 0.0999555
G1 F15000
M204 S6000
G1 X87.357 Y80.886 E.00072
; LINE_WIDTH: 0.125639
G1 X87.443 Y80.811 E.00056
M204 S10000
G1 X88.277 Y80.673 F42000
; LINE_WIDTH: 0.528681
G1 F15000
M204 S6000
G1 X88.603 Y80.654 E.00802
G3 X90.813 Y80.65 I1.307 J111.941 E.05434
G1 X91.064 Y80.658 E.00618
G1 X91.074 Y80.671 E.00041
; LINE_WIDTH: 0.499423
G1 X91.273 Y80.943 E.00781
M204 S10000
G1 X92.105 Y80.831 F42000
; LINE_WIDTH: 0.0944724
G1 F15000
M204 S6000
G1 X92.192 Y80.857 E.00031
G1 X92.322 Y80.972 E.00059
; WIPE_START
G1 X92.192 Y80.857 E-.49958
G1 X92.105 Y80.831 E-.26042
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.764 Y82.338 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.402531
G1 F15000
M204 S6000
G1 X93.496 Y81.236 E.0209
M204 S10000
G1 X93.521 Y81.236 F42000
; LINE_WIDTH: 0.268898
G1 F15000
M204 S6000
G1 X93.644 Y81.878 E.00777
; LINE_WIDTH: 0.24243
G1 X93.668 Y82.024 E.00157
; LINE_WIDTH: 0.194105
G1 X93.692 Y82.17 E.00122
; LINE_WIDTH: 0.152004
G1 X93.71 Y82.323 E.00095
; LINE_WIDTH: 0.117662
G1 X93.727 Y82.469 E.00066
; LINE_WIDTH: 0.0901998
G1 X93.739 Y82.658 E.0006
M204 S10000
G1 X93.739 Y83.348 F42000
; LINE_WIDTH: 0.095587
G1 F15000
M204 S6000
G1 X93.722 Y83.587 E.00082
; LINE_WIDTH: 0.129951
G1 X93.703 Y83.737 E.00077
; LINE_WIDTH: 0.1669
G1 X93.685 Y83.883 E.00101
; LINE_WIDTH: 0.203192
G1 X93.666 Y83.988 E.00093
; LINE_WIDTH: 0.238693
G1 X93.649 Y84.085 E.00103
; LINE_WIDTH: 0.272813
G1 X93.632 Y84.182 E.00119
; LINE_WIDTH: 0.292563
G1 X93.541 Y84.636 E.00604
M204 S10000
G1 X93.34 Y85.267 F42000
; LINE_WIDTH: 0.0932181
G1 F15000
M204 S6000
G1 X93.186 Y85.401 E.00068
; CHANGE_LAYER
; Z_HEIGHT: 2.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.34 Y85.267 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/166
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.16 I-.783 J.931 P1  F42000
G1 X96.256 Y87.72 Z3.16
G1 Z2.88
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X96.952 Y87.418 I1.201 J1.82 E.0147
G1 X96.963 Y86.999 E.0081
G1 X97.104 Y87.002 E.00272
G3 X98.368 Y88.482 I.06 J1.229 E.04329
G3 X96.517 Y89.129 I-1.253 J-.614 E.0419
G3 X95.606 Y88.137 I.352 J-1.238 E.02733
G3 X96.904 Y86.997 I1.398 J.283 E.03575
; WIPE_START
G1 X97.104 Y87.002 E-.0761
G1 X97.651 Y87.112 E-.21229
G1 X97.971 Y87.302 E-.1412
G1 X98.216 Y87.558 E-.13459
G1 X98.368 Y87.856 E-.1272
G1 X98.397 Y88.034 E-.06863
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.28 I-1.077 J-.566 P1  F42000
G1 X96.585 Y91.482 Z3.28
G1 Z2.88
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.258 Y91.357 I.59 J1.313 E.01332
G1 X97.374 Y90.953 E.0081
G3 X97.668 Y93.084 I-.062 J1.094 E.05818
G3 X95.723 Y92.399 I-.582 J-1.451 E.04338
G3 X96.627 Y91.018 I1.087 J-.275 E.03576
G3 X97.303 Y90.936 I.491 J1.215 E.01328
; WIPE_START
G1 X97.672 Y91.027 E-.1444
G1 X97.99 Y91.199 E-.13738
G1 X98.232 Y91.438 E-.12923
G1 X98.382 Y91.724 E-.12269
G1 X98.433 Y92.035 E-.11964
G1 X98.388 Y92.312 E-.10666
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.28 I-.689 J-1.003 P1  F42000
G1 X88.797 Y98.9 Z3.28
G1 Z2.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03671
G3 X90.877 Y98.899 I-.003 J1.9 E.10776
G1 X88.857 Y98.9 E.03695
; WIPE_START
M204 S6000
G1 X88.797 Y98.9 E-.02283
G1 X88.573 Y98.887 E-.08539
G1 X88.428 Y98.863 E-.05595
G1 X88.314 Y98.837 E-.04446
G1 X88.061 Y98.751 E-.10141
G1 X87.927 Y98.688 E-.05626
G1 X87.796 Y98.613 E-.05737
G1 X87.581 Y98.458 E-.10076
G1 X87.47 Y98.357 E-.05703
G1 X87.366 Y98.247 E-.05743
G1 X87.272 Y98.129 E-.05739
G1 X87.187 Y98.004 E-.05736
G1 X87.179 Y97.99 E-.00638
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.115 Y90.415 Z3.28 F42000
G1 X88.797 Y84.9 Z3.28
G1 Z2.88
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.007 J-1.9 E.10894
G1 X90.803 Y81.1 E.03671
G3 X90.877 Y84.899 I-.003 J1.9 E.10776
G1 X88.857 Y84.9 E.03695
; WIPE_START
M204 S6000
G1 X88.797 Y84.9 E-.02283
G1 X88.573 Y84.887 E-.08539
G1 X88.428 Y84.863 E-.05595
G1 X88.314 Y84.837 E-.04446
G1 X88.061 Y84.751 E-.10141
G1 X87.927 Y84.688 E-.05626
G1 X87.796 Y84.613 E-.05737
G1 X87.581 Y84.458 E-.10076
G1 X87.47 Y84.357 E-.05703
G1 X87.366 Y84.247 E-.05743
G1 X87.272 Y84.129 E-.05739
G1 X87.187 Y84.004 E-.05736
G1 X87.179 Y83.99 E-.00637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.035 Y91.621 Z3.28 F42000
G1 X86.896 Y98.977 Z3.28
G1 Z2.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4800
M204 S6000
G1 X86.023 Y98.977 E.01809
G1 X86.023 Y97.944 E.02141
G1 X86.233 Y97.906 E.00441
G1 X86.288 Y98.055 E.0033
G2 X86.609 Y98.619 I2.81 J-1.225 E.01347
G1 X86.858 Y98.93 E.00827
; WIPE_START
G1 X86.023 Y98.977 E-.31771
G1 X86.023 Y97.944 E-.39226
G1 X86.153 Y97.921 E-.05003
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.826 Y90.474 Z3.28 F42000
G1 X88.798 Y86.148 Z3.28
G1 Z2.88
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.921 Y86.146 E.04402
G2 X93.379 Y84.805 I-.127 J-3.155 E.06017
G1 X93.552 Y84.863 E.0038
G1 X93.552 Y95.137 E.21311
G1 X93.376 Y95.194 E.00384
G2 X90.822 Y93.852 I-2.58 J1.81 E.06217
G1 X88.772 Y93.852 E.04253
G2 X86.829 Y94.544 I.039 J3.183 E.04355
G1 X86.448 Y94.876 E.0105
G1 X86.448 Y85.115 E.20247
G1 X86.776 Y85.412 E.00919
G2 X88.738 Y86.147 I2.022 J-2.411 E.04431
; WIPE_START
G1 X90.738 Y86.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.606 Y93.547 Z3.28 F42000
G1 X93.977 Y98.977 Z3.28
G1 Z2.88
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X92.686 Y98.977 E.02676
G2 X93.404 Y97.801 I-2.092 J-2.085 E.02885
G2 X90.815 Y94.277 I-2.604 J-.8 E.1053
G1 X88.78 Y94.277 E.04222
G2 X86.228 Y96.095 I.026 J2.737 E.06921
G1 X86.023 Y96.054 E.00432
G1 X86.023 Y83.944 E.25118
G1 X86.233 Y83.906 E.00441
G2 X88.785 Y85.724 I2.571 J-.91 E.06923
G1 X90.906 Y85.722 E.04399
G2 X92.925 Y81.295 I-.108 J-2.724 E.12474
G1 X92.684 Y81.023 E.00753
G1 X93.977 Y81.023 E.0268
G1 X93.977 Y98.917 E.37115
; WIPE_START
G1 X92.686 Y98.977 E-.49083
G1 X92.897 Y98.739 E-.1209
G1 X93.054 Y98.53 E-.09911
G1 X93.122 Y98.42 E-.04916
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.152 Y91.389 Z3.28 F42000
G1 X86.228 Y82.095 Z3.28
G1 Z2.88
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X86.023 Y82.054 E.00432
G1 X86.023 Y81.023 E.02137
G1 X86.904 Y81.023 E.01827
G1 X86.645 Y81.334 E.00838
G2 X86.249 Y82.039 I2.3 J1.756 E.01683
; WIPE_START
G1 X86.023 Y82.054 E-.08587
G1 X86.023 Y81.023 E-.39144
G1 X86.767 Y81.023 E-.28269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.773 Y85.298 Z3.28 F42000
G1 Z2.88
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X88.791 Y85.299 E.00038
G1 X90.891 Y85.298 E.04355
G2 X91.5 Y80.808 I-.094 J-2.299 E.13314
G1 X91.538 Y80.599 E.00441
G1 X94.401 Y80.599 E.05938
G1 X94.401 Y99.401 E.38999
G1 X91.547 Y99.401 E.0592
G1 X91.505 Y99.198 E.0043
G1 X91.816 Y99.064 E.00702
G2 X90.809 Y94.701 I-1.019 J-2.063 E.12777
G1 X88.788 Y94.701 E.04191
G2 X88.098 Y99.193 I.015 J2.301 E.1348
G1 X88.059 Y99.401 E.00439
G1 X85.599 Y99.401 E.05103
G1 X85.599 Y80.599 E.38999
G1 X88.062 Y80.599 E.05109
G1 X88.098 Y80.811 E.00445
G2 X88.524 Y85.283 I.701 J2.189 E.1293
G1 X88.713 Y85.294 E.00394
; WIPE_START
G1 X88.791 Y85.299 E-.02983
M73 P46 R12
G1 X90.713 Y85.298 E-.73017
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.783 Y92.644 Z3.28 F42000
G1 X94.8 Y99.8 Z3.28
G1 Z2.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X92.332 Y99.02 F42000
G1 Z2.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969003
G1 F15000
M204 S6000
G1 X92.194 Y99.143 E.00064
G1 X92.105 Y99.168 E.00032
M204 S10000
G1 X91.327 Y99.325 F42000
; LINE_WIDTH: 0.529364
G1 F15000
M204 S6000
G1 X90.884 Y99.349 E.01093
G3 X88.787 Y99.35 I-1.089 J-128.053 E.05163
G1 X88.536 Y99.343 E.00619
G1 X88.526 Y99.33 E.00038
; LINE_WIDTH: 0.501017
G1 X88.327 Y99.057 E.00786
M204 S10000
G1 X87.429 Y99.189 F42000
; LINE_WIDTH: 0.126194
G1 F15000
M204 S6000
G1 X87.287 Y99.057 E.00095
; LINE_WIDTH: 0.0949044
G1 X87.173 Y98.945 E.00054
M204 S10000
G1 X86.329 Y98.764 F42000
; LINE_WIDTH: 0.0999269
G1 F15000
M204 S6000
G3 X86.256 Y98.502 I5.974 J-1.823 E.00099
M204 S10000
G1 X86.368 Y97.666 F42000
; LINE_WIDTH: 0.472078
G1 F15000
M204 S6000
G1 X86.098 Y97.479 E.00716
; LINE_WIDTH: 0.502732
G1 X86.084 Y97.469 E.00042
; LINE_WIDTH: 0.528604
G1 X86.069 Y97.458 E.00044
; LINE_WIDTH: 0.52008
G3 X86.09 Y96.284 I6.165 J-.477 E.02844
M204 S10000
G1 X86.236 Y95.435 F42000
; LINE_WIDTH: 0.132324
G1 F15000
M204 S6000
G1 X86.325 Y95.33 E.00072
; LINE_WIDTH: 0.0994664
G1 X86.478 Y95.164 E.00081
; WIPE_START
G1 X86.325 Y95.33 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.082 Y94.161 Z3.28 F42000
G1 Z2.88
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426452
G1 F15000
M204 S6000
G1 X86.796 Y93.874 E.00794
G1 X86.796 Y93.308 E.0111
G1 X87.321 Y93.833 E.01457
G3 X87.728 Y93.673 I1.208 J2.47 E.00857
G1 X86.796 Y92.741 E.02583
G1 X86.796 Y92.174 E.0111
G1 X88.182 Y93.56 E.0384
G3 X88.695 Y93.507 I.636 J3.657 E.01013
G1 X86.796 Y91.608 E.05263
G1 X86.796 Y91.041 E.0111
G1 X89.26 Y93.506 E.06829
G1 X89.828 Y93.507 E.01113
G1 X86.796 Y90.474 E.08402
G1 X86.796 Y89.908 E.0111
G1 X90.396 Y93.508 E.09976
G1 X90.964 Y93.509 E.01113
G1 X86.796 Y89.341 E.11549
G1 X86.796 Y88.774 E.0111
G1 X91.625 Y93.604 E.13381
G3 X92.578 Y93.99 I-.864 J3.5 E.02021
G1 X86.796 Y88.208 E.16021
G1 X86.796 Y87.641 E.0111
G1 X93.204 Y94.05 E.17756
G1 X93.204 Y93.483 E.0111
G1 X86.796 Y87.074 E.17756
G1 X86.796 Y86.507 E.0111
G1 X93.204 Y92.916 E.17756
G1 X93.204 Y92.35 E.0111
G1 X86.796 Y85.941 E.17756
G1 X86.796 Y85.863 E.00153
G2 X87.756 Y86.335 I2.009 J-2.876 E.02105
G1 X93.204 Y91.783 E.15095
G1 X93.204 Y91.216 E.0111
G1 X88.467 Y86.479 E.13125
G2 X89.05 Y86.495 I.434 J-5.063 E.01143
G1 X93.204 Y90.65 E.1151
G1 X93.204 Y90.083 E.0111
G1 X89.617 Y86.495 E.09941
G1 X90.183 Y86.495 E.01109
G1 X93.204 Y89.516 E.08372
G1 X93.204 Y88.95 E.0111
G1 X90.749 Y86.494 E.06803
G2 X91.283 Y86.461 I.054 J-3.483 E.01049
G1 X93.204 Y88.383 E.05324
G1 X93.204 Y87.816 E.0111
G1 X91.752 Y86.363 E.04025
G2 X92.169 Y86.214 I-.539 J-2.166 E.0087
G1 X93.204 Y87.25 E.02869
G1 X93.204 Y86.683 E.0111
G1 X92.549 Y86.027 E.01817
G2 X92.889 Y85.801 I-1.252 J-2.251 E.00802
G1 X93.382 Y86.294 E.01366
M204 S10000
G1 X93.223 Y85.361 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879014
G1 F15000
M204 S6000
G1 X93.34 Y85.257 E.00047
M204 S10000
G1 X93.54 Y84.635 F42000
; LINE_WIDTH: 0.295332
G1 F15000
M204 S6000
G1 X93.631 Y84.189 E.00601
; LINE_WIDTH: 0.270507
G1 X93.653 Y84.065 E.00151
; LINE_WIDTH: 0.224399
G1 X93.677 Y83.933 E.0013
; LINE_WIDTH: 0.181866
G1 X93.696 Y83.791 E.00109
; LINE_WIDTH: 0.143036
G1 X93.716 Y83.645 E.00085
; LINE_WIDTH: 0.101638
G1 X93.74 Y83.359 E.00106
M204 S10000
G1 X93.739 Y82.658 F42000
; LINE_WIDTH: 0.0902099
G1 F15000
M204 S6000
G1 X93.727 Y82.469 E.0006
; LINE_WIDTH: 0.117725
G1 X93.71 Y82.322 E.00066
; LINE_WIDTH: 0.152147
G1 X93.692 Y82.169 E.00095
; LINE_WIDTH: 0.194278
G1 X93.668 Y82.023 E.00122
; LINE_WIDTH: 0.242621
G1 X93.644 Y81.877 E.00157
; LINE_WIDTH: 0.269083
G1 X93.522 Y81.236 E.00777
M204 S10000
G1 X93.496 Y81.236 F42000
; LINE_WIDTH: 0.402539
G1 F15000
M204 S6000
G1 X93.764 Y82.337 E.02088
; WIPE_START
G1 X93.496 Y81.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.326 Y80.976 Z3.28 F42000
G1 Z2.88
G1 E.8 F1800
; LINE_WIDTH: 0.0972249
G1 F15000
M204 S6000
G1 X92.139 Y80.811 E.00087
M204 S10000
G1 X91.273 Y80.943 F42000
; LINE_WIDTH: 0.497274
G1 F15000
M204 S6000
G1 X91.073 Y80.672 E.00776
; LINE_WIDTH: 0.528669
G1 X91.062 Y80.657 E.00045
G1 X90.813 Y80.65 E.00613
G2 X88.603 Y80.654 I-.902 J112.159 E.05435
G1 X88.277 Y80.674 E.00801
M204 S10000
G1 X87.442 Y80.811 F42000
; LINE_WIDTH: 0.126041
G1 F15000
M204 S6000
G1 X87.357 Y80.886 E.00056
; LINE_WIDTH: 0.100184
G1 X87.212 Y81.023 E.00072
M204 S10000
G1 X86.09 Y82.284 F42000
; LINE_WIDTH: 0.520012
G1 F15000
M204 S6000
G2 X86.069 Y83.458 I6.059 J.696 E.02843
; LINE_WIDTH: 0.528598
G1 X86.084 Y83.469 E.00044
; LINE_WIDTH: 0.502713
G1 X86.098 Y83.479 E.00042
; LINE_WIDTH: 0.472046
G1 X86.368 Y83.666 E.00716
M204 S10000
G1 X86.256 Y84.502 F42000
; LINE_WIDTH: 0.100761
G1 F15000
M204 S6000
G1 X86.287 Y84.614 E.00042
G1 X86.442 Y84.79 E.00086
; WIPE_START
G1 X86.287 Y84.614 E-.50957
G1 X86.256 Y84.502 E-.25043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.337 Y90.952 Z3.28 F42000
G1 X93.764 Y96.367 Z3.28
G1 Z2.88
G1 E.8 F1800
; LINE_WIDTH: 0.404293
G1 F15000
M204 S6000
G1 X93.573 Y95.554 E.01545
G1 X93.294 Y95.444 E.00556
M204 S10000
G1 X93.542 Y95.364 F42000
; LINE_WIDTH: 0.286961
G1 F15000
M204 S6000
G3 X93.65 Y95.919 I-12.232 J2.673 E.00723
; LINE_WIDTH: 0.237695
G1 X93.667 Y96.014 E.001
; LINE_WIDTH: 0.204258
G1 X93.684 Y96.109 E.00084
; LINE_WIDTH: 0.16794
G1 X93.703 Y96.263 E.00108
; LINE_WIDTH: 0.130491
G1 X93.721 Y96.409 E.00075
; LINE_WIDTH: 0.0958648
G1 X93.739 Y96.652 E.00084
M204 S10000
G1 X93.739 Y97.348 F42000
; LINE_WIDTH: 0.0956196
G1 F15000
M204 S6000
G1 X93.722 Y97.587 E.00082
; LINE_WIDTH: 0.130023
G1 X93.703 Y97.737 E.00077
; LINE_WIDTH: 0.166952
G1 X93.685 Y97.883 E.00101
; LINE_WIDTH: 0.203222
G1 X93.666 Y97.988 E.00092
; LINE_WIDTH: 0.238703
G1 X93.649 Y98.085 E.00103
; LINE_WIDTH: 0.272804
G1 X93.632 Y98.182 E.00119
; LINE_WIDTH: 0.29254
G1 X93.515 Y98.764 E.00775
M204 S10000
G1 X93.486 Y98.764 F42000
; LINE_WIDTH: 0.437251
G1 F15000
M204 S6000
G2 X93.764 Y97.695 I-21.282 J-6.109 E.02224
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X93.558 Y98.508 E-.57675
G1 X93.486 Y98.764 E-.18325
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/166
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
M106 S196.35
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.28 I1.124 J.466 P1  F42000
G1 X96.51 Y91.473 Z3.28
G1 Z3
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X97.192 Y91.359 I1.168 J4.91 E.01334
G1 X97.316 Y90.957 E.00811
G3 X97.602 Y93.086 I-.065 J1.093 E.05812
G3 X95.604 Y92.414 I-.598 J-1.528 E.04412
G3 X95.803 Y91.497 I.903 J-.285 E.01893
G3 X97.237 Y90.937 I1.263 J1.119 E.03081
; WIPE_START
G1 X97.605 Y91.03 E-.14404
G1 X97.923 Y91.205 E-.13817
G1 X98.166 Y91.445 E-.1297
G1 X98.316 Y91.731 E-.1228
G1 X98.367 Y92.042 E-.11965
G1 X98.323 Y92.316 E-.10565
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.11 J-.499 P1  F42000
G1 X96.231 Y87.658 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.881 Y87.411 I.708 J.887 E.01362
G1 X96.891 Y86.992 E.0081
G3 X98.303 Y88.474 I.18 J1.242 E.04613
G3 X96.402 Y89.126 I-1.288 J-.656 E.04284
G3 X95.548 Y88.445 I.487 J-1.486 E.02151
G3 X96.256 Y87.149 I1.091 J-.245 E.03109
G3 X96.832 Y86.99 I1.111 J2.909 E.01154
; WIPE_START
G1 X97.219 Y87 E-.14694
G1 X97.586 Y87.104 E-.14514
G1 X97.905 Y87.294 E-.14112
G1 X98.15 Y87.55 E-.13453
G1 X98.303 Y87.847 E-.12717
G1 X98.33 Y88.017 E-.06511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I-.915 J-.802 P1  F42000
G1 X88.797 Y98.9 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F2400
M204 S1000
G3 X88.796 Y95.1 I.003 J-1.9 E.10911
G1 X90.803 Y95.1 E.03671
G3 X90.876 Y98.899 I-.003 J1.9 E.10777
G1 X88.857 Y98.9 E.03694
; WIPE_START
M204 S6000
G1 X88.797 Y98.9 E-.02282
G1 X88.573 Y98.886 E-.08549
G1 X88.425 Y98.863 E-.05674
G1 X88.204 Y98.804 E-.08711
G1 X88.064 Y98.752 E-.0569
G1 X87.827 Y98.632 E-.10053
G1 X87.702 Y98.55 E-.05706
G1 X87.582 Y98.458 E-.05741
G1 X87.47 Y98.357 E-.05742
G1 X87.366 Y98.247 E-.0573
G1 X87.272 Y98.129 E-.05752
G1 X87.187 Y98.004 E-.05729
G1 X87.179 Y97.989 E-.00638
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.116 Y90.415 Z3.4 F42000
G1 X88.797 Y84.9 Z3.4
G1 Z3
G1 E.8 F1800
G1 F2400
M204 S1000
G3 X88.796 Y81.1 I.003 J-1.9 E.10911
G1 X90.803 Y81.1 E.03671
G3 X90.876 Y84.899 I-.003 J1.9 E.10777
G1 X88.857 Y84.9 E.03694
; WIPE_START
M204 S6000
G1 X88.797 Y84.9 E-.02282
G1 X88.573 Y84.886 E-.08549
G1 X88.425 Y84.863 E-.05674
G1 X88.204 Y84.804 E-.08711
G1 X88.064 Y84.752 E-.0569
G1 X87.827 Y84.632 E-.10061
G1 X87.702 Y84.55 E-.05698
G1 X87.582 Y84.458 E-.05741
G1 X87.47 Y84.357 E-.05743
G1 X87.366 Y84.247 E-.0573
G1 X87.272 Y84.129 E-.05752
G1 X87.187 Y84.004 E-.05729
G1 X87.179 Y83.989 E-.00638
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.493 Y90.865 Z3.4 F42000
G1 X94.8 Y99.8 Z3.4
G1 Z3
G1 E.8 F1800
G1 F2400
M204 S1000
G1 X85.2 Y99.8 E.17566
G1 X85.2 Y80.2 E.35864
G1 X94.8 Y80.2 E.17566
G1 X94.8 Y99.74 E.35754
; WIPE_START
M204 S6000
G1 X92.8 Y99.752 E-.76
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




G1 X94.652 Y98.893 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.401332
G1 F2100
M204 S800
G1 X94.061 Y99.483 E.01535
G1 X93.53 Y99.483 E.00975
G1 X94.483 Y98.53 E.02477
G1 X94.483 Y97.999 E.00975
G1 X92.999 Y99.483 E.03856
G1 X92.467 Y99.483 E.00975
G1 X94.483 Y97.467 E.05235
G1 X94.483 Y96.936 E.00975
G1 X91.936 Y99.483 E.06615
G1 X91.405 Y99.483 E.00975
G1 X94.652 Y96.237 E.08431
; WIPE_START
M204 S6000
G1 X93.238 Y97.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.757 Y97.601 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2100
M204 S800
G1 X94.483 Y95.874 E.04484
G1 X94.483 Y95.343 E.00975
G1 X93.009 Y96.817 E.03828
G2 X92.925 Y96.37 I-2.767 J.292 E.00836
G1 X94.483 Y94.812 E.04048
G1 X94.483 Y94.281 E.00975
G1 X92.774 Y95.991 E.04441
G1 X92.77 Y95.982 E.00017
G2 X92.568 Y95.665 I-1.686 J.853 E.00691
G1 X94.483 Y93.749 E.04976
G1 X94.483 Y93.218 E.00975
G1 X92.316 Y95.386 E.05629
G2 X92.02 Y95.151 I-1.479 J1.561 E.00695
G1 X94.483 Y92.687 E.06398
G1 X94.484 Y92.156 E.00975
G1 X91.675 Y94.964 E.07292
G2 X91.273 Y94.835 I-.813 J1.847 E.00777
G1 X94.484 Y91.625 E.08337
G1 X94.484 Y91.094 E.00975
G1 X90.794 Y94.783 E.09582
G1 X90.263 Y94.783 E.00975
G1 X94.484 Y90.563 E.10962
G1 X94.484 Y90.031 E.00975
G1 X89.731 Y94.783 E.12341
G1 X89.2 Y94.783 E.00975
G1 X94.483 Y89.5 E.1372
G1 X94.483 Y88.969 E.00975
G1 X88.475 Y94.978 E.15604
; WIPE_START
M204 S6000
G1 X89.889 Y93.564 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.399 Y98.959 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2100
M204 S800
G1 X90.874 Y99.483 E.01363
G1 X90.343 Y99.483 E.00975
G1 X90.611 Y99.215 E.00696
G1 X90.08 Y99.216 E.00976
G1 X89.812 Y99.484 E.00696
G1 X89.281 Y99.484 E.00975
G1 X89.548 Y99.216 E.00695
G1 X89.017 Y99.216 E.00976
G1 X88.749 Y99.484 E.00694
G1 X88.218 Y99.484 E.00975
G1 X88.506 Y99.196 E.00746
G3 X88.076 Y99.094 I.528 J-3.177 E.00811
G1 X87.687 Y99.484 E.01011
G1 X87.156 Y99.484 E.00975
G1 X87.71 Y98.929 E.01439
G3 X87.395 Y98.714 I1.231 J-2.139 E.00702
G1 X86.625 Y99.484 E.01999
G1 X86.094 Y99.484 E.00975
G1 X87.125 Y98.452 E.02678
G3 X86.902 Y98.144 I1.974 J-1.662 E.00699
G1 X85.563 Y99.484 E.03479
G1 X85.517 Y99.484 E.00084
G1 X85.517 Y98.998 E.00891
G1 X86.729 Y97.786 E.03148
G3 X86.615 Y97.369 I1.573 J-.653 E.00796
G1 X85.517 Y98.467 E.02852
G1 X85.517 Y97.936 E.00975
G1 X86.779 Y96.674 E.03278
; WIPE_START
M204 S6000
G1 X85.517 Y97.936 E-.67832
G1 X85.517 Y98.151 E-.08168
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.348 Y97.573 Z3.4 F42000
G1 Z3
G1 E.8 F1800
M73 P47 R12
G1 F2100
M204 S800
G1 X86.742 Y96.179 E.0362
G3 X87.982 Y94.94 I2.068 J.829 E.03309
G1 X94.483 Y88.438 E.16884
G1 X94.483 Y87.907 E.00975
G1 X85.517 Y96.874 E.23287
G1 X85.517 Y96.343 E.00975
G1 X94.483 Y87.376 E.23287
G1 X94.483 Y86.844 E.00975
G1 X85.517 Y95.811 E.23287
G1 X85.517 Y95.28 E.00975
G1 X94.483 Y86.313 E.23287
G1 X94.483 Y85.782 E.00975
G1 X85.517 Y94.749 E.23287
G1 X85.517 Y94.218 E.00975
G1 X94.483 Y85.251 E.23287
G1 X94.483 Y84.72 E.00975
G1 X85.517 Y93.687 E.23287
G1 X85.517 Y93.156 E.00975
G1 X94.483 Y84.189 E.23287
G1 X94.483 Y83.658 E.00975
G1 X85.517 Y92.625 E.23287
G1 X85.517 Y92.093 E.00975
G1 X94.483 Y83.126 E.23287
G1 X94.483 Y82.595 E.00975
G1 X85.517 Y91.562 E.23287
G1 X85.517 Y91.031 E.00975
G1 X91.42 Y85.127 E.15331
G2 X92.926 Y83.622 I-.627 J-2.132 E.04077
G1 X94.483 Y82.064 E.04046
G1 X94.483 Y81.533 E.00975
G1 X93.015 Y83.001 E.03812
G2 X92.963 Y82.523 I-2.304 J.013 E.00885
G1 X94.483 Y81.002 E.0395
G1 X94.483 Y80.517 E.00891
G1 X94.438 Y80.517 E.00084
G1 X92.833 Y82.121 E.04167
G2 X92.647 Y81.776 I-2.469 J1.104 E.00721
G1 X93.907 Y80.517 E.0327
G1 X93.375 Y80.517 E.00975
G1 X92.412 Y81.48 E.02502
G2 X92.131 Y81.229 I-1.822 J1.757 E.00691
G1 X92.844 Y80.517 E.01851
G1 X92.313 Y80.517 E.00975
G1 X91.805 Y81.025 E.0132
G2 X91.424 Y80.874 I-.878 J1.658 E.00753
G1 X91.782 Y80.517 E.00929
G1 X91.251 Y80.517 E.00975
G1 X90.976 Y80.791 E.00713
G2 X90.453 Y80.783 I-.338 J5.212 E.00962
G1 X90.72 Y80.517 E.00693
G1 X90.188 Y80.517 E.00975
G1 X89.921 Y80.783 E.00693
G1 X89.39 Y80.783 E.00975
G1 X89.657 Y80.517 E.00693
G1 X89.126 Y80.517 E.00975
G1 X88.687 Y80.956 E.01142
; WIPE_START
M204 S6000
G1 X89.126 Y80.517 E-.23624
G1 X89.657 Y80.517 E-.20184
G1 X89.39 Y80.783 E-.14348
G1 X89.86 Y80.783 E-.17844
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.978 Y85.038 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2100
M204 S800
G1 X85.517 Y90.5 E.14184
G1 X85.517 Y89.969 E.00975
G1 X90.27 Y85.216 E.12344
G1 X89.738 Y85.216 E.00976
G1 X85.517 Y89.438 E.10964
G1 X85.517 Y88.907 E.00975
G1 X89.207 Y85.216 E.09583
G3 X88.679 Y85.213 I-.213 J-8.648 E.0097
G1 X85.517 Y88.375 E.08212
G1 X85.517 Y87.844 E.00975
G1 X88.221 Y85.139 E.07024
G3 X87.835 Y84.994 I.646 J-2.301 E.00758
G1 X85.517 Y87.313 E.06022
G1 X85.517 Y86.782 E.00975
G1 X87.502 Y84.796 E.05156
G3 X87.217 Y84.55 I1.436 J-1.951 E.00692
G1 X85.517 Y86.251 E.04416
G1 X85.517 Y85.72 E.00975
G1 X86.977 Y84.259 E.03793
G3 X86.784 Y83.921 I1.946 J-1.335 E.00716
G1 X85.517 Y85.188 E.03292
G1 X85.517 Y84.657 E.00975
G1 X86.648 Y83.526 E.02938
G3 X86.584 Y83.058 I2.31 J-.551 E.00868
G1 X85.517 Y84.126 E.02773
G1 X85.517 Y83.595 E.00975
G1 X86.652 Y82.46 E.02948
G3 X88.26 Y80.851 I2.149 J.541 E.04386
G1 X88.595 Y80.517 E.0087
G1 X88.064 Y80.517 E.00975
G1 X85.517 Y83.064 E.06615
G1 X85.517 Y82.533 E.00975
G1 X87.533 Y80.517 E.05236
G1 X87.002 Y80.517 E.00975
G1 X85.517 Y82.002 E.03857
G1 X85.517 Y81.47 E.00975
G1 X86.47 Y80.517 E.02477
G1 X85.939 Y80.517 E.00975
G1 X85.348 Y81.108 E.01535
; CHANGE_LAYER
; Z_HEIGHT: 3.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2100
M204 S6000
G1 X85.939 Y80.517 E-.31768
G1 X86.47 Y80.517 E-.20184
G1 X86.023 Y80.964 E-.24048
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/166
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
M106 S204
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.4 I-.675 J1.013 P1  F42000
G1 X96.108 Y87.682 Z3.4
G1 Z3.12
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F1200
M204 S6000
G3 X96.762 Y87.408 I.682 J.71 E.014
G1 X96.78 Y86.988 E.0081
G3 X98.288 Y88.154 I.172 J1.336 E.04083
G3 X96.752 Y89.227 I-1.256 J-.162 E.04066
G3 X95.41 Y88.359 I-.01 J-1.456 E.03262
G3 X95.931 Y87.278 I1.057 J-.156 E.02456
G3 X96.72 Y86.986 I1.137 J1.859 E.0163
; WIPE_START
G1 F9000
G1 X97.173 Y87 E-.17222
G1 X97.521 Y87.097 E-.13742
G1 X97.84 Y87.286 E-.1408
G1 X98.085 Y87.541 E-.13445
G1 X98.237 Y87.839 E-.12711
G1 X98.257 Y87.964 E-.048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.52 I-1.08 J-.561 P1  F42000
G1 X96.435 Y91.469 Z3.52
G1 Z3.12
G1 E.8 F1800
G1 F1200
M204 S6000
G3 X97.126 Y91.36 I.576 J1.413 E.01359
G1 X97.251 Y90.959 E.00811
G3 X97.536 Y93.088 I-.056 J1.091 E.05839
G3 X95.485 Y92.426 I-.617 J-1.597 E.04494
G3 X95.987 Y91.24 I1.071 J-.246 E.02653
G3 X97.171 Y90.939 I1.06 J1.691 E.02392
; WIPE_START
G1 F9000
G1 X97.538 Y91.031 E-.14376
G1 X97.857 Y91.208 E-.13852
G1 X98.1 Y91.451 E-.13051
G1 X98.251 Y91.738 E-.12316
G1 X98.302 Y92.049 E-.11971
G1 X98.257 Y92.32 E-.10434
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.52 I-.13 J-1.21 P1  F42000
G1 X87.301 Y93.501 Z3.52
G1 Z3.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z3.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/166
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.52 I.144 J1.208 P1  F42000
G1 X96.094 Y87.62 Z3.52
G1 Z3.24
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X96.806 Y87.402 I.847 J1.499 E.01446
G1 X96.834 Y86.983 E.0081
G3 X98.223 Y88.146 I.118 J1.269 E.03882
G3 X96.635 Y89.224 I-1.284 J-.183 E.04165
G3 X95.41 Y88.619 I.122 J-1.79 E.02701
G1 X95.41 Y87.714 E.01746
G3 X96.775 Y86.979 I1.445 J1.049 E.03092
M106 S204
M106 S255
; WIPE_START
G1 X97.458 Y87.091 E-.2629
G1 X97.774 Y87.278 E-.13956
G1 X98.019 Y87.533 E-.13437
G1 X98.171 Y87.831 E-.12703
M73 P48 R12
G1 X98.212 Y88.08 E-.09615
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.64 I-1.068 J-.584 P1  F42000
G1 X96.356 Y91.474 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X97.062 Y91.368 I.496 J.905 E.01404
G1 X97.144 Y90.956 E.0081
G3 X98.185 Y92.367 I-.09 J1.155 E.03832
G3 X96.622 Y93.194 I-1.366 J-.691 E.03632
G3 X95.41 Y92.504 I.154 J-1.68 E.02772
G1 X95.41 Y91.767 E.01421
G3 X97.086 Y90.945 I1.512 J.962 E.03785
M106 S204
; WIPE_START
G1 X97.472 Y91.033 E-.1502
G1 X97.79 Y91.21 E-.13852
G1 X98.033 Y91.454 E-.13104
G1 X98.185 Y91.743 E-.12375
G1 X98.236 Y92.054 E-.11986
G1 X98.195 Y92.305 E-.09663
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.64 I-.133 J-1.21 P1  F42000
G1 X87.301 Y93.501 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/166
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.64 I.156 J1.207 P1  F42000
G1 X96.203 Y87.516 Z3.64
G1 Z3.36
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X96.911 Y87.4 I.597 J1.42 E.01395
G1 X96.973 Y86.983 E.00812
G3 X98.106 Y88.448 I-.012 J1.18 E.04105
G3 X97.014 Y89.224 I-1.199 J-.531 E.0271
G3 X95.195 Y88.485 I-.341 J-1.769 E.04003
G3 X95.99 Y87.154 I1.104 J-.244 E.03295
G3 X96.913 Y86.979 I.828 J1.848 E.01826
M106 S204
M106 S255
; WIPE_START
G1 X97.57 Y87.189 E-.26223
G1 X97.953 Y87.525 E-.19383
G1 X98.106 Y87.823 E-.12698
G1 X98.157 Y88.138 E-.12136
G1 X98.133 Y88.282 E-.0556
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.76 I-1.037 J-.636 P1  F42000
G1 X96.127 Y91.554 Z3.76
G1 Z3.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.858 Y91.368 I.924 J2.098 E.0146
G1 X96.868 Y90.948 E.0081
G3 X98.118 Y92.37 I.11 J1.164 E.04253
G3 X96.335 Y93.158 I-1.377 J-.703 E.04067
G3 X95.185 Y92.152 I.084 J-1.256 E.03165
G3 X96.16 Y91.065 I1.422 J.295 E.02949
G3 X96.809 Y90.947 I.567 J1.267 E.01283
M106 S204
; WIPE_START
G1 X97.411 Y91.039 E-.23151
G1 X97.724 Y91.212 E-.13557
G1 X97.967 Y91.456 E-.13114
G1 X98.119 Y91.746 E-.12411
G1 X98.17 Y92.057 E-.11999
G1 X98.162 Y92.103 E-.01768
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.76 I-.155 J-1.207 P1  F42000
G1 X87.301 Y93.501 Z3.76
G1 Z3.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z3.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/166
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.76 I.158 J1.207 P1  F42000
G1 X96.13 Y87.507 Z3.76
G1 Z3.48
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X96.851 Y87.401 I.514 J.989 E.01429
G1 X96.952 Y86.993 E.0081
G3 X97.89 Y88.726 I-.027 J1.135 E.04599
G3 X96.431 Y89.24 I-1.217 J-1.127 E.03102
G3 X95.077 Y88.499 I.011 J-1.627 E.031
G3 X95.573 Y87.322 I.963 J-.287 E.02669
G3 X96.891 Y86.98 I1.212 J1.958 E.02664
M106 S204
; WIPE_START
G1 X97.395 Y87.125 E-.19941
G1 X97.64 Y87.27 E-.10796
G1 X97.888 Y87.518 E-.13326
G1 X98.04 Y87.815 E-.12685
G1 X98.091 Y88.13 E-.12132
G1 X98.061 Y88.315 E-.07121
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.88 I-1.044 J-.625 P1  F42000
G1 X96.159 Y91.492 Z3.88
G1 Z3.48
G1 E.8 F1800
G1 F1200
M204 S6000
G3 X96.872 Y91.373 I.538 J1.029 E.01417
G1 X96.972 Y90.965 E.0081
G3 X97.903 Y92.657 I-.015 J1.11 E.04514
G3 X95.126 Y92.458 I-1.309 J-1.204 E.06165
G3 X95.625 Y91.29 I1.016 J-.256 E.02629
G3 X96.915 Y90.951 I1.207 J1.971 E.02607
; WIPE_START
G1 F9000
G1 X97.324 Y91.039 E-.15906
G1 X97.661 Y91.216 E-.14461
G1 X97.901 Y91.458 E-.12944
G1 X98.052 Y91.747 E-.12416
G1 X98.103 Y92.059 E-.12001
G1 X98.068 Y92.274 E-.08272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.88 I-.138 J-1.209 P1  F42000
G1 X87.301 Y93.501 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z3.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/166
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z3.88 I.159 J1.207 P1  F42000
G1 X96.03 Y87.515 Z3.88
G1 Z3.6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X96.761 Y87.404 I.721 J2.295 E.01431
G1 X96.852 Y86.994 E.0081
G3 X97.975 Y88.433 I-.047 J1.195 E.04002
G3 X96.785 Y89.229 I-1.332 J-.702 E.02876
G3 X94.959 Y88.512 I-.385 J-1.703 E.04017
G1 X94.947 Y88.455 E.00112
G3 X95.455 Y87.335 I1.043 J-.202 E.02528
G3 X96.794 Y86.982 I1.267 J2.089 E.02705
M106 S204
; WIPE_START
G1 X97.205 Y87.077 E-.16052
G1 X97.56 Y87.256 E-.15108
G1 X97.821 Y87.517 E-.14027
G1 X97.974 Y87.807 E-.12462
G1 X98.026 Y88.122 E-.12126
G1 X97.999 Y88.284 E-.06225
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I-1.042 J-.629 P1  F42000
G1 X96.062 Y91.492 Z4
G1 Z3.6
G1 E.8 F1800
G1 F1200
M204 S6000
G3 X96.796 Y91.383 I.533 J1.06 E.01457
G1 X96.874 Y90.97 E.0081
G3 X98.037 Y92.06 I-.051 J1.22 E.03349
G3 X96.798 Y93.208 I-1.313 J-.175 E.0353
G3 X95.007 Y92.468 I-.335 J-1.727 E.03956
G3 X95.506 Y91.301 I1.014 J-.256 E.02628
G3 X96.816 Y90.959 I1.248 J2.102 E.02645
; WIPE_START
G1 F9000
G1 X97.445 Y91.143 E-.24922
G1 X97.836 Y91.463 E-.19203
G1 X97.986 Y91.749 E-.12258
G1 X98.037 Y92.06 E-.12001
G1 X98.005 Y92.258 E-.07616
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I-.14 J-1.209 P1  F42000
G1 X87.301 Y93.501 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
M73 P49 R12
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/166
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4 I.16 J1.206 P1  F42000
G1 X95.936 Y87.522 Z4
G1 Z3.72
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X96.676 Y87.412 I.755 J2.542 E.01447
G1 X96.763 Y87.001 E.0081
G3 X97.957 Y88.116 I-.065 J1.266 E.03422
G3 X97.115 Y89.129 I-1.173 J-.12 E.02693
G3 X95.022 Y88.799 I-.758 J-1.997 E.04272
G3 X95.338 Y87.349 I.722 J-.603 E.03298
G3 X96.706 Y86.989 I1.302 J2.17 E.02763
M106 S204
M106 S255
; WIPE_START
G1 X97.122 Y87.077 E-.16181
G1 X97.678 Y87.439 E-.25204
G1 X97.899 Y87.802 E-.16152
G1 X97.957 Y88.116 E-.12139
G1 X97.929 Y88.281 E-.06324
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.12 I-1.041 J-.631 P1  F42000
G1 X95.981 Y91.492 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.722 Y91.392 I.686 J2.292 E.01446
G1 X96.804 Y90.98 E.0081
G3 X97.913 Y92.37 I-.002 J1.139 E.03932
G3 X96.255 Y93.236 I-1.508 J-.868 E.03807
G3 X94.887 Y92.478 I.026 J-1.66 E.03139
G3 X95.386 Y91.312 I.981 J-.27 E.02639
G3 X96.746 Y90.969 I1.269 J2.164 E.02741
M106 S204
; WIPE_START
G1 X97.13 Y91.046 E-.14885
G1 X97.504 Y91.226 E-.15758
G1 X97.748 Y91.461 E-.12884
G1 X97.915 Y91.754 E-.12801
G1 X97.969 Y92.061 E-.11858
G1 X97.932 Y92.264 E-.07815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.12 I-.141 J-1.209 P1  F42000
G1 X87.301 Y93.501 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/166
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.12 I.16 J1.206 P1  F42000
G1 X95.83 Y87.532 Z4.12
G1 Z3.84
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X96.582 Y87.422 I.772 J2.657 E.0147
G1 X96.654 Y87.009 E.0081
M73 P49 R11
G3 X97.875 Y88.111 I-.028 J1.258 E.03456
G3 X96.581 Y89.25 I-1.33 J-.207 E.03606
G3 X95.464 Y89.149 I-.35 J-2.367 E.02181
G3 X95.22 Y87.362 I.158 J-.932 E.04616
G3 X96.595 Y86.998 I1.323 J2.22 E.02778
M106 S204
M106 S255
; WIPE_START
G1 X97.022 Y87.08 E-.16525
G1 X97.388 Y87.26 E-.15494
G1 X97.659 Y87.509 E-.1396
G1 X97.788 Y87.72 E-.09422
G1 X97.875 Y88.111 E-.15209
G1 X97.851 Y88.251 E-.0539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.24 I-1.04 J-.632 P1  F42000
G1 X95.874 Y91.5 Z4.24
G1 Z3.84
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.618 Y91.397 I.737 J2.584 E.01451
G1 X96.702 Y90.986 E.0081
G3 X97.885 Y92.063 I-.04 J1.233 E.03356
G3 X96.626 Y93.224 I-1.334 J-.183 E.03578
G3 X94.767 Y92.487 I-.386 J-1.739 E.04092
G3 X95.266 Y91.322 I1.01 J-.257 E.02625
G3 X96.644 Y90.974 I1.303 J2.253 E.02775
M106 S204
; WIPE_START
G1 X97.037 Y91.056 E-.15274
G1 X97.392 Y91.227 E-.1495
G1 X97.683 Y91.474 E-.14517
G1 X97.833 Y91.75 E-.11939
G1 X97.885 Y92.063 E-.12044
G1 X97.854 Y92.252 E-.07276
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.24 I-.143 J-1.209 P1  F42000
G1 X87.301 Y93.501 Z4.24
G1 Z3.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z3.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/166
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.24 I.16 J1.206 P1  F42000
G1 X95.713 Y87.546 Z4.24
G1 Z3.96
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X96.473 Y87.435 I.769 J2.624 E.01486
G1 X96.537 Y87.02 E.0081
G3 X97.797 Y88.107 I.004 J1.27 E.03498
G1 X97.749 Y88.375 E.00525
G3 X95.96 Y89.294 I-1.581 J-.877 E.04111
G3 X94.605 Y88.551 I.004 J-1.615 E.03105
G3 X95.102 Y87.375 I1.031 J-.257 E.02639
G3 X96.478 Y87.011 I1.327 J2.233 E.0278
M106 S204
M106 S255
; WIPE_START
G1 X96.931 Y87.088 E-.17442
G1 X97.293 Y87.261 E-.15255
G1 X97.562 Y87.508 E-.13878
G1 X97.735 Y87.797 E-.1282
G1 X97.797 Y88.107 E-.11983
G1 X97.775 Y88.226 E-.04622
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.36 I-1.038 J-.635 P1  F42000
G1 X95.767 Y91.508 Z4.36
G1 Z3.96
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.522 Y91.407 I.737 J2.65 E.01473
G1 X96.593 Y90.993 E.0081
G3 X97.808 Y92.064 I-.064 J1.297 E.0337
G3 X96.512 Y93.235 I-1.414 J-.262 E.03618
G3 X94.648 Y92.496 I-.388 J-1.742 E.04106
G3 X95.146 Y91.333 I1.007 J-.257 E.02623
G3 X96.534 Y90.983 I1.313 J2.285 E.02794
M106 S204
; WIPE_START
G1 X96.961 Y91.065 E-.16492
G1 X97.301 Y91.232 E-.14401
G1 X97.571 Y91.472 E-.13712
G1 X97.75 Y91.762 E-.12959
G1 X97.808 Y92.064 E-.11676
G1 X97.774 Y92.238 E-.06762
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.36 I-.146 J-1.208 P1  F42000
G1 X87.301 Y93.501 Z4.36
G1 Z3.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z3.96
M73 P50 R11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/166
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.36 I.161 J1.206 P1  F42000
G1 X95.59 Y87.56 Z4.36
G1 Z4.08
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X96.354 Y87.449 I.771 J2.616 E.01492
G1 X96.418 Y87.034 E.0081
G3 X97.638 Y87.798 I-.041 J1.423 E.02911
G3 X96.807 Y89.154 I-1.114 J.25 E.03392
G3 X94.669 Y88.839 I-.818 J-1.864 E.04392
G3 X94.984 Y87.389 I.721 J-.603 E.03297
G3 X96.359 Y87.025 I1.327 J2.234 E.02777
M106 S204
M106 S255
; WIPE_START
G1 X96.825 Y87.098 E-.17923
G1 X97.197 Y87.267 E-.15536
G1 X97.472 Y87.509 E-.13912
G1 X97.638 Y87.798 E-.12682
G1 X97.693 Y88.096 E-.1153
G1 X97.673 Y88.211 E-.04418
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.48 I-1.038 J-.636 P1  F42000
G1 X95.645 Y91.519 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.406 Y91.418 I.738 J2.659 E.01485
G1 X96.472 Y91.004 E.0081
G3 X97.703 Y92.067 I-.005 J1.251 E.03414
G3 X96.394 Y93.246 I-1.344 J-.175 E.03699
G3 X94.528 Y92.505 I-.387 J-1.746 E.04109
G3 X95.026 Y91.342 I1.006 J-.257 E.02621
G3 X96.414 Y90.994 I1.312 J2.292 E.02792
M106 S204
; WIPE_START
G1 X96.872 Y91.073 E-.17689
G1 X97.217 Y91.243 E-.14601
G1 X97.484 Y91.48 E-.13571
G1 X97.646 Y91.759 E-.12242
G1 X97.703 Y92.067 E-.11893
G1 X97.657 Y92.218 E-.06005
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.48 I-.15 J-1.208 P1  F42000
G1 X87.301 Y93.501 Z4.48
G1 Z4.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z4.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/166
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.48 I.161 J1.206 P1  F42000
G1 X95.469 Y87.574 Z4.48
G1 Z4.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X96.236 Y87.462 I.776 J2.634 E.01498
G1 X96.3 Y87.047 E.0081
G1 X96.343 Y87.054 E.00085
G3 X97.602 Y88.101 I.044 J1.228 E.03455
G3 X96.223 Y89.291 I-1.436 J-.27 E.03791
G3 X94.369 Y88.577 I-.409 J-1.701 E.04072
G3 X94.866 Y87.402 I1.03 J-.257 E.02638
G3 X96.241 Y87.038 I1.326 J2.234 E.02777
M106 S204
M106 S255
; WIPE_START
G1 X96.343 Y87.054 E-.03925
G1 X96.71 Y87.11 E-.14089
G1 X97.1 Y87.276 E-.16096
G1 X97.374 Y87.513 E-.13787
G1 X97.544 Y87.798 E-.12607
G1 X97.602 Y88.101 E-.11734
G1 X97.583 Y88.199 E-.03764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I-1.035 J-.641 P1  F42000
G1 X95.519 Y91.53 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.285 Y91.43 I.739 J2.66 E.01493
G1 X96.352 Y91.015 E.0081
G1 X96.412 Y91.025 E.00118
G3 X97.549 Y92.387 I.047 J1.117 E.03951
G3 X95.777 Y93.279 I-1.521 J-.815 E.04075
G3 X94.408 Y92.513 I.023 J-1.648 E.03152
G3 X94.907 Y91.352 I1.003 J-.257 E.0262
G3 X96.293 Y91.006 I1.309 J2.294 E.0279
M106 S204
; WIPE_START
G1 X96.412 Y91.025 E-.04568
G1 X96.764 Y91.083 E-.13571
G1 X97.136 Y91.252 E-.15512
G1 X97.392 Y91.489 E-.13265
G1 X97.553 Y91.774 E-.12429
G1 X97.611 Y92.07 E-.11462
G1 X97.585 Y92.204 E-.05192
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I-.152 J-1.207 P1  F42000
G1 X87.301 Y93.501 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/166
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.6 I.161 J1.206 P1  F42000
G1 X95.348 Y87.588 Z4.6
G1 Z4.32
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X96.118 Y87.476 I.774 J2.606 E.01504
G1 X96.182 Y87.061 E.0081
G1 X96.226 Y87.068 E.00086
G3 X97.502 Y88.105 I.067 J1.221 E.03476
G3 X96.102 Y89.306 I-1.456 J-.281 E.03836
G3 X94.252 Y88.59 I-.405 J-1.703 E.04067
G3 X94.748 Y87.415 I1.03 J-.257 E.02638
G3 X96.123 Y87.052 I1.326 J2.235 E.02777
M106 S204
M106 S255
; WIPE_START
G1 X96.226 Y87.068 E-.03949
G1 X96.593 Y87.124 E-.14098
G1 X96.994 Y87.287 E-.1647
G1 X97.28 Y87.523 E-.1409
G1 X97.446 Y87.8 E-.12288
G1 X97.502 Y88.105 E-.11753
G1 X97.486 Y88.191 E-.03351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.72 I-1.032 J-.645 P1  F42000
G1 X95.394 Y91.542 Z4.72
G1 Z4.32
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.164 Y91.441 I.741 J2.665 E.01503
G1 X96.232 Y91.026 E.0081
G1 X96.295 Y91.037 E.00123
G3 X97.523 Y92.087 I.043 J1.193 E.03422
G3 X96.631 Y93.147 I-1.249 J-.145 E.0283
G3 X94.472 Y92.8 I-.759 J-2.167 E.04392
G3 X94.787 Y91.361 I.701 J-.601 E.03288
G3 X96.173 Y91.017 I1.306 J2.295 E.02789
M106 S204
; WIPE_START
G1 X96.295 Y91.037 E-.04678
G1 X96.647 Y91.093 E-.13537
G1 X97.042 Y91.263 E-.16352
G1 X97.195 Y91.39 E-.07539
G1 X97.47 Y91.78 E-.18139
G1 X97.523 Y92.087 E-.11838
G1 X97.506 Y92.188 E-.03917
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.72 I-.155 J-1.207 P1  F42000
G1 X87.301 Y93.501 Z4.72
G1 Z4.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z4.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/166
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.72 I.162 J1.206 P1  F42000
G1 X95.228 Y87.602 Z4.72
G1 Z4.44
M73 P51 R11
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X96 Y87.489 I.775 J2.602 E.01508
G1 X96.064 Y87.074 E.0081
G1 X96.108 Y87.081 E.00087
G3 X97.405 Y88.111 I.062 J1.253 E.03485
G3 X96.455 Y89.194 I-1.381 J-.253 E.02916
G3 X94.315 Y88.877 I-.794 J-2.02 E.04365
G3 X94.63 Y87.428 I.72 J-.602 E.03296
G3 X96.005 Y87.065 I1.325 J2.236 E.02777
M106 S204
M106 S255
; WIPE_START
G1 X96.108 Y87.081 E-.03967
G1 X96.475 Y87.138 E-.1409
G1 X96.877 Y87.3 E-.16477
G1 X97.175 Y87.533 E-.14371
G1 X97.347 Y87.811 E-.12421
G1 X97.405 Y88.111 E-.11608
G1 X97.39 Y88.19 E-.03066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.84 I-1.029 J-.649 P1  F42000
G1 X95.269 Y91.552 Z4.84
G1 Z4.44
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X96.044 Y91.452 I.742 J2.67 E.01511
G1 X96.112 Y91.037 E.0081
G1 X96.177 Y91.048 E.00128
G3 X97.441 Y92.092 I.048 J1.229 E.03458
G3 X96.511 Y93.158 I-1.315 J-.208 E.02875
G3 X94.353 Y92.808 I-.776 J-2.048 E.04414
G3 X94.667 Y91.37 I.7 J-.601 E.03287
G3 X96.054 Y91.028 I1.302 J2.296 E.02788
M106 S204
; WIPE_START
G1 X96.177 Y91.048 E-.04767
G1 X96.528 Y91.105 E-.13492
G1 X96.933 Y91.271 E-.16645
G1 X97.22 Y91.509 E-.14174
G1 X97.387 Y91.785 E-.12261
G1 X97.441 Y92.092 E-.11825
G1 X97.428 Y92.165 E-.02836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.84 I-.159 J-1.207 P1  F42000
G1 X87.301 Y93.501 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z4.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/166
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.84 I.162 J1.206 P1  F42000
G1 X95.109 Y87.616 Z4.84
G1 Z4.56
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X95.882 Y87.503 I.774 J2.597 E.0151
G1 X95.946 Y87.088 E.0081
G1 X96.051 Y87.104 E.00205
G3 X97.3 Y88.118 I.014 J1.259 E.03366
G3 X96.337 Y89.207 I-1.308 J-.187 E.02967
G3 X94.197 Y88.89 I-.792 J-2.031 E.04363
G3 X94.512 Y87.441 I.72 J-.602 E.03296
G3 X95.887 Y87.079 I1.324 J2.236 E.02777
M106 S204
M106 S255
; WIPE_START
G1 X96.051 Y87.104 E-.06279
G1 X96.357 Y87.151 E-.1178
G1 X96.76 Y87.314 E-.16497
G1 X97.061 Y87.546 E-.14468
G1 X97.242 Y87.821 E-.12512
G1 X97.3 Y88.118 E-.11511
G1 X97.285 Y88.195 E-.02954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.96 I-1.027 J-.652 P1  F42000
G1 X95.147 Y91.562 Z4.96
G1 Z4.56
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X95.924 Y91.462 I.74 J2.675 E.01515
G1 X95.992 Y91.048 E.0081
G1 X96.06 Y91.059 E.00132
G3 X97.344 Y92.097 I.04 J1.264 E.03468
G3 X96.392 Y93.169 I-1.254 J-.155 E.02938
G3 X94.233 Y92.816 I-.771 J-2.061 E.04414
G3 X94.547 Y91.378 I.699 J-.601 E.03286
G3 X95.934 Y91.038 I1.298 J2.296 E.02787
M106 S204
; WIPE_START
G1 X96.06 Y91.059 E-.04855
G1 X96.408 Y91.116 E-.13414
G1 X96.814 Y91.282 E-.16674
G1 X97.114 Y91.518 E-.14497
G1 X97.287 Y91.796 E-.12456
G1 X97.344 Y92.097 E-.11632
G1 X97.332 Y92.161 E-.02472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.96 I-.161 J-1.206 P1  F42000
G1 X87.301 Y93.501 Z4.96
G1 Z4.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z4.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/166
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z4.96 I.162 J1.206 P1  F42000
G1 X94.991 Y87.629 Z4.96
G1 Z4.68
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X95.764 Y87.516 I.773 J2.597 E.01511
G1 X95.828 Y87.101 E.0081
G1 X95.874 Y87.108 E.00089
G3 X97.184 Y88.128 I.052 J1.285 E.0348
G3 X96.219 Y89.221 I-1.411 J-.274 E.02946
G3 X94.079 Y88.902 I-.792 J-2.03 E.04364
G3 X94.394 Y87.453 I.719 J-.602 E.03295
G3 X95.769 Y87.092 I1.323 J2.236 E.02776
M106 S204
M106 S255
; WIPE_START
G1 X95.874 Y87.108 E-.04007
G1 X96.239 Y87.164 E-.14055
G1 X96.642 Y87.327 E-.165
G1 X96.943 Y87.559 E-.14445
G1 X97.124 Y87.833 E-.12492
G1 X97.184 Y88.128 E-.1145
G1 X97.168 Y88.207 E-.03051
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.08 I-1.026 J-.654 P1  F42000
G1 X95.025 Y91.572 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X95.803 Y91.472 I.738 J2.677 E.01518
G1 X95.872 Y91.058 E.0081
G1 X95.942 Y91.069 E.00137
G3 X97.182 Y91.806 I-.076 J1.54 E.02892
G3 X96.684 Y92.974 I-.948 J.286 E.02657
G3 X94.113 Y92.823 I-1.18 J-1.869 E.05298
G3 X94.427 Y91.386 I.697 J-.6 E.03285
G3 X95.814 Y91.048 I1.294 J2.298 E.02786
M106 S204
; WIPE_START
G1 X95.942 Y91.069 E-.04948
G1 X96.289 Y91.127 E-.13329
G1 X96.695 Y91.294 E-.1671
G1 X97 Y91.529 E-.14629
G1 X97.182 Y91.806 E-.12581
G1 X97.24 Y92.103 E-.11524
G1 X97.228 Y92.162 E-.02279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.08 I-.163 J-1.206 P1  F42000
G1 X87.301 Y93.501 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/166
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.08 I.163 J1.206 P1  F42000
G1 X94.873 Y87.642 Z5.08
G1 Z4.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X95.646 Y87.529 I.772 J2.595 E.01511
G1 X95.71 Y87.114 E.0081
G1 X95.756 Y87.121 E.00091
G3 X97.066 Y88.141 I.051 J1.286 E.03478
G1 X97.019 Y88.378 E.00466
G3 X95.408 Y89.371 I-1.597 J-.788 E.03846
G3 X93.78 Y88.64 I-.235 J-1.655 E.0363
G3 X94.276 Y87.466 I1.027 J-.258 E.02636
G3 X95.651 Y87.105 I1.322 J2.236 E.02776
M106 S204
M106 S255
; WIPE_START
G1 X95.756 Y87.121 E-.04032
G1 X96.121 Y87.178 E-.14032
G1 X96.524 Y87.341 E-.16505
G1 X96.825 Y87.572 E-.14448
M73 P52 R11
G1 X97.006 Y87.846 E-.12481
G1 X97.066 Y88.141 E-.11434
G1 X97.051 Y88.22 E-.03068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I-1.026 J-.655 P1  F42000
G1 X94.904 Y91.58 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X95.683 Y91.482 I.734 J2.68 E.01518
G1 X95.752 Y91.068 E.0081
G1 X95.825 Y91.08 E.00142
G3 X97.063 Y91.816 I-.08 J1.544 E.02889
G3 X96.564 Y92.984 I-1.015 J.257 E.0263
G3 X93.993 Y92.83 I-1.178 J-1.87 E.053
G3 X94.307 Y91.394 I.696 J-.6 E.03283
G3 X95.694 Y91.058 I1.291 J2.299 E.02786
M106 S204
; WIPE_START
G1 X95.825 Y91.08 E-.05044
G1 X96.169 Y91.137 E-.13243
G1 X96.576 Y91.305 E-.16725
G1 X96.88 Y91.54 E-.1462
G1 X97.063 Y91.816 E-.12592
G1 X97.123 Y92.111 E-.11451
G1 X97.111 Y92.172 E-.02326
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I-.163 J-1.206 P1  F42000
G1 X87.301 Y93.501 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/166
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.2 I.163 J1.206 P1  F42000
G1 X94.754 Y87.654 Z5.2
G1 Z4.92
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X95.527 Y87.542 I.771 J2.595 E.01511
G1 X95.592 Y87.127 E.0081
G1 X95.639 Y87.135 E.00092
G3 X96.949 Y88.155 I.05 J1.286 E.03477
G1 X96.901 Y88.392 E.00467
G3 X95.511 Y89.372 I-1.524 J-.686 E.0344
G1 X95.199 Y89.389 E.00603
G3 X93.662 Y88.652 I-.156 J-1.645 E.03452
G3 X94.158 Y87.479 I1.026 J-.257 E.02635
G3 X95.533 Y87.118 I1.321 J2.237 E.02776
M106 S204
M106 S255
; WIPE_START
G1 X95.639 Y87.135 E-.04056
G1 X96.003 Y87.191 E-.14009
G1 X96.406 Y87.354 E-.16507
G1 X96.707 Y87.586 E-.1445
G1 X96.889 Y87.86 E-.12483
G1 X96.949 Y88.155 E-.11435
G1 X96.933 Y88.234 E-.03059
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.32 I-1.025 J-.657 P1  F42000
G1 X94.783 Y91.589 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X95.562 Y91.491 I.73 J2.68 E.01519
G1 X95.632 Y91.077 E.0081
G1 X95.707 Y91.09 E.00147
G3 X97.004 Y92.122 I.017 J1.309 E.03459
G3 X96.034 Y93.199 I-1.385 J-.272 E.02934
G3 X95.285 Y93.327 I-.681 J-1.73 E.01475
G3 X93.689 Y92.555 I-.158 J-1.708 E.03591
G3 X94.187 Y91.401 I.988 J-.258 E.02609
G3 X95.574 Y91.067 I1.287 J2.3 E.02785
M106 S204
; WIPE_START
G1 X95.707 Y91.09 E-.05142
G1 X96.049 Y91.147 E-.13154
G1 X96.456 Y91.315 E-.16737
G1 X96.761 Y91.551 E-.14636
G1 X96.944 Y91.827 E-.12588
G1 X97.004 Y92.122 E-.11439
G1 X96.992 Y92.182 E-.02303
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.32 I-.164 J-1.206 P1  F42000
G1 X87.301 Y93.501 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z4.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/166
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.32 I.164 J1.206 P1  F42000
G1 X94.636 Y87.667 Z5.32
G1 Z5.04
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X95.409 Y87.555 I.77 J2.597 E.01511
G1 X95.474 Y87.14 E.0081
G1 X95.522 Y87.148 E.00093
G3 X96.831 Y88.168 I.049 J1.287 E.03477
G1 X96.783 Y88.406 E.00468
G3 X95.171 Y89.397 I-1.596 J-.791 E.03845
G3 X93.544 Y88.664 I-.233 J-1.656 E.03629
G3 X94.04 Y87.491 I1.026 J-.257 E.02634
G3 X95.416 Y87.131 I1.321 J2.238 E.02776
M106 S204
M106 S255
; WIPE_START
G1 X95.522 Y87.148 E-.04084
G1 X95.885 Y87.204 E-.13985
G1 X96.288 Y87.367 E-.16511
G1 X96.589 Y87.599 E-.14451
G1 X96.771 Y87.873 E-.12486
G1 X96.831 Y88.168 E-.11435
G1 X96.815 Y88.247 E-.03048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.44 I-1.024 J-.658 P1  F42000
G1 X94.663 Y91.596 Z5.44
G1 Z5.04
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X95.442 Y91.5 I.726 J2.684 E.01519
G1 X95.512 Y91.086 E.0081
G1 X95.59 Y91.1 E.00152
G3 X96.884 Y92.133 I.013 J1.311 E.03456
G1 X96.823 Y92.438 E.00598
G3 X94.468 Y93.259 I-1.697 J-1.079 E.05187
G3 X93.509 Y92.264 I.288 J-1.236 E.02817
G3 X94.478 Y91.209 I1.358 J.275 E.02902
G3 X95.454 Y91.077 I.814 J2.341 E.01911
M106 S204
; WIPE_START
G1 X95.59 Y91.1 E-.05244
G1 X95.929 Y91.157 E-.13061
G1 X96.336 Y91.326 E-.1675
G1 X96.641 Y91.562 E-.14651
G1 X96.824 Y91.838 E-.12599
G1 X96.884 Y92.133 E-.11442
G1 X96.873 Y92.191 E-.02254
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.44 I-.165 J-1.206 P1  F42000
G1 X87.301 Y93.501 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z5.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/166
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.44 I.164 J1.206 P1  F42000
G1 X94.518 Y87.68 Z5.44
G1 Z5.16
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X95.291 Y87.568 I.769 J2.599 E.01511
G1 X95.356 Y87.153 E.0081
G1 X95.404 Y87.161 E.00095
G3 X96.713 Y88.182 I.048 J1.287 E.03476
G1 X96.665 Y88.42 E.00469
G3 X95.276 Y89.398 I-1.522 J-.687 E.03436
G1 X94.852 Y89.42 E.00818
G3 X93.425 Y88.676 I-.046 J-1.651 E.0324
G3 X93.922 Y87.504 I1.025 J-.257 E.02634
G3 X95.298 Y87.144 I1.32 J2.239 E.02776
M106 S204
M106 S255
; WIPE_START
G1 X95.404 Y87.161 E-.04111
G1 X95.767 Y87.217 E-.13961
G1 X96.17 Y87.381 E-.16513
G1 X96.472 Y87.613 E-.14457
G1 X96.653 Y87.887 E-.12486
G1 X96.713 Y88.182 E-.11436
G1 X96.697 Y88.26 E-.03036
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I-1.022 J-.66 P1  F42000
G1 X94.538 Y91.605 Z5.56
G1 Z5.16
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X95.319 Y91.509 I.72 J2.657 E.01522
G1 X95.387 Y91.095 E.0081
G3 X96.704 Y91.849 I-.086 J1.678 E.03036
G3 X96.206 Y93.015 I-1.01 J.258 E.02627
G3 X93.634 Y92.847 I-1.17 J-1.874 E.05305
G3 X93.947 Y91.414 I.69 J-.6 E.03281
G3 X95.329 Y91.085 I1.276 J2.298 E.02773
M106 S204
; WIPE_START
G1 X95.809 Y91.166 E-.18507
G1 X96.216 Y91.336 E-.16765
G1 X96.521 Y91.572 E-.14664
G1 X96.704 Y91.849 E-.1261
G1 X96.765 Y92.144 E-.11444
G1 X96.754 Y92.196 E-.02009
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I-.166 J-1.206 P1  F42000
G1 X87.301 Y93.501 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
M73 P53 R11
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/166
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.56 I.165 J1.206 P1  F42000
G1 X94.4 Y87.692 Z5.56
G1 Z5.28
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X95.173 Y87.581 I.768 J2.601 E.01511
G1 X95.238 Y87.166 E.0081
G1 X95.348 Y87.183 E.00215
G3 X96.595 Y88.195 I.006 J1.267 E.03352
G1 X96.547 Y88.434 E.0047
G3 X94.933 Y89.423 I-1.596 J-.794 E.03847
G3 X93.327 Y88.725 I-.226 J-1.676 E.03547
G3 X93.804 Y87.516 I.963 J-.319 E.02719
G3 X95.18 Y87.157 I1.319 J2.24 E.02776
M106 S204
M106 S255
; WIPE_START
G1 X95.348 Y87.183 E-.06487
G1 X95.649 Y87.23 E-.11584
G1 X96.052 Y87.394 E-.16518
G1 X96.354 Y87.626 E-.14459
G1 X96.535 Y87.9 E-.1249
G1 X96.595 Y88.195 E-.11436
G1 X96.579 Y88.273 E-.03025
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.68 I-1.022 J-.661 P1  F42000
G1 X94.42 Y91.611 Z5.68
G1 Z5.28
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X95.2 Y91.518 I.717 J2.679 E.0152
G1 X95.271 Y91.104 E.0081
G1 X95.356 Y91.118 E.00167
G3 X96.585 Y91.859 I-.094 J1.545 E.02877
G3 X96.087 Y93.024 I-1.008 J.258 E.02625
G3 X93.513 Y92.852 I-1.167 J-1.876 E.0531
G3 X93.826 Y91.42 I.707 J-.596 E.03263
G3 X95.212 Y91.094 I1.273 J2.303 E.02779
M106 S204
; WIPE_START
G1 X95.356 Y91.118 E-.05532
G1 X95.689 Y91.175 E-.12851
G1 X96.09 Y91.343 E-.16503
G1 X96.402 Y91.583 E-.14963
G1 X96.585 Y91.859 E-.12602
G1 X96.645 Y92.155 E-.11448
G1 X96.634 Y92.209 E-.021
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.68 I-.167 J-1.205 P1  F42000
G1 X87.301 Y93.501 Z5.68
G1 Z5.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z5.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/166
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.68 I.166 J1.206 P1  F42000
G1 X94.282 Y87.705 Z5.68
G1 Z5.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X95.055 Y87.594 I.766 J2.6 E.01509
G1 X95.12 Y87.179 E.0081
G1 X95.17 Y87.187 E.00097
G3 X96.477 Y88.208 I.046 J1.288 E.03475
G3 X95.512 Y89.299 I-1.407 J-.272 E.02944
G3 X93.424 Y89.02 I-.794 J-2.009 E.04242
G3 X93.686 Y87.528 I.697 J-.647 E.03379
G3 X95.062 Y87.17 I1.318 J2.243 E.02775
M106 S204
M106 S255
; WIPE_START
G1 X95.17 Y87.187 E-.04153
G1 X95.531 Y87.243 E-.13919
G1 X95.934 Y87.407 E-.16522
G1 X96.236 Y87.639 E-.14464
G1 X96.417 Y87.913 E-.12492
G1 X96.477 Y88.208 E-.11437
G1 X96.462 Y88.286 E-.03013
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I-1.021 J-.662 P1  F42000
G1 X94.302 Y91.617 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X95.082 Y91.526 I.709 J2.693 E.01518
G1 X95.154 Y91.112 E.0081
G3 X96.465 Y91.87 I-.07 J1.636 E.03035
G3 X95.669 Y93.18 I-1.074 J.245 E.0327
G3 X93.306 Y92.741 I-.879 J-1.844 E.04953
G3 X93.706 Y91.425 I.873 J-.453 E.02933
G3 X95.096 Y91.102 I1.269 J2.304 E.02786
M106 S204
; WIPE_START
G1 X95.569 Y91.184 E-.18264
G1 X95.973 Y91.353 E-.1663
G1 X96.282 Y91.593 E-.14864
G1 X96.465 Y91.87 E-.12622
G1 X96.526 Y92.165 E-.1145
G1 X96.514 Y92.221 E-.0217
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I-.167 J-1.205 P1  F42000
G1 X87.301 Y93.501 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/166
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.8 I.166 J1.206 P1  F42000
G1 X94.165 Y87.717 Z5.8
G1 Z5.52
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X94.937 Y87.607 I.764 J2.599 E.01508
G1 X95.002 Y87.192 E.0081
G1 X95.052 Y87.2 E.00098
G3 X96.359 Y88.222 I.045 J1.289 E.03474
G1 X96.311 Y88.462 E.00473
G3 X94.922 Y89.436 I-1.521 J-.692 E.0343
G3 X93.171 Y88.867 I-.387 J-1.787 E.03719
G3 X93.353 Y87.721 I.822 J-.457 E.0241
G3 X94.944 Y87.183 I1.46 J1.695 E.03319
M106 S204
M106 S255
; WIPE_START
G1 X95.052 Y87.2 E-.04188
G1 X95.414 Y87.256 E-.13889
G1 X95.816 Y87.42 E-.16524
G1 X96.118 Y87.652 E-.14469
G1 X96.299 Y87.927 E-.12495
G1 X96.359 Y88.222 E-.11437
G1 X96.344 Y88.299 E-.02998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P53 R10
G3 Z5.92 I-1.02 J-.663 P1  F42000
G1 X94.185 Y91.622 Z5.92
G1 Z5.52
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.964 Y91.534 I.7 J2.697 E.01517
G1 X95.037 Y91.12 E.0081
G3 X96.346 Y91.879 I-.074 J1.636 E.03032
G3 X95.546 Y93.19 I-1.073 J.245 E.03276
G3 X93.189 Y92.737 I-.885 J-1.749 E.04977
G3 X93.582 Y91.431 I.843 J-.459 E.02924
G3 X94.978 Y91.11 I1.266 J2.31 E.02797
M106 S204
; WIPE_START
G1 X95.449 Y91.193 E-.18161
G1 X95.856 Y91.363 E-.16758
G1 X96.162 Y91.602 E-.14762
G1 X96.346 Y91.879 E-.12641
G1 X96.406 Y92.175 E-.11453
G1 X96.394 Y92.232 E-.02224
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.92 I-.168 J-1.205 P1  F42000
G1 X87.301 Y93.501 Z5.92
G1 Z5.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z5.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/166
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z5.92 I.167 J1.205 P1  F42000
G1 X94.047 Y87.728 Z5.92
G1 Z5.64
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X94.818 Y87.619 I.763 J2.609 E.01506
G1 X94.884 Y87.204 E.0081
G1 X94.935 Y87.212 E.001
G3 X96.241 Y88.235 I.044 J1.289 E.03472
G1 X96.193 Y88.477 E.00475
G3 X94.804 Y89.448 I-1.605 J-.815 E.03402
G3 X93.055 Y88.872 I-.365 J-1.835 E.03711
G3 X93.484 Y87.532 I.879 J-.458 E.03017
G3 X94.826 Y87.195 I1.28 J2.262 E.02699
M106 S204
M106 S255
; WIPE_START
G1 X94.935 Y87.212 E-.04226
G1 X95.296 Y87.269 E-.13856
G1 X95.698 Y87.433 E-.16526
G1 X96 Y87.665 E-.14471
M73 P54 R10
G1 X96.181 Y87.94 E-.125
G1 X96.241 Y88.235 E-.11439
G1 X96.226 Y88.312 E-.02983
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I-1.02 J-.664 P1  F42000
G1 X94.067 Y91.627 Z6.04
G1 Z5.64
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.846 Y91.542 I.69 J2.701 E.01516
G1 X94.919 Y91.128 E.0081
G3 X96.226 Y91.889 I-.079 J1.637 E.03029
G3 X95.423 Y93.2 I-1.072 J.245 E.03281
G3 X93.072 Y92.734 I-.853 J-1.863 E.04935
G3 X93.54 Y91.397 I.847 J-.454 E.03072
G3 X94.861 Y91.118 I1.178 J2.312 E.02633
M106 S204
; WIPE_START
G1 X95.329 Y91.201 E-.18055
G1 X95.737 Y91.372 E-.16822
G1 X96.042 Y91.611 E-.14729
G1 X96.226 Y91.889 E-.12658
G1 X96.286 Y92.184 E-.11457
G1 X96.275 Y92.243 E-.0228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I-.169 J-1.205 P1  F42000
G1 X87.301 Y93.501 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/166
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.04 I.168 J1.205 P1  F42000
G1 X93.93 Y87.74 Z6.04
G1 Z5.76
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X94.7 Y87.632 I.761 J2.621 E.01504
G1 X94.766 Y87.217 E.0081
G1 X94.818 Y87.225 E.00102
G3 X96.123 Y88.248 I.043 J1.29 E.03471
G3 X95.159 Y89.337 I-1.421 J-.286 E.02938
G3 X92.94 Y88.878 I-.765 J-1.897 E.0463
G3 X93.49 Y87.478 I.897 J-.456 E.03275
G3 X94.707 Y87.208 I1.153 J2.316 E.02429
M106 S204
M106 S255
; WIPE_START
G1 X94.818 Y87.225 E-.0426
G1 X95.178 Y87.282 E-.13824
G1 X95.581 Y87.446 E-.16532
G1 X95.882 Y87.678 E-.14472
G1 X96.064 Y87.953 E-.12504
G1 X96.123 Y88.248 E-.11439
G1 X96.108 Y88.324 E-.0297
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.16 I-1.019 J-.665 P1  F42000
G1 X93.95 Y91.631 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.729 Y91.549 I.68 J2.716 E.01514
G1 X94.802 Y91.135 E.0081
G3 X96.106 Y91.898 I-.083 J1.638 E.03026
G3 X95.299 Y93.209 I-1.077 J.241 E.03285
G3 X92.954 Y92.732 I-.844 J-1.853 E.0493
G3 X93.548 Y91.338 I.871 J-.453 E.03338
G3 X94.744 Y91.125 I1.045 J2.409 E.02363
M106 S204
; WIPE_START
G1 X95.209 Y91.208 E-.17939
G1 X95.617 Y91.381 E-.16837
G1 X95.923 Y91.62 E-.14747
G1 X96.106 Y91.898 E-.12671
G1 X96.167 Y92.194 E-.1146
G1 X96.155 Y92.254 E-.02346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.16 I-.17 J-1.205 P1  F42000
G1 X87.301 Y93.501 Z6.16
G1 Z5.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z5.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 5.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/166
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.16 I.169 J1.205 P1  F42000
G1 X93.813 Y87.751 Z6.16
G1 Z5.88
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X94.582 Y87.644 I.757 J2.634 E.01503
G1 X94.648 Y87.229 E.0081
G1 X94.764 Y87.248 E.00227
G3 X96.006 Y88.261 I-.001 J1.268 E.03343
G3 X95.197 Y89.27 I-1.258 J-.179 E.02614
G3 X92.824 Y88.883 I-.933 J-1.752 E.04979
G3 X93.085 Y87.692 I.801 J-.449 E.02572
G3 X94.589 Y87.22 I1.47 J2.055 E.03091
M106 S204
M106 S255
; WIPE_START
G1 X94.764 Y87.248 E-.06715
G1 X95.06 Y87.294 E-.11374
G1 X95.463 Y87.458 E-.16535
G1 X95.764 Y87.691 E-.14479
G1 X95.946 Y87.966 E-.12503
G1 X96.006 Y88.261 E-.11439
G1 X95.99 Y88.337 E-.02954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.28 I-1.018 J-.666 P1  F42000
G1 X93.833 Y91.635 Z6.28
G1 Z5.88
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.611 Y91.556 I.541 J1.442 E.01524
G1 X94.685 Y91.142 E.0081
G3 X95.987 Y91.907 I-.087 J1.638 E.03023
G3 X95.176 Y93.218 I-1.074 J.242 E.03292
G3 X92.837 Y92.73 I-.834 J-1.852 E.04924
G3 X93.099 Y91.554 I.765 J-.446 E.02553
G3 X94.627 Y91.132 I1.403 J2.101 E.03108
M106 S204
; WIPE_START
G1 X95.089 Y91.215 E-.17821
G1 X95.497 Y91.388 E-.16855
G1 X95.803 Y91.628 E-.14764
G1 X95.987 Y91.907 E-.12685
G1 X96.047 Y92.202 E-.11464
G1 X96.034 Y92.265 E-.02412
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.28 I-.171 J-1.205 P1  F42000
G1 X87.301 Y93.501 Z6.28
G1 Z5.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z5.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/166
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.28 I.167 J1.205 P1  F42000
G1 X93.699 Y87.774 Z6.28
G1 Z6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X94.464 Y87.656 I1.144 J4.897 E.01493
G1 X94.53 Y87.241 E.0081
G1 X94.647 Y87.26 E.00229
G3 X95.888 Y88.274 I-.002 J1.269 E.03342
G1 X95.839 Y88.517 E.00479
G3 X94.451 Y89.485 I-1.516 J-.697 E.0342
G3 X92.708 Y88.888 I-.306 J-1.949 E.03695
G3 X92.967 Y87.709 I.79 J-.444 E.02546
G3 X94.471 Y87.232 I1.486 J2.078 E.03093
M106 S204
M106 S255
; WIPE_START
G1 X94.647 Y87.26 E-.06771
G1 X94.942 Y87.307 E-.11324
G1 X95.345 Y87.471 E-.16539
G1 X95.646 Y87.704 E-.14485
G1 X95.828 Y87.979 E-.12506
G1 X95.888 Y88.274 E-.11441
G1 X95.873 Y88.349 E-.02934
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I-1.019 J-.665 P1  F42000
G1 X93.72 Y91.651 Z6.4
G1 Z6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.493 Y91.562 I.86 J4.06 E.01503
G1 X94.569 Y91.149 E.0081
G3 X95.867 Y91.915 I-.092 J1.639 E.03019
G3 X95.052 Y93.227 I-1.071 J.244 E.03301
G3 X92.72 Y92.726 I-.825 J-1.84 E.04921
G3 X92.979 Y91.563 I.755 J-.442 E.02528
G3 X94.51 Y91.138 I1.409 J2.109 E.03115
M106 S204
; WIPE_START
G1 X94.969 Y91.222 E-.177
M73 P55 R10
G1 X95.377 Y91.396 E-.16872
G1 X95.683 Y91.636 E-.14782
G1 X95.867 Y91.915 E-.12698
G1 X95.927 Y92.211 E-.11468
G1 X95.914 Y92.275 E-.0248
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I-.171 J-1.205 P1  F42000
G1 X87.301 Y93.501 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/166
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.4 I.166 J1.206 P1  F42000
G1 X93.585 Y87.795 Z6.4
G1 Z6.12
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X94.345 Y87.668 I.822 J2.573 E.01491
G1 X94.411 Y87.253 E.0081
G1 X94.468 Y87.262 E.0011
G3 X95.77 Y88.287 I.038 J1.291 E.03466
G3 X94.805 Y89.374 I-1.401 J-.271 E.0294
G3 X92.592 Y88.891 I-.744 J-1.902 E.04628
G3 X92.849 Y87.725 I.779 J-.44 E.02519
G3 X94.353 Y87.244 I1.51 J2.129 E.03093
M106 S204
M106 S255
; WIPE_START
G1 X94.468 Y87.262 E-.04417
G1 X94.823 Y87.319 E-.13685
G1 X95.227 Y87.484 E-.16544
G1 X95.528 Y87.717 E-.14489
G1 X95.71 Y87.991 E-.12512
G1 X95.77 Y88.287 E-.11441
G1 X95.755 Y88.362 E-.02912
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I-1.018 J-.667 P1  F42000
G1 X93.586 Y91.67 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.354 Y91.564 I.744 J2.566 E.015
G1 X94.43 Y91.151 E.0081
G3 X95.747 Y91.923 I-.09 J1.662 E.03056
G3 X95.249 Y93.08 I-.995 J.257 E.02613
G3 X92.602 Y92.722 I-1.109 J-1.761 E.05591
G3 X92.86 Y91.571 I.745 J-.438 E.02502
G3 X94.372 Y91.14 I1.477 J2.319 E.03074
M106 S204
; WIPE_START
G1 X94.848 Y91.228 E-.184
G1 X95.257 Y91.403 E-.16889
G1 X95.563 Y91.644 E-.14799
G1 X95.747 Y91.923 E-.12714
G1 X95.808 Y92.219 E-.11473
G1 X95.799 Y92.264 E-.01724
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I-.175 J-1.204 P1  F42000
G1 X87.301 Y93.501 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/166
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.52 I.166 J1.206 P1  F42000
G1 X93.467 Y87.814 Z6.52
G1 Z6.24
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X94.226 Y87.68 I.875 J2.726 E.0149
G1 X94.293 Y87.265 E.0081
G1 X94.351 Y87.274 E.00114
G3 X95.652 Y88.299 I.036 J1.292 E.03464
G3 X94.688 Y89.386 I-1.416 J-.285 E.02934
G3 X92.477 Y88.894 I-.739 J-1.894 E.04631
G3 X92.73 Y87.741 I.767 J-.436 E.02494
G3 X94.234 Y87.256 I1.665 J2.589 E.03081
M106 S204
M106 S255
; WIPE_START
G1 X94.351 Y87.274 E-.04496
G1 X94.705 Y87.331 E-.13633
G1 X95.109 Y87.496 E-.16551
G1 X95.41 Y87.729 E-.14496
G1 X95.592 Y88.004 E-.12516
G1 X95.652 Y88.299 E-.11441
G1 X95.637 Y88.373 E-.02868
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.64 I-1.019 J-.665 P1  F42000
G1 X93.485 Y91.674 Z6.64
G1 Z6.24
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.256 Y91.573 I.783 J2.991 E.01503
G1 X94.333 Y91.16 E.0081
G3 X95.627 Y91.931 I-.108 J1.653 E.03014
G3 X95.043 Y93.129 I-1.004 J.251 E.0279
G3 X92.485 Y92.716 I-1.016 J-1.842 E.05381
G3 X92.74 Y91.578 I.735 J-.433 E.02476
G3 X94.275 Y91.15 I1.384 J1.996 E.0313
M106 S204
; WIPE_START
G1 X94.72 Y91.233 E-.17211
G1 X95.137 Y91.41 E-.17222
G1 X95.443 Y91.651 E-.14803
G1 X95.627 Y91.931 E-.1273
G1 X95.688 Y92.227 E-.11476
G1 X95.674 Y92.293 E-.02557
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.64 I-.174 J-1.204 P1  F42000
G1 X87.301 Y93.501 Z6.64
G1 Z6.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z6.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/166
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.64 I.166 J1.206 P1  F42000
G1 X93.348 Y87.833 Z6.64
G1 Z6.36
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X94.106 Y87.691 I.968 J3.082 E.01489
G1 X94.171 Y87.276 E.0081
G1 X94.231 Y87.286 E.00116
G3 X95.534 Y88.312 I.036 J1.294 E.0347
G3 X94.215 Y89.487 I-1.458 J-.308 E.03645
G3 X92.36 Y88.899 I-.387 J-2 E.0391
G3 X92.606 Y87.762 I.756 J-.432 E.02457
G3 X94.113 Y87.267 I1.541 J2.152 E.03104
M106 S204
M106 S255
; WIPE_START
G1 X94.231 Y87.286 E-.04541
G1 X94.587 Y87.343 E-.13717
G1 X94.991 Y87.508 E-.16564
G1 X95.292 Y87.742 E-.14499
G1 X95.474 Y88.017 E-.12519
G1 X95.534 Y88.312 E-.11442
G1 X95.52 Y88.382 E-.02717
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.76 I-1.007 J-.683 P1  F42000
G1 X93.256 Y91.719 Z6.76
G1 Z6.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X94.036 Y91.573 I.931 J2.82 E.01534
G1 X94.038 Y91.153 E.0081
G3 X95.507 Y91.938 I.011 J1.746 E.03347
G3 X95.011 Y93.092 I-.987 J.259 E.02609
G3 X92.367 Y92.71 I-1.08 J-1.865 E.05552
G3 X92.62 Y91.584 I.724 J-.429 E.02451
G3 X93.979 Y91.153 I1.436 J2.165 E.02785
M106 S204
; WIPE_START
G1 X94.602 Y91.238 E-.23893
G1 X95.017 Y91.416 E-.17154
G1 X95.323 Y91.658 E-.14828
G1 X95.507 Y91.938 E-.12747
G1 X95.546 Y92.129 E-.07379
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.76 I-.2 J-1.2 P1  F42000
G1 X87.301 Y93.501 Z6.76
G1 Z6.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
M73 P56 R10
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z6.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/166
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.76 I.163 J1.206 P1  F42000
G1 X93.162 Y87.874 Z6.76
G1 Z6.48
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X93.919 Y87.713 I1.007 J2.88 E.01494
G1 X93.929 Y87.293 E.0081
G3 X95.356 Y88.029 I.071 J1.614 E.03238
G3 X94.86 Y89.202 I-1.024 J.258 E.02634
G3 X92.244 Y88.906 I-1.122 J-1.798 E.05477
G3 X92.493 Y87.77 I.764 J-.428 E.02452
G3 X93.87 Y87.29 I1.526 J2.163 E.02847
M106 S204
M106 S255
; WIPE_START
G1 X94.469 Y87.355 E-.22884
G1 X94.873 Y87.52 E-.16577
G1 X95.174 Y87.754 E-.14507
G1 X95.356 Y88.029 E-.12525
G1 X95.406 Y88.274 E-.09508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I-1.017 J-.668 P1  F42000
G1 X93.138 Y91.727 Z6.88
G1 Z6.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X93.899 Y91.588 I.911 J2.844 E.01496
G1 X93.939 Y91.17 E.0081
G3 X95.388 Y91.945 I.107 J1.54 E.03339
G3 X94.891 Y93.098 I-.983 J.26 E.02607
G3 X92.25 Y92.703 I-1.066 J-1.9 E.0554
G3 X92.5 Y91.59 I.714 J-.424 E.02425
G3 X93.88 Y91.164 I1.424 J2.168 E.02821
M106 S204
; WIPE_START
G1 X94.486 Y91.244 E-.23205
G1 X94.897 Y91.422 E-.17014
G1 X95.203 Y91.664 E-.14858
G1 X95.388 Y91.945 E-.12761
G1 X95.431 Y92.155 E-.08162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.88 I-.199 J-1.201 P1  F42000
G1 X87.301 Y93.501 Z6.88
G1 Z6.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z6.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/166
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z6.88 I.162 J1.206 P1  F42000
G1 X93.029 Y87.895 Z6.88
G1 Z6.6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X93.776 Y87.736 I1.013 J2.918 E.01476
G1 X93.798 Y87.316 E.0081
G3 X95.238 Y88.042 I.111 J1.572 E.03262
G3 X94.413 Y89.377 I-1.099 J.244 E.0335
G3 X92.127 Y88.912 I-.792 J-1.959 E.04764
G3 X92.375 Y87.787 I.76 J-.422 E.02428
G3 X93.739 Y87.313 I1.493 J2.096 E.02823
M106 S204
M106 S255
; WIPE_START
G1 X94.348 Y87.366 E-.23227
G1 X94.755 Y87.532 E-.16681
G1 X95.056 Y87.766 E-.14512
G1 X95.238 Y88.042 E-.12531
G1 X95.285 Y88.275 E-.0905
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I-1.017 J-.669 P1  F42000
G1 X93.006 Y91.738 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X93.766 Y91.602 I.897 J2.815 E.01493
G1 X93.807 Y91.184 E.0081
G3 X95.268 Y91.951 I.045 J1.689 E.03323
G3 X94.393 Y93.28 I-1.078 J.243 E.03424
G3 X92.133 Y92.695 I-.688 J-1.998 E.04768
G3 X92.381 Y91.594 I.704 J-.42 E.02398
G3 X93.748 Y91.178 I1.402 J2.151 E.02792
M106 S204
; WIPE_START
G1 X94.357 Y91.247 E-.23298
G1 X94.777 Y91.427 E-.17358
G1 X95.083 Y91.67 E-.1486
G1 X95.268 Y91.951 E-.1278
G1 X95.308 Y92.15 E-.07704
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I-.202 J-1.2 P1  F42000
G1 X87.301 Y93.501 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/166
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7 I.162 J1.206 P1  F42000
G1 X92.903 Y87.914 Z7
G1 Z6.72
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X93.641 Y87.758 I1.016 J2.978 E.01457
G1 X93.668 Y87.338 E.0081
G3 X95.12 Y88.054 I.149 J1.529 E.03287
G3 X94.428 Y89.318 I-1.042 J.251 E.03046
G3 X92.009 Y88.916 I-.922 J-1.935 E.05032
G3 X92.256 Y87.805 I.747 J-.417 E.024
G3 X93.609 Y87.334 I1.461 J2.019 E.02801
M106 S204
M106 S255
; WIPE_START
G1 X94.14 Y87.369 E-.2023
G1 X94.636 Y87.544 E-.20005
G1 X94.938 Y87.778 E-.14521
G1 X95.12 Y88.054 E-.12539
G1 X95.166 Y88.278 E-.08705
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.12 I-1.016 J-.671 P1  F42000
G1 X92.874 Y91.749 Z7.12
G1 Z6.72
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X93.632 Y91.615 I.883 J2.79 E.01489
G1 X93.674 Y91.197 E.0081
G3 X95.148 Y91.957 I.046 J1.718 E.03335
G3 X94.409 Y93.217 I-1.016 J.25 E.03115
G3 X92.016 Y92.686 I-.821 J-1.961 E.05037
G3 X92.261 Y91.598 I.693 J-.416 E.02374
G3 X93.616 Y91.191 I1.379 J2.134 E.02763
M106 S204
; WIPE_START
G1 X94.15 Y91.244 E-.20393
G1 X94.657 Y91.432 E-.20556
G1 X94.963 Y91.676 E-.14882
G1 X95.148 Y91.957 E-.12796
G1 X95.187 Y92.147 E-.07373
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.12 I-.206 J-1.199 P1  F42000
G1 X87.301 Y93.501 Z7.12
G1 Z6.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z6.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/166
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.12 I.16 J1.206 P1  F42000
G1 X92.76 Y87.94 Z7.12
G1 Z6.84
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X93.507 Y87.779 I.947 J2.576 E.01479
G1 X93.541 Y87.36 E.0081
G3 X95.002 Y88.066 I.189 J1.474 E.03308
G3 X94.433 Y89.263 I-1.007 J.255 E.02772
G3 X92.132 Y89.168 I-1.063 J-2.163 E.04626
G3 X92.136 Y87.823 I.415 J-.671 E.03105
G3 X93.478 Y87.355 I1.441 J1.977 E.02778
M106 S204
M106 S255
; WIPE_START
G1 X94.002 Y87.39 E-.19979
G1 X94.516 Y87.556 E-.20508
G1 X94.82 Y87.79 E-.14586
G1 X95.002 Y88.066 E-.12545
G1 X95.046 Y88.282 E-.08382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.24 I-1.014 J-.672 P1  F42000
G1 X92.742 Y91.758 Z7.24
G1 Z6.84
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X93.498 Y91.627 I.868 J2.766 E.01484
G1 X93.542 Y91.209 E.0081
G1 X93.607 Y91.216 E.00125
G3 X95.028 Y91.963 I.108 J1.521 E.03259
G3 X94.426 Y93.153 I-.959 J.262 E.02817
G3 X91.89 Y92.665 I-.948 J-1.91 E.05348
M73 P57 R10
G3 X92.14 Y91.6 I.727 J-.391 E.02304
G3 X93.483 Y91.203 I1.356 J2.118 E.02735
M106 S204
; WIPE_START
G1 X93.607 Y91.216 E-.04719
G1 X94.011 Y91.257 E-.15444
G1 X94.541 Y91.442 E-.21343
G1 X94.843 Y91.681 E-.14638
G1 X95.028 Y91.963 E-.12804
G1 X95.065 Y92.145 E-.07053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.24 I-.209 J-1.199 P1  F42000
G1 X87.301 Y93.501 Z7.24
G1 Z6.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z6.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/166
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.24 I.159 J1.207 P1  F42000
G1 X92.632 Y87.962 Z7.24
G1 Z6.96
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X93.375 Y87.799 I.917 J2.408 E.01472
G1 X93.418 Y87.381 E.0081
G3 X94.884 Y88.077 I.199 J1.471 E.03309
G3 X94.313 Y89.259 I-.974 J.258 E.02755
G3 X91.859 Y89.021 I-1.053 J-1.912 E.0505
G3 X92.013 Y87.84 I.606 J-.522 E.0259
G3 X93.347 Y87.376 I1.441 J1.991 E.02761
M106 S204
M106 S255
; WIPE_START
G1 X93.867 Y87.412 E-.19787
G1 X94.336 Y87.552 E-.18634
G1 X94.701 Y87.802 E-.16805
G1 X94.884 Y88.077 E-.12548
G1 X94.927 Y88.289 E-.08227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.36 I-1.013 J-.675 P1  F42000
G1 X92.611 Y91.766 Z7.36
G1 Z6.96
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X93.364 Y91.638 I.851 J2.739 E.01478
G1 X93.409 Y91.221 E.0081
G3 X94.723 Y91.687 I-.029 J2.164 E.02735
G3 X94.341 Y93.127 I-.709 J.583 E.03351
G3 X91.861 Y92.766 I-.976 J-1.991 E.05135
G3 X92.031 Y91.594 I.553 J-.518 E.02619
G3 X93.351 Y91.214 I1.323 J2.115 E.02682
M106 S204
; WIPE_START
G1 X93.874 Y91.269 E-.1998
G1 X94.348 Y91.426 E-.18984
G1 X94.723 Y91.687 E-.17358
G1 X94.908 Y91.968 E-.12796
G1 X94.944 Y92.145 E-.06882
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.36 I-.212 J-1.198 P1  F42000
G1 X87.301 Y93.501 Z7.36
G1 Z6.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z6.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 7.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/166
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.36 I.158 J1.207 P1  F42000
G1 X92.505 Y87.982 Z7.36
G1 Z7.08
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X93.242 Y87.818 I.93 J2.432 E.0146
G1 X93.294 Y87.401 E.0081
G3 X94.764 Y88.089 I.166 J1.559 E.03289
G3 X94.175 Y89.262 I-.932 J.266 E.02779
G3 X91.788 Y89.07 I-1.04 J-2.001 E.04866
G3 X92.005 Y87.778 I.545 J-.573 E.02975
G3 X93.217 Y87.394 I1.344 J2.14 E.02477
M106 S204
M106 S255
; WIPE_START
G1 X93.731 Y87.433 E-.19604
G1 X94.196 Y87.572 E-.18428
G1 X94.565 Y87.809 E-.16672
G1 X94.764 Y88.089 E-.13069
G1 X94.808 Y88.301 E-.08227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.48 I-1.01 J-.679 P1  F42000
G1 X92.474 Y91.774 Z7.48
G1 Z7.08
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X93.226 Y91.649 I.83 J2.674 E.01473
G1 X93.27 Y91.231 E.0081
G1 X93.422 Y91.247 E.00295
G3 X94.786 Y91.974 I.012 J1.622 E.03106
G3 X94.2 Y93.122 I-.903 J.263 E.02738
G3 X91.796 Y92.818 I-.967 J-2.01 E.04939
G3 X92.028 Y91.521 I.553 J-.57 E.02995
G3 X93.211 Y91.225 I1.192 J2.254 E.02374
M106 S204
; WIPE_START
G1 X93.422 Y91.247 E-.08059
G1 X93.736 Y91.281 E-.1202
G1 X94.205 Y91.436 E-.18757
G1 X94.581 Y91.686 E-.1716
G1 X94.786 Y91.974 E-.13433
G1 X94.821 Y92.143 E-.06572
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.48 I-.216 J-1.198 P1  F42000
G1 X87.301 Y93.501 Z7.48
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z7.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/166
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.48 I.158 J1.207 P1  F42000
G1 X92.384 Y87.999 Z7.48
G1 Z7.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X93.113 Y87.836 I.975 J2.647 E.01446
G1 X93.162 Y87.418 E.0081
G3 X94.628 Y88.099 I.082 J1.744 E.03241
G3 X94.398 Y89.006 I-.749 J.292 E.01924
G3 X91.674 Y89.055 I-1.391 J-1.562 E.05721
G3 X92.004 Y87.71 I.583 J-.57 E.03192
G3 X93.087 Y87.413 I1.313 J2.666 E.02179
M106 S204
M106 S255
; WIPE_START
G1 X93.596 Y87.452 E-.19366
G1 X94.056 Y87.592 E-.18288
G1 X94.411 Y87.816 E-.15957
G1 X94.628 Y88.099 E-.13565
G1 X94.679 Y88.326 E-.08825
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I-1.009 J-.68 P1  F42000
G1 X92.354 Y91.775 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X93.101 Y91.658 I.814 J2.773 E.01462
G1 X93.148 Y91.241 E.0081
G3 X94.648 Y91.976 I.019 J1.86 E.03339
G3 X94.423 Y92.871 I-.773 J.281 E.01889
G3 X91.676 Y92.8 I-1.329 J-1.746 E.05723
G3 X92.002 Y91.462 I.571 J-.57 E.03183
G3 X93.089 Y91.234 I1.108 J2.58 E.02155
M106 S204
; WIPE_START
G1 X93.599 Y91.292 E-.195
G1 X94.064 Y91.448 E-.18655
G1 X94.426 Y91.685 E-.16439
G1 X94.648 Y91.976 E-.13895
G1 X94.692 Y92.169 E-.07512
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I-.216 J-1.198 P1  F42000
G1 X87.301 Y93.501 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
M73 P57 R9
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
M73 P58 R9
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 7.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/166
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.6 I.158 J1.207 P1  F42000
G1 X92.265 Y88.017 Z7.6
G1 Z7.32
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X92.99 Y87.856 I2 J7.272 E.01433
G1 X93.018 Y87.436 E.0081
G3 X94.483 Y88.109 I.086 J1.746 E.0323
G1 X94.519 Y88.262 E.00304
G3 X93.899 Y89.266 I-1.019 J.064 E.02424
G3 X91.68 Y89.136 I-1.003 J-1.892 E.04506
G3 X91.984 Y87.684 I.448 J-.664 E.03658
G3 X92.959 Y87.433 I1.104 J2.269 E.01952
M106 S204
M106 S255
; WIPE_START
G1 X93.46 Y87.471 E-.19112
G1 X93.916 Y87.611 E-.18144
G1 X94.27 Y87.834 E-.15878
G1 X94.483 Y88.109 E-.13203
G1 X94.519 Y88.262 E-.05986
G1 X94.54 Y88.356 E-.03676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.72 I-1.009 J-.68 P1  F42000
G1 X92.232 Y91.78 Z7.72
G1 Z7.32
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X92.973 Y91.667 I1.186 J5.32 E.01445
G1 X93.022 Y91.25 E.0081
G3 X94.501 Y91.978 I.006 J1.855 E.03293
G3 X94.28 Y92.867 I-.756 J.284 E.01878
G3 X91.558 Y92.783 I-1.309 J-1.73 E.05675
G3 X91.878 Y91.463 I.561 J-.563 E.03139
G3 X92.963 Y91.243 I1.036 J2.322 E.02153
M106 S204
; WIPE_START
G1 X93.462 Y91.301 E-.19069
G1 X93.923 Y91.458 E-.1851
G1 X94.282 Y91.694 E-.16351
G1 X94.501 Y91.978 E-.13607
G1 X94.552 Y92.195 E-.08463
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.72 I-.216 J-1.198 P1  F42000
G1 X87.301 Y93.501 Z7.72
G1 Z7.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z7.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 7.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/166
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.72 I.16 J1.206 P1  F42000
G1 X92.137 Y88.023 Z7.72
G1 Z7.44
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X92.862 Y87.878 I.767 J1.952 E.01433
G1 X92.887 Y87.459 E.0081
G3 X94.339 Y88.124 I.073 J1.758 E.03197
G3 X94.115 Y89.015 I-.779 J.279 E.01879
G3 X91.766 Y89.278 I-1.377 J-1.674 E.0482
G3 X91.27 Y88.119 I.567 J-.928 E.02592
G3 X92.116 Y87.594 I.977 J.63 E.01982
G3 X92.827 Y87.455 I.697 J1.674 E.01408
M106 S204
M106 S255
; WIPE_START
G1 X93.326 Y87.489 E-.18982
G1 X93.777 Y87.63 E-.17945
G1 X94.127 Y87.852 E-.15774
G1 X94.339 Y88.124 E-.13098
G1 X94.4 Y88.385 E-.10202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.84 I-1.009 J-.68 P1  F42000
G1 X92.111 Y91.782 Z7.84
G1 Z7.44
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X92.847 Y91.675 I.808 J2.984 E.01436
G1 X92.897 Y91.258 E.0081
G3 X94.355 Y91.984 I-.008 J1.841 E.03251
G3 X94.136 Y92.863 I-.745 J.281 E.01857
G3 X91.44 Y92.765 I-1.287 J-1.714 E.05624
G3 X91.755 Y91.461 I.552 J-.557 E.03101
G3 X92.839 Y91.251 I.993 J2.218 E.02147
M106 S204
; WIPE_START
G1 X93.324 Y91.31 E-.18588
G1 X93.782 Y91.467 E-.18371
G1 X94.138 Y91.703 E-.16237
G1 X94.355 Y91.984 E-.13509
G1 X94.411 Y92.222 E-.09295
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.84 I-.215 J-1.198 P1  F42000
G1 X87.301 Y93.501 Z7.84
G1 Z7.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z7.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 7.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/166
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.84 I.169 J1.205 P1  F42000
G1 X91.998 Y88.005 Z7.84
G1 Z7.56
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X92.725 Y87.9 I7.357 J48.454 E.01416
G1 X92.763 Y87.482 E.0081
G3 X94.194 Y88.139 I.114 J1.64 E.03165
G3 X93.973 Y89.019 I-.766 J.276 E.01857
G3 X91.343 Y88.952 I-1.28 J-1.402 E.05602
G3 X91.638 Y87.665 I.574 J-.546 E.03008
G3 X92.694 Y87.477 I1.498 J5.373 E.02069
M106 S204
M106 S255
; WIPE_START
G1 X93.192 Y87.509 E-.18981
G1 X93.637 Y87.647 E-.17718
G1 X93.984 Y87.868 E-.15647
G1 X94.194 Y88.139 E-.13004
G1 X94.258 Y88.412 E-.10651
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I-1.009 J-.681 P1  F42000
G1 X91.985 Y91.781 Z7.96
G1 Z7.56
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X92.719 Y91.682 I.788 J3.074 E.01432
G1 X92.772 Y91.265 E.0081
G3 X94.208 Y91.99 I-.021 J1.828 E.03211
G3 X93.993 Y92.858 I-.734 J.278 E.01834
G3 X91.135 Y92.456 I-1.248 J-1.49 E.06268
G3 X91.633 Y91.457 I.785 J-.233 E.02369
G3 X92.713 Y91.258 I1.012 J2.462 E.02133
M106 S204
; WIPE_START
G1 X93.187 Y91.318 E-.18142
G1 X93.64 Y91.475 E-.18232
G1 X93.993 Y91.71 E-.16123
G1 X94.208 Y91.99 E-.13408
G1 X94.27 Y92.248 E-.10095
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I-.215 J-1.198 P1  F42000
G1 X87.301 Y93.501 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z7.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 7.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
M73 P59 R9
G1 E-.04 F1800
; layer num/total_layer_count: 63/166
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z7.96 I.178 J1.204 P1  F42000
G1 X91.857 Y87.988 Z7.96
G1 Z7.68
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G2 X92.583 Y87.92 I-1.102 J-15.749 E.01406
G1 X92.616 Y87.501 E.0081
G3 X94.05 Y88.152 I.092 J1.703 E.03155
G3 X93.832 Y89.021 I-.754 J.273 E.01832
G3 X91.055 Y88.633 I-1.237 J-1.278 E.06226
G3 X91.523 Y87.647 I.743 J-.252 E.02328
G3 X92.557 Y87.497 I1.08 J3.811 E.02021
M106 S204
M106 S255
; WIPE_START
G1 X93.057 Y87.53 E-.19049
G1 X93.499 Y87.664 E-.17532
G1 X93.842 Y87.884 E-.15474
G1 X94.05 Y88.152 E-.12909
G1 X94.116 Y88.435 E-.11037
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.08 I-.995 J-.7 P1  F42000
G1 X91.737 Y91.817 Z8.08
G1 Z7.68
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X92.465 Y91.679 I.846 J2.464 E.01434
G1 X92.474 Y91.259 E.0081
G3 X94.062 Y91.994 I.062 J1.948 E.03498
G3 X93.849 Y92.852 I-.723 J.275 E.01812
G3 X91.02 Y92.433 I-1.227 J-1.473 E.06221
G3 X91.511 Y91.45 I.764 J-.233 E.02336
G3 X92.415 Y91.258 I.899 J2.008 E.01794
M106 S204
; WIPE_START
G1 X93.049 Y91.324 E-.2424
G1 X93.499 Y91.482 E-.18101
G1 X93.849 Y91.716 E-.16013
G1 X94.062 Y91.994 E-.1331
G1 X94.088 Y92.105 E-.04336
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.08 I-.245 J-1.192 P1  F42000
G1 X87.301 Y93.501 Z8.08
G1 Z7.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z7.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/166
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.08 I.144 J1.208 P1  F42000
G1 X91.378 Y88.182 Z8.08
G1 Z7.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X92.049 Y87.925 I.604 J.574 E.01432
G1 X92.052 Y87.505 E.0081
G3 X93.361 Y87.682 I-.073 J5.463 E.02552
G3 X93.902 Y88.739 I-.278 J.809 E.02528
G3 X90.963 Y88.652 I-1.442 J-.989 E.06733
G3 X91.81 Y87.511 I.86 J-.247 E.03167
G1 X91.993 Y87.505 E.00352
M106 S204
M106 S255
; WIPE_START
G1 X92.92 Y87.552 E-.35261
G1 X93.361 Y87.682 E-.17473
G1 X93.699 Y87.898 E-.15243
G1 X93.828 Y88.065 E-.08023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I-1.047 J-.621 P1  F42000
G1 X91.606 Y91.811 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X92.314 Y91.682 I.811 J2.43 E.01391
G1 X92.357 Y91.264 E.0081
G3 X93.911 Y91.992 I.138 J1.728 E.03461
G3 X93.71 Y92.838 I-.699 J.281 E.01787
G3 X90.907 Y92.406 I-1.211 J-1.452 E.06184
G3 X91.39 Y91.44 I.742 J-.233 E.02303
G3 X92.298 Y91.258 I.878 J2.028 E.01798
M106 S204
; WIPE_START
G1 X92.902 Y91.327 E-.23115
G1 X93.357 Y91.488 E-.18341
G1 X93.704 Y91.722 E-.15889
G1 X93.911 Y91.992 E-.1294
G1 X93.947 Y92.138 E-.05715
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I-.244 J-1.192 P1  F42000
G1 X87.301 Y93.501 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 7.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/166
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.2 I.2 J1.2 P1  F42000
G1 X91.426 Y87.965 Z8.2
G1 Z7.92
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X92.118 Y87.902 I.62 J2.983 E.01343
G1 X92.209 Y87.492 E.0081
G3 X93.558 Y87.914 I-.176 J2.928 E.0275
G3 X93.545 Y89.028 I-.47 J.552 E.02449
G3 X90.866 Y88.707 I-1.19 J-1.415 E.05831
G3 X91.281 Y87.558 I.927 J-.315 E.02544
G3 X92.151 Y87.479 I.794 J3.921 E.01688
M106 S204
M106 S255
; WIPE_START
G1 X92.78 Y87.571 E-.24145
G1 X93.222 Y87.703 E-.17514
G1 X93.558 Y87.914 E-.15065
G1 X93.76 Y88.176 E-.12593
G1 X93.8 Y88.347 E-.06683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.32 I-1.01 J-.679 P1  F42000
G1 X91.476 Y91.802 Z8.32
G1 Z7.92
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X92.179 Y91.682 I.778 J2.424 E.0138
G1 X92.224 Y91.264 E.0081
G3 X93.769 Y92 I.123 J1.731 E.03449
G3 X93.223 Y93.059 I-.844 J.235 E.02524
G3 X90.975 Y92.669 I-.837 J-1.851 E.04669
G3 X91.269 Y91.427 I.517 J-.534 E.02959
G3 X92.165 Y91.258 I.846 J2.028 E.01772
M106 S204
; WIPE_START
G1 X92.763 Y91.329 E-.22852
G1 X93.215 Y91.493 E-.18292
G1 X93.559 Y91.726 E-.15792
G1 X93.769 Y92 E-.13127
G1 X93.805 Y92.152 E-.05936
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.32 I-.247 J-1.192 P1  F42000
G1 X87.301 Y93.501 Z8.32
G1 Z7.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z7.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 8.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/166
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.32 I.062 J1.215 P1  F42000
G1 X91.139 Y88.499 Z8.32
G1 Z8.04
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X91.364 Y87.872 I.979 J-.003 E.01312
G1 X91.501 Y87.848 E.00267
G1 X91.572 Y87.434 E.0081
G3 X92.509 Y87.561 I-.541 J7.524 E.01822
G3 X93.616 Y88.189 I-.26 J1.749 E.0251
G3 X93.402 Y89.034 I-.737 J.263 E.01783
G3 X91.263 Y89.133 I-1.132 J-1.308 E.04452
G3 X90.786 Y88.122 I.144 J-.686 E.02492
G3 X91.501 Y87.422 I.692 J-.009 E.02154
M106 S204
M106 S255
; WIPE_START
G1 X92.509 Y87.561 E-.38676
G1 X93.08 Y87.723 E-.22568
M73 P60 R9
G1 X93.41 Y87.929 E-.14757
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.44 I-1.074 J-.572 P1  F42000
G1 X91.358 Y91.785 Z8.44
G1 Z8.04
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X92.06 Y91.68 I.73 J2.501 E.01372
G1 X92.107 Y91.263 E.0081
G3 X93.622 Y92.001 I.024 J1.875 E.0337
G3 X93.083 Y93.045 I-.828 J.233 E.02493
G3 X90.862 Y92.637 I-.802 J-1.884 E.04611
G3 X91.148 Y91.408 I.509 J-.529 E.02927
G3 X92.048 Y91.256 I.807 J2.04 E.01774
M106 S204
; WIPE_START
G1 X92.544 Y91.312 E-.18942
G1 X93.068 Y91.493 E-.2109
G1 X93.415 Y91.729 E-.15925
G1 X93.622 Y92.001 E-.13025
G1 X93.665 Y92.181 E-.07018
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.44 I-.247 J-1.192 P1  F42000
G1 X87.301 Y93.501 Z8.44
G1 Z8.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z8.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 8.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/166
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.44 I.086 J1.214 P1  F42000
G1 X91.058 Y88.42 Z8.44
G1 Z8.16
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G2 X91.135 Y88.084 I-.734 J-.344 E.0067
G3 X91.424 Y87.763 I.299 J-.021 E.0093
G1 X91.481 Y87.347 E.0081
G3 X93.267 Y87.948 I-.722 J5.098 E.03653
G3 X93.26 Y89.039 I-.455 J.543 E.024
G3 X91.4 Y89.229 I-1.075 J-1.326 E.03814
G3 X90.71 Y88.066 I-.026 J-.771 E.03177
G3 X91.422 Y87.337 I.676 J-.052 E.02224
M106 S204
M106 S255
; WIPE_START
G1 X92.381 Y87.533 E-.37204
G1 X92.936 Y87.739 E-.22487
G1 X93.267 Y87.948 E-.14851
G1 X93.29 Y87.978 E-.01459
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.56 I-1.067 J-.585 P1  F42000
G1 X91.212 Y91.769 Z8.56
G1 Z8.16
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.908 Y91.673 I.704 J2.549 E.01359
G1 X91.959 Y91.256 E.0081
G3 X93.476 Y92.001 I.054 J1.807 E.03389
G3 X92.943 Y93.031 I-.813 J.232 E.02463
G3 X90.75 Y92.602 I-.776 J-1.851 E.04566
G3 X91.023 Y91.384 I.507 J-.526 E.02884
G3 X91.901 Y91.249 I.782 J2.164 E.01723
M106 S204
; WIPE_START
G1 X92.405 Y91.311 E-.19308
G1 X92.923 Y91.492 E-.20839
G1 X93.27 Y91.73 E-.16002
G1 X93.476 Y92.001 E-.12946
G1 X93.518 Y92.178 E-.06904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.56 I-.253 J-1.19 P1  F42000
G1 X87.301 Y93.501 Z8.56
G1 Z8.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z8.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 8.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/166
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.56 I.14 J1.209 P1  F42000
G1 X91.072 Y88.234 Z8.56
G1 Z8.28
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X91.301 Y87.668 I.455 J-.145 E.01275
G1 X91.356 Y87.249 E.00815
G3 X92.011 Y87.466 I-.245 J1.836 E.01337
G3 X93.325 Y88.221 I-.374 J2.173 E.02982
G3 X92.899 Y89.195 I-.778 J.24 E.02234
G3 X91.493 Y89.272 I-.775 J-1.292 E.02822
G3 X90.658 Y88.123 I-.207 J-.728 E.03556
G3 X91.297 Y87.245 I.717 J-.15 E.02359
M106 S204
M106 S255
; WIPE_START
G1 X91.692 Y87.312 E-.15233
G1 X92.011 Y87.466 E-.13441
G1 X92.258 Y87.51 E-.09549
G1 X92.899 Y87.82 E-.27024
G1 X93.126 Y87.967 E-.10297
G1 X93.134 Y87.976 E-.00456
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.68 I-1.068 J-.583 P1  F42000
G1 X91.076 Y91.747 Z8.68
G1 Z8.28
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.771 Y91.665 I.638 J2.41 E.01353
G1 X91.826 Y91.248 E.0081
G3 X93.329 Y92 I.037 J1.804 E.03369
G3 X92.762 Y93.032 I-.809 J.228 E.02516
G3 X90.647 Y92.569 I-.707 J-1.836 E.0442
G3 X91.298 Y91.26 I.599 J-.519 E.03592
G1 X91.768 Y91.24 E.00906
M106 S204
; WIPE_START
G1 X92.267 Y91.307 E-.19159
G1 X92.731 Y91.467 E-.18645
G1 X93.125 Y91.729 E-.17942
G1 X93.329 Y92 E-.12913
G1 X93.374 Y92.188 E-.0734
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.68 I-.257 J-1.189 P1  F42000
G1 X87.301 Y93.501 Z8.68
G1 Z8.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z8.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/166
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.68 I.135 J1.209 P1  F42000
G1 X91.003 Y88.26 Z8.68
G1 Z8.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X91.036 Y88.21 E.00115
G3 X91.134 Y87.61 I.461 J-.233 E.01253
G1 X91.232 Y87.583 E.00196
G1 X91.254 Y87.163 E.0081
G3 X92.178 Y87.511 I-.552 J2.865 E.01912
G3 X93.179 Y88.233 I-.697 J2.021 E.02413
G3 X92.894 Y89.1 I-.66 J.264 E.0191
G3 X91.625 Y89.302 I-.837 J-1.173 E.02567
G3 X90.416 Y88.783 I-.318 J-.926 E.0278
G3 X90.601 Y88.108 I.944 J-.105 E.01382
G3 X91.195 Y87.157 I.742 J-.197 E.02423
M106 S204
M106 S255
; WIPE_START
G1 X91.579 Y87.21 E-.14724
G1 X92.178 Y87.511 E-.2547
G1 X92.564 Y87.682 E-.1606
G1 X92.975 Y87.974 E-.19129
G1 X92.985 Y87.987 E-.00616
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I-1.066 J-.586 P1  F42000
G1 X90.937 Y91.711 Z8.8
G1 Z8.4
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X91.622 Y91.651 I.563 J2.469 E.01331
G1 X91.697 Y91.237 E.0081
G3 X93.183 Y91.998 I-.07 J1.969 E.03323
G3 X92.61 Y93.019 I-.799 J.223 E.02506
G3 X90.555 Y92.535 I-.674 J-1.743 E.04325
G3 X90.47 Y91.513 I.736 J-.576 E.02093
G3 X91.634 Y91.227 I.943 J1.326 E.02366
M106 S204
; WIPE_START
G1 X92.13 Y91.301 E-.19066
G1 X92.588 Y91.463 E-.18451
G1 X92.963 Y91.712 E-.17084
G1 X93.183 Y91.998 E-.13732
G1 X93.23 Y92.194 E-.07667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I-.262 J-1.188 P1  F42000
G1 X87.301 Y93.501 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
M73 P61 R9
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 8.52
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/166
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.8 I.16 J1.206 P1  F42000
G1 X90.883 Y88.189 Z8.8
G1 Z8.52
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G2 X90.998 Y87.574 I-56.679 J-10.906 E.01205
G3 X91.174 Y87.496 I.175 J.157 E.00382
G1 X91.198 Y87.076 E.0081
G3 X92.191 Y87.554 I-.215 J1.716 E.02162
G3 X93.094 Y88.507 I-.432 J1.315 E.02637
G3 X92.063 Y89.306 I-.982 J-.203 E.02739
G2 X91.103 Y89.38 I-.021 J5.961 E.01857
G3 X90.303 Y88.545 I.008 J-.809 E.02483
G2 X90.54 Y87.565 I-2.217 J-1.054 E.01958
G3 X91.139 Y87.07 I.659 J.187 E.01594
M106 S204
M106 S255
; WIPE_START
G1 X91.645 Y87.182 E-.19698
G1 X92.191 Y87.554 E-.25096
G1 X92.437 Y87.657 E-.10152
G1 X92.783 Y87.933 E-.16822
G1 X92.853 Y88.02 E-.04232
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.92 I-1.097 J-.527 P1  F42000
G1 X90.819 Y92.25 Z8.92
G1 Z8.52
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.782 Y91.655 I.336 J-.319 E.01247
G1 X90.935 Y91.616 E.00305
G1 X90.954 Y91.197 E.0081
G3 X92.807 Y91.698 I.204 J2.922 E.03769
G3 X92.819 Y92.797 I-.41 J.554 E.02453
G3 X90.32 Y92.204 I-1.006 J-1.323 E.05658
G3 X90.895 Y91.193 I.618 J-.317 E.02657
M106 S204
; WIPE_START
G1 X91.502 Y91.207 E-.23064
G1 X91.992 Y91.291 E-.18885
G1 X92.447 Y91.458 E-.18413
G1 X92.79 Y91.686 E-.15639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.92 I-.382 J-1.155 P1  F42000
G1 X87.301 Y93.501 Z8.92
G1 Z8.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z8.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 8.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/166
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z8.92 I.184 J1.203 P1  F42000
G1 X90.802 Y88.121 Z8.92
G1 Z8.64
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G2 X90.912 Y87.497 I-35.972 J-6.658 E.01221
G3 X91.099 Y87.417 I.183 J.168 E.00404
G1 X91.122 Y86.997 E.0081
G3 X92.312 Y87.642 I-.143 J1.684 E.02683
G3 X92.946 Y88.509 I-.46 J1.002 E.02163
G3 X92.214 Y89.211 I-.773 J-.074 E.0213
G3 X91.157 Y89.418 I-2.109 J-7.97 E.02078
G3 X90.194 Y88.582 I-.127 J-.826 E.02795
G2 X90.459 Y87.476 I-2.403 J-1.162 E.02211
G3 X91.063 Y86.992 I.653 J.196 E.01587
M106 S204
M106 S255
; WIPE_START
G1 X91.399 Y87.023 E-.12806
G1 X91.695 Y87.148 E-.12219
G1 X92.312 Y87.642 E-.30022
G1 X92.648 Y87.9 E-.16126
G1 X92.721 Y88.004 E-.04828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.04 I-1.097 J-.526 P1  F42000
G1 X90.723 Y92.17 Z9.04
G1 Z8.64
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.695 Y91.583 I.314 J-.309 E.01241
G1 X90.836 Y91.546 E.00281
G1 X90.859 Y91.126 E.0081
G1 X90.991 Y91.138 E.00256
G3 X92.663 Y91.692 I-.215 J3.448 E.03432
G3 X92.678 Y92.779 I-.41 J.549 E.0242
G3 X90.171 Y91.917 I-.961 J-1.282 E.06018
G3 X90.8 Y91.121 I.647 J-.136 E.02232
M106 S204
; WIPE_START
G1 X90.991 Y91.138 E-.0729
G1 X91.854 Y91.277 E-.33199
G1 X92.305 Y91.45 E-.18343
G1 X92.663 Y91.692 E-.16415
G1 X92.675 Y91.707 E-.00753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.04 I-.385 J-1.154 P1  F42000
G1 X87.301 Y93.501 Z9.04
G1 Z8.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z8.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 8.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/166
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.04 I.205 J1.199 P1  F42000
G1 X90.74 Y88.062 Z9.04
G1 Z8.76
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.827 Y87.42 I4.575 J.293 E.01251
G3 X91.012 Y87.341 I.179 J.165 E.00399
G1 X91.034 Y86.922 E.0081
G1 X91.198 Y86.936 E.00318
G3 X92.319 Y87.73 I-.308 J1.624 E.02731
G3 X92.554 Y88.977 I-.321 J.706 E.02864
G2 X91.734 Y89.312 I173.662 J425.637 E.01708
G3 X90.207 Y89.117 I-.603 J-1.358 E.0312
G3 X90.291 Y88.225 I.555 J-.398 E.01884
G3 X90.486 Y87.155 I3.441 J.076 E.02105
G3 X90.975 Y86.917 I.508 J.42 E.0108
M106 S204
M106 S255
; WIPE_START
G1 X91.198 Y86.936 E-.08509
G1 X91.677 Y87.089 E-.19129
G1 X92.072 Y87.417 E-.19492
G1 X92.319 Y87.73 E-.15153
G1 X92.517 Y87.876 E-.09337
G1 X92.583 Y87.97 E-.0438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.16 I-1.1 J-.521 P1  F42000
G1 X90.624 Y92.104 Z9.16
G1 Z8.76
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.611 Y91.516 I.303 J-.3 E.01249
G1 X90.761 Y91.475 E.00299
G1 X90.776 Y91.055 E.0081
G3 X92.518 Y91.683 I-.354 J3.718 E.03607
G3 X92.536 Y92.758 I-.409 J.545 E.02391
G3 X90.849 Y92.917 I-1.011 J-1.709 E.03374
G3 X90.31 Y92.394 I.124 J-.666 E.01534
G3 X90.201 Y91.305 I.792 J-.629 E.02228
G3 X90.717 Y91.052 I.556 J.48 E.01137
M106 S204
; WIPE_START
G1 X91.079 Y91.08 E-.13813
G1 X91.712 Y91.255 E-.24953
G1 X92.162 Y91.438 E-.18469
G1 X92.518 Y91.683 E-.1641
G1 X92.556 Y91.731 E-.02355
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.16 I-.388 J-1.153 P1  F42000
G1 X87.301 Y93.501 Z9.16
G1 Z8.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z8.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 8.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/166
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.16 I.228 J1.195 P1  F42000
G1 X90.771 Y87.981 Z9.16
M73 P62 R9
G1 Z8.88
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X90.802 Y87.921 E.00132
G3 X90.792 Y87.3 I.465 J-.318 E.01266
G1 X90.919 Y87.267 E.00254
G1 X90.941 Y86.847 E.0081
G1 X90.991 Y86.851 E.00097
G3 X92.381 Y87.858 I-.203 J1.743 E.03458
G3 X92.017 Y89.124 I-.437 J.559 E.03252
G3 X90.1 Y89.155 I-.978 J-1.186 E.03991
G3 X90.113 Y88.344 I.509 J-.398 E.01692
G1 X90.352 Y87.878 E.0101
G3 X90.882 Y86.842 I.601 J-.346 E.0266
M106 S204
M106 S255
; WIPE_START
G1 X90.991 Y86.851 E-.04164
G1 X91.247 Y86.873 E-.09745
G1 X91.617 Y87.017 E-.15098
G1 X91.959 Y87.288 E-.1659
G1 X92.381 Y87.858 E-.26956
G1 X92.435 Y87.931 E-.03449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.28 I-1.106 J-.509 P1  F42000
G1 X90.547 Y92.036 Z9.28
G1 Z8.88
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.52 Y91.463 I.261 J-.299 E.01236
G1 X90.684 Y91.412 E.0033
M73 P62 R8
G1 X90.691 Y90.991 E.0081
G3 X92.373 Y91.67 I-.51 J3.689 E.03532
G3 X92.062 Y92.92 I-.438 J.555 E.03124
G3 X90.542 Y92.933 I-.787 J-3.384 E.02954
G3 X90.235 Y92.335 I.51 J-.64 E.01335
G3 X90.093 Y91.267 I.704 J-.637 E.02207
G3 X90.632 Y90.988 I.625 J.546 E.01198
M106 S204
; WIPE_START
G1 X90.987 Y91.009 E-.13491
G1 X91.558 Y91.218 E-.23127
G1 X92.019 Y91.42 E-.19115
G1 X92.373 Y91.67 E-.16479
G1 X92.434 Y91.749 E-.03787
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.28 I-.393 J-1.152 P1  F42000
G1 X87.301 Y93.501 Z9.28
G1 Z8.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z8.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/166
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.28 I.248 J1.192 P1  F42000
G1 X90.724 Y87.927 Z9.28
G1 Z9
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.625 Y87.334 I4.519 J-1.06 E.0116
G3 X90.826 Y87.191 I.189 J.054 E.00514
G1 X90.848 Y86.771 E.0081
G1 X90.894 Y86.775 E.0009
G3 X92.384 Y88.03 I-.181 J1.727 E.03986
G3 X92.069 Y89.013 I-.505 J.38 E.02327
G3 X89.99 Y89.186 I-1.133 J-1.03 E.04424
G3 X89.99 Y88.413 I.588 J-.387 E.01578
G1 X90.295 Y88.04 E.00929
G3 X90.208 Y87.235 I6.899 J-1.149 E.01561
G3 X90.789 Y86.766 I.627 J.182 E.01532
M106 S204
M106 S255
; WIPE_START
G1 X90.894 Y86.775 E-.04015
G1 X91.152 Y86.798 E-.09817
G1 X91.541 Y86.946 E-.15823
G1 X91.869 Y87.186 E-.15469
G1 X92.181 Y87.591 E-.1939
G1 X92.308 Y87.865 E-.11487
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I-1.08 J-.562 P1  F42000
G1 X90.311 Y91.702 Z9.4
G1 Z9
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.732 Y91.359 I.311 J-.048 E.01262
G1 X90.776 Y91.362 E.00084
G1 X90.801 Y90.943 E.0081
G3 X92.445 Y91.936 I-.546 J2.759 E.03778
G3 X91.928 Y92.888 I-.701 J.236 E.02342
G2 X91.031 Y93.076 I.189 J3.131 E.01773
G3 X90.17 Y92.281 I-.202 J-.646 E.02734
G3 X89.863 Y91.716 I2.245 J-1.584 E.01242
G3 X90.742 Y90.939 I.763 J-.023 E.0258
M106 S204
; WIPE_START
G1 X91.293 Y91.088 E-.21677
G1 X91.874 Y91.395 E-.24969
G1 X92.228 Y91.653 E-.16669
G1 X92.431 Y91.918 E-.12685
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I-.359 J-1.163 P1  F42000
G1 X87.301 Y93.501 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 9.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/166
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.4 I.276 J1.185 P1  F42000
G1 X90.57 Y87.87 Z9.4
G1 Z9.12
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.575 Y87.181 I5.676 J-.298 E.01328
G3 X90.734 Y87.114 I.152 J.139 E.00342
G1 X90.756 Y86.695 E.0081
G1 X90.8 Y86.699 E.00085
G3 X92.326 Y88.638 I-.106 J1.654 E.05368
G3 X90.103 Y89.399 I-1.545 J-.885 E.04946
G3 X89.88 Y88.458 I.292 J-.566 E.02117
G1 X90.134 Y88.152 E.00766
G2 X90.126 Y87.154 I-12.927 J-.396 E.01925
G3 X90.697 Y86.69 I.617 J.176 E.0151
M106 S204
M106 S255
; WIPE_START
G1 X90.8 Y86.699 E-.03924
G1 X91.054 Y86.722 E-.09694
G1 X91.453 Y86.873 E-.16218
G1 X91.804 Y87.119 E-.16285
G1 X91.968 Y87.317 E-.09764
G1 X92.223 Y87.78 E-.20116
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.52 I-1.092 J-.537 P1  F42000
G1 X90.259 Y91.772 Z9.52
G1 Z9.12
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.305 Y91.395 I.132 J-.175 E.00885
G3 X90.766 Y91.316 I.35 J.66 E.00917
G1 X90.883 Y90.912 E.0081
G3 X92.299 Y91.918 I-1.141 J3.107 E.03388
G3 X91.795 Y92.851 I-.671 J.241 E.02306
G2 X90.963 Y93.167 I.415 J2.347 E.01726
G3 X90.12 Y92.684 I-.212 J-.608 E.02123
G1 X90.103 Y92.233 E.00869
G3 X89.868 Y91.208 I.473 J-.648 E.02211
G3 X90.826 Y90.894 I.82 J.884 E.02005
M106 S204
; WIPE_START
G1 X91.198 Y91.017 E-.14882
G1 X91.715 Y91.351 E-.23374
G1 X92.083 Y91.63 E-.1755
G1 X92.299 Y91.918 E-.1368
G1 X92.341 Y92.084 E-.06514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.52 I-.329 J-1.172 P1  F42000
G1 X87.301 Y93.501 Z9.52
G1 Z9.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z9.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 9.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/166
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.52 I.301 J1.179 P1  F42000
G1 X90.539 Y87.796 Z9.52
G1 Z9.24
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X90.561 Y87.699 E.00192
G3 X90.539 Y87.065 I.486 J-.335 E.0129
G1 X90.642 Y87.037 E.00207
G1 X90.664 Y86.617 E.0081
G1 X90.705 Y86.621 E.0008
G3 X92.212 Y88.491 I-.088 J1.613 E.05219
G3 X89.776 Y89.262 I-1.5 J-.505 E.05733
G3 X90.009 Y88.223 I.707 J-.387 E.02243
G1 X90.128 Y87.71 E.01015
G3 X90.605 Y86.612 I.583 J-.399 E.02753
M106 S204
M106 S255
; WIPE_START
M73 P63 R8
G1 X90.705 Y86.621 E-.03825
G1 X90.956 Y86.644 E-.09558
G1 X91.353 Y86.796 E-.16161
G1 X91.726 Y87.052 E-.17187
G1 X91.992 Y87.36 E-.15477
G1 X92.143 Y87.69 E-.13792
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.64 I-1.092 J-.536 P1  F42000
G1 X90.154 Y91.741 Z9.64
G1 Z9.24
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.189 Y91.368 I.119 J-.177 E.00883
G3 X90.684 Y91.277 I.398 J.776 E.00984
G1 X90.78 Y90.868 E.0081
G3 X92.154 Y91.894 I-.623 J2.267 E.03383
G3 X91.598 Y92.821 I-.65 J.241 E.0239
G3 X90.556 Y93.284 I-1.066 J-.997 E.02257
G3 X90.05 Y92.637 I.098 J-.598 E.01739
G1 X89.956 Y92.153 E.0095
G3 X90.318 Y90.875 I.374 J-.584 E.03417
G1 X90.722 Y90.854 E.00779
M106 S204
; WIPE_START
G1 X91.106 Y90.959 E-.15124
G1 X91.477 Y91.2 E-.16803
G1 X91.936 Y91.598 E-.23078
G1 X92.154 Y91.894 E-.13961
G1 X92.199 Y92.073 E-.07034
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.64 I-.34 J-1.168 P1  F42000
G1 X87.301 Y93.501 Z9.64
G1 Z9.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z9.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 9.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/166
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.64 I.324 J1.173 P1  F42000
G1 X90.505 Y87.731 Z9.64
G1 Z9.36
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X90.509 Y87.715 E.00033
G3 X90.417 Y87.008 I.7 J-.45 E.01419
G3 X90.551 Y86.958 I.121 J.121 E.00284
G1 X90.583 Y86.539 E.0081
G1 X90.711 Y86.551 E.00248
G3 X92.141 Y88.402 I-.208 J1.638 E.0501
G3 X90.618 Y89.602 I-1.517 J-.359 E.04032
G3 X89.649 Y89.245 I-.136 J-1.122 E.02067
G3 X89.932 Y88.219 I.808 J-.329 E.02205
G1 X90.073 Y87.716 E.01008
G3 X90.271 Y86.591 I.712 J-.454 E.02417
G1 X90.524 Y86.534 E.00499
M106 S204
M106 S255
; WIPE_START
G1 X90.711 Y86.551 E-.07143
G1 X91.251 Y86.717 E-.21441
G1 X91.634 Y86.978 E-.17619
G1 X91.918 Y87.297 E-.16235
G1 X92.071 Y87.619 E-.13561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.76 I-1.066 J-.587 P1  F42000
G1 X89.964 Y91.445 Z9.76
G1 Z9.36
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.605 Y91.244 I.529 J.564 E.01338
G1 X90.676 Y90.83 E.0081
G3 X91.78 Y91.542 I-.326 J1.719 E.02597
G3 X91.839 Y92.608 I-.446 J.559 E.02323
G2 X91.155 Y93.205 I6.376 J7.981 E.0175
G3 X90.49 Y93.386 I-.711 J-1.299 E.01342
G3 X89.979 Y92.505 I.249 J-.733 E.02143
G2 X89.531 Y91.614 I-20.324 J9.653 E.01923
G3 X90.2 Y90.849 I.738 J-.029 E.02158
G1 X90.617 Y90.82 E.00806
M106 S204
; WIPE_START
G1 X91.02 Y90.91 E-.15672
G1 X91.378 Y91.129 E-.15948
G1 X91.78 Y91.542 E-.21917
G1 X92.008 Y91.861 E-.14917
G1 X92.057 Y92.054 E-.07546
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.76 I-.354 J-1.164 P1  F42000
G1 X87.301 Y93.501 Z9.76
G1 Z9.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z9.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 9.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/166
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.76 I.36 J1.162 P1  F42000
G1 X90.422 Y87.635 Z9.76
G1 Z9.48
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X90.425 Y87.62 E.0003
G3 X90.301 Y87.026 I.787 J-.473 E.01191
G3 X90.499 Y86.879 I.297 J.193 E.00485
G1 X90.531 Y86.459 E.00812
G3 X92.081 Y88.03 I-.152 J1.701 E.04627
G3 X91.655 Y89.149 I-1.92 J-.092 E.02346
G3 X89.684 Y89.508 I-1.303 J-1.565 E.04036
G3 X89.574 Y88.589 I.467 J-.522 E.0195
G2 X89.873 Y87.19 I-.695 J-.88 E.02989
G3 X90.472 Y86.451 I.663 J-.076 E.02044
M106 S204
M106 S255
; WIPE_START
G1 X90.771 Y86.488 E-.1146
G1 X91.148 Y86.636 E-.15384
G1 X91.531 Y86.899 E-.17643
G1 X91.836 Y87.231 E-.17145
G1 X92.009 Y87.567 E-.1437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.88 I-1.064 J-.591 P1  F42000
G1 X89.859 Y91.436 Z9.88
G1 Z9.48
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.485 Y91.217 I.525 J.496 E.01327
G1 X90.555 Y90.803 E.0081
G3 X91.936 Y92.108 I-.281 J1.681 E.03884
G3 X90.71 Y93.463 I-1.819 J-.414 E.03683
G3 X89.917 Y92.547 I-.094 J-.719 E.02763
G2 X89.537 Y91.851 I-1.163 J.184 E.0156
G3 X90.078 Y90.824 I.554 J-.364 E.02724
G1 X90.497 Y90.794 E.00811
M106 S204
; WIPE_START
G1 X90.919 Y90.873 E-.163
G1 X91.281 Y91.071 E-.15689
G1 X91.685 Y91.529 E-.23214
G1 X91.856 Y91.807 E-.12404
G1 X91.913 Y92.02 E-.08392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.88 I-.372 J-1.159 P1  F42000
G1 X87.301 Y93.501 Z9.88
G1 Z9.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z9.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/166
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z9.88 I.422 J1.141 P1  F42000
G1 X90.34 Y87.458 Z9.88
G1 Z9.6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.278 Y86.922 I.6 J-.34 E.01067
G3 X90.549 Y86.819 I.317 J.427 E.00565
G1 X90.556 Y86.399 E.0081
G3 X91.998 Y87.866 I-.351 J1.787 E.04213
G3 X91.848 Y88.384 I-.694 J.08 E.01067
G3 X91.11 Y89.445 I-1.072 J.041 E.02674
G3 X89.622 Y89.575 I-.882 J-1.516 E.02973
G3 X89.697 Y88.346 I.587 J-.581 E.02679
G1 X90.021 Y88.103 E.00779
G1 X89.927 Y87.536 E.01109
G3 X90.497 Y86.398 I.599 J-.411 E.02987
M106 S204
M106 S255
; WIPE_START
G1 X91.046 Y86.553 E-.21658
G1 X91.424 Y86.816 E-.17516
G1 X91.742 Y87.159 E-.17757
G1 X91.931 Y87.513 E-.15273
G1 X91.95 Y87.612 E-.03797
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10 I-1.059 J-.6 P1  F42000
G1 X89.768 Y91.458 Z10
G1 Z9.6
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X89.768 Y91.454 E.00007
G3 X90.361 Y91.193 I.443 J.201 E.01368
G1 X90.43 Y90.778 E.0081
G3 X91.64 Y91.558 I-.105 J1.492 E.02896
G3 X91.334 Y93.131 I-1.056 J.61 E.03368
G3 X90.13 Y93.393 I-.752 J-.561 E.0259
G3 X89.909 Y92.511 I.494 J-.592 E.01873
G3 X89.357 Y91.567 I4.328 J-3.161 E.02112
G3 X89.946 Y90.795 I.651 J-.114 E.02101
G1 X90.371 Y90.769 E.00821
M106 S204
; WIPE_START
G1 X90.811 Y90.841 E-.16933
G1 X91.192 Y91.024 E-.16041
G1 X91.64 Y91.558 E-.26519
G1 X91.787 Y91.824 E-.11525
G1 X91.8 Y91.954 E-.04981
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10 I-.396 J-1.151 P1  F42000
M73 P64 R8
G1 X87.301 Y93.501 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 9.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/166
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z10 I.465 J1.125 P1  F42000
G1 X90.271 Y87.337 Z10
G1 Z9.72
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.563 Y86.776 I.21 J-.247 E.01683
G1 X90.618 Y86.359 E.0081
G3 X91.908 Y87.786 I-.51 J1.758 E.03904
G3 X91.704 Y88.371 I-.827 J.039 E.01224
G3 X91.454 Y89.166 I-.792 J.189 E.01687
G3 X89.633 Y89.667 I-1.368 J-1.412 E.03797
G3 X89.776 Y88.26 I.556 J-.655 E.03205
G2 X89.948 Y87.62 I-1.385 J-.715 E.01285
G3 X90.559 Y86.352 I.539 J-.522 E.03524
M106 S204
M106 S255
; WIPE_START
G1 X90.955 Y86.475 E-.15749
G1 X91.318 Y86.731 E-.16863
G1 X91.635 Y87.077 E-.17841
G1 X91.839 Y87.445 E-.16003
G1 X91.889 Y87.691 E-.09544
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.12 I-1.056 J-.605 P1  F42000
G1 X89.707 Y91.5 Z10.12
G1 Z9.72
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.972 Y91.174 I.278 J-.044 E.00913
G3 X90.231 Y91.166 I.148 J.631 E.00503
G1 X90.298 Y90.752 E.0081
G3 X91.711 Y92.499 I-.028 J1.468 E.04933
G3 X90.486 Y93.608 I-1.516 J-.445 E.03351
G3 X89.828 Y92.733 I.106 J-.764 E.02345
G2 X89.373 Y91.795 I-1.52 J.158 E.02052
G3 X90.24 Y90.742 I.674 J-.328 E.033
M106 S204
; WIPE_START
G1 X90.691 Y90.816 E-.1739
G1 X90.964 Y90.929 E-.11216
G1 X91.379 Y91.255 E-.2004
G1 X91.724 Y91.886 E-.27355
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.12 I-.417 J-1.143 P1  F42000
G1 X87.301 Y93.501 Z10.12
G1 Z9.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z9.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 9.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/166
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z10.12 I.4 J1.149 P1  F42000
G1 X90.351 Y87.527 Z10.12
G1 Z9.84
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.249 Y86.753 I.375 J-.443 E.0165
G1 X90.351 Y86.73 E.00202
G1 X90.372 Y86.31 E.0081
G3 X91.526 Y86.989 I.012 J1.3 E.0271
G3 X91.556 Y88.331 I-.795 J.689 E.02807
G3 X91.318 Y89.2 I-.794 J.249 E.01833
G3 X89.805 Y89.786 I-1.551 J-1.755 E.03193
G3 X89.342 Y88.753 I.154 J-.69 E.02532
G3 X89.792 Y88.275 I.462 J-.016 E.01407
G1 X89.941 Y87.654 E.01231
G3 X90.118 Y86.353 I.594 J-.582 E.02918
G1 X90.313 Y86.307 E.00386
M106 S204
M106 S255
; WIPE_START
G1 X90.877 Y86.4 E-.21709
G1 X91.211 Y86.644 E-.15724
G1 X91.526 Y86.989 E-.1775
G1 X91.737 Y87.369 E-.16529
G1 X91.761 Y87.48 E-.04288
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.24 I-1.086 J-.548 P1  F42000
G1 X89.691 Y91.578 Z10.24
G1 Z9.84
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.074 Y91.131 I.292 J-.137 E.01428
G1 X90.163 Y90.721 E.0081
G3 X91.467 Y91.524 I-.084 J1.597 E.0308
G3 X91.703 Y92.227 I-2.423 J1.202 E.01433
G3 X90.397 Y93.665 I-1.523 J-.071 E.04059
G3 X89.809 Y92.698 I.213 J-.791 E.02407
G1 X89.697 Y92.175 E.01031
G3 X90.105 Y90.708 I.306 J-.705 E.04248
M106 S204
; WIPE_START
G1 X90.561 Y90.79 E-.17608
G1 X90.973 Y90.959 E-.16926
G1 X91.281 Y91.21 E-.15092
G1 X91.467 Y91.524 E-.13874
G1 X91.604 Y91.823 E-.125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.24 I-.442 J-1.134 P1  F42000
G1 X87.301 Y93.501 Z10.24
G1 Z9.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z9.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 9.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/166
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z10.24 I.446 J1.132 P1  F42000
G1 X90.256 Y87.41 Z10.24
G1 Z9.96
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.198 Y86.722 I.438 J-.383 E.01423
G3 X90.338 Y86.694 I.108 J.178 E.0028
G1 X90.38 Y86.277 E.0081
G3 X91.66 Y87.921 I-.119 J1.413 E.04513
G2 X91.473 Y88.657 I1.117 J.675 E.01485
G3 X90.477 Y89.668 I-1.309 J-.294 E.02882
G3 X89.266 Y89.327 I-.496 J-.559 E.02883
G3 X89.275 Y88.545 I6.317 J-.318 E.01509
G3 X89.754 Y88.216 I.513 J.233 E.01177
G1 X89.874 Y87.588 E.01233
G3 X89.957 Y86.368 I.779 J-.559 E.02555
G3 X90.321 Y86.271 I.326 J.489 E.00739
M106 S204
M106 S255
; WIPE_START
G1 X90.909 Y86.411 E-.22976
G1 X91.417 Y86.899 E-.26764
G1 X91.627 Y87.282 E-.16586
G1 X91.682 Y87.53 E-.09675
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.36 I-1.096 J-.529 P1  F42000
G1 X89.695 Y91.647 Z10.36
G1 Z9.96
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.974 Y91.104 I.266 J-.207 E.01473
G1 X90.007 Y90.685 E.0081
G3 X91.417 Y91.73 I.049 J1.408 E.03654
G3 X91.556 Y92.679 I-.649 J.579 E.01957
G3 X90.305 Y93.706 I-1.289 J-.295 E.03357
G3 X89.78 Y92.721 I.342 J-.815 E.0233
G1 X89.818 Y92.534 E.00368
G2 X89.276 Y91.78 I-8.687 J5.664 E.01791
G3 X89.948 Y90.68 I.675 J-.343 E.02971
M106 S204
; WIPE_START
G1 X90.423 Y90.761 E-.18326
G1 X90.849 Y90.933 E-.17462
G1 X91.086 Y91.109 E-.11217
G1 X91.359 Y91.47 E-.17203
G1 X91.417 Y91.73 E-.10129
G1 X91.441 Y91.767 E-.01663
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.36 I-.47 J-1.123 P1  F42000
G1 X87.301 Y93.501 Z10.36
G1 Z9.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
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




G1 X86.95 Y93.289 F42000
G1 Z9.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 10.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/166
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z10.36 I.483 J1.117 P1  F42000
G1 X90.193 Y87.309 Z10.36
G1 Z10.08
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.204 Y86.665 I.372 J-.316 E.01356
G3 X90.354 Y86.661 I.089 J.537 E.0029
G1 X90.412 Y86.245 E.0081
G3 X91.548 Y87.835 I-.192 J1.338 E.04211
G2 X91.334 Y88.696 I.695 J.63 E.01781
G3 X90.528 Y89.63 I-1.4 J-.394 E.02456
G3 X89.294 Y89.559 I-.582 J-.636 E.02656
M73 P65 R8
G3 X89.256 Y88.469 I2.336 J-.628 E.0212
G3 X89.72 Y88.135 I.594 J.336 E.01138
G1 X89.834 Y87.543 E.01162
G3 X89.779 Y86.469 I1.024 J-.591 E.02153
G3 X90.353 Y86.239 I.493 J.4 E.01244
M106 S204
M106 S255
; WIPE_START
G1 X90.992 Y86.461 E-.25714
G1 X91.308 Y86.807 E-.17805
G1 X91.516 Y87.188 E-.16503
G1 X91.595 Y87.55 E-.14053
G1 X91.587 Y87.6 E-.01925
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.48 I-1.106 J-.508 P1  F42000
G1 X89.711 Y91.686 Z10.48
G1 Z10.08
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X89.651 Y91.618 E.00176
G3 X89.758 Y91.12 I.356 J-.184 E.01062
G2 X89.909 Y91.088 I.004 J-.356 E.00301
G1 X89.941 Y90.669 E.0081
G3 X91.245 Y91.432 I-.158 J1.768 E.03008
G1 X91.336 Y91.819 E.00767
G3 X91.469 Y92.783 I-.739 J.593 E.01969
G3 X90.268 Y93.75 I-1.26 J-.335 E.03181
G3 X89.786 Y92.65 I.44 J-.848 E.02503
G1 X89.622 Y92.162 E.00993
G3 X89.64 Y90.711 I.362 J-.721 E.03477
G2 X89.882 Y90.665 I-.359 J-2.53 E.00476
M106 S204
; WIPE_START
G1 X90.28 Y90.72 E-.15272
G1 X90.715 Y90.906 E-.17975
G1 X91.046 Y91.148 E-.156
G1 X91.245 Y91.432 E-.13171
G1 X91.329 Y91.79 E-.13981
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.48 I-.476 J-1.12 P1  F42000
G1 X87.301 Y93.501 Z10.48
G1 Z10.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.48 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.48
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
            G0 Z10.48 F4000
            G39.3 S1
            G0 Z10.48 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.95 Y93.289 F42000
G1 Z10.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/166
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z10.48 I.438 J1.135 P1  F42000
G1 X90.266 Y87.433 Z10.48
G1 Z10.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.137 Y86.632 I.63 J-.512 E.01636
G1 X90.249 Y86.629 E.00216
G1 X90.357 Y86.223 E.0081
G3 X91.437 Y87.74 I-.175 J1.268 E.04019
G2 X91.196 Y88.742 I.69 J.696 E.02092
G3 X90.743 Y89.443 I-1.053 J-.184 E.01651
G3 X89.328 Y89.701 I-.855 J-.677 E.03029
G3 X89.187 Y88.959 I.755 J-.527 E.015
G3 X89.557 Y88.153 I.584 J-.22 E.01902
G2 X89.853 Y87.535 I-.707 J-.718 E.01347
G3 X89.849 Y86.311 I.811 J-.615 E.02532
G3 X90.3 Y86.207 I.367 J.566 E.0091
M106 S204
M106 S255
; WIPE_START
G1 X90.828 Y86.391 E-.21242
G1 X91.021 Y86.507 E-.08551
G1 X91.207 Y86.723 E-.10851
G1 X91.406 Y87.093 E-.1598
G1 X91.484 Y87.454 E-.14008
G1 X91.461 Y87.593 E-.05368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.6 I-1.109 J-.501 P1  F42000
G1 X89.65 Y91.6 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.6 Y91.151 I1.785 J-.427 E.00875
G3 X90.006 Y91.086 I.395 J1.182 E.00796
G1 X90.068 Y90.671 E.0081
G3 X91.339 Y92.043 I-.396 J1.641 E.0382
G3 X90.205 Y93.788 I-1.147 J.496 E.04741
G3 X89.791 Y92.916 I.405 J-.726 E.01985
G2 X89.39 Y91.976 I-.867 J-.186 E.021
G3 X89.329 Y90.823 I.718 J-.616 E.02395
G3 X90.009 Y90.664 I.605 J1.061 E.01364
M106 S204
; WIPE_START
G1 X90.571 Y90.872 E-.22765
G1 X90.915 Y91.121 E-.16126
G1 X91.122 Y91.398 E-.13162
G1 X91.323 Y91.995 E-.23947
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.6 I-.427 J-1.14 P1  F42000
G1 X87.301 Y93.501 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.6
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
            G0 Z10.6 F4000
            G39.3 S1
            G0 Z10.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.95 Y93.289 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 10.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/166
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z10.6 I.453 J1.129 P1  F42000
G1 X90.252 Y87.387 Z10.6
G1 Z10.32
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.078 Y86.607 I1.014 J-.635 E.01571
G3 X90.16 Y86.595 I.078 J.253 E.0016
G1 X90.259 Y86.187 E.0081
G3 X91.375 Y87.356 I-.206 J1.314 E.03349
G3 X90.978 Y88.43 I-3.06 J-.521 E.02221
G3 X90.768 Y89.366 I-.747 J.324 E.01977
G3 X89.184 Y89.661 I-.942 J-.663 E.03438
G3 X89.091 Y89.422 I.254 J-.237 E.00505
G1 X89.159 Y88.875 E.01064
G3 X89.164 Y88.387 I.276 J-.241 E.01028
G3 X89.858 Y88.078 I.684 J.601 E.0151
G1 X89.833 Y87.436 E.01237
G3 X89.788 Y86.289 I.824 J-.607 E.0235
G3 X90.201 Y86.174 I.383 J.578 E.0084
M106 S204
M106 S255
; WIPE_START
G1 X90.526 Y86.262 E-.12785
G1 X91.069 Y86.594 E-.24197
G1 X91.297 Y86.996 E-.17575
G1 X91.375 Y87.356 E-.13977
G1 X91.343 Y87.55 E-.07465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.72 I-1.144 J-.415 P1  F42000
G1 X89.82 Y91.75 Z10.72
G1 Z10.32
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.566 Y91.206 I.541 J-.585 E.01187
G1 X89.549 Y91.12 E.00168
G3 X89.754 Y91.086 I.162 J.332 E.00407
G1 X89.824 Y90.671 E.0081
G3 X91.067 Y91.679 I-.017 J1.291 E.03325
G3 X91.369 Y92.611 I-2.754 J1.409 E.01897
G3 X90.316 Y93.846 I-1.297 J-.039 E.0338
G3 X89.798 Y93.131 I.059 J-.588 E.01922
G3 X89.877 Y92.514 I2.52 J.009 E.01202
G1 X89.552 Y92.075 E.01053
G3 X89.145 Y91.241 I.767 J-.891 E.0184
G3 X89.483 Y90.695 I.364 J-.152 E.01446
G1 X89.766 Y90.661 E.00549
M106 S204
; WIPE_START
G1 X90.084 Y90.689 E-.1213
G1 X90.423 Y90.822 E-.13851
G1 X90.776 Y91.09 E-.16842
G1 X90.986 Y91.368 E-.13239
G1 X91.067 Y91.679 E-.12187
G1 X91.148 Y91.866 E-.0775
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.72 I-.476 J-1.12 P1  F42000
G1 X87.301 Y93.501 Z10.72
G1 Z10.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.72
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
            G0 Z10.72 F4000
            G39.3 S1
            G0 Z10.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.95 Y93.289 F42000
G1 Z10.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 10.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/166
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z10.72 I-.068 J1.215 P1  F42000
G1 X89.442 Y88.85 Z10.72
G1 Z10.44
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G2 X89.422 Y88.649 I-.279 J-.073 E.00398
G3 X89.716 Y88.505 I4.683 J9.228 E.0063
G1 X89.735 Y88.085 E.00811
G3 X90.21 Y88.27 I-.321 J1.531 E.00987
G3 X90.672 Y89.376 I.091 J.612 E.03152
G3 X89.045 Y89.617 I-.93 J-.669 E.03535
G3 X89.013 Y88.768 I11.335 J-.847 E.01638
G3 X89.249 Y88.26 I.314 J-.163 E.01246
G3 X89.676 Y88.079 I3.193 J6.94 E.00894
M106 S204
M106 S255
; WIPE_START
G1 X90.21 Y88.27 E-.21542
G1 X90.421 Y88.284 E-.08044
M73 P66 R8
G1 X90.697 Y88.407 E-.1147
G1 X90.869 Y88.601 E-.09858
G1 X90.923 Y88.831 E-.08985
G1 X90.849 Y89.11 E-.10999
G1 X90.774 Y89.222 E-.05102
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.84 I1.171 J-.33 P1  F42000
G1 X90.167 Y87.068 Z10.84
G1 Z10.44
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.1 Y86.149 I1.04 J-.537 E.01824
G3 X91.267 Y87.256 I-.081 J1.254 E.03364
G3 X90.534 Y87.836 I-.576 J.025 E.02101
G3 X89.716 Y86.29 I.293 J-1.144 E.03794
G3 X90.041 Y86.144 I.352 J.348 E.00703
M106 S204
M106 S255
; WIPE_START
G1 X90.41 Y86.22 E-.14307
G1 X91.068 Y86.668 E-.30254
G1 X91.195 Y86.91 E-.1041
G1 X91.267 Y87.256 E-.13406
G1 X91.235 Y87.454 E-.07622
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.84 I-1.142 J-.42 P1  F42000
G1 X89.704 Y91.612 Z10.84
G1 Z10.44
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.621 Y91.261 I.115 J-.213 E.00785
G1 X89.49 Y91.105 E.00393
G3 X89.653 Y91.08 I.262 J1.164 E.00317
G1 X89.722 Y90.666 E.0081
G3 X90.959 Y91.671 I-.002 J1.266 E.03324
G2 X91.24 Y92.399 I1.27 J-.073 E.01528
G3 X90.19 Y93.885 I-1.176 J.283 E.03971
G3 X89.83 Y93.078 I.197 J-.571 E.01909
G3 X89.948 Y92.462 I2.926 J.24 E.01213
G1 X89.425 Y91.927 E.01441
G3 X89.194 Y91.405 I.16 J-.383 E.01215
G3 X89.461 Y90.678 I.218 J-.332 E.02055
G1 X89.664 Y90.656 E.00394
M106 S204
; WIPE_START
G1 X90.262 Y90.774 E-.2316
G1 X90.625 Y91.047 E-.1728
G1 X90.849 Y91.34 E-.14033
G1 X90.959 Y91.671 E-.13253
G1 X91.009 Y91.883 E-.08274
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.84 I-.487 J-1.115 P1  F42000
G1 X87.301 Y93.501 Z10.84
G1 Z10.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.84
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
            G0 Z10.84 F4000
            G39.3 S1
            G0 Z10.84 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.95 Y93.289 F42000
G1 Z10.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 10.56
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/166
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z10.84 I-.109 J1.212 P1  F42000
G1 X89.414 Y88.932 Z10.84
G1 Z10.56
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G2 X89.384 Y88.636 I-.174 J-.132 E.00632
G2 X89.693 Y88.475 I-.005 J-.387 E.00696
G1 X89.678 Y88.035 E.00848
M73 P66 R7
G2 X90.574 Y88.468 I51.108 J-104.685 E.01918
G3 X90.605 Y89.325 I-.385 J.443 E.01854
G3 X88.921 Y89.585 I-.946 J-.545 E.03769
G3 X89.003 Y88.828 I5.26 J.184 E.01468
G3 X89.209 Y88.25 I.226 J-.245 E.01504
G2 X89.619 Y88.033 I-.882 J-2.16 E.00895
M106 S204
M106 S255
; WIPE_START
G1 X90.574 Y88.468 E-.39877
G1 X90.734 Y88.649 E-.09164
G1 X90.786 Y88.884 E-.09141
G1 X90.714 Y89.174 E-.11362
G1 X90.615 Y89.312 E-.06456
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.96 I1.198 J-.213 P1  F42000
G1 X90.212 Y87.045 Z10.96
G1 Z10.56
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.977 Y86.119 I1.419 J-.853 E.01869
G3 X91.093 Y86.829 I-.499 J2.015 E.02595
G3 X90.751 Y87.731 I-.588 J.292 E.02087
G3 X89.794 Y87.163 I-.099 J-.924 E.02299
G3 X89.771 Y86.168 I.571 J-.511 E.02088
G3 X89.918 Y86.116 I.227 J.406 E.00303
M106 S204
M106 S255
; WIPE_START
G1 X90.246 Y86.167 E-.12596
G1 X90.609 Y86.363 E-.15687
G1 X91.093 Y86.829 E-.25536
G1 X91.16 Y87.159 E-.12799
G1 X91.121 Y87.403 E-.09383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.96 I-1.156 J-.381 P1  F42000
G1 X89.737 Y91.606 Z10.96
G1 Z10.56
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.467 Y91.516 I.658 J-2.418 E.00547
G1 X89.493 Y91.163 E.00682
G1 X89.44 Y91.093 E.0017
G3 X89.535 Y91.078 I.076 J.177 E.00188
G1 X89.546 Y90.658 E.0081
G3 X90.772 Y91.56 I.066 J1.196 E.0318
G1 X90.67 Y91.984 E.00841
G1 X91.02 Y92.206 E.00798
G3 X91.205 Y92.912 I-1.845 J.861 E.01415
G3 X90.071 Y93.91 I-1.187 J-.205 E.03147
G3 X89.867 Y92.999 I.451 J-.58 E.01952
G1 X89.988 Y92.564 E.0087
G1 X89.705 Y92.081 E.01079
G3 X89.116 Y91.779 I1.241 J-3.144 E.01277
G3 X89.063 Y91.289 I.517 J-.304 E.00978
G3 X89.256 Y90.704 I.212 J-.254 E.01526
G3 X89.486 Y90.657 I.31 J.923 E.00455
M106 S204
; WIPE_START
G1 X89.881 Y90.705 E-.1512
G1 X90.346 Y90.889 E-.19
G1 X90.703 Y91.296 E-.20584
G1 X90.772 Y91.56 E-.10352
G1 X90.705 Y91.84 E-.10943
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.96 I-.534 J-1.094 P1  F42000
G1 X87.301 Y93.501 Z10.96
G1 Z10.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.96 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.96
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
            G0 Z10.96 F4000
            G39.3 S1
            G0 Z10.96 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.95 Y93.289 F42000
G1 Z10.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 10.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/166
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z10.96 I-.085 J1.214 P1  F42000
G1 X89.321 Y88.877 Z10.96
G1 Z10.68
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X89.312 Y88.639 E.0046
G2 X89.681 Y88.454 I.062 J-.337 E.00853
G1 X89.637 Y87.99 E.00898
G1 X89.689 Y87.993 E.001
G3 X90.592 Y88.704 I-2.263 J3.805 E.02223
G3 X90.04 Y89.723 I-.838 J.205 E.0245
G3 X88.817 Y89.591 I-.519 J-.921 E.02532
G2 X88.902 Y88.795 I-2.601 J-.682 E.01549
G3 X89.002 Y88.305 I.133 J-.228 E.01266
G2 X89.474 Y88.038 I-.107 J-.74 E.01068
G1 X89.578 Y87.987 E.00223
M106 S204
M106 S255
; WIPE_START
G1 X89.689 Y87.993 E-.04219
G1 X89.93 Y88.106 E-.10131
G1 X90.592 Y88.704 E-.33905
G1 X90.623 Y88.949 E-.09399
G1 X90.547 Y89.31 E-.14023
G1 X90.459 Y89.382 E-.04323
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.08 I1.211 J-.118 P1  F42000
G1 X90.221 Y86.947 Z11.08
G1 Z10.68
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.89 Y86.085 I2.101 J-1.301 E.0179
G1 X89.902 Y86.085 E.00022
G3 X91.054 Y87.072 I-.264 J1.474 E.03068
G3 X90.172 Y87.517 I-.553 J0 E.02354
G3 X89.651 Y86.234 I.693 J-1.029 E.02832
G3 X89.831 Y86.084 I.232 J.095 E.00471
M106 S204
M106 S255
; WIPE_START
G1 X89.902 Y86.085 E-.02682
G1 X90.445 Y86.293 E-.22099
G1 X90.895 Y86.723 E-.23672
G1 X91.016 Y86.891 E-.07885
G1 X91.054 Y87.072 E-.0703
G1 X91.01 Y87.339 E-.10264
G1 X90.973 Y87.389 E-.02368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.08 I-1.165 J-.353 P1  F42000
G1 X89.706 Y91.568 Z11.08
G1 Z10.68
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X89.421 Y91.559 E.00551
G1 X89.34 Y91.096 E.00905
G3 X89.431 Y91.088 I.072 J.313 E.00177
G1 X89.443 Y90.668 E.0081
G3 X90.05 Y90.833 I.024 J1.118 E.0123
G3 X90.726 Y91.699 I-.141 J.808 E.02322
G1 X90.616 Y91.812 E.00305
G1 X90.877 Y92.377 E.012
G3 X91.082 Y93.015 I-.381 J.475 E.01368
G3 X90.094 Y93.972 I-1.284 J-.336 E.02789
G3 X89.869 Y93.166 I.324 J-.525 E.01774
G2 X90.075 Y92.609 I-4.604 J-2.019 E.01146
G1 X89.855 Y92.086 E.01093
G2 X89.261 Y91.961 I-.593 J1.34 E.01178
G3 X89.02 Y91.704 I-.011 J-.232 E.00772
G1 X88.935 Y91.215 E.00957
G3 X89.207 Y90.69 I.225 J-.216 E.01496
G1 X89.378 Y90.667 E.00334
M106 S204
; WIPE_START
G1 X89.754 Y90.698 E-.14323
G1 X90.05 Y90.833 E-.12355
G1 X90.329 Y90.917 E-.11073
G1 X90.556 Y91.132 E-.11892
G1 X90.737 Y91.448 E-.1381
G1 X90.726 Y91.699 E-.0955
G1 X90.671 Y91.755 E-.02997
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.08 I-.56 J-1.081 P1  F42000
G1 X87.301 Y93.501 Z11.08
G1 Z10.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
M73 P67 R7
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.08
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
            G0 Z11.08 F4000
            G39.3 S1
            G0 Z11.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.95 Y93.289 F42000
G1 Z10.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/166
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z11.08 I-.232 J1.195 P1  F42000
G1 X89.253 Y89.159 Z11.08
G1 Z10.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X89.223 Y88.622 E.01036
G1 X89.628 Y88.42 E.00872
G1 X89.686 Y87.952 E.00909
G3 X90.532 Y88.905 I-1.791 J2.44 E.02475
G3 X88.718 Y89.617 I-1.131 J-.216 E.04475
G2 X88.671 Y88.474 I-1.293 J-.519 E.02271
G3 X89.393 Y88.068 I1.384 J1.613 E.01608
G3 X89.63 Y87.936 I.231 J.136 E.00548
M106 S204
M106 S255
; WIPE_START
G1 X89.837 Y88.027 E-.08601
G1 X90.041 Y88.248 E-.11432
G1 X90.532 Y88.905 E-.31167
G1 X90.475 Y89.179 E-.10599
G1 X90.213 Y89.445 E-.14201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.2 I1.214 J.091 P1  F42000
G1 X90.397 Y86.999 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X89.928 Y86.045 I1.095 J-1.13 E.02089
G3 X90.933 Y87.024 I-.785 J1.811 E.02765
G3 X90.111 Y87.307 I-.451 J.025 E.02256
G3 X89.632 Y86.195 I.637 J-.933 E.02464
G3 X89.871 Y86.034 I.225 J.077 E.00596
M106 S204
M106 S255
; WIPE_START
G1 X90.186 Y86.166 E-.12972
G1 X90.507 Y86.429 E-.15785
G1 X90.933 Y87.024 E-.27808
G1 X90.898 Y87.245 E-.08501
G1 X90.766 Y87.422 E-.08373
G1 X90.704 Y87.447 E-.02562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.2 I-1.158 J-.375 P1  F42000
G1 X89.37 Y91.567 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X89.322 Y91.103 E.00899
G1 X89.384 Y91.101 E.00121
G1 X89.39 Y90.681 E.0081
G3 X90.281 Y90.857 I-.129 J3.003 E.01756
G3 X90.818 Y91.598 I-2.491 J2.37 E.01771
G3 X90.152 Y91.932 I-.601 J-.367 E.01513
G3 X89.069 Y91.971 I-.792 J-6.959 E.02092
G3 X88.949 Y91.731 I.022 J-.16 E.00607
G1 X88.909 Y91.211 E.01005
G3 X88.962 Y90.736 I.065 J-.234 E.01318
G3 X89.331 Y90.68 I.427 J1.588 E.00722
M106 S204
M106 S255
; WIPE_START
G1 X90.094 Y90.775 E-.29224
G1 X90.281 Y90.857 E-.07732
G1 X90.693 Y91.342 E-.24198
G1 X90.818 Y91.598 E-.10846
G1 X90.76 Y91.686 E-.03999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.2 I-1.175 J-.317 P1  F42000
G1 X90.311 Y93.345 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F9000
M204 S6000
G2 X90.524 Y92.43 I-1.072 J-.731 E.01854
G1 X90.558 Y92.432 E.00065
G3 X90.994 Y92.772 I-.012 J.466 E.01142
G3 X90.068 Y94.004 I-1.285 J-.002 E.03187
G1 X89.993 Y93.995 E.00146
G3 X89.909 Y93.217 I.511 J-.448 E.01607
G3 X90.465 Y92.426 I1.454 J.431 E.01896
M106 S204
; WIPE_START
G1 X90.558 Y92.432 E-.03524
G1 X90.706 Y92.443 E-.05663
G1 X90.89 Y92.57 E-.08513
G1 X90.994 Y92.772 E-.08627
G1 X90.886 Y93.217 E-.17407
G1 X90.687 Y93.596 E-.16279
G1 X90.43 Y93.873 E-.14362
G1 X90.389 Y93.888 E-.01625
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.2 I.151 J-1.208 P1  F42000
G1 X87.301 Y93.501 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.2
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
            G0 Z11.2 F4000
            G39.3 S1
            G0 Z11.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.95 Y93.289 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 10.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/166
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z11.2 I-.255 J1.19 P1  F42000
G1 X89.215 Y89.198 Z11.2
G1 Z10.92
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X89.17 Y88.686 E.00989
G1 X89.566 Y88.369 E.00978
G1 X89.614 Y87.892 E.00923
G3 X90.136 Y88.73 I-.66 J.992 E.0196
G3 X90.167 Y89.289 I-.109 J.287 E.0136
G3 X88.627 Y89.688 I-.981 J-.613 E.03383
G2 X88.752 Y88.731 I-1.389 J-.669 E.01893
G3 X88.627 Y88.361 I.115 J-.245 E.00839
G3 X89.029 Y88.277 I.447 J1.132 E.00794
G3 X89.56 Y87.87 I1.158 J.959 E.01302
M106 S204
M106 S255
; WIPE_START
G1 X89.93 Y88.145 E-.17533
G1 X90.07 Y88.429 E-.12058
G1 X90.136 Y88.73 E-.11682
G1 X90.308 Y88.896 E-.09105
G1 X90.337 Y89.003 E-.04227
G1 X90.167 Y89.289 E-.12622
G1 X90.059 Y89.486 E-.08547
G1 X90.054 Y89.489 E-.00226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.32 I1.214 J-.083 P1  F42000
G1 X89.813 Y85.979 Z11.32
G1 Z10.92
G1 E.8 F1800
G1 F9000
M204 S6000
G3 X90.728 Y87.175 I-.699 J1.484 E.03018
G3 X90.409 Y87.303 I-.222 J-.091 E.0074
G3 X89.621 Y86.126 I.392 J-1.115 E.02928
G3 X89.754 Y85.974 I.16 J.006 E.00423
M106 S204
M106 S255
; WIPE_START
G1 X90.018 Y86.067 E-.10628
G1 X90.361 Y86.376 E-.17525
G1 X90.6 Y86.753 E-.16975
G1 X90.728 Y87.175 E-.16774
G1 X90.656 Y87.3 E-.05452
G1 X90.429 Y87.303 E-.08646
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.32 I-1.179 J-.302 P1  F42000
G1 X89.336 Y91.561 Z11.32
G1 Z10.92
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X89.293 Y91.572 E.00087
G1 X89.214 Y91.121 E.00882
G3 X89.272 Y91.122 I.026 J.156 E.00111
G1 X89.327 Y90.706 E.0081
G2 X90.058 Y90.723 I.464 J-4.318 E.01411
G3 X90.478 Y91.229 I-.265 J.648 E.0132
G3 X90.868 Y91.688 I-.101 J.48 E.0125
G3 X89.878 Y91.861 I-.704 J-1.116 E.01987
G3 X88.85 Y91.942 I-.614 J-1.225 E.02038
G2 X88.617 Y90.914 I-1.177 J-.274 E.02101
G3 X88.92 Y90.728 I.249 J.066 E.00756
G3 X89.269 Y90.698 I.38 J2.399 E.00675
M106 S204
M106 S255
; WIPE_START
G1 X89.579 Y90.752 E-.11983
G1 X90.058 Y90.723 E-.18224
G1 X90.358 Y90.946 E-.14206
G1 X90.478 Y91.229 E-.11671
G1 X90.758 Y91.399 E-.12433
G1 X90.87 Y91.533 E-.06642
G1 X90.87 Y91.555 E-.00842
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.32 I-1.201 J-.198 P1  F42000
G1 X90.692 Y92.635 Z11.32
G1 Z10.92
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X90.754 Y92.691 E.00162
G3 X90.081 Y94.032 I-1.128 J.272 E.03144
G3 X89.843 Y93.673 I-.059 J-.219 E.01091
G3 X90.648 Y92.595 I1.324 J.148 E.02719
M106 S204
; WIPE_START
G1 X90.754 Y92.691 E-.05439
G1 X90.786 Y92.993 E-.11517
G1 X90.706 Y93.38 E-.15035
G1 X90.53 Y93.714 E-.14342
G1 X90.311 Y93.942 E-.12012
G1 X90.081 Y94.032 E-.09409
G1 X89.891 Y94.02 E-.07219
G1 X89.871 Y94.002 E-.01027
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.32 I.233 J-1.194 P1  F42000
G1 X87.301 Y93.501 Z11.32
G1 Z10.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.32 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.32
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
            G0 Z11.32 F4000
            G39.3 S1
            G0 Z11.32 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.95 Y93.289 F42000
G1 Z10.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 11.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/166
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z11.32 I-.168 J1.205 P1  F42000
G1 X89.179 Y89.021 Z11.32
G1 Z11.04
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G1 X89.127 Y88.717 E.00596
G1 X89.359 Y88.724 E.00448
G2 X89.59 Y87.836 I-1.107 J-.761 E.01805
G1 X89.6 Y87.839 E.00022
G3 X89.941 Y88.82 I-.516 J.729 E.02134
G1 X89.961 Y89.298 E.00922
G3 X89.002 Y89.787 I-.825 J-.431 E.02214
G3 X88.584 Y89.631 I-.152 J-.232 E.01001
G3 X88.758 Y89.419 I.279 J.051 E.00552
G1 X88.79 Y89.238 E.00354
G1 X88.693 Y88.675 E.01101
G3 X88.814 Y88.287 I.049 J-.198 E.01278
G1 X89.104 Y88.296 E.0056
G1 X89.286 Y87.934 E.00781
G3 X89.533 Y87.821 I.393 J.534 E.00526
M106 S204
M106 S255
; WIPE_START
G1 X89.6 Y87.839 E-.02663
G1 X89.818 Y88.045 E-.11383
G1 X89.946 Y88.302 E-.10917
G1 X89.99 Y88.579 E-.10642
G1 X89.941 Y88.82 E-.09327
G1 X89.961 Y89.298 E-.1818
G1 X89.839 Y89.514 E-.09442
G1 X89.763 Y89.563 E-.03446
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.44 I1.217 J.019 P1  F42000
G1 X89.818 Y85.94 Z11.44
G1 Z11.04
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X89.827 Y85.944 E.00019
G3 X90.407 Y86.855 I-.77 J1.129 E.0214
G1 X90.349 Y86.955 E.00224
G3 X89.614 Y86.01 I.053 J-.799 E.02606
G3 X89.762 Y85.923 I.177 J.134 E.00339
M106 S204
M106 S255
; WIPE_START
G1 X89.827 Y85.944 E-.02602
G1 X90.114 Y86.191 E-.14391
G1 X90.264 Y86.42 E-.10382
G1 X90.361 Y86.575 E-.06968
G1 X90.407 Y86.855 E-.10774
G1 X90.349 Y86.955 E-.04409
G1 X90.159 Y86.953 E-.07226
G1 X89.77 Y86.66 E-.18475
G1 X89.761 Y86.642 E-.00773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.44 I-1.211 J-.122 P1  F42000
G1 X89.273 Y91.481 Z11.44
G1 Z11.04
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X89.185 Y91.165 E.00632
G2 X89.932 Y91.124 I.303 J-1.306 E.01461
G1 X90.079 Y90.685 E.00892
G3 X90.632 Y91.332 I-9.249 J8.477 E.0164
G3 X90.906 Y91.719 I-.039 J.318 E.0103
G3 X90.219 Y91.792 I-.431 J-.791 E.01367
G2 X89.224 Y92 I.013 J2.543 E.01972
G3 X88.808 Y91.821 I-.163 J-.194 E.01079
G1 X88.896 Y91.695 E.00296
G1 X88.733 Y91.106 E.01177
G3 X88.862 Y90.724 I.056 J-.194 E.01258
G2 X90 Y90.67 I.434 J-2.859 E.02211
M106 S204
M106 S255
; WIPE_START
G1 X90.632 Y91.332 E-.34756
G1 X90.928 Y91.541 E-.13795
G1 X90.906 Y91.719 E-.06825
G1 X90.667 Y91.811 E-.09739
G1 X90.38 Y91.799 E-.10885
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P68 R7
G3 Z11.44 I-1.213 J.099 P1  F42000
G1 X90.48 Y93.026 Z11.44
G1 Z11.04
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X90.513 Y93.037 E.00066
G3 X89.857 Y94.052 I-.664 J.29 E.02752
G3 X89.792 Y93.829 I.097 J-.149 E.00487
G3 X90.422 Y93.014 I1.33 J.377 E.02035
M106 S204
; WIPE_START
G1 X90.513 Y93.037 E-.03544
G1 X90.58 Y93.235 E-.07942
G1 X90.529 Y93.534 E-.115
G1 X90.39 Y93.809 E-.11724
G1 X90.188 Y93.99 E-.10272
G1 X89.857 Y94.052 E-.12817
G1 X89.769 Y93.91 E-.0635
G1 X89.792 Y93.829 E-.0319
G1 X89.895 Y93.626 E-.08662
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.44 I.059 J-1.216 P1  F42000
G1 X87.301 Y93.501 Z11.44
G1 Z11.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.44 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.44
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
            G0 Z11.44 F4000
            G39.3 S1
            G0 Z11.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.95 Y93.289 F42000
G1 Z11.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
; CHANGE_LAYER
; Z_HEIGHT: 11.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/166
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z11.44 I1.003 J.689 P1  F42000
G1 X88.525 Y86.417 Z11.44
G1 Z11.16
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F1200
M204 S6000
G1 X88.844 Y86.097 E.00872
G1 X90.109 Y86.097 E.02438
G1 X88.702 Y87.504 E.03835
G1 X88.702 Y88.465 E.01853
G3 X89.483 Y87.988 I.698 J.265 E.01898
G1 X91.003 Y86.468 E.04145
G1 X91.003 Y87.732 E.02438
G1 X90.135 Y88.6 E.02366
G3 X89.793 Y89.365 I-.768 J.115 E.01705
G3 X90.134 Y89.866 I-.395 J.636 E.01203
G1 X91.003 Y88.997 E.02368
G1 X91.003 Y90.262 E.02438
G1 X90.133 Y91.131 E.0237
G3 X89.261 Y92.004 I-.734 J.139 E.02798
G1 X88.702 Y92.563 E.01524
G1 X88.702 Y93.827 E.02438
G1 X91.003 Y91.526 E.06272
G1 X91.003 Y92.791 E.02438
G1 X89.714 Y94.08 E.03515
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z11.56 I.284 J-1.183 P1  F42000
G1 X87.301 Y93.501 Z11.56
G1 Z11.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.56 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.56
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
            G0 Z11.56 F4000
            G39.3 S1
            G0 Z11.56 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.95 Y93.289 F42000
G1 Z11.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
; CHANGE_LAYER
; Z_HEIGHT: 11.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/166
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z11.56 I.825 J.895 P1  F42000
G1 X88.525 Y87.26 Z11.56
G1 Z11.28
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F1200
M204 S6000
G1 X89.426 Y88.162 E.02458
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z11.68 I.492 J1.113 P1  F42000
G1 X91.18 Y87.386 Z11.68
G1 Z11.28
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X89.891 Y86.097 E.03515
G1 X88.702 Y86.097 E.02292
G1 X88.702 Y86.173 E.00146
G1 X91.003 Y88.474 E.06272
G1 X91.003 Y89.738 E.02438
G1 X90.134 Y88.869 E.02369
G3 X89.793 Y89.365 I-.767 J-.163 E.01191
G3 X90.135 Y90.135 I-.396 J.637 E.01725
G1 X91.003 Y91.003 E.02366
G1 X91.003 Y92.268 E.02438
G1 X90.135 Y91.403 E.02361
G3 X89.483 Y92.013 I-.738 J-.137 E.01842
G1 X91.003 Y93.532 E.04143
G1 X91.003 Y93.903 E.00715
G1 X90.109 Y93.903 E.01723
G1 X88.702 Y92.496 E.03835
G1 X88.702 Y93.761 E.02438
G1 X89.022 Y94.08 E.00872
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.8 F1800
M204 S10000
G17
G3 Z11.68 I.388 J-1.153 P1  F42000
G1 X87.301 Y93.501 Z11.68
G1 Z11.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.68 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.68
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
            G0 Z11.68 F4000
            G39.3 S1
            G0 Z11.68 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.95 Y93.289 F42000
G1 Z11.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/166
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z11.68 I-1.214 J.089 P1  F42000
G1 X87.301 Y93.501 Z11.68
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.8
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
            G0 Z11.8 F4000
            G39.3 S1
            G0 Z11.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.95 Y93.289 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
; CHANGE_LAYER
; Z_HEIGHT: 11.52
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/166
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z11.8 I-1.214 J.089 P1  F42000
G1 X87.301 Y93.501 Z11.8
G1 Z11.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.01455
G1 X86.599 Y86.499 E.14523
G1 X87.301 Y86.499 E.01455
G1 X87.301 Y93.441 E.14398
M204 S250
G1 X87.7 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.02745
G1 X86.2 Y86.1 E.14272
G1 X87.7 Y86.1 E.02745
G1 X87.7 Y93.84 E.14163
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.57046
G1 X86.2 Y93.401 E-.18955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.92 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.92
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
            G0 Z11.92 F4000
            G39.3 S1
            G0 Z11.92 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.95 Y93.289 F42000
G1 Z11.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303032
G1 F1200
M204 S6000
G1 X86.95 Y86.711 E.08917
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 11.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X86.95 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/166
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
M106 S255
; OBJECT_ID: 12
M204 S10000
G17
G3 Z11.92 I-1.018 J.667 P1  F42000
G1 X89.065 Y91.94 Z11.92
G1 Z11.64
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
M204 S1000
G3 X89.001 Y90.635 I.336 J-.67 E.03289
G3 X89.001 Y89.365 I.406 J-.635 E.03133
G3 X89.307 Y87.986 I.404 J-.634 E.03811
G3 X89.798 Y89.365 I.089 J.745 E.04196
G3 X89.798 Y90.635 I-.405 J.635 E.03134
G3 X89.119 Y91.965 I-.398 J.635 E.04611
M106 S201.45
M106 S255
; WIPE_START
M204 S6000
G1 X88.938 Y91.861 E-.07928
G1 X88.881 Y91.812 E-.02847
G1 X88.784 Y91.699 E-.05667
G1 X88.712 Y91.568 E-.05695
G1 X88.685 Y91.498 E-.02856
G1 X88.654 Y91.352 E-.05654
G1 X88.653 Y91.203 E-.05665
G1 X88.663 Y91.129 E-.02855
G1 X88.706 Y90.986 E-.05677
G1 X88.778 Y90.85 E-.05838
G1 X88.86 Y90.749 E-.04949
G1 X88.959 Y90.663 E-.04969
G1 X89.001 Y90.635 E-.0193
G1 X88.881 Y90.542 E-.05772
G1 X88.784 Y90.429 E-.0568
G1 X88.756 Y90.384 E-.0202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.04 I1.102 J.517 P1  F42000
G1 X90.177 Y87.355 Z12.04
G1 Z11.64
G1 E.8 F1800
G1 F600
M204 S1000
G2 X89.537 Y87.162 I-.808 J1.521 E.01394
G1 X89.552 Y86.923 E.00496
G1 X90.177 Y86.923 E.01295
G1 X90.177 Y87.295 E.0077
M106 S201.45
M106 S255
; WIPE_START
M204 S6000
G1 X89.976 Y87.264 E-.08159
G1 X89.828 Y87.215 E-.06282
G1 X89.674 Y87.179 E-.06354
G1 X89.537 Y87.162 E-.05539
G1 X89.552 Y86.923 E-.09617
G1 X90.177 Y86.923 E-.25107
G1 X90.177 Y87.295 E-.14942
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.04 I-1.21 J-.131 P1  F42000
G1 X89.548 Y93.077 Z12.04
G1 Z11.64
G1 E.8 F1800
G1 F600
M204 S1000
G1 X89.529 Y92.843 E.00486
G2 X89.885 Y92.768 I-.197 J-1.829 E.00756
G1 X90.177 Y92.657 E.00646
G1 X90.177 Y93.077 E.0087
G1 X89.608 Y93.077 E.01179
M106 S201.45
M106 S255
; WIPE_START
M204 S6000
G1 X89.529 Y92.843 E-.09817
G1 X89.733 Y92.809 E-.08233
G1 X89.885 Y92.768 E-.06267
M73 P69 R7
G1 X90.177 Y92.657 E-.12396
G1 X90.177 Y93.077 E-.16679
G1 X89.608 Y93.077 E-.22609
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.04 I1.14 J-.426 P1  F42000
G1 X87.635 Y87.791 Z12.04
G1 Z11.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4800
M204 S6000
G1 X87.448 Y87.74 E.00402
G1 X87.448 Y87.348 E.00813
G1 X87.718 Y87.348 E.0056
G1 F2760
G1 X87.951 Y87.348 E.00485
G1 F2520
G1 X87.752 Y87.595 E.00659
G1 F3006.986
G1 X87.718 Y87.652 E.00139
G1 F3829.913
G1 X87.665 Y87.74 E.00211
; WIPE_START
G1 X87.448 Y87.74 E-.1034
G1 X87.448 Y87.348 E-.1863
G1 X87.718 Y87.348 E-.1282
G1 X87.951 Y87.348 E-.11102
G1 X87.752 Y87.595 E-.15092
G1 X87.718 Y87.652 E-.0318
G1 X87.665 Y87.74 E-.04836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.945 Y92.652 Z12.04 F42000
G1 Z11.64
G1 E.8 F1800
G1 F2880
M204 S6000
G1 X87.718 Y92.652 E.00471
G1 F4800
G1 X87.448 Y92.652 E.0056
G1 X87.448 Y92.262 E.00809
G1 X87.632 Y92.209 E.00398
G1 F4470.289
G1 X87.718 Y92.346 E.00334
G1 F3101.772
G1 X87.76 Y92.413 E.00164
G1 F2520
G1 X87.908 Y92.605 E.00503
M204 S10000
G1 X88.096 Y93.077 F42000
G1 F1800
M204 S6000
G1 X87.718 Y93.077 E.00784
M106 S201.45
M106 S255
G1 F4800
G1 X87.318 Y93.077 E.0083
G1 X87.023 Y93.077 E.0061
G1 X87.023 Y86.923 E.12763
G1 X87.318 Y86.923 E.0061
G1 X87.718 Y86.923 E.0083
G1 F1800
G1 X88.1 Y86.923 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F600
M204 S1000
G1 X89.25 Y86.923 E.02385
G1 X89.27 Y87.156 E.00484
M106 S201.45
M106 S255

G2 X88.1 Y87.839 I.159 J1.616 E.029
M106 S201.45
M106 S255
; FEATURE: Inner wall
M204 S6000
G1 X88.009 Y87.991 E.00366
M106 S201.45
M106 S255
G1 F960
G1 X87.943 Y88.133 E.00325
M106 S201.45
M106 S255
G1 F1753.135
G1 X87.891 Y88.281 E.00326
M106 S201.45
M106 S255
G1 F2280
G1 X87.853 Y88.433 E.00325
G1 F2640
G1 X87.832 Y88.589 E.00327
G1 F2880
G2 X87.835 Y88.902 I1.565 J.14 E.0065
G1 F2640
G1 X87.86 Y89.057 E.00325
G1 F2280
G1 X87.9 Y89.208 E.00324
G1 F1560
G1 X87.96 Y89.368 E.00355
M106 S201.45
M106 S255
G1 F1440
G1 X87.931 Y89.432 E.00144
M106 S201.45
M106 S255
G1 F1920
G1 X87.882 Y89.581 E.00326
G1 F2400
G1 X87.843 Y89.754 E.00368
G1 F2760
G1 X87.824 Y89.995 E.00502
G1 F2880
G1 X87.835 Y90.172 E.00368
G1 F2640
G1 X87.86 Y90.327 E.00326
G1 F2280
G1 X87.9 Y90.479 E.00326
G1 F1560
G1 X87.957 Y90.632 E.00338
M106 S201.45
M106 S255
G1 F1680
G1 X87.891 Y90.821 E.00416
M106 S201.45
M106 S255
G1 F2280
G1 X87.853 Y90.973 E.00325
G1 F2640
G1 X87.832 Y91.129 E.00327
G1 F2880
G2 X87.835 Y91.442 I1.565 J.14 E.0065
G1 F2640
G1 X87.86 Y91.597 E.00325
G1 F2280
G1 X87.9 Y91.748 E.00324
G1 F1590.983
G1 X87.955 Y91.896 E.00326
M106 S201.45
M106 S255
G1 F840
G1 X88.025 Y92.037 E.00327
M106 S201.45
M106 S255
G1 F600
G1 X88.1 Y92.158 E.00295
M106 S201.45
M106 S255
; FEATURE: Overhang wall

M204 S1000
G2 X88.989 Y92.79 I1.299 J-.884 E.02311
G1 X89.26 Y92.849 E.00576
G1 X89.236 Y93.077 E.00474
G1 X88.156 Y93.077 E.02241
M106 S201.45
M106 S255
M204 S10000
G1 X88.096 Y93.501 F42000
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X87.718 Y93.501 E.00784
M106 S201.45
M106 S255
G1 F4800
G1 X87.318 Y93.501 E.0083
G1 X86.599 Y93.501 E.0149
G1 X86.599 Y86.499 E.14523
G1 X87.318 Y86.499 E.0149
G1 X87.718 Y86.499 E.0083
G1 F1800
G1 X88.1 Y86.499 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F600
M204 S1000
G1 X90.601 Y86.499 E.05187
G1 X90.601 Y88.137 E.03397
M106 S201.45
M106 S255

G1 X90.41 Y88.186 E.00408
G2 X88.441 Y89.363 I-1.011 J.543 E.07698
G2 X88.442 Y90.634 I.967 J.635 E.02791
G2 X90.309 Y91.974 I.958 J.636 E.07319
G1 X90.422 Y91.812 E.0041
G1 X90.601 Y91.868 E.00388
G1 X90.601 Y93.501 E.03388
G1 X88.156 Y93.501 E.05072
M106 S201.45
M106 S255
M204 S250
G1 X88.096 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1920
M204 S1000
G1 X87.74 Y93.9 E.00651
G1 F2400
G1 X86.2 Y93.9 E.02818
G1 X86.2 Y86.1 E.14272
G1 X87.74 Y86.1 E.02818
G1 F1920
G1 X88.1 Y86.1 E.00659
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
G1 X91 Y86.1 E.06015
G1 X91 Y93.9 E.16179
M106 S201.45
M106 S255
G1 F3000
G1 X88.156 Y93.9 E.059
M106 S201.45
; WIPE_START
M204 S6000
G1 X87.74 Y93.9 E-.15792
M73 P70 R7
G1 X86.2 Y93.9 E-.5852
G1 X86.2 Y93.856 E-.01688
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.04 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.04
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
            G0 Z12.04 F4000
            G39.3 S1
            G0 Z12.04 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.491 Y92.029 F42000
G1 Z11.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463041
G1 F15000
M204 S6000
G1 X87.447 Y91.695 E.00719
; LINE_WIDTH: 0.417878
G1 X87.424 Y91.3 E.0076
G1 X87.441 Y90.905 E.00757
; LINE_WIDTH: 0.459885
G1 X87.465 Y90.706 E.00424
; LINE_WIDTH: 0.49659
G2 X87.474 Y90.628 I-.451 J-.095 E.00183
G1 X87.471 Y90.604 E.00055
; LINE_WIDTH: 0.472402
G1 X87.447 Y90.426 E.00392
; LINE_WIDTH: 0.41663
G3 X87.435 Y89.707 I4.344 J-.436 E.01377
; LINE_WIDTH: 0.447547
G3 X87.459 Y89.475 I3.312 J.234 E.00479
; LINE_WIDTH: 0.492064
G1 X87.476 Y89.367 E.00249
G1 X87.47 Y89.333 E.0008
; LINE_WIDTH: 0.472164
G1 X87.447 Y89.155 E.0039
; LINE_WIDTH: 0.417878
G1 X87.424 Y88.76 E.0076
G1 X87.441 Y88.365 E.00757
; LINE_WIDTH: 0.456658
G1 X87.461 Y88.197 E.00356
G1 X87.48 Y88.186 E.00047
; LINE_WIDTH: 0.428429
G1 X87.499 Y88.175 E.00044
; LINE_WIDTH: 0.394489
G1 X87.74 Y88.041 E.00498
M204 S10000
G1 X88.301 Y87.288 F42000
; LINE_WIDTH: 0.100331
G1 F15000
M204 S6000
G1 X88.47 Y87.136 E.00083
; WIPE_START
G1 X88.301 Y87.288 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.04 I-.7 J.996 P1  F42000
G1 X90.349 Y88.727 Z12.04
G1 Z11.64
G1 E.8 F1800
; LINE_WIDTH: 0.588396
G1 F15000
M204 S6000
G1 X90.523 Y89.506 E.02196
; LINE_WIDTH: 0.560425
G1 X90.543 Y89.609 E.00274
; LINE_WIDTH: 0.523748
G1 X90.56 Y89.73 E.00297
; LINE_WIDTH: 0.4906
G1 X90.572 Y89.87 E.0032
G1 X90.574 Y90.082 E.00482
G1 X90.55 Y90.342 E.00592
; LINE_WIDTH: 0.549637
G3 X90.526 Y90.482 I-2.005 J-.279 E.00366
M204 S10000
G1 X90.35 Y89.995 F42000
; LINE_WIDTH: 0.587864
G1 F15000
M204 S6000
G1 X90.524 Y90.777 E.02202
; LINE_WIDTH: 0.56014
G1 X90.543 Y90.88 E.00271
; LINE_WIDTH: 0.523695
G1 X90.56 Y91 E.00296
; LINE_WIDTH: 0.483982
G3 X90.555 Y91.644 I-2.94 J.303 E.01446
M204 S10000
G1 X90.389 Y92.287 F42000
; LINE_WIDTH: 0.102288
G1 F15000
M204 S6000
G1 X90.21 Y92.393 E.00077
; WIPE_START
G1 X90.389 Y92.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.04 I-.348 J-1.166 P1  F42000
G1 X88.516 Y92.847 Z12.04
G1 Z11.64
G1 E.8 F1800
; LINE_WIDTH: 0.109235
G1 F15000
M204 S6000
G1 X88.402 Y92.813 E.00048
G1 X88.265 Y92.682 E.00078
; CHANGE_LAYER
; Z_HEIGHT: 11.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.402 Y92.813 E-.46764
G1 X88.516 Y92.847 E-.29236
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/166
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z12.04 I1.165 J.352 P1  F42000
G1 X90.177 Y87.355 Z12.04
G1 Z11.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1300
M204 S6000
G2 X89.537 Y87.162 I-.808 J1.52 E.01395
G1 X89.552 Y86.923 E.00496
G1 X90.177 Y86.923 E.01296
G1 X90.177 Y87.295 E.00771
; WIPE_START
G1 F4800
G1 X89.976 Y87.265 E-.08137
G1 X89.828 Y87.214 E-.06307
G1 X89.676 Y87.18 E-.06248
G1 X89.537 Y87.162 E-.05656
G1 X89.552 Y86.923 E-.09604
G1 X90.177 Y86.923 E-.25116
G1 X90.177 Y87.295 E-.14932
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.16 I-.233 J-1.194 P1  F42000
G1 X87.637 Y87.79 Z12.16
G1 Z11.76
G1 E.8 F1800
G1 F1300
M204 S6000
G1 X87.448 Y87.74 E.00406
G1 X87.448 Y87.348 E.00814
G1 X87.932 Y87.348 E.01006
G1 X87.715 Y87.654 E.00779
G1 X87.667 Y87.738 E.00201
; WIPE_START
G1 F4800
G1 X87.448 Y87.74 E-.10612
G1 X87.448 Y87.348 E-.19006
G1 X87.932 Y87.348 E-.23486
G1 X87.715 Y87.654 E-.182
G1 X87.667 Y87.738 E-.04697
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.945 Y92.652 Z12.16 F42000
G1 Z11.76
G1 E.8 F1800
G1 F1300
M204 S6000
G1 X87.448 Y92.652 E.01031
G1 X87.448 Y92.262 E.00809
G1 X87.632 Y92.209 E.00398
G1 X87.76 Y92.414 E.00501
G1 X87.908 Y92.605 E.00501
; WIPE_START
G1 F4800
G1 X87.448 Y92.652 E-.23021
G1 X87.448 Y92.262 E-.19411
G1 X87.632 Y92.209 E-.09541
G1 X87.76 Y92.414 E-.12011
G1 X87.908 Y92.605 E-.12016
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.16 I-.207 J1.199 P1  F42000
G1 X89.267 Y92.839 Z12.16
G1 Z11.76
G1 E.8 F1800
G1 F1300
M204 S6000
G1 X89.251 Y93.077 E.00494
G1 X87.023 Y93.077 E.0462
G1 X87.023 Y86.923 E.12763
G1 X89.25 Y86.923 E.04618
G1 X89.27 Y87.156 E.00484
G2 X87.844 Y88.483 I.157 J1.599 E.04342
G2 X87.96 Y89.368 I1.63 J.237 E.01876
G2 X87.96 Y90.638 I1.442 J.635 E.02711
G2 X89.207 Y92.833 I1.44 J.633 E.06077
M204 S10000
G1 X89.548 Y93.077 F42000
G1 F1300
M204 S6000
G1 X89.529 Y92.843 E.00486
G2 X89.886 Y92.768 I-.195 J-1.819 E.00758
G1 X90.177 Y92.657 E.00645
G1 X90.177 Y93.077 E.0087
G1 X89.608 Y93.077 E.01179
M204 S10000
G1 X89.397 Y92.419 F42000
G1 F1300
M204 S6000
G1 X89.417 Y92.418 E.00041
G2 X90.31 Y91.973 I-.017 J-1.151 E.02139
G1 X90.422 Y91.812 E.00409
G1 X90.601 Y91.868 E.00388
G1 X90.601 Y93.501 E.03388
G1 X86.599 Y93.501 E.083
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y88.136 E.03395
G1 X90.418 Y88.189 E.00396
G2 X88.441 Y89.363 I-1.015 J.541 E.07718
G2 X88.441 Y90.633 I.967 J.635 E.02789
G2 X89.303 Y92.414 I.96 J.635 E.04941
G1 X89.337 Y92.416 E.00072
M204 S250
G1 X89.411 Y92.016 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1300
M204 S1000
G3 X89.001 Y90.635 I-.011 J-.748 E.03551
G3 X89.001 Y89.365 I.399 J-.635 E.02771
G3 X89.307 Y87.986 I.399 J-.636 E.03372
G3 X89.798 Y89.365 I.089 J.745 E.03702
G3 X89.798 Y90.635 I-.397 J.635 E.02774
G3 X89.471 Y92.013 I-.398 J.634 E.03404
; WIPE_START
G1 F2400
M204 S6000
G1 X89.258 Y92.007 E-.08093
G1 X89.135 Y91.972 E-.0487
G1 X89.064 Y91.941 E-.02935
G1 X88.938 Y91.861 E-.05676
G1 X88.881 Y91.812 E-.02874
G1 X88.785 Y91.699 E-.05623
G1 X88.745 Y91.636 E-.02854
G1 X88.685 Y91.498 E-.05686
G1 X88.654 Y91.352 E-.05686
G1 X88.65 Y91.274 E-.02954
G1 X88.66 Y91.146 E-.04885
G1 X88.7 Y90.999 E-.05811
G1 X88.768 Y90.866 E-.05656
G1 X88.811 Y90.806 E-.02821
G1 X88.915 Y90.698 E-.05686
G1 X88.998 Y90.638 E-.03891
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.16 I-1.175 J-.317 P1  F42000
G1 X88.118 Y93.9 Z12.16
G1 Z11.76
G1 E.8 F1800
G1 F1300
M204 S1000
G1 X86.2 Y93.9 E.03509
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y93.9 E.14272
G1 X88.178 Y93.9 E.05164
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.75163
G1 X86.2 Y93.878 E-.00837
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.16
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
            G0 Z12.16 F4000
            G39.3 S1
            G0 Z12.16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.491 Y92.029 F42000
G1 Z11.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463153
G1 F1300
M204 S6000
G1 X87.447 Y91.696 E.00718
; LINE_WIDTH: 0.41668
G3 X87.435 Y90.975 I4.331 J-.436 E.0138
; LINE_WIDTH: 0.447711
G3 X87.459 Y90.745 I3.316 J.236 E.00477
; LINE_WIDTH: 0.492085
G1 X87.476 Y90.637 E.00248
G1 X87.471 Y90.604 E.00077
; LINE_WIDTH: 0.472473
G1 X87.447 Y90.426 E.00392
; LINE_WIDTH: 0.416677
G3 X87.435 Y89.705 I4.332 J-.436 E.0138
; LINE_WIDTH: 0.447754
G3 X87.459 Y89.475 I3.31 J.235 E.00478
; LINE_WIDTH: 0.492131
G1 X87.476 Y89.367 E.00247
G1 X87.471 Y89.334 E.00077
; LINE_WIDTH: 0.472466
G1 X87.447 Y89.156 E.00392
; LINE_WIDTH: 0.417038
M73 P70 R6
G3 X87.437 Y88.407 I4.239 J-.434 E.01435
; LINE_WIDTH: 0.458689
G1 X87.46 Y88.195 E.00451
G1 X87.742 Y88.038 E.00684
M204 S10000
G1 X88.209 Y87.365 F42000
; LINE_WIDTH: 0.0931912
G1 F1300
M204 S6000
G1 X88.281 Y87.291 E.00034
; LINE_WIDTH: 0.120073
G1 X88.353 Y87.216 E.00048
; LINE_WIDTH: 0.140001
G1 X88.438 Y87.136 E.00066
; WIPE_START
G1 F15000
G1 X88.353 Y87.216 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.16 I-.721 J.981 P1  F42000
G1 X90.348 Y88.682 Z12.16
G1 Z11.76
G1 E.8 F1800
; LINE_WIDTH: 0.580358
G1 F1300
M204 S6000
G3 X90.543 Y89.609 I-18.48 J4.367 E.02567
; LINE_WIDTH: 0.52395
G1 X90.56 Y89.729 E.00296
; LINE_WIDTH: 0.488335
G3 X90.557 Y90.293 I-2.492 J.27 E.01278
; LINE_WIDTH: 0.534545
G1 X90.534 Y90.44 E.0037
M204 S10000
G1 X90.348 Y89.953 F42000
; LINE_WIDTH: 0.580227
G1 F1300
M204 S6000
G3 X90.543 Y90.879 I-18.169 J4.302 E.02565
; LINE_WIDTH: 0.5239
G1 X90.56 Y90.999 E.00295
; LINE_WIDTH: 0.484012
G3 X90.555 Y91.644 I-2.93 J.303 E.01448
M204 S10000
G1 X90.389 Y92.287 F42000
; LINE_WIDTH: 0.102269
G1 F1300
M204 S6000
G1 X90.21 Y92.393 E.00077
; WIPE_START
G1 F15000
G1 X90.389 Y92.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.16 I-.348 J-1.166 P1  F42000
G1 X88.516 Y92.847 Z12.16
G1 Z11.76
G1 E.8 F1800
; LINE_WIDTH: 0.109198
G1 F1300
M204 S6000
G1 X88.402 Y92.813 E.00048
G1 X88.265 Y92.682 E.00077
; CHANGE_LAYER
; Z_HEIGHT: 11.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.402 Y92.813 E-.46765
G1 X88.516 Y92.847 E-.29235
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/166
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z12.16 I1.165 J.352 P1  F42000
G1 X90.177 Y87.355 Z12.16
G1 Z11.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1276
M204 S6000
G2 X89.538 Y87.162 I-.808 J1.522 E.01393
G1 X89.552 Y86.923 E.00496
G1 X90.177 Y86.923 E.01295
G1 X90.177 Y87.295 E.0077
; WIPE_START
G1 F4800
G1 X89.975 Y87.264 E-.08197
G1 X89.827 Y87.214 E-.06295
G1 X89.674 Y87.179 E-.06316
G1 X89.538 Y87.162 E-.05524
G1 X89.552 Y86.923 E-.09619
G1 X90.177 Y86.923 E-.25108
G1 X90.177 Y87.295 E-.14941
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.28 I-.231 J-1.195 P1  F42000
G1 X87.642 Y87.785 Z12.28
G1 Z11.88
G1 E.8 F1800
G1 F1276
M204 S6000
G1 X87.448 Y87.738 E.00415
G1 X87.448 Y87.348 E.00809
G1 X87.933 Y87.348 E.01006
G1 X87.698 Y87.678 E.00841
G1 X87.67 Y87.732 E.00126
; WIPE_START
G1 F4800
G1 X87.448 Y87.738 E-.10793
G1 X87.448 Y87.348 E-.18968
G1 X87.933 Y87.348 E-.2358
G1 X87.698 Y87.678 E-.197
G1 X87.67 Y87.732 E-.0296
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.944 Y92.652 Z12.28 F42000
G1 Z11.88
G1 E.8 F1800
G1 F1276
M204 S6000
G1 X87.448 Y92.652 E.0103
G1 X87.448 Y92.262 E.00809
G1 X87.632 Y92.209 E.00398
G1 X87.759 Y92.412 E.00496
G1 X87.908 Y92.605 E.00505
; WIPE_START
G1 F4800
G1 X87.448 Y92.652 E-.23014
G1 X87.448 Y92.262 E-.19417
G1 X87.632 Y92.209 E-.09547
G1 X87.759 Y92.412 E-.11906
G1 X87.908 Y92.605 E-.12116
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.28 I-.215 J1.198 P1  F42000
G1 X89.23 Y92.843 Z12.28
G1 Z11.88
G1 E.8 F1800
G1 F1276
M204 S6000
G1 X89.26 Y92.849 E.00064
G1 X89.236 Y93.077 E.00474
G1 X87.023 Y93.077 E.04589
G1 X87.023 Y86.923 E.12763
G1 X89.255 Y86.923 E.04629
G1 X89.269 Y87.164 E.00499
G2 X87.957 Y89.362 I.129 J1.568 E.06201
G2 X87.957 Y90.632 I1.478 J.635 E.02708
G2 X88.988 Y92.79 I1.451 J.632 E.05625
G1 X89.171 Y92.83 E.00388
M204 S10000
G1 X89.548 Y93.077 F42000
G1 F1276
M204 S6000
G1 X89.529 Y92.843 E.00486
G2 X89.886 Y92.768 I-.196 J-1.822 E.00759
G1 X90.177 Y92.657 E.00644
G1 X90.177 Y93.077 E.0087
G1 X89.608 Y93.077 E.01179
M204 S10000
G1 X89.435 Y92.419 F42000
G1 F1276
M204 S6000
G1 X89.531 Y92.411 E.00201
G2 X90.413 Y91.813 I-.131 J-1.143 E.02297
G1 X90.601 Y91.864 E.00404
G1 X90.601 Y93.501 E.03394
G1 X86.599 Y93.501 E.083
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y88.137 E.03397
G1 X90.41 Y88.186 E.00409
G2 X88.44 Y89.36 I-1.011 J.544 E.0769
G2 X88.25 Y90.012 I1.036 J.655 E.01426
G2 X88.44 Y90.63 I1.141 J-.011 E.0136
G2 X88.25 Y91.282 I1.036 J.655 E.01426
G2 X89.375 Y92.418 I1.15 J-.013 E.03667
M204 S250
G1 X89.409 Y92.02 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1276
M204 S1000
G1 X89.407 Y92.02 E.00004
G3 X89.001 Y90.635 I-.007 J-.75 E.03552
G3 X89.001 Y89.365 I.4 J-.635 E.02771
G3 X89.252 Y87.994 I.405 J-.635 E.0326
G3 X89.798 Y89.365 I.144 J.737 E.03804
G3 X89.798 Y90.635 I-.397 J.635 E.02774
G3 X89.486 Y92.015 I-.398 J.635 E.03386
G1 X89.469 Y92.016 E.00031
; WIPE_START
G1 F2400
M204 S6000
G1 X89.407 Y92.02 E-.02358
G1 X89.281 Y92.011 E-.04806
G1 X89.133 Y91.971 E-.0583
G1 X88.999 Y91.904 E-.05676
G1 X88.938 Y91.861 E-.0284
G1 X88.83 Y91.758 E-.05662
G1 X88.784 Y91.699 E-.02861
G1 X88.744 Y91.635 E-.02855
G1 X88.685 Y91.498 E-.05654
G1 X88.654 Y91.353 E-.05663
G1 X88.653 Y91.203 E-.05682
G1 X88.681 Y91.056 E-.05682
G1 X88.706 Y90.984 E-.02915
G1 X88.765 Y90.869 E-.04895
G1 X88.811 Y90.805 E-.03015
G1 X88.915 Y90.698 E-.05663
G1 X88.999 Y90.637 E-.03944
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.28 I-1.177 J-.31 P1  F42000
G1 X88.14 Y93.9 Z12.28
G1 Z11.88
G1 E.8 F1800
G1 F1276
M204 S1000
G1 X86.2 Y93.9 E.0355
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y93.9 E.14272
G1 X88.2 Y93.9 E.05123
; WIPE_START
G1 F2400
M204 S6000
G1 X86.2 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.28 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.28
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
            G0 Z12.28 F4000
            G39.3 S1
            G0 Z12.28 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.491 Y92.029 F42000
G1 Z11.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463134
G1 F1276
M204 S6000
G1 X87.447 Y91.696 E.00718
; LINE_WIDTH: 0.417865
G1 X87.424 Y91.3 E.00761
G1 X87.441 Y90.906 E.00756
; LINE_WIDTH: 0.459624
G1 X87.464 Y90.707 E.00424
; LINE_WIDTH: 0.496459
G2 X87.474 Y90.628 I-.465 J-.098 E.00185
G1 X87.471 Y90.604 E.00055
; LINE_WIDTH: 0.472426
G1 X87.447 Y90.426 E.00392
; LINE_WIDTH: 0.417864
G1 X87.424 Y90.03 E.00761
G1 X87.441 Y89.636 E.00756
; LINE_WIDTH: 0.459625
G1 X87.464 Y89.437 E.00424
; LINE_WIDTH: 0.496468
G2 X87.474 Y89.358 I-.47 J-.098 E.00185
M73 P71 R6
G1 X87.471 Y89.334 E.00055
; LINE_WIDTH: 0.472444
G1 X87.447 Y89.156 E.00392
; LINE_WIDTH: 0.417874
G1 X87.424 Y88.76 E.00762
G1 X87.441 Y88.366 E.00756
; LINE_WIDTH: 0.456085
G1 X87.461 Y88.192 E.00368
G1 X87.491 Y88.174 E.00073
; LINE_WIDTH: 0.41035
G1 X87.744 Y88.028 E.00549
M204 S10000
G1 X88.21 Y87.364 F42000
; LINE_WIDTH: 0.0930579
G1 F1276
M204 S6000
G1 X88.281 Y87.29 E.00034
; LINE_WIDTH: 0.119663
G1 X88.353 Y87.216 E.00047
; LINE_WIDTH: 0.139545
G1 X88.439 Y87.136 E.00065
; WIPE_START
G1 F15000
G1 X88.353 Y87.216 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.28 I-.988 J.71 P1  F42000
G1 X90.35 Y89.993 Z12.28
G1 Z11.88
G1 E.8 F1800
; LINE_WIDTH: 0.586892
G1 F1276
M204 S6000
G1 X90.524 Y90.78 E.02211
; LINE_WIDTH: 0.559652
G1 X90.543 Y90.88 E.00266
; LINE_WIDTH: 0.523808
G1 X90.559 Y90.999 E.00292
; LINE_WIDTH: 0.484097
G3 X90.555 Y91.645 I-2.931 J.304 E.01451
M204 S10000
G1 X90.389 Y92.288 F42000
; LINE_WIDTH: 0.100413
G1 F1276
M204 S6000
G1 X90.212 Y92.393 E.00075
; WIPE_START
G1 F15000
G1 X90.389 Y92.288 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.28 I-.348 J-1.166 P1  F42000
G1 X88.516 Y92.847 Z12.28
G1 Z11.88
G1 E.8 F1800
; LINE_WIDTH: 0.109267
G1 F1276
M204 S6000
G1 X88.402 Y92.813 E.00049
G1 X88.264 Y92.681 E.00078
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.402 Y92.813 E-.46763
G1 X88.516 Y92.847 E-.29237
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/166
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z12.28 I1.165 J.352 P1  F42000
G1 X90.177 Y87.355 Z12.28
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1299
M204 S6000
G2 X89.537 Y87.162 I-.807 J1.516 E.01394
G1 X89.552 Y86.923 E.00496
G1 X90.177 Y86.923 E.01295
G1 X90.177 Y87.295 E.00771
; WIPE_START
G1 F4800
G1 X89.98 Y87.266 E-.07978
G1 X89.828 Y87.214 E-.0648
G1 X89.674 Y87.179 E-.06354
G1 X89.537 Y87.162 E-.05521
G1 X89.552 Y86.923 E-.09616
G1 X90.177 Y86.923 E-.25101
G1 X90.177 Y87.295 E-.1495
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.4 I-.233 J-1.194 P1  F42000
G1 X87.637 Y87.79 Z12.4
G1 Z12
G1 E.8 F1800
G1 F1299
M204 S6000
G1 X87.448 Y87.74 E.00406
G1 X87.448 Y87.348 E.00814
G1 X87.932 Y87.348 E.01006
G1 X87.715 Y87.654 E.00779
G1 X87.667 Y87.738 E.00201
; WIPE_START
G1 F4800
G1 X87.448 Y87.74 E-.10612
G1 X87.448 Y87.348 E-.19006
G1 X87.932 Y87.348 E-.23486
G1 X87.715 Y87.654 E-.18196
G1 X87.667 Y87.738 E-.04701
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.939 Y92.652 Z12.4 F42000
G1 Z12
G1 E.8 F1800
G1 F1299
M204 S6000
G1 X87.448 Y92.652 E.01019
G1 X87.448 Y92.258 E.00817
G1 X87.64 Y92.21 E.00411
G1 X87.718 Y92.355 E.00342
G1 X87.903 Y92.604 E.00644
; WIPE_START
G1 F4800
G1 X87.448 Y92.652 E-.22819
G1 X87.448 Y92.258 E-.19627
G1 X87.64 Y92.21 E-.09874
G1 X87.718 Y92.355 E-.08209
G1 X87.903 Y92.604 E-.15472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.4 I-.207 J1.199 P1  F42000
G1 X89.267 Y92.839 Z12.4
G1 Z12
G1 E.8 F1800
G1 F1299
M204 S6000
G1 X89.251 Y93.077 E.00494
G1 X87.023 Y93.077 E.0462
G1 X87.023 Y86.923 E.12763
G1 X89.255 Y86.923 E.04629
G1 X89.269 Y87.164 E.00499
G2 X87.959 Y89.369 I.13 J1.568 E.06218
G2 X87.959 Y90.639 I1.445 J.635 E.02711
G2 X89.207 Y92.833 I1.44 J.633 E.06077
M204 S10000
G1 X89.548 Y93.077 F42000
G1 F1299
M204 S6000
G1 X89.529 Y92.843 E.00486
G2 X89.886 Y92.768 I-.197 J-1.821 E.00759
G1 X90.177 Y92.657 E.00644
G1 X90.177 Y93.077 E.0087
G1 X89.608 Y93.077 E.01179
M204 S10000
G1 X89.396 Y92.419 F42000
G1 F1299
M204 S6000
G1 X89.417 Y92.419 E.00043
G2 X90.31 Y91.973 I-.016 J-1.15 E.02141
G1 X90.422 Y91.812 E.00408
G1 X90.601 Y91.868 E.00388
G1 X90.601 Y93.501 E.03388
G1 X86.599 Y93.501 E.083
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y88.137 E.03397
G1 X90.41 Y88.186 E.00409
G2 X88.44 Y89.365 I-1.012 J.545 E.07705
G2 X88.44 Y90.635 I.972 J.635 E.02787
G2 X89.303 Y92.415 I.961 J.633 E.04936
G1 X89.336 Y92.416 E.00069
M204 S250
G1 X89.411 Y92.016 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1299
M204 S1000
G3 X89.002 Y90.635 I-.01 J-.748 E.03551
G3 X89.002 Y89.365 I.396 J-.635 E.02774
G3 X89.252 Y87.994 I.399 J-.635 E.03268
G3 X89.798 Y89.365 I.145 J.737 E.03804
G3 X89.798 Y90.635 I-.405 J.635 E.02765
G3 X89.471 Y92.013 I-.398 J.634 E.03405
; WIPE_START
G1 F2400
M204 S6000
G1 X89.262 Y92.007 E-.07926
G1 X89.19 Y91.99 E-.02832
G1 X89.119 Y91.966 E-.0284
G1 X88.987 Y91.896 E-.05678
G1 X88.871 Y91.802 E-.05687
G1 X88.82 Y91.746 E-.02846
G1 X88.773 Y91.683 E-.03004
G1 X88.712 Y91.569 E-.04922
G1 X88.685 Y91.497 E-.02896
G1 X88.654 Y91.352 E-.05669
G1 X88.65 Y91.273 E-.02976
G1 X88.66 Y91.144 E-.04931
G1 X88.7 Y90.999 E-.05724
G1 X88.768 Y90.866 E-.05655
G1 X88.811 Y90.805 E-.02834
G1 X88.915 Y90.698 E-.05691
G1 X88.998 Y90.638 E-.03889
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.4 I-1.179 J-.302 P1  F42000
G1 X88.163 Y93.9 Z12.4
G1 Z12
G1 E.8 F1800
G1 F1299
M204 S1000
G1 X86.2 Y93.9 E.03591
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y93.9 E.14272
G1 X88.223 Y93.9 E.05082
; WIPE_START
G1 F2400
M204 S6000
G1 X86.223 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.4
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
            G0 Z12.4 F4000
            G39.3 S1
            G0 Z12.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.491 Y92.029 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463114
G1 F1299
M204 S6000
G1 X87.447 Y91.695 E.00718
; LINE_WIDTH: 0.416731
G3 X87.435 Y90.97 I4.327 J-.435 E.01388
; LINE_WIDTH: 0.448267
G3 X87.459 Y90.744 I3.287 J.237 E.0047
; LINE_WIDTH: 0.4923
G1 X87.476 Y90.637 E.00247
G1 X87.47 Y90.601 E.00083
; LINE_WIDTH: 0.471984
G1 X87.447 Y90.425 E.00387
; LINE_WIDTH: 0.416728
G3 X87.435 Y89.7 I4.328 J-.435 E.01388
; LINE_WIDTH: 0.448267
G3 X87.459 Y89.474 I3.287 J.237 E.0047
; LINE_WIDTH: 0.492309
G1 X87.476 Y89.367 E.00247
G1 X87.47 Y89.331 E.00083
; LINE_WIDTH: 0.471984
G1 X87.447 Y89.155 E.00387
; LINE_WIDTH: 0.417113
G3 X87.437 Y88.403 I4.237 J-.433 E.01443
; LINE_WIDTH: 0.458658
G1 X87.46 Y88.196 E.00441
G1 X87.742 Y88.038 E.00683
M204 S10000
G1 X88.209 Y87.365 F42000
; LINE_WIDTH: 0.093203
G1 F1299
M204 S6000
G1 X88.281 Y87.291 E.00034
; LINE_WIDTH: 0.120109
G1 X88.353 Y87.216 E.00048
; LINE_WIDTH: 0.140027
G1 X88.438 Y87.136 E.00065
; WIPE_START
G1 F15000
G1 X88.353 Y87.216 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.4 I-.733 J.971 P1  F42000
G1 X90.35 Y88.724 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.586543
G1 F1299
M204 S6000
G1 X90.524 Y89.511 E.0221
; LINE_WIDTH: 0.55952
G1 X90.543 Y89.61 E.00263
; LINE_WIDTH: 0.523858
G1 X90.559 Y89.729 E.00294
; LINE_WIDTH: 0.485326
G1 X90.575 Y89.965 E.00532
G1 X90.566 Y90.208 E.00547
; LINE_WIDTH: 0.517627
G3 X90.542 Y90.396 I-2.704 J-.255 E.00454
; LINE_WIDTH: 0.549059
G1 X90.536 Y90.432 E.00095
M204 S10000
G1 X90.35 Y89.994 F42000
; LINE_WIDTH: 0.586543
G1 F1299
M204 S6000
G1 X90.524 Y90.781 E.0221
; LINE_WIDTH: 0.55952
G1 X90.543 Y90.88 E.00263
; LINE_WIDTH: 0.523858
G1 X90.559 Y90.999 E.00294
; LINE_WIDTH: 0.484025
G3 X90.555 Y91.644 I-2.935 J.304 E.01448
M204 S10000
G1 X90.389 Y92.287 F42000
; LINE_WIDTH: 0.102317
G1 F1299
M204 S6000
G1 X90.21 Y92.393 E.00077
; WIPE_START
G1 F15000
G1 X90.389 Y92.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.4 I-.346 J-1.167 P1  F42000
G1 X88.443 Y92.864 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.135856
G1 F1299
M204 S6000
G1 X88.384 Y92.805 E.00045
; LINE_WIDTH: 0.120426
G1 X88.31 Y92.732 E.00048
; LINE_WIDTH: 0.093309
G1 X88.236 Y92.658 E.00034
; CHANGE_LAYER
; Z_HEIGHT: 12.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.31 Y92.732 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/166
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z12.4 I1.15 J.399 P1  F42000
G1 X90.177 Y87.355 Z12.4
G1 Z12.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1281
M204 S6000
G2 X89.537 Y87.162 I-.809 J1.525 E.01393
G1 X89.552 Y86.923 E.00496
G1 X90.177 Y86.923 E.01295
G1 X90.177 Y87.295 E.0077
; WIPE_START
G1 F4800
G1 X89.975 Y87.264 E-.08217
G1 X89.826 Y87.214 E-.06314
G1 X89.674 Y87.179 E-.06271
G1 X89.537 Y87.162 E-.05532
G1 X89.552 Y86.923 E-.09618
G1 X90.177 Y86.923 E-.2511
G1 X90.177 Y87.295 E-.14938
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.637 Y87.79 Z12.52 F42000
G1 Z12.12
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X87.448 Y87.74 E.00406
G1 X87.448 Y87.348 E.00814
G1 X87.932 Y87.348 E.01005
G1 X87.715 Y87.653 E.00777
G1 X87.667 Y87.738 E.00204
; WIPE_START
G1 F4800
G1 X87.448 Y87.74 E-.10608
G1 X87.448 Y87.348 E-.19007
G1 X87.932 Y87.348 E-.23483
G1 X87.715 Y87.653 E-.18148
G1 X87.667 Y87.738 E-.04754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.944 Y92.652 Z12.52 F42000
G1 Z12.12
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X87.448 Y92.652 E.0103
G1 X87.448 Y92.262 E.00809
G1 X87.632 Y92.209 E.00398
G1 X87.759 Y92.412 E.00496
G1 X87.908 Y92.605 E.00505
; WIPE_START
G1 F4800
G1 X87.448 Y92.652 E-.2301
G1 X87.448 Y92.262 E-.19422
G1 X87.632 Y92.209 E-.09549
G1 X87.759 Y92.412 E-.11907
G1 X87.908 Y92.605 E-.12113
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.267 Y92.839 Z12.52 F42000
G1 Z12.12
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X89.251 Y93.077 E.00494
G1 X87.023 Y93.077 E.0462
G1 X87.023 Y86.923 E.12763
G1 X89.255 Y86.923 E.04628
G1 X89.268 Y87.164 E.00499
G2 X87.96 Y89.368 I.129 J1.567 E.06216
G2 X87.845 Y89.748 I1.598 J.692 E.00824
G1 X87.824 Y89.994 E.00512
G2 X87.96 Y90.638 I1.64 J-.008 E.01376
G2 X87.845 Y91.018 I1.598 J.692 E.00824
G1 X87.824 Y91.264 E.00512
G2 X89.207 Y92.833 I1.582 J0 E.0474
M204 S10000
G1 X89.548 Y93.077 F42000
G1 F1281
M204 S6000
G1 X89.529 Y92.843 E.00486
G2 X89.886 Y92.768 I-.197 J-1.823 E.00759
G1 X90.177 Y92.657 E.00644
G1 X90.177 Y93.077 E.0087
G1 X89.608 Y93.077 E.01179
M204 S10000
G1 X89.396 Y92.419 F42000
G1 F1281
M204 S6000
G1 X89.417 Y92.419 E.00042
G2 X90.31 Y91.974 I-.016 J-1.151 E.0214
G1 X90.422 Y91.812 E.00409
G1 X90.601 Y91.867 E.00388
G1 X90.601 Y93.501 E.03388
G1 X86.599 Y93.501 E.083
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y88.136 E.03396
G1 X90.415 Y88.189 E.004
G2 X88.441 Y89.363 I-1.014 J.542 E.0771
G2 X88.441 Y90.633 I.967 J.635 E.02789
G2 X89.303 Y92.414 I.96 J.635 E.04941
G1 X89.336 Y92.416 E.0007
M204 S250
G1 X89.411 Y92.016 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1281
M204 S1000
G3 X89.001 Y90.635 I-.01 J-.748 E.0355
G3 X89.001 Y89.365 I.4 J-.635 E.02771
G3 X89.252 Y87.994 I.4 J-.635 E.03269
G3 X89.798 Y89.365 I.144 J.737 E.03804
G3 X89.798 Y90.635 I-.405 J.635 E.02765
G3 X89.471 Y92.013 I-.398 J.634 E.03405
; WIPE_START
G1 F2400
M204 S6000
G1 X89.258 Y92.007 E-.08085
G1 X89.133 Y91.971 E-.04957
G1 X88.999 Y91.904 E-.05659
G1 X88.938 Y91.861 E-.0284
G1 X88.882 Y91.812 E-.02852
G1 X88.784 Y91.699 E-.05679
G1 X88.712 Y91.568 E-.0567
G1 X88.685 Y91.498 E-.02854
G1 X88.654 Y91.352 E-.05676
G1 X88.65 Y91.273 E-.03002
G1 X88.66 Y91.143 E-.04958
G1 X88.7 Y90.999 E-.05674
G1 X88.731 Y90.93 E-.02863
G1 X88.811 Y90.806 E-.0563
G1 X88.915 Y90.698 E-.0569
G1 X88.998 Y90.638 E-.03913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.185 Y93.9 Z12.52 F42000
G1 Z12.12
G1 E.8 F1800
G1 F1281
M204 S1000
G1 X86.2 Y93.9 E.03632
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y93.9 E.14272
G1 X88.245 Y93.9 E.05041
; WIPE_START
G1 F2400
M204 S6000
M73 P72 R6
G1 X86.245 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.52 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.52
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
            G0 Z12.52 F4000
            G39.3 S1
            G0 Z12.52 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.491 Y92.029 F42000
G1 Z12.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463081
G1 F1281
M204 S6000
G1 X87.447 Y91.696 E.00719
; LINE_WIDTH: 0.416773
G3 X87.435 Y90.969 I4.326 J-.435 E.01392
; LINE_WIDTH: 0.448506
G3 X87.459 Y90.743 I3.225 J.232 E.00468
; LINE_WIDTH: 0.49232
G1 X87.476 Y90.637 E.00245
G1 X87.471 Y90.604 E.00078
; LINE_WIDTH: 0.47232
G1 X87.447 Y90.426 E.00393
; LINE_WIDTH: 0.416751
G3 X87.435 Y89.699 I4.326 J-.435 E.01392
; LINE_WIDTH: 0.448516
G3 X87.459 Y89.473 I3.269 J.237 E.00468
; LINE_WIDTH: 0.492333
G1 X87.476 Y89.367 E.00245
G1 X87.47 Y89.334 E.00078
; LINE_WIDTH: 0.472331
G1 X87.447 Y89.156 E.00392
; LINE_WIDTH: 0.417165
G3 X87.437 Y88.401 I4.238 J-.433 E.01447
; LINE_WIDTH: 0.458419
G1 X87.46 Y88.196 E.00436
G1 X87.742 Y88.038 E.00682
M204 S10000
G1 X88.208 Y87.365 F42000
; LINE_WIDTH: 0.0932789
G1 F1281
M204 S6000
G1 X88.281 Y87.29 E.00034
; LINE_WIDTH: 0.120323
G1 X88.353 Y87.215 E.00048
; LINE_WIDTH: 0.14021
G1 X88.438 Y87.136 E.00065
; WIPE_START
G1 F15000
G1 X88.353 Y87.215 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.35 Y88.722 Z12.52 F42000
G1 Z12.12
G1 E.8 F1800
; LINE_WIDTH: 0.585937
G1 F1281
M204 S6000
G1 X90.525 Y89.512 E.02216
; LINE_WIDTH: 0.559043
G1 X90.543 Y89.611 E.00262
; LINE_WIDTH: 0.523637
G1 X90.56 Y89.729 E.00292
; LINE_WIDTH: 0.486112
G3 X90.563 Y90.241 I-2.347 J.271 E.01155
; LINE_WIDTH: 0.522809
G1 X90.541 Y90.401 E.00391
; LINE_WIDTH: 0.55093
G1 X90.535 Y90.437 E.00095
; WIPE_START
G1 F15000
G1 X90.541 Y90.401 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.389 Y92.287 Z12.52 F42000
G1 Z12.12
G1 E.8 F1800
; LINE_WIDTH: 0.102318
G1 F1281
M204 S6000
G1 X90.21 Y92.393 E.00078
; WIPE_START
G1 F15000
G1 X90.389 Y92.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.516 Y92.846 Z12.52 F42000
G1 Z12.12
G1 E.8 F1800
; LINE_WIDTH: 0.109634
G1 F1281
M204 S6000
G1 X88.402 Y92.813 E.00049
G1 X88.283 Y92.699 E.00067
; LINE_WIDTH: 0.0791314
G1 X88.282 Y92.663 E.00009
; CHANGE_LAYER
; Z_HEIGHT: 12.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.283 Y92.699 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/166
; update layer progress
M73 L101
M991 S0 P100 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z12.52 I1.147 J.406 P1  F42000
G1 X90.177 Y87.355 Z12.52
G1 Z12.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1281
M204 S6000
G2 X89.537 Y87.162 I-.807 J1.52 E.01393
G1 X89.552 Y86.923 E.00496
G1 X90.177 Y86.923 E.01295
G1 X90.177 Y87.295 E.0077
; WIPE_START
G1 F4800
G1 X89.976 Y87.264 E-.08163
G1 X89.827 Y87.214 E-.06308
G1 X89.674 Y87.179 E-.06339
G1 X89.537 Y87.162 E-.05523
G1 X89.552 Y86.923 E-.09619
G1 X90.177 Y86.923 E-.25108
G1 X90.177 Y87.295 E-.14941
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.642 Y87.785 Z12.64 F42000
G1 Z12.24
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X87.448 Y87.738 E.00415
G1 X87.448 Y87.348 E.00809
G1 X87.933 Y87.348 E.01006
G1 X87.697 Y87.679 E.00844
G1 X87.67 Y87.731 E.00121
; WIPE_START
G1 F4800
G1 X87.448 Y87.738 E-.10807
G1 X87.448 Y87.348 E-.18969
G1 X87.933 Y87.348 E-.23579
G1 X87.697 Y87.679 E-.19798
G1 X87.67 Y87.731 E-.02846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.944 Y92.652 Z12.64 F42000
G1 Z12.24
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X87.448 Y92.652 E.0103
G1 X87.448 Y92.262 E.00809
G1 X87.632 Y92.209 E.00398
G1 X87.758 Y92.412 E.00495
G1 X87.908 Y92.605 E.00506
; WIPE_START
G1 F4800
G1 X87.448 Y92.652 E-.23012
G1 X87.448 Y92.262 E-.1942
G1 X87.632 Y92.209 E-.0955
G1 X87.758 Y92.412 E-.11872
G1 X87.908 Y92.605 E-.12147
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.267 Y92.839 Z12.64 F42000
G1 Z12.24
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X89.251 Y93.077 E.00494
G1 X87.023 Y93.077 E.0462
G1 X87.023 Y86.923 E.12763
G1 X89.255 Y86.923 E.04629
G1 X89.268 Y87.164 E.005
G2 X87.957 Y89.361 I.129 J1.567 E.062
G2 X87.957 Y90.631 I1.481 J.635 E.02708
G2 X89.207 Y92.833 I1.448 J.633 E.0609
M204 S10000
G1 X89.548 Y93.077 F42000
G1 F1281
M204 S6000
G1 X89.529 Y92.843 E.00486
G2 X89.887 Y92.768 I-.197 J-1.823 E.0076
G1 X90.177 Y92.657 E.00643
G1 X90.177 Y93.077 E.0087
G1 X89.608 Y93.077 E.01179
M204 S10000
G1 X89.397 Y92.419 F42000
G1 F1281
M204 S6000
G1 X89.417 Y92.419 E.00043
G2 X90.31 Y91.973 I-.017 J-1.15 E.0214
G1 X90.422 Y91.812 E.00408
G1 X90.601 Y91.868 E.00388
G1 X90.601 Y93.501 E.03388
G1 X86.599 Y93.501 E.083
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y88.136 E.03396
G1 X90.415 Y88.189 E.004
G2 X88.439 Y89.36 I-1.014 J.542 E.07703
G1 X88.337 Y89.559 E.00463
G2 X88.439 Y90.63 I1.066 J.439 E.02323
G1 X88.337 Y90.829 E.00463
G2 X89.303 Y92.415 I1.063 J.44 E.04481
G1 X89.337 Y92.416 E.00071
M204 S250
G1 X89.411 Y92.016 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1281
M204 S1000
G3 X89.001 Y90.635 I-.011 J-.748 E.03551
G3 X89.001 Y89.365 I.4 J-.635 E.02771
G3 X89.252 Y87.994 I.405 J-.635 E.0326
G3 X89.798 Y89.365 I.144 J.737 E.03804
G3 X89.798 Y90.635 I-.397 J.635 E.02774
G3 X89.471 Y92.013 I-.398 J.634 E.03403
; WIPE_START
G1 F2400
M204 S6000
G1 X89.258 Y92.007 E-.0812
G1 X89.132 Y91.971 E-.04985
G1 X88.999 Y91.904 E-.05632
G1 X88.938 Y91.861 E-.02839
G1 X88.83 Y91.758 E-.05678
G1 X88.784 Y91.698 E-.02865
G1 X88.712 Y91.568 E-.05659
G1 X88.685 Y91.498 E-.02843
G1 X88.654 Y91.352 E-.05675
G1 X88.65 Y91.278 E-.02833
G1 X88.663 Y91.129 E-.05686
G1 X88.705 Y90.986 E-.05634
G1 X88.765 Y90.87 E-.04993
G1 X88.811 Y90.805 E-.0299
G1 X88.915 Y90.698 E-.05701
G1 X88.998 Y90.638 E-.03868
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.207 Y93.9 Z12.64 F42000
G1 Z12.24
G1 E.8 F1800
G1 F1281
M204 S1000
G1 X86.2 Y93.9 E.03673
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y93.9 E.14272
G1 X88.267 Y93.9 E.05001
; WIPE_START
G1 F2400
M204 S6000
G1 X86.267 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.64 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.64
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
            G0 Z12.64 F4000
            G39.3 S1
            G0 Z12.64 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.491 Y92.029 F42000
G1 Z12.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46317
G1 F1281
M204 S6000
G1 X87.447 Y91.696 E.00717
; LINE_WIDTH: 0.417927
G1 X87.424 Y91.3 E.00762
G1 X87.441 Y90.904 E.00758
; LINE_WIDTH: 0.459688
G1 X87.464 Y90.708 E.00419
; LINE_WIDTH: 0.496413
G2 X87.474 Y90.627 I-.467 J-.098 E.00188
G1 X87.47 Y90.604 E.00055
; LINE_WIDTH: 0.472427
G1 X87.447 Y90.427 E.0039
; LINE_WIDTH: 0.417932
G1 X87.424 Y90.03 E.00762
G1 X87.441 Y89.634 E.00758
; LINE_WIDTH: 0.459676
G1 X87.464 Y89.438 E.00419
; LINE_WIDTH: 0.496401
G2 X87.474 Y89.357 I-.471 J-.098 E.00188
G1 X87.471 Y89.334 E.00055
; LINE_WIDTH: 0.47245
G1 X87.447 Y89.156 E.00391
; LINE_WIDTH: 0.417928
G1 X87.424 Y88.76 E.00762
G1 X87.441 Y88.364 E.00758
; LINE_WIDTH: 0.456402
G1 X87.461 Y88.192 E.00366
G1 X87.49 Y88.174 E.0007
; LINE_WIDTH: 0.412657
G1 X87.744 Y88.028 E.00555
M204 S10000
G1 X88.209 Y87.365 F42000
; LINE_WIDTH: 0.0932833
G1 F1281
M204 S6000
G1 X88.281 Y87.29 E.00034
; LINE_WIDTH: 0.12034
G1 X88.354 Y87.215 E.00048
; LINE_WIDTH: 0.14017
G1 X88.438 Y87.136 E.00065
; WIPE_START
G1 F15000
G1 X88.354 Y87.215 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.35 Y88.729 Z12.64 F42000
G1 Z12.24
G1 E.8 F1800
; LINE_WIDTH: 0.588456
G1 F1281
M204 S6000
G1 X90.523 Y89.506 E.0219
; LINE_WIDTH: 0.560452
G1 X90.543 Y89.609 E.00274
; LINE_WIDTH: 0.52386
G1 X90.56 Y89.729 E.00295
; LINE_WIDTH: 0.488476
G3 X90.557 Y90.295 I-2.495 J.27 E.01283
; LINE_WIDTH: 0.534824
G1 X90.534 Y90.439 E.00364
; WIPE_START
G1 F15000
G1 X90.557 Y90.295 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.389 Y92.287 Z12.64 F42000
G1 Z12.24
G1 E.8 F1800
; LINE_WIDTH: 0.102297
G1 F1281
M204 S6000
G1 X90.21 Y92.393 E.00078
; WIPE_START
G1 F15000
G1 X90.389 Y92.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.516 Y92.847 Z12.64 F42000
G1 Z12.24
G1 E.8 F1800
; LINE_WIDTH: 0.109384
G1 F1281
M204 S6000
G1 X88.402 Y92.813 E.00049
G1 X88.264 Y92.681 E.00078
; CHANGE_LAYER
; Z_HEIGHT: 12.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.402 Y92.813 E-.4674
G1 X88.516 Y92.847 E-.2926
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/166
; update layer progress
M73 L102
M991 S0 P101 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z12.64 I1.165 J.352 P1  F42000
G1 X90.177 Y87.355 Z12.64
G1 Z12.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1280
M204 S6000
G2 X89.538 Y87.162 I-.808 J1.523 E.01393
G1 X89.552 Y86.923 E.00496
G1 X90.177 Y86.923 E.01294
G1 X90.177 Y87.295 E.0077
; WIPE_START
G1 F4800
G1 X89.975 Y87.264 E-.08204
G1 X89.826 Y87.214 E-.06303
G1 X89.674 Y87.179 E-.06304
G1 X89.538 Y87.162 E-.0552
G1 X89.552 Y86.923 E-.09621
G1 X90.177 Y86.923 E-.25108
G1 X90.177 Y87.295 E-.14941
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.637 Y87.79 Z12.76 F42000
G1 Z12.36
G1 E.8 F1800
G1 F1280
M204 S6000
G1 X87.448 Y87.74 E.00406
G1 X87.448 Y87.348 E.00814
G1 X87.933 Y87.348 E.01006
G1 X87.714 Y87.654 E.00781
G1 X87.667 Y87.738 E.00199
; WIPE_START
G1 F4800
G1 X87.448 Y87.74 E-.10614
G1 X87.448 Y87.348 E-.19005
G1 X87.933 Y87.348 E-.23488
G1 X87.714 Y87.654 E-.18236
G1 X87.667 Y87.738 E-.04658
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.939 Y92.652 Z12.76 F42000
G1 Z12.36
G1 E.8 F1800
G1 F1280
M204 S6000
G1 X87.448 Y92.652 E.01019
G1 X87.448 Y92.258 E.00817
G1 X87.64 Y92.21 E.00411
G1 X87.719 Y92.356 E.00345
G1 X87.903 Y92.604 E.00641
; WIPE_START
G1 F4800
G1 X87.448 Y92.652 E-.2282
G1 X87.448 Y92.258 E-.19626
G1 X87.64 Y92.21 E-.09862
G1 X87.719 Y92.356 E-.08289
G1 X87.903 Y92.604 E-.15403
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.267 Y92.839 Z12.76 F42000
G1 Z12.36
G1 E.8 F1800
G1 F1280
M204 S6000
G1 X89.251 Y93.077 E.00494
G1 X87.023 Y93.077 E.0462
G1 X87.023 Y86.923 E.12763
G1 X89.254 Y86.923 E.04627
G1 X89.267 Y87.164 E.005
G2 X87.96 Y89.368 I.131 J1.568 E.06213
G1 X87.923 Y89.45 E.00186
G2 X87.96 Y90.638 I1.517 J.548 E.02526
G1 X87.923 Y90.72 E.00185
G2 X89.207 Y92.833 I1.482 J.546 E.0589
M204 S10000
G1 X89.548 Y93.077 F42000
G1 F1280
M204 S6000
G1 X89.529 Y92.843 E.00486
G2 X89.887 Y92.768 I-.2 J-1.837 E.0076
G1 X90.177 Y92.657 E.00643
G1 X90.177 Y93.077 E.0087
G1 X89.608 Y93.077 E.01179
M204 S10000
G1 X89.397 Y92.419 F42000
G1 F1280
M204 S6000
G1 X89.417 Y92.419 E.00042
G2 X90.31 Y91.974 I-.017 J-1.15 E.02139
G1 X90.422 Y91.812 E.00409
G1 X90.601 Y91.868 E.00388
G1 X90.601 Y93.501 E.03388
G1 X86.599 Y93.501 E.083
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y88.136 E.03396
G1 X90.415 Y88.189 E.004
G2 X88.44 Y89.365 I-1.014 J.543 E.07716
G2 X88.44 Y90.635 I.971 J.635 E.02788
G2 X89.303 Y92.414 I.961 J.633 E.04936
G1 X89.337 Y92.416 E.00071
M204 S250
G1 X89.411 Y92.016 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1280
M204 S1000
G3 X89.002 Y90.635 I-.011 J-.748 E.03552
G3 X89.002 Y89.365 I.404 J-.635 E.02765
G3 X89.252 Y87.994 I.399 J-.635 E.03269
G3 X89.798 Y89.364 I.147 J.735 E.03812
G3 X89.798 Y90.634 I-.398 J.635 E.02772
G3 X89.471 Y92.013 I-.397 J.634 E.03405
; WIPE_START
G1 F2400
M204 S6000
G1 X89.337 Y92.018 E-.05115
G1 X89.19 Y91.99 E-.05671
G1 X89.119 Y91.966 E-.02864
G1 X88.987 Y91.896 E-.05675
G1 X88.871 Y91.802 E-.05676
G1 X88.82 Y91.746 E-.02838
G1 X88.773 Y91.683 E-.03008
G1 X88.713 Y91.572 E-.04817
G1 X88.685 Y91.498 E-.02998
G1 X88.666 Y91.425 E-.02838
G1 X88.65 Y91.278 E-.05652
G1 X88.664 Y91.124 E-.05856
G1 X88.699 Y91.003 E-.048
G1 X88.73 Y90.932 E-.0296
G1 X88.811 Y90.805 E-.05699
G1 X88.915 Y90.698 E-.05672
G1 X88.997 Y90.638 E-.03862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.229 Y93.9 Z12.76 F42000
G1 Z12.36
G1 E.8 F1800
G1 F1280
M204 S1000
G1 X86.2 Y93.9 E.03713
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y93.9 E.14272
G1 X88.289 Y93.9 E.0496
; WIPE_START
G1 F2400
M204 S6000
G1 X86.289 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.76 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.76
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
            G0 Z12.76 F4000
            G39.3 S1
            G0 Z12.76 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




M73 P73 R6
G1 X87.491 Y92.029 F42000
G1 Z12.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.462947
G1 F1280
M204 S6000
G1 X87.447 Y91.694 E.0072
; LINE_WIDTH: 0.418496
G1 X87.424 Y91.299 E.0076
G1 X87.428 Y91.102 E.00378
G1 X87.443 Y90.879 E.0043
; LINE_WIDTH: 0.457895
G3 X87.461 Y90.744 I1.933 J.189 E.00289
; LINE_WIDTH: 0.491674
G1 X87.476 Y90.637 E.00244
; LINE_WIDTH: 0.500647
G1 X87.47 Y90.602 E.00083
; LINE_WIDTH: 0.471932
G1 X87.447 Y90.424 E.00391
; LINE_WIDTH: 0.418506
G1 X87.424 Y90.029 E.0076
G1 X87.428 Y89.832 E.00379
G1 X87.443 Y89.609 E.0043
; LINE_WIDTH: 0.457906
G3 X87.461 Y89.474 I1.949 J.191 E.00289
; LINE_WIDTH: 0.491676
G1 X87.476 Y89.368 E.00244
; LINE_WIDTH: 0.500637
G1 X87.47 Y89.332 E.00083
; LINE_WIDTH: 0.47192
G1 X87.447 Y89.154 E.00391
; LINE_WIDTH: 0.418497
G1 X87.424 Y88.759 E.0076
G1 X87.428 Y88.562 E.00378
G1 X87.443 Y88.339 E.0043
; LINE_WIDTH: 0.461142
G3 X87.494 Y87.972 I5.245 J.537 E.00789
M204 S10000
G1 X88.209 Y87.365 F42000
; LINE_WIDTH: 0.0931865
G1 F1280
M204 S6000
G1 X88.281 Y87.29 E.00034
; LINE_WIDTH: 0.120063
G1 X88.353 Y87.216 E.00048
; LINE_WIDTH: 0.139987
G1 X88.438 Y87.136 E.00065
; WIPE_START
G1 F15000
G1 X88.353 Y87.216 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.349 Y88.727 Z12.76 F42000
G1 Z12.36
G1 E.8 F1800
; LINE_WIDTH: 0.588396
G1 F1280
M204 S6000
G1 X90.523 Y89.506 E.02198
; LINE_WIDTH: 0.560469
G1 X90.543 Y89.609 E.00273
; LINE_WIDTH: 0.523907
G1 X90.56 Y89.729 E.00296
; LINE_WIDTH: 0.489281
G1 X90.575 Y89.987 E.00586
G1 X90.573 Y90.106 E.00268
G1 X90.554 Y90.317 E.00482
; LINE_WIDTH: 0.542446
G1 X90.529 Y90.464 E.00376
; WIPE_START
G1 F15000
G1 X90.554 Y90.317 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.389 Y92.287 Z12.76 F42000
G1 Z12.36
G1 E.8 F1800
; LINE_WIDTH: 0.102082
G1 F1280
M204 S6000
G1 X90.211 Y92.392 E.00077
; WIPE_START
G1 F15000
G1 X90.389 Y92.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.449 Y92.864 Z12.76 F42000
G1 Z12.36
G1 E.8 F1800
; LINE_WIDTH: 0.13566
G1 F1280
M204 S6000
G1 X88.383 Y92.805 E.00048
; LINE_WIDTH: 0.120138
G1 X88.31 Y92.731 E.00048
; LINE_WIDTH: 0.093215
G1 X88.236 Y92.658 E.00034
; CHANGE_LAYER
; Z_HEIGHT: 12.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.31 Y92.731 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/166
; update layer progress
M73 L103
M991 S0 P102 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z12.76 I1.15 J.399 P1  F42000
G1 X90.177 Y87.355 Z12.76
G1 Z12.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1260
M204 S6000
G2 X89.543 Y87.15 I-.987 J1.966 E.01386
G1 X89.569 Y86.923 E.00472
G1 X90.177 Y86.923 E.0126
G1 X90.177 Y87.295 E.0077
; WIPE_START
G1 F4800
G1 X89.975 Y87.264 E-.08345
G1 X89.826 Y87.214 E-.0642
G1 X89.543 Y87.15 E-.11868
G1 X89.569 Y86.923 E-.09307
G1 X90.177 Y86.923 E-.24863
G1 X90.177 Y87.295 E-.15196
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.637 Y87.79 Z12.88 F42000
G1 Z12.48
G1 E.8 F1800
G1 F1260
M204 S6000
G1 X87.448 Y87.74 E.00406
G1 X87.448 Y87.348 E.00814
G1 X87.933 Y87.348 E.01006
G1 X87.715 Y87.653 E.00777
G1 X87.667 Y87.738 E.00203
; WIPE_START
G1 F4800
G1 X87.448 Y87.74 E-.10609
G1 X87.448 Y87.348 E-.19003
G1 X87.933 Y87.348 E-.23488
G1 X87.715 Y87.653 E-.18154
G1 X87.667 Y87.738 E-.04746
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.944 Y92.652 Z12.88 F42000
G1 Z12.48
G1 E.8 F1800
G1 F1260
M204 S6000
G1 X87.448 Y92.652 E.0103
G1 X87.448 Y92.262 E.00809
G1 X87.632 Y92.209 E.00398
G1 X87.759 Y92.412 E.00497
G1 X87.908 Y92.605 E.00504
; WIPE_START
G1 F4800
G1 X87.448 Y92.652 E-.23014
G1 X87.448 Y92.262 E-.19418
G1 X87.632 Y92.209 E-.09547
G1 X87.759 Y92.412 E-.11918
G1 X87.908 Y92.605 E-.12104
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.267 Y92.839 Z12.88 F42000
G1 Z12.48
G1 E.8 F1800
G1 F1260
M204 S6000
G1 X89.251 Y93.077 E.00494
G1 X87.023 Y93.077 E.0462
G1 X87.023 Y86.923 E.12763
G1 X89.253 Y86.923 E.04624
G1 X89.271 Y87.158 E.00489
G2 X87.96 Y89.368 I.135 J1.574 E.06224
G2 X87.96 Y90.638 I1.442 J.635 E.02711
G2 X88.578 Y92.615 I1.445 J.633 E.04686
G1 X88.823 Y92.739 E.00569
G1 X89.087 Y92.815 E.00572
G1 X89.207 Y92.831 E.00251
M204 S10000
G1 X89.548 Y93.077 F42000
G1 F1260
M204 S6000
G1 X89.529 Y92.843 E.00486
G2 X90.177 Y92.642 I-.226 J-1.876 E.01414
G1 X90.177 Y93.077 E.00901
G1 X89.608 Y93.077 E.01179
M204 S10000
G1 X89.397 Y92.419 F42000
G1 F1260
M204 S6000
G1 X89.417 Y92.418 E.00042
G2 X90.413 Y91.813 I-.017 J-1.15 E.02533
G1 X90.601 Y91.864 E.00404
G1 X90.601 Y93.501 E.03394
G1 X86.599 Y93.501 E.083
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y88.136 E.03395
G1 X90.417 Y88.189 E.00396
G2 X88.441 Y89.363 I-1.015 J.541 E.07717
G2 X88.441 Y90.633 I.967 J.635 E.02789
G2 X89.303 Y92.414 I.959 J.635 E.04942
G1 X89.337 Y92.416 E.00071
M204 S250
G1 X89.411 Y92.019 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1260
M204 S1000
G3 X89.001 Y90.636 I-.011 J-.749 E.03558
G3 X89.001 Y89.366 I.399 J-.635 E.02771
G3 X89.321 Y87.984 I.404 J-.634 E.03388
G3 X89.798 Y89.365 I.075 J.747 E.03675
G3 X89.798 Y90.635 I-.399 J.635 E.02771
G3 X89.471 Y92.016 I-.398 J.635 E.03411
; WIPE_START
G1 F2400
M204 S6000
G1 X89.257 Y92.007 E-.08137
G1 X89.125 Y91.969 E-.0523
G1 X89.003 Y91.907 E-.05197
G1 X88.938 Y91.861 E-.03023
G1 X88.83 Y91.758 E-.0567
G1 X88.784 Y91.699 E-.02859
G1 X88.745 Y91.635 E-.02838
G1 X88.685 Y91.498 E-.0567
G1 X88.654 Y91.352 E-.05685
G1 X88.65 Y91.274 E-.02988
G1 X88.66 Y91.147 E-.04809
G1 X88.7 Y90.999 E-.05836
G1 X88.731 Y90.931 E-.02859
G1 X88.811 Y90.805 E-.05649
G1 X88.915 Y90.698 E-.05681
G1 X88.998 Y90.638 E-.0387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.251 Y93.9 Z12.88 F42000
G1 Z12.48
G1 E.8 F1800
G1 F1260
M204 S1000
G1 X86.2 Y93.9 E.03753
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y93.9 E.14272
G1 X88.311 Y93.9 E.04921
; WIPE_START
G1 F2400
M204 S6000
G1 X86.311 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.88
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
            G0 Z12.88 F4000
            G39.3 S1
            G0 Z12.88 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.491 Y92.029 F42000
G1 Z12.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.462974
G1 F1260
M204 S6000
G1 X87.447 Y91.695 E.00721
; LINE_WIDTH: 0.416559
G3 X87.435 Y90.977 I4.339 J-.435 E.01374
; LINE_WIDTH: 0.44741
G3 X87.459 Y90.746 I3.303 J.233 E.00478
; LINE_WIDTH: 0.49195
G1 X87.476 Y90.637 E.00251
G1 X87.47 Y90.603 E.0008
; LINE_WIDTH: 0.472062
G1 X87.447 Y90.425 E.00393
; LINE_WIDTH: 0.416569
G3 X87.435 Y89.706 I4.339 J-.434 E.01375
; LINE_WIDTH: 0.447555
G3 X87.459 Y89.476 I3.282 J.232 E.00476
; LINE_WIDTH: 0.491977
G1 X87.476 Y89.367 E.0025
G1 X87.47 Y89.334 E.00078
; LINE_WIDTH: 0.472189
G1 X87.447 Y89.155 E.00393
; LINE_WIDTH: 0.41694
G3 X87.437 Y88.408 I4.247 J-.432 E.01431
; LINE_WIDTH: 0.459194
G1 X87.46 Y88.196 E.00453
G1 X87.743 Y88.038 E.00685
M204 S10000
G1 X88.209 Y87.365 F42000
; LINE_WIDTH: 0.0931688
G1 F1260
M204 S6000
G1 X88.281 Y87.29 E.00034
; LINE_WIDTH: 0.120012
G1 X88.353 Y87.216 E.00048
; LINE_WIDTH: 0.139911
G1 X88.438 Y87.136 E.00065
; WIPE_START
G1 F15000
G1 X88.353 Y87.216 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.348 Y89.953 Z12.88 F42000
G1 Z12.48
G1 E.8 F1800
; LINE_WIDTH: 0.580081
G1 F1260
M204 S6000
G3 X90.543 Y90.879 I-18.119 J4.292 E.02565
; LINE_WIDTH: 0.523917
G1 X90.56 Y90.999 E.00296
; LINE_WIDTH: 0.484093
G3 X90.555 Y91.645 I-2.941 J.303 E.0145
; WIPE_START
G1 F15000
G1 X90.575 Y91.258 E-.45591
G1 X90.56 Y90.999 E-.30409
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.515 Y92.844 Z12.88 F42000
G1 Z12.48
G1 E.8 F1800
; LINE_WIDTH: 0.102336
G1 F1260
M204 S6000
G1 X88.402 Y92.813 E.00044
G1 X88.264 Y92.681 E.00071
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.402 Y92.813 E-.47099
G1 X88.515 Y92.844 E-.28901
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/166
; update layer progress
M73 L104
M991 S0 P103 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z12.88 I1.165 J.353 P1  F42000
G1 X90.177 Y87.355 Z12.88
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1281
M204 S6000
G2 X89.544 Y87.149 I-.987 J1.962 E.01386
G1 X89.569 Y86.923 E.00472
G1 X90.177 Y86.923 E.0126
G1 X90.177 Y87.295 E.0077
; WIPE_START
G1 F4800
G1 X89.976 Y87.264 E-.08316
G1 X89.827 Y87.214 E-.06432
G1 X89.544 Y87.149 E-.11884
G1 X89.569 Y86.923 E-.09307
G1 X90.177 Y86.923 E-.24861
G1 X90.177 Y87.295 E-.15199
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.637 Y87.79 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X87.448 Y87.74 E.00406
G1 X87.448 Y87.348 E.00814
G1 X87.932 Y87.348 E.01005
G1 X87.715 Y87.654 E.0078
G1 X87.667 Y87.738 E.002
; WIPE_START
G1 F4800
G1 X87.448 Y87.74 E-.10613
G1 X87.448 Y87.348 E-.19008
G1 X87.932 Y87.348 E-.23483
G1 X87.715 Y87.654 E-.18214
G1 X87.667 Y87.738 E-.04682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.944 Y92.652 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X87.448 Y92.652 E.0103
G1 X87.448 Y92.262 E.00809
G1 X87.632 Y92.209 E.00398
G1 X87.759 Y92.413 E.00498
G1 X87.908 Y92.605 E.00503
; WIPE_START
G1 F4800
G1 X87.448 Y92.652 E-.23016
G1 X87.448 Y92.262 E-.19416
G1 X87.632 Y92.209 E-.09545
G1 X87.759 Y92.413 E-.11942
G1 X87.908 Y92.605 E-.12081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.267 Y92.839 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X89.251 Y93.077 E.00494
G1 X87.023 Y93.077 E.0462
G1 X87.023 Y86.923 E.12763
G1 X89.253 Y86.923 E.04624
G1 X89.271 Y87.158 E.00489
G2 X87.96 Y89.368 I.135 J1.574 E.06224
G1 X87.922 Y89.453 E.00192
G1 X87.855 Y89.691 E.00514
G2 X87.96 Y90.638 I1.587 J.303 E.02006
G1 X87.922 Y90.723 E.00192
G1 X87.855 Y90.961 E.00514
G2 X89.207 Y92.833 I1.549 J.305 E.05372
M204 S10000
G1 X89.548 Y93.077 F42000
G1 F1281
M204 S6000
G1 X89.529 Y92.843 E.00486
G2 X89.887 Y92.768 I-.198 J-1.825 E.0076
G1 X90.177 Y92.657 E.00643
G1 X90.177 Y93.077 E.0087
G1 X89.608 Y93.077 E.01179
M204 S10000
G1 X89.438 Y92.419 F42000
G1 F1281
M204 S6000
G1 X89.532 Y92.411 E.00196
G2 X90.413 Y91.813 I-.132 J-1.143 E.02296
G1 X90.601 Y91.864 E.00404
G1 X90.601 Y93.501 E.03394
G1 X86.599 Y93.501 E.083
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y88.136 E.03396
G1 X90.415 Y88.189 E.004
G2 X88.441 Y89.363 I-1.014 J.542 E.0771
G2 X88.441 Y90.633 I.967 J.635 E.02788
G2 X89.378 Y92.419 I.959 J.636 E.05098
M204 S250
G1 X89.411 Y92.016 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1281
M204 S1000
G3 X89.001 Y90.636 I-.011 J-.748 E.0355
G3 X89.001 Y89.366 I.406 J-.635 E.02763
G3 X89.321 Y87.984 I.4 J-.635 E.03397
G3 X89.798 Y89.365 I.076 J.747 E.03679
G3 X89.798 Y90.635 I-.405 J.635 E.02765
G3 X89.471 Y92.013 I-.398 J.634 E.03404
; WIPE_START
G1 F2400
M204 S6000
G1 X89.336 Y92.018 E-.05125
G1 X89.19 Y91.99 E-.05672
G1 X89.12 Y91.966 E-.02808
G1 X89.003 Y91.907 E-.04982
G1 X88.938 Y91.861 E-.03001
G1 X88.83 Y91.758 E-.05681
G1 X88.784 Y91.699 E-.0285
G1 X88.712 Y91.568 E-.0567
G1 X88.685 Y91.499 E-.02833
G1 X88.654 Y91.353 E-.05675
G1 X88.65 Y91.278 E-.02854
G1 X88.663 Y91.13 E-.0564
G1 X88.698 Y91.004 E-.04983
G1 X88.731 Y90.931 E-.03024
G1 X88.811 Y90.806 E-.05646
G1 X88.915 Y90.698 E-.0571
G1 X88.997 Y90.638 E-.03847
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.272 Y93.9 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F1281
M204 S1000
G1 X86.2 Y93.9 E.03792
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y93.9 E.14272
G1 X88.332 Y93.9 E.04881
; WIPE_START
G1 F2400
M204 S6000
G1 X86.332 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13
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
            G0 Z13 F4000
            G39.3 S1
            G0 Z13 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.491 Y92.029 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463156
G1 F1281
M204 S6000
G1 X87.447 Y91.696 E.00718
; LINE_WIDTH: 0.418247
G1 X87.424 Y91.3 E.00762
G1 X87.442 Y90.89 E.00787
; LINE_WIDTH: 0.45624
G3 X87.46 Y90.749 I2.035 J.195 E.00299
; LINE_WIDTH: 0.490985
G1 X87.476 Y90.637 E.00257
; LINE_WIDTH: 0.50099
G1 X87.471 Y90.605 E.00077
; LINE_WIDTH: 0.472546
G1 X87.447 Y90.426 E.00393
; LINE_WIDTH: 0.418243
G1 X87.424 Y90.03 E.00762
G1 X87.442 Y89.62 E.00787
; LINE_WIDTH: 0.456238
G3 X87.46 Y89.479 I2.03 J.195 E.00299
; LINE_WIDTH: 0.490977
G1 X87.476 Y89.367 E.00257
; LINE_WIDTH: 0.500995
G1 X87.471 Y89.335 E.00077
; LINE_WIDTH: 0.472556
G1 X87.447 Y89.156 E.00393
; LINE_WIDTH: 0.418247
M73 P74 R6
G1 X87.424 Y88.76 E.00762
G1 X87.442 Y88.35 E.00787
; LINE_WIDTH: 0.460096
G3 X87.493 Y87.972 I5.477 J.55 E.00811
M204 S10000
G1 X88.227 Y87.382 F42000
; LINE_WIDTH: 0.0892476
G1 F1281
M204 S6000
G1 X88.227 Y87.346 E.00011
G1 X88.291 Y87.28 E.00028
; LINE_WIDTH: 0.120562
G1 X88.353 Y87.216 E.00042
; LINE_WIDTH: 0.140371
G1 X88.438 Y87.136 E.00065
; WIPE_START
G1 F15000
G1 X88.353 Y87.216 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.348 Y88.682 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.580372
G1 F1281
M204 S6000
G3 X90.543 Y89.609 I-18.568 J4.383 E.02569
; LINE_WIDTH: 0.523901
G1 X90.56 Y89.729 E.00296
; LINE_WIDTH: 0.489317
G1 X90.575 Y89.988 E.00587
G1 X90.573 Y90.106 E.00267
G1 X90.554 Y90.318 E.00483
; LINE_WIDTH: 0.542438
G1 X90.529 Y90.464 E.00373
; WIPE_START
G1 F15000
G1 X90.554 Y90.318 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.389 Y92.288 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.100422
G1 F1281
M204 S6000
G1 X90.212 Y92.393 E.00075
; WIPE_START
G1 F15000
G1 X90.389 Y92.288 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.515 Y92.844 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.102341
G1 F1281
M204 S6000
G1 X88.402 Y92.813 E.00044
G1 X88.264 Y92.681 E.00071
; CHANGE_LAYER
; Z_HEIGHT: 12.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.402 Y92.813 E-.47083
G1 X88.515 Y92.844 E-.28917
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/166
; update layer progress
M73 L105
M991 S0 P104 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z13 I1.165 J.353 P1  F42000
G1 X90.177 Y87.355 Z13
G1 Z12.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1240
M204 S6000
G2 X89.544 Y87.149 I-.988 J1.965 E.01386
G1 X89.569 Y86.923 E.00472
G1 X90.177 Y86.923 E.0126
G1 X90.177 Y87.295 E.0077
; WIPE_START
G1 F4800
G1 X89.976 Y87.264 E-.08313
G1 X89.827 Y87.214 E-.06414
G1 X89.544 Y87.149 E-.11906
G1 X89.569 Y86.923 E-.09307
G1 X90.177 Y86.923 E-.24858
G1 X90.177 Y87.295 E-.15202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.637 Y87.79 Z13.12 F42000
G1 Z12.72
G1 E.8 F1800
G1 F1240
M204 S6000
G1 X87.448 Y87.74 E.00406
G1 X87.448 Y87.348 E.00814
G1 X87.933 Y87.348 E.01006
G1 X87.715 Y87.653 E.00778
G1 X87.667 Y87.738 E.00203
; WIPE_START
G1 F4800
G1 X87.448 Y87.74 E-.10609
G1 X87.448 Y87.348 E-.19004
G1 X87.933 Y87.348 E-.23487
G1 X87.715 Y87.653 E-.18168
G1 X87.667 Y87.738 E-.04732
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.939 Y92.652 Z13.12 F42000
G1 Z12.72
G1 E.8 F1800
G1 F1240
M204 S6000
G1 X87.448 Y92.652 E.01019
G1 X87.448 Y92.26 E.00813
G1 X87.634 Y92.209 E.00402
G1 X87.737 Y92.38 E.00414
G1 X87.903 Y92.604 E.00579
; WIPE_START
G1 F4800
G1 X87.448 Y92.652 E-.22864
G1 X87.448 Y92.26 E-.19569
G1 X87.634 Y92.209 E-.09674
G1 X87.737 Y92.38 E-.09956
G1 X87.903 Y92.604 E-.13937
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.267 Y92.839 Z13.12 F42000
G1 Z12.72
G1 E.8 F1800
G1 F1240
M204 S6000
G1 X89.251 Y93.077 E.00493
G1 X87.023 Y93.077 E.0462
G1 X87.023 Y86.923 E.12763
G1 X89.253 Y86.923 E.04624
G1 X89.271 Y87.158 E.00489
G2 X87.961 Y89.366 I.134 J1.572 E.06219
G1 X87.922 Y89.452 E.00197
G1 X87.855 Y89.69 E.00512
G2 X87.96 Y90.638 I1.586 J.305 E.02009
G1 X87.922 Y90.722 E.00191
G1 X87.855 Y90.96 E.00512
G2 X89.207 Y92.833 I1.548 J.307 E.05376
M204 S10000
G1 X89.548 Y93.077 F42000
G1 F1240
M204 S6000
G1 X89.529 Y92.843 E.00486
G2 X89.887 Y92.768 I-.199 J-1.831 E.00759
G1 X90.177 Y92.657 E.00643
G1 X90.177 Y93.077 E.0087
G1 X89.608 Y93.077 E.01179
M204 S10000
G1 X89.438 Y92.419 F42000
G1 F1240
M204 S6000
G1 X89.532 Y92.411 E.00196
G2 X90.413 Y91.813 I-.132 J-1.143 E.02296
G1 X90.601 Y91.864 E.00404
G1 X90.601 Y93.501 E.03394
G1 X86.599 Y93.501 E.083
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y88.136 E.03396
G1 X90.415 Y88.189 E.004
G2 X88.441 Y89.364 I-1.014 J.542 E.07714
G2 X88.44 Y90.635 I.97 J.636 E.02791
G2 X89.378 Y92.419 I.96 J.633 E.05093
M204 S250
G1 X89.411 Y92.016 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1240
M204 S1000
G3 X89.002 Y90.635 I-.011 J-.748 E.03552
G3 X89.002 Y89.365 I.404 J-.635 E.02765
G3 X89.322 Y87.984 I.398 J-.636 E.03399
G3 X89.798 Y89.365 I.076 J.747 E.03678
G3 X89.798 Y90.635 I-.405 J.635 E.02765
G3 X89.471 Y92.013 I-.398 J.634 E.03404
; WIPE_START
G1 F2400
M204 S6000
G1 X89.336 Y92.018 E-.05124
G1 X89.189 Y91.99 E-.05688
G1 X89.051 Y91.934 E-.05659
G1 X88.926 Y91.852 E-.05684
G1 X88.871 Y91.802 E-.02848
G1 X88.776 Y91.686 E-.05674
G1 X88.704 Y91.551 E-.05825
G1 X88.667 Y91.43 E-.04817
G1 X88.654 Y91.352 E-.03007
G1 X88.653 Y91.203 E-.05657
G1 X88.663 Y91.129 E-.02833
G1 X88.698 Y91.003 E-.04957
G1 X88.731 Y90.931 E-.03009
G1 X88.811 Y90.805 E-.05683
G1 X88.915 Y90.698 E-.05661
G1 X88.997 Y90.638 E-.03874
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.294 Y93.9 Z13.12 F42000
G1 Z12.72
G1 E.8 F1800
G1 F1240
M204 S1000
G1 X86.2 Y93.9 E.03831
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y93.9 E.14272
G1 X88.354 Y93.9 E.04842
; WIPE_START
G1 F2400
M204 S6000
G1 X86.354 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.12
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
            G0 Z13.12 F4000
            G39.3 S1
            G0 Z13.12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.495 Y92.027 F42000
G1 Z12.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465116
G1 F1240
M204 S6000
G3 X87.447 Y91.699 I4.689 J-.859 E.00713
; LINE_WIDTH: 0.418378
G1 X87.424 Y91.299 E.00769
G1 X87.428 Y91.103 E.00375
G1 X87.442 Y90.888 E.00414
; LINE_WIDTH: 0.456567
G3 X87.461 Y90.748 I2.038 J.197 E.00297
; LINE_WIDTH: 0.491128
G1 X87.476 Y90.637 E.00255
; LINE_WIDTH: 0.500634
G1 X87.47 Y90.603 E.00082
; LINE_WIDTH: 0.472031
G1 X87.447 Y90.425 E.00391
; LINE_WIDTH: 0.41907
G3 X87.445 Y89.589 I3.987 J-.427 E.0161
; LINE_WIDTH: 0.481461
G1 X87.477 Y89.363 E.0051
G1 X87.464 Y89.276 E.00196
; LINE_WIDTH: 0.468467
G1 X87.45 Y89.189 E.00191
; LINE_WIDTH: 0.451929
G1 X87.447 Y89.159 E.00062
; LINE_WIDTH: 0.418379
G1 X87.424 Y88.759 E.00769
G1 X87.428 Y88.563 E.00375
G1 X87.442 Y88.348 E.00414
; LINE_WIDTH: 0.460292
G3 X87.493 Y87.972 I5.482 J.554 E.00807
M204 S10000
G1 X88.209 Y87.365 F42000
; LINE_WIDTH: 0.0931678
G1 F1240
M204 S6000
G1 X88.281 Y87.291 E.00034
; LINE_WIDTH: 0.119993
G1 X88.353 Y87.216 E.00048
; LINE_WIDTH: 0.139942
G1 X88.438 Y87.136 E.00066
; WIPE_START
G1 F15000
G1 X88.353 Y87.216 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.389 Y92.288 Z13.12 F42000
G1 Z12.72
G1 E.8 F1800
; LINE_WIDTH: 0.100343
G1 F1240
M204 S6000
G1 X90.213 Y92.392 E.00075
; WIPE_START
G1 F15000
G1 X90.389 Y92.288 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.455 Y92.864 Z13.12 F42000
G1 Z12.72
G1 E.8 F1800
; LINE_WIDTH: 0.135774
G1 F1240
M204 S6000
G1 X88.384 Y92.805 E.0005
; LINE_WIDTH: 0.120344
G1 X88.31 Y92.732 E.00048
; LINE_WIDTH: 0.0932841
G1 X88.236 Y92.659 E.00034
; CHANGE_LAYER
; Z_HEIGHT: 12.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.31 Y92.732 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/166
; update layer progress
M73 L106
M991 S0 P105 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z13.12 I1.15 J.399 P1  F42000
G1 X90.177 Y87.355 Z13.12
G1 Z12.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1281
M204 S6000
G2 X89.543 Y87.149 I-.986 J1.961 E.01386
G1 X89.569 Y86.923 E.00472
G1 X90.177 Y86.923 E.0126
G1 X90.177 Y87.295 E.0077
; WIPE_START
G1 F4800
G1 X89.976 Y87.264 E-.08299
G1 X89.827 Y87.214 E-.06437
G1 X89.543 Y87.149 E-.11896
G1 X89.569 Y86.923 E-.09307
G1 X90.177 Y86.923 E-.24861
G1 X90.177 Y87.295 E-.15199
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.637 Y87.79 Z13.24 F42000
G1 Z12.84
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X87.448 Y87.74 E.00406
G1 X87.448 Y87.348 E.00814
G1 X87.933 Y87.348 E.01006
G1 X87.715 Y87.653 E.00777
G1 X87.667 Y87.738 E.00203
; WIPE_START
G1 F4800
G1 X87.448 Y87.74 E-.10608
G1 X87.448 Y87.348 E-.19002
G1 X87.933 Y87.348 E-.2349
G1 X87.715 Y87.653 E-.18153
G1 X87.667 Y87.738 E-.04748
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.956 Y92.652 Z13.24 F42000
G1 Z12.84
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X87.448 Y92.652 E.01053
G1 X87.448 Y92.262 E.00809
G1 X87.632 Y92.209 E.00398
G1 X87.775 Y92.438 E.00559
G1 X87.917 Y92.606 E.00457
; WIPE_START
G1 F4800
G1 X87.448 Y92.652 E-.23213
G1 X87.448 Y92.262 E-.19215
G1 X87.632 Y92.209 E-.09449
G1 X87.775 Y92.438 E-.13271
G1 X87.917 Y92.606 E-.10852
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.267 Y92.839 Z13.24 F42000
G1 Z12.84
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X89.251 Y93.077 E.00494
G1 X87.023 Y93.077 E.0462
G1 X87.023 Y86.923 E.12763
G1 X89.253 Y86.923 E.04624
G1 X89.271 Y87.158 E.00489
G2 X87.96 Y89.368 I.135 J1.574 E.06224
G2 X87.96 Y90.638 I1.441 J.635 E.02712
G1 X87.922 Y90.722 E.0019
G2 X89.207 Y92.833 I1.483 J.544 E.05886
M204 S10000
G1 X89.548 Y93.077 F42000
G1 F1281
M204 S6000
G1 X89.529 Y92.843 E.00486
G2 X89.886 Y92.768 I-.201 J-1.842 E.00758
G1 X90.177 Y92.657 E.00645
G1 X90.177 Y93.077 E.0087
G1 X89.608 Y93.077 E.01179
M204 S10000
G1 X89.438 Y92.419 F42000
G1 F1281
M204 S6000
G1 X89.532 Y92.411 E.00196
G2 X90.309 Y91.975 I-.131 J-1.143 E.01898
G1 X90.423 Y91.812 E.00412
G1 X90.601 Y91.868 E.00387
G1 X90.601 Y93.501 E.03387
G1 X86.599 Y93.501 E.083
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y88.136 E.03396
G1 X90.415 Y88.189 E.004
G2 X88.441 Y89.363 I-1.014 J.542 E.0771
G2 X88.441 Y90.633 I.967 J.635 E.02789
G2 X89.378 Y92.418 I.96 J.635 E.05097
M204 S250
M73 P74 R5
G1 X89.411 Y92.016 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1281
M204 S1000
G3 X89.002 Y90.635 I-.011 J-.748 E.03552
G3 X89.002 Y89.365 I.396 J-.635 E.02774
G3 X89.322 Y87.984 I.403 J-.634 E.03389
G3 X89.798 Y89.365 I.078 J.746 E.03683
G3 X89.798 Y90.635 I-.405 J.635 E.02765
G3 X89.471 Y92.013 I-.398 J.634 E.03404
; WIPE_START
G1 F2400
M204 S6000
G1 X89.337 Y92.018 E-.05119
G1 X89.19 Y91.99 E-.05675
G1 X89.051 Y91.934 E-.05675
G1 X88.986 Y91.896 E-.02868
G1 X88.87 Y91.801 E-.0569
G1 X88.786 Y91.702 E-.04943
G1 X88.745 Y91.635 E-.02984
G1 X88.685 Y91.498 E-.05675
G1 X88.666 Y91.426 E-.0284
G1 X88.65 Y91.278 E-.05678
G1 X88.663 Y91.128 E-.0571
G1 X88.699 Y91.003 E-.04919
G1 X88.731 Y90.931 E-.03005
G1 X88.811 Y90.805 E-.05677
G1 X88.915 Y90.698 E-.05684
G1 X88.997 Y90.638 E-.03858
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.315 Y93.9 Z13.24 F42000
G1 Z12.84
G1 E.8 F1800
G1 F1281
M204 S1000
G1 X86.2 Y93.9 E.03869
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y93.9 E.14272
G1 X88.375 Y93.9 E.04804
; WIPE_START
G1 F2400
M204 S6000
G1 X86.375 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.24 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.24
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
            G0 Z13.24 F4000
            G39.3 S1
            G0 Z13.24 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.491 Y92.029 F42000
G1 Z12.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463047
G1 F1281
M204 S6000
G1 X87.447 Y91.696 E.00719
; LINE_WIDTH: 0.418339
G1 X87.424 Y91.299 E.00762
G1 X87.428 Y91.103 E.00377
G1 X87.442 Y90.886 E.00417
; LINE_WIDTH: 0.456884
G3 X87.461 Y90.747 I2.015 J.195 E.00295
; LINE_WIDTH: 0.491238
G1 X87.476 Y90.637 E.00252
; LINE_WIDTH: 0.500843
G1 X87.47 Y90.604 E.00079
; LINE_WIDTH: 0.47223
G1 X87.447 Y90.425 E.00393
; LINE_WIDTH: 0.41657
G3 X87.435 Y89.707 I4.342 J-.435 E.01375
; LINE_WIDTH: 0.447634
G3 X87.459 Y89.475 I3.327 J.236 E.00481
; LINE_WIDTH: 0.4921
G1 X87.476 Y89.367 E.00248
G1 X87.471 Y89.334 E.00078
; LINE_WIDTH: 0.472315
G1 X87.447 Y89.156 E.00393
; LINE_WIDTH: 0.416964
G3 X87.437 Y88.409 I4.246 J-.433 E.01431
; LINE_WIDTH: 0.458469
G1 X87.46 Y88.196 E.00454
G1 X87.742 Y88.038 E.00683
M204 S10000
G1 X88.209 Y87.365 F42000
; LINE_WIDTH: 0.0932253
G1 F1281
M204 S6000
G1 X88.282 Y87.29 E.00034
; LINE_WIDTH: 0.12018
G1 X88.354 Y87.215 E.00048
; LINE_WIDTH: 0.139958
G1 X88.439 Y87.136 E.00065
; WIPE_START
M73 P75 R5
G1 F15000
G1 X88.354 Y87.215 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.349 Y88.727 Z13.24 F42000
G1 Z12.84
G1 E.8 F1800
; LINE_WIDTH: 0.588344
G1 F1281
M204 S6000
G1 X90.523 Y89.506 E.02196
; LINE_WIDTH: 0.560403
G1 X90.543 Y89.609 E.00273
; LINE_WIDTH: 0.523811
G1 X90.56 Y89.729 E.00296
; LINE_WIDTH: 0.490678
G1 X90.572 Y89.871 E.00323
G1 X90.574 Y90.083 E.00482
G1 X90.55 Y90.343 E.00593
; LINE_WIDTH: 0.549398
G3 X90.526 Y90.48 I-1.944 J-.27 E.00357
; WIPE_START
G1 F15000
G1 X90.55 Y90.343 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.389 Y92.287 Z13.24 F42000
G1 Z12.84
G1 E.8 F1800
; LINE_WIDTH: 0.1023
G1 F1281
M204 S6000
G1 X90.21 Y92.393 E.00078
; WIPE_START
G1 F15000
G1 X90.389 Y92.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.483 Y92.864 Z13.24 F42000
G1 Z12.84
G1 E.8 F1800
; LINE_WIDTH: 0.0966604
G1 F1281
M204 S6000
G1 X88.326 Y92.725 E.00073
; CHANGE_LAYER
; Z_HEIGHT: 12.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.483 Y92.864 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/166
; update layer progress
M73 L107
M991 S0 P106 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z13.24 I1.163 J.358 P1  F42000
G1 X90.177 Y87.355 Z13.24
G1 Z12.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1281
M204 S6000
G2 X89.531 Y87.16 I-.862 J1.685 E.01406
G1 X89.548 Y86.923 E.00491
G1 X90.177 Y86.923 E.01304
G1 X90.177 Y87.295 E.0077
; WIPE_START
G1 F4800
G1 X89.955 Y87.255 E-.08998
G1 X89.721 Y87.187 E-.09769
G1 X89.531 Y87.16 E-.07695
G1 X89.548 Y86.923 E-.09489
G1 X90.177 Y86.923 E-.25175
G1 X90.177 Y87.295 E-.14874
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.635 Y87.791 Z13.36 F42000
G1 Z12.96
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X87.448 Y87.74 E.00402
G1 X87.448 Y87.348 E.00813
G1 X87.939 Y87.348 E.01019
G1 X87.736 Y87.621 E.00705
G1 X87.665 Y87.74 E.00287
; WIPE_START
G1 F4800
G1 X87.448 Y87.74 E-.10473
G1 X87.448 Y87.348 E-.18866
G1 X87.939 Y87.348 E-.23634
G1 X87.736 Y87.621 E-.16365
G1 X87.665 Y87.74 E-.06663
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.939 Y92.652 Z13.36 F42000
G1 Z12.96
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X87.448 Y92.652 E.01019
G1 X87.448 Y92.26 E.00813
G1 X87.634 Y92.209 E.00402
G1 X87.737 Y92.38 E.00414
G1 X87.903 Y92.604 E.00579
; WIPE_START
G1 F4800
G1 X87.448 Y92.652 E-.22863
G1 X87.448 Y92.26 E-.19571
G1 X87.634 Y92.209 E-.09673
G1 X87.737 Y92.38 E-.09958
G1 X87.903 Y92.604 E-.13936
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.267 Y92.839 Z13.36 F42000
G1 Z12.96
G1 E.8 F1800
G1 F1281
M204 S6000
G1 X89.251 Y93.077 E.00494
G1 X87.023 Y93.077 E.0462
G1 X87.023 Y86.923 E.12763
G1 X89.253 Y86.923 E.04624
G1 X89.271 Y87.158 E.00489
G2 X87.958 Y89.36 I.135 J1.572 E.06204
G2 X87.958 Y90.63 I1.469 J.635 E.02709
G2 X89.207 Y92.833 I1.447 J.635 E.06093
M204 S10000
G1 X89.548 Y93.077 F42000
G1 F1281
M204 S6000
G1 X89.529 Y92.843 E.00486
G2 X89.886 Y92.768 I-.199 J-1.834 E.00758
G1 X90.177 Y92.657 E.00644
G1 X90.177 Y93.077 E.0087
G1 X89.608 Y93.077 E.01179
M204 S10000
G1 X89.438 Y92.419 F42000
G1 F1281
M204 S6000
G1 X89.532 Y92.412 E.00195
G2 X90.31 Y91.974 I-.132 J-1.142 E.01901
G1 X90.423 Y91.812 E.0041
G1 X90.601 Y91.868 E.00388
G1 X90.601 Y93.501 E.03388
G1 X86.599 Y93.501 E.083
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y88.136 E.03396
G1 X90.415 Y88.189 E.004
G2 X88.441 Y89.365 I-1.014 J.542 E.07717
G2 X88.441 Y90.635 I.966 J.635 E.02789
G2 X89.378 Y92.42 I.959 J.635 E.05097
M204 S250
G1 X89.411 Y92.016 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1281
M204 S1000
G3 X89.002 Y90.635 I-.011 J-.748 E.03552
G3 X89.002 Y89.365 I.404 J-.635 E.02765
G3 X89.322 Y87.984 I.403 J-.634 E.03389
G3 X89.798 Y89.365 I.076 J.747 E.03678
G3 X89.798 Y90.635 I-.405 J.635 E.02765
G3 X89.471 Y92.013 I-.398 J.634 E.03404
; WIPE_START
G1 F2400
M204 S6000
G1 X89.262 Y92.008 E-.07941
G1 X89.19 Y91.99 E-.02841
G1 X89.051 Y91.934 E-.05668
G1 X88.926 Y91.852 E-.05698
G1 X88.821 Y91.747 E-.05662
G1 X88.776 Y91.686 E-.02845
G1 X88.705 Y91.553 E-.05746
G1 X88.667 Y91.431 E-.04868
G1 X88.654 Y91.353 E-.03
G1 X88.653 Y91.203 E-.05673
G1 X88.681 Y91.056 E-.057
G1 X88.706 Y90.986 E-.02838
G1 X88.738 Y90.918 E-.02857
G1 X88.82 Y90.794 E-.05657
G1 X88.872 Y90.737 E-.02923
G1 X88.998 Y90.638 E-.06083
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.335 Y93.9 Z13.36 F42000
G1 Z12.96
G1 E.8 F1800
G1 F1281
M204 S1000
G1 X86.2 Y93.9 E.03907
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y93.9 E.14272
G1 X88.395 Y93.9 E.04766
; WIPE_START
G1 F2400
M204 S6000
G1 X86.395 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.36 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.36
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
            G0 Z13.36 F4000
            G39.3 S1
            G0 Z13.36 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.496 Y92.027 F42000
G1 Z12.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465408
G1 F1281
M204 S6000
G3 X87.447 Y91.702 I4.577 J-.846 E.00707
; LINE_WIDTH: 0.418084
G1 X87.424 Y91.3 E.00772
G1 X87.441 Y90.905 E.00757
; LINE_WIDTH: 0.459862
G1 X87.465 Y90.706 E.00425
; LINE_WIDTH: 0.495105
G2 X87.464 Y90.547 I-.332 J-.078 E.00369
; LINE_WIDTH: 0.468987
G1 X87.451 Y90.462 E.00187
; LINE_WIDTH: 0.452537
G1 X87.447 Y90.432 E.00063
; LINE_WIDTH: 0.418084
G1 X87.424 Y90.03 E.00772
G1 X87.441 Y89.635 E.00757
; LINE_WIDTH: 0.459862
G1 X87.465 Y89.436 E.00425
; LINE_WIDTH: 0.495105
G2 X87.464 Y89.277 I-.332 J-.078 E.00369
; LINE_WIDTH: 0.468987
G1 X87.451 Y89.192 E.00187
; LINE_WIDTH: 0.452537
G1 X87.447 Y89.162 E.00063
; LINE_WIDTH: 0.418084
G1 X87.424 Y88.76 E.00772
G1 X87.441 Y88.365 E.00757
; LINE_WIDTH: 0.456634
G1 X87.461 Y88.197 E.00357
G1 X87.48 Y88.186 E.00047
; LINE_WIDTH: 0.428405
G1 X87.499 Y88.175 E.00044
; LINE_WIDTH: 0.394344
G1 X87.74 Y88.041 E.00497
M204 S10000
G1 X88.227 Y87.355 F42000
; LINE_WIDTH: 0.0954901
G1 F1281
M204 S6000
G1 X88.337 Y87.239 E.00054
; LINE_WIDTH: 0.12471
G1 X88.449 Y87.136 E.00074
; WIPE_START
G1 F15000
G1 X88.337 Y87.239 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.349 Y88.727 Z13.36 F42000
G1 Z12.96
G1 E.8 F1800
; LINE_WIDTH: 0.588159
G1 F1281
M204 S6000
G1 X90.524 Y89.507 E.02197
; LINE_WIDTH: 0.560328
G1 X90.543 Y89.609 E.00272
; LINE_WIDTH: 0.523864
G1 X90.56 Y89.729 E.00295
; LINE_WIDTH: 0.485243
G1 X90.575 Y89.965 E.00532
G1 X90.566 Y90.205 E.00538
; LINE_WIDTH: 0.517101
G3 X90.542 Y90.394 I-2.747 J-.256 E.00459
; LINE_WIDTH: 0.548676
G1 X90.536 Y90.431 E.00096
; WIPE_START
G1 F15000
G1 X90.542 Y90.394 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.389 Y92.287 Z13.36 F42000
G1 Z12.96
G1 E.8 F1800
; LINE_WIDTH: 0.10229
G1 F1281
M204 S6000
G1 X90.21 Y92.393 E.00077
; WIPE_START
G1 F15000
G1 X90.389 Y92.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.449 Y92.864 Z13.36 F42000
G1 Z12.96
G1 E.8 F1800
; LINE_WIDTH: 0.135605
G1 F1281
M204 S6000
G1 X88.383 Y92.804 E.00048
; LINE_WIDTH: 0.120034
G1 X88.309 Y92.731 E.00048
; LINE_WIDTH: 0.0931814
G1 X88.236 Y92.658 E.00034
; CHANGE_LAYER
; Z_HEIGHT: 13.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.309 Y92.731 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/166
; update layer progress
M73 L108
M991 S0 P107 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z13.36 I1.15 J.398 P1  F42000
G1 X90.177 Y87.338 Z13.36
G1 Z13.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1266
M204 S6000
G1 X89.856 Y87.223 E.00706
G2 X89.53 Y87.16 I-.482 J1.612 E.0069
G1 X89.548 Y86.923 E.00491
G1 X90.177 Y86.923 E.01305
G1 X90.177 Y87.278 E.00734
; WIPE_START
G1 F4800
G1 X89.856 Y87.223 E-.13154
G1 X89.705 Y87.185 E-.06327
G1 X89.53 Y87.16 E-.07133
G1 X89.548 Y86.923 E-.09583
G1 X90.177 Y86.923 E-.25468
G1 X90.177 Y87.278 E-.14335
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.939 Y92.652 Z13.48 F42000
G1 Z13.08
G1 E.8 F1800
G1 F1266
M204 S6000
G1 X87.448 Y92.652 E.01019
G1 X87.448 Y92.258 E.00817
G1 X87.639 Y92.21 E.0041
G1 X87.719 Y92.356 E.00346
G1 X87.903 Y92.604 E.0064
; WIPE_START
G1 F4800
G1 X87.448 Y92.652 E-.22816
G1 X87.448 Y92.258 E-.19629
G1 X87.639 Y92.21 E-.0986
G1 X87.719 Y92.356 E-.08316
G1 X87.903 Y92.604 E-.15379
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.635 Y87.791 Z13.48 F42000
G1 Z13.08
G1 E.8 F1800
G1 F1266
M204 S6000
G1 X87.448 Y87.74 E.00402
G1 X87.448 Y87.348 E.00813
G1 X87.939 Y87.348 E.01019
G1 X87.736 Y87.621 E.00705
G1 X87.665 Y87.74 E.00288
; WIPE_START
G1 F4800
G1 X87.448 Y87.74 E-.10472
G1 X87.448 Y87.348 E-.18864
G1 X87.939 Y87.348 E-.23636
G1 X87.736 Y87.621 E-.16351
G1 X87.665 Y87.74 E-.06676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.267 Y92.839 Z13.48 F42000
G1 Z13.08
G1 E.8 F1800
G1 F1266
M204 S6000
G1 X89.251 Y93.077 E.00494
G1 X87.023 Y93.077 E.0462
G1 X87.023 Y86.923 E.12763
G1 X89.253 Y86.923 E.04624
G1 X89.271 Y87.158 E.00489
G2 X87.957 Y89.362 I.135 J1.574 E.0621
G2 X87.957 Y90.632 I1.475 J.635 E.02708
G2 X89.207 Y92.833 I1.448 J.633 E.06086
M204 S10000
G1 X89.551 Y93.077 F42000
G1 F1266
M204 S6000
G1 X89.538 Y92.835 E.00501
G2 X89.857 Y92.777 I-.049 J-1.165 E.00674
G1 X90.177 Y92.662 E.00704
G1 X90.177 Y93.077 E.00859
G1 X89.611 Y93.077 E.01173
M204 S10000
G1 X89.4 Y92.419 F42000
G1 F1266
M204 S6000
G1 X89.43 Y92.418 E.00062
G2 X90.413 Y91.813 I-.029 J-1.149 E.02508
G1 X90.601 Y91.864 E.00404
G1 X90.601 Y93.501 E.03394
G1 X86.599 Y93.501 E.083
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y88.136 E.03396
G1 X90.415 Y88.189 E.004
G2 X88.441 Y89.367 I-1.014 J.543 E.0772
G2 X88.441 Y90.637 I.972 J.635 E.02787
G2 X89.304 Y92.415 I.96 J.633 E.04936
G1 X89.34 Y92.416 E.00074
M204 S250
G1 X89.413 Y92.02 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1266
M204 S1000
G1 X89.338 Y92.017 E.00138
G3 X89.002 Y90.635 I.062 J-.747 E.03426
G3 X89.002 Y89.365 I.404 J-.635 E.02765
G3 X89.322 Y87.984 I.403 J-.634 E.03389
G3 X89.798 Y89.365 I.074 J.747 E.03675
G3 X89.798 Y90.635 I-.396 J.635 E.02775
G3 X89.473 Y92.016 I-.398 J.635 E.03406
; WIPE_START
G1 F2400
M204 S6000
G1 X89.338 Y92.017 E-.05136
G1 X89.189 Y91.99 E-.05749
G1 X89.05 Y91.934 E-.05698
G1 X88.986 Y91.896 E-.02825
G1 X88.871 Y91.802 E-.0565
G1 X88.82 Y91.746 E-.02864
G1 X88.773 Y91.683 E-.02979
G1 X88.713 Y91.572 E-.04821
G1 X88.685 Y91.498 E-.03005
G1 X88.654 Y91.352 E-.05657
G1 X88.653 Y91.203 E-.05677
G1 X88.681 Y91.056 E-.05678
G1 X88.706 Y90.985 E-.02848
G1 X88.776 Y90.854 E-.05654
G1 X88.821 Y90.793 E-.02857
G1 X88.873 Y90.736 E-.02944
G1 X88.996 Y90.64 E-.05959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.355 Y93.9 Z13.48 F42000
G1 Z13.08
G1 E.8 F1800
G1 F1266
M204 S1000
G1 X86.2 Y93.9 E.03944
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y93.9 E.14272
G1 X88.415 Y93.9 E.04729
; WIPE_START
G1 F2400
M204 S6000
G1 X86.415 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.48 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.48
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
            G0 Z13.48 F4000
            G39.3 S1
            G0 Z13.48 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.491 Y92.028 F42000
G1 Z13.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463083
G1 F1266
M204 S6000
G1 X87.447 Y91.695 E.00718
; LINE_WIDTH: 0.417876
G1 X87.424 Y91.299 E.00761
G1 X87.441 Y90.905 E.00757
; LINE_WIDTH: 0.460013
G1 X87.465 Y90.706 E.00426
; LINE_WIDTH: 0.496678
G2 X87.474 Y90.626 I-.406 J-.088 E.00184
G1 X87.47 Y90.603 E.00055
; LINE_WIDTH: 0.472144
G1 X87.447 Y90.425 E.0039
; LINE_WIDTH: 0.417873
G1 X87.424 Y90.029 E.00761
G1 X87.441 Y89.635 E.00757
; LINE_WIDTH: 0.460011
G1 X87.465 Y89.436 E.00426
; LINE_WIDTH: 0.496675
M73 P76 R5
G2 X87.474 Y89.356 I-.401 J-.087 E.00184
G1 X87.47 Y89.333 E.00055
; LINE_WIDTH: 0.472113
G1 X87.447 Y89.155 E.0039
; LINE_WIDTH: 0.417876
G1 X87.424 Y88.759 E.00761
G1 X87.441 Y88.365 E.00757
; LINE_WIDTH: 0.456665
G1 X87.461 Y88.197 E.00355
G1 X87.48 Y88.186 E.00048
; LINE_WIDTH: 0.427373
G1 X87.5 Y88.174 E.00045
; LINE_WIDTH: 0.393133
G1 X87.741 Y88.041 E.00494
M204 S10000
G1 X88.228 Y87.355 F42000
; LINE_WIDTH: 0.0954407
G1 F1266
M204 S6000
G1 X88.337 Y87.239 E.00054
; LINE_WIDTH: 0.124597
G1 X88.449 Y87.136 E.00074
; WIPE_START
G1 F15000
G1 X88.337 Y87.239 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.19 Y87.592 Z13.48 F42000
G1 Z13.08
G1 E.8 F1800
; LINE_WIDTH: 0.0990097
G1 F1266
M204 S6000
G1 X90.338 Y87.675 E.00061
G3 X90.389 Y87.789 I-1.54 J.76 E.00045
; WIPE_START
G1 F15000
G1 X90.338 Y87.675 E-.322
G1 X90.19 Y87.592 E-.438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.389 Y92.294 Z13.48 F42000
G1 Z13.08
G1 E.8 F1800
; LINE_WIDTH: 0.105033
G1 F1266
M204 S6000
G1 X90.189 Y92.408 E.00089
; WIPE_START
G1 F15000
G1 X90.389 Y92.294 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.449 Y92.864 Z13.48 F42000
G1 Z13.08
G1 E.8 F1800
; LINE_WIDTH: 0.135569
G1 F1266
M204 S6000
G1 X88.382 Y92.804 E.00048
; LINE_WIDTH: 0.11993
G1 X88.309 Y92.731 E.00048
; LINE_WIDTH: 0.0931395
G1 X88.236 Y92.658 E.00034
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.309 Y92.731 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/166
; update layer progress
M73 L109
M991 S0 P108 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z13.48 I.662 J1.021 P1  F42000
G1 X89.411 Y92.016 Z13.48
G1 Z13.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1353
M204 S1000
G3 X89.002 Y90.635 I-.011 J-.748 E.03552
G3 X89.002 Y89.365 I.404 J-.635 E.02765
G3 X89.322 Y87.984 I.403 J-.634 E.03389
G3 X89.798 Y89.365 I.078 J.746 E.03685
G3 X89.798 Y90.635 I-.399 J.635 E.02771
G3 X89.471 Y92.013 I-.398 J.634 E.03403
; WIPE_START
G1 F2400
M204 S6000
G1 X89.336 Y92.018 E-.05136
G1 X89.19 Y91.99 E-.05654
G1 X89.119 Y91.966 E-.02868
G1 X88.986 Y91.896 E-.05679
G1 X88.871 Y91.802 E-.05678
G1 X88.82 Y91.746 E-.02834
G1 X88.774 Y91.683 E-.0299
G1 X88.713 Y91.572 E-.04815
G1 X88.685 Y91.498 E-.02992
G1 X88.654 Y91.352 E-.05677
G1 X88.65 Y91.277 E-.0284
G1 X88.663 Y91.128 E-.05695
G1 X88.706 Y90.986 E-.05651
G1 X88.778 Y90.85 E-.05853
G1 X88.858 Y90.751 E-.04817
G1 X88.915 Y90.698 E-.02965
G1 X88.997 Y90.639 E-.03858
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.375 Y93.9 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
G1 F1353
M204 S1000
G1 X86.2 Y93.9 E.0398
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y93.9 E.14272
G1 X88.435 Y93.9 E.04693
; WIPE_START
G1 F2400
M204 S6000
G1 X86.435 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.6
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
            G0 Z13.6 F4000
            G39.3 S1
            G0 Z13.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.462 Y92.48 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.149992
G1 F1353
M204 S6000
G1 X86.462 Y90.817 E.0101
M204 S10000
G1 X86.462 Y90.518 F42000
G1 F1353
M204 S6000
G1 X86.462 Y89.547 E.0059
M204 S10000
G1 X86.462 Y89.248 F42000
G1 F1353
M204 S6000
G1 X86.462 Y87.571 E.01019
M204 S10000
G1 X90.072 Y86.297 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.410922
G1 F1353
M204 S800
G1 X90.684 Y86.909 E.01628
G1 X90.684 Y87.453 E.01026
G1 X89.696 Y86.466 E.0263
G1 X89.151 Y86.466 E.01026
G1 X90.684 Y87.998 E.04081
G1 X90.684 Y88.543 E.01026
G1 X88.606 Y86.466 E.05532
G1 X88.062 Y86.466 E.01026
G1 X89.268 Y87.672 E.03212
G2 X88.861 Y87.81 I.139 J1.076 E.00814
G1 X87.517 Y86.466 E.0358
G1 X86.972 Y86.466 E.01026
G1 X88.57 Y88.064 E.04255
G2 X88.38 Y88.418 I.767 J.64 E.00763
G1 X86.517 Y86.555 E.04962
G1 X86.517 Y87.099 E.01026
G1 X88.354 Y88.937 E.04893
G2 X88.544 Y89.366 I1.061 J-.215 E.00891
G2 X88.43 Y89.558 I.806 J.609 E.00422
G1 X86.666 Y87.794 E.04699
G1 X86.666 Y88.338 E.01026
G1 X88.333 Y90.01 E.04447
G2 X88.544 Y90.636 I1.058 J-.01 E.01264
G2 X88.493 Y90.71 I.234 J.217 E.00171
G1 X86.666 Y88.883 E.04866
G1 X86.666 Y89.291 E.00768
G1 X86.58 Y89.342 E.00188
G1 X88.502 Y91.264 E.05118
; WIPE_START
G1 F2100
M204 S6000
G1 X87.088 Y89.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.298 Y88.702 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
G1 F1353
M204 S800
G1 X90.684 Y89.088 E.01028
G1 X90.684 Y89.632 E.01026
G1 X90.32 Y89.269 E.00969
G3 X90.256 Y89.365 I-.513 J-.269 E.00218
G3 X90.466 Y89.959 I-.833 J.628 E.01205
G1 X90.684 Y90.177 E.0058
G1 X90.684 Y90.722 E.01026
G1 X90.381 Y90.419 E.00807
G3 X90.256 Y90.635 I-1.008 J-.436 E.00471
G3 X90.438 Y91.021 I-.811 J.618 E.00809
G1 X90.684 Y91.266 E.00655
G1 X90.684 Y91.811 E.01026
G1 X90.428 Y91.556 E.00681
G1 X90.426 Y91.564 E.00016
G3 X90.246 Y91.919 I-1.009 J-.288 E.00753
G1 X90.684 Y92.356 E.01165
G1 X90.684 Y92.901 E.01026
G1 X89.96 Y92.177 E.01927
G3 X89.562 Y92.324 I-.52 J-.799 E.00806
G1 X90.684 Y93.445 E.02987
G1 X90.684 Y93.534 E.00167
G1 X90.228 Y93.534 E.00858
G1 X86.666 Y89.972 E.09486
G1 X86.666 Y90.517 E.01026
G1 X89.683 Y93.534 E.08035
G1 X89.138 Y93.534 E.01026
G1 X86.666 Y91.062 E.06584
G1 X86.666 Y91.607 E.01026
G1 X88.594 Y93.534 E.05134
G1 X88.049 Y93.534 E.01026
G1 X86.666 Y92.151 E.03683
G1 X86.666 Y92.486 E.00631
G1 X86.556 Y92.586 E.0028
G1 X87.504 Y93.534 E.02525
G1 X86.959 Y93.534 E.01026
G1 X86.348 Y92.923 E.01628
; CHANGE_LAYER
; Z_HEIGHT: 13.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F2100
M204 S6000
G1 X86.959 Y93.534 E-.32849
G1 X87.504 Y93.534 E-.20699
G1 X87.086 Y93.116 E-.22451
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/166
; update layer progress
M73 L110
M991 S0 P109 ;notify layer change
M106 S204
; OBJECT_ID: 12
M204 S10000
G17
G3 Z13.6 I-.343 J1.168 P1  F42000
G1 X88.394 Y93.501 Z13.6
G1 Z13.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.03724
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.454 Y93.501 E.04452
M204 S250
G1 X88.394 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04015
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.454 Y93.9 E.04658
; WIPE_START
G1 F2400
M204 S6000
G1 X86.454 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.72
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
            G0 Z13.72 F4000
            G39.3 S1
            G0 Z13.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z13.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 13.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/166
; update layer progress
M73 L111
M991 S0 P110 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z13.72 I-1.217 J.004 P1  F42000
G1 X88.413 Y93.501 Z13.72
G1 Z13.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.03762
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.473 Y93.501 E.04413
M204 S250
G1 X88.413 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04049
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.473 Y93.9 E.04624
; WIPE_START
G1 F2400
M204 S6000
G1 X86.473 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.84
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
            G0 Z13.84 F4000
            G39.3 S1
            G0 Z13.84 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z13.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 13.56
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 112/166
; update layer progress
M73 L112
M991 S0 P111 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z13.84 I-1.217 J.008 P1  F42000
G1 X88.431 Y93.501 Z13.84
G1 Z13.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.038
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.491 Y93.501 E.04376
M204 S250
G1 X88.431 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04083
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.491 Y93.9 E.0459
; WIPE_START
G1 F2400
M204 S6000
G1 X86.491 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.96 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.96
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
            G0 Z13.96 F4000
            G39.3 S1
            G0 Z13.96 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z13.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 13.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/166
; update layer progress
M73 L113
M991 S0 P112 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z13.96 I-1.217 J.011 P1  F42000
G1 X88.449 Y93.501 Z13.96
G1 Z13.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.03837
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.509 Y93.501 E.04339
M204 S250
G1 X88.449 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04115
M73 P77 R5
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.509 Y93.9 E.04558
; WIPE_START
G1 F2400
M204 S6000
G1 X86.509 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.08
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
            G0 Z14.08 F4000
            G39.3 S1
            G0 Z14.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z13.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 114/166
; update layer progress
M73 L114
M991 S0 P113 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z14.08 I-1.217 J.014 P1  F42000
G1 X88.466 Y93.501 Z14.08
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.03872
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.526 Y93.501 E.04304
M204 S250
G1 X88.466 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04146
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.526 Y93.9 E.04527
; WIPE_START
G1 F2400
M204 S6000
G1 X86.526 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.2
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
            G0 Z14.2 F4000
            G39.3 S1
            G0 Z14.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 13.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/166
; update layer progress
M73 L115
M991 S0 P114 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z14.2 I-1.217 J.017 P1  F42000
G1 X88.482 Y93.501 Z14.2
G1 Z13.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.03906
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.542 Y93.501 E.0427
M204 S250
G1 X88.482 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04176
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.542 Y93.9 E.04497
; WIPE_START
G1 F2400
M204 S6000
G1 X86.542 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.32 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.32
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
            G0 Z14.32 F4000
            G39.3 S1
            G0 Z14.32 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z13.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 14.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/166
; update layer progress
M73 L116
M991 S0 P115 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z14.32 I-1.217 J.02 P1  F42000
G1 X88.498 Y93.501 Z14.32
G1 Z14.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.03938
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.558 Y93.501 E.04238
M204 S250
G1 X88.498 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04204
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.558 Y93.9 E.04469
; WIPE_START
G1 F2400
M204 S6000
G1 X86.558 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.44 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.44
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
            G0 Z14.44 F4000
            G39.3 S1
            G0 Z14.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z14.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
M73 P78 R5
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 14.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 117/166
; update layer progress
M73 L117
M991 S0 P116 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z14.44 I-1.217 J.023 P1  F42000
G1 X88.513 Y93.501 Z14.44
G1 Z14.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.03969
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.573 Y93.501 E.04207
M204 S250
G1 X88.513 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04231
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.573 Y93.9 E.04442
; WIPE_START
G1 F2400
M204 S6000
G1 X86.573 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.56 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.56
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
            G0 Z14.56 F4000
            G39.3 S1
            G0 Z14.56 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z14.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 14.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/166
; update layer progress
M73 L118
M991 S0 P117 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z14.56 I-1.217 J.025 P1  F42000
G1 X88.527 Y93.501 Z14.56
G1 Z14.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.03998
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.587 Y93.501 E.04178
M204 S250
G1 X88.527 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04257
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.587 Y93.9 E.04416
; WIPE_START
G1 F2400
M204 S6000
G1 X86.587 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.68 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.68
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
            G0 Z14.68 F4000
            G39.3 S1
            G0 Z14.68 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z14.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 119/166
; update layer progress
M73 L119
M991 S0 P118 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z14.68 I-1.217 J.027 P1  F42000
G1 X88.54 Y93.501 Z14.68
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04025
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.6 Y93.501 E.0415
M204 S250
G1 X88.54 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04281
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
M73 P78 R4
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
M73 P79 R4
G1 X91 Y93.9 E.02562
G1 X88.6 Y93.9 E.04392
; WIPE_START
G1 F2400
M204 S6000
G1 X86.6 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.8
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
            G0 Z14.8 F4000
            G39.3 S1
            G0 Z14.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 14.52
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 120/166
; update layer progress
M73 L120
M991 S0 P119 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z14.8 I-1.217 J.03 P1  F42000
G1 X88.552 Y93.501 Z14.8
G1 Z14.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04051
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.612 Y93.501 E.04125
M204 S250
G1 X88.552 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04304
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.612 Y93.9 E.04369
; WIPE_START
G1 F2400
M204 S6000
G1 X86.612 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.92 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.92
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
            G0 Z14.92 F4000
            G39.3 S1
            G0 Z14.92 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z14.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 14.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 121/166
; update layer progress
M73 L121
M991 S0 P120 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z14.92 I-1.217 J.032 P1  F42000
G1 X88.564 Y93.501 Z14.92
G1 Z14.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04075
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.624 Y93.501 E.04101
M204 S250
G1 X88.564 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04325
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.624 Y93.9 E.04348
; WIPE_START
G1 F2400
M204 S6000
G1 X86.624 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.04 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.04
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
            G0 Z15.04 F4000
            G39.3 S1
            G0 Z15.04 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z14.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 14.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 122/166
; update layer progress
M73 L122
M991 S0 P121 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z15.04 I-1.216 J.034 P1  F42000
G1 X88.574 Y93.501 Z15.04
G1 Z14.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04097
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.634 Y93.501 E.04079
M204 S250
M73 P80 R4
G1 X88.574 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04344
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.634 Y93.9 E.04329
; WIPE_START
G1 F2400
M204 S6000
G1 X86.634 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.16
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
            G0 Z15.16 F4000
            G39.3 S1
            G0 Z15.16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z14.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 14.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 123/166
; update layer progress
M73 L123
M991 S0 P122 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z15.16 I-1.216 J.035 P1  F42000
G1 X88.584 Y93.501 Z15.16
G1 Z14.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04117
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.644 Y93.501 E.04058
M204 S250
G1 X88.584 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04363
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.644 Y93.9 E.04311
; WIPE_START
G1 F2400
M204 S6000
G1 X86.644 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.28 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.28
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
            G0 Z15.28 F4000
            G39.3 S1
            G0 Z15.28 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z14.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 124/166
; update layer progress
M73 L124
M991 S0 P123 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z15.28 I-1.216 J.037 P1  F42000
G1 X88.593 Y93.501 Z15.28
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04136
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.653 Y93.501 E.0404
M204 S250
G1 X88.593 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04379
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.653 Y93.9 E.04294
; WIPE_START
G1 F2400
M204 S6000
G1 X86.653 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.4
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
            G0 Z15.4 F4000
            G39.3 S1
            G0 Z15.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z15
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 15.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
M73 P81 R4
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 125/166
; update layer progress
M73 L125
M991 S0 P124 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z15.4 I-1.216 J.039 P1  F42000
G1 X88.602 Y93.501 Z15.4
G1 Z15.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04153
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.662 Y93.501 E.04022
M204 S250
G1 X88.602 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04394
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.662 Y93.9 E.04279
; WIPE_START
G1 F2400
M204 S6000
G1 X86.662 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.52 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.52
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
            G0 Z15.52 F4000
            G39.3 S1
            G0 Z15.52 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z15.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 15.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 126/166
; update layer progress
M73 L126
M991 S0 P125 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z15.52 I-1.216 J.04 P1  F42000
G1 X88.609 Y93.501 Z15.52
G1 Z15.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04169
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.669 Y93.501 E.04007
M204 S250
G1 X88.609 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04408
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.669 Y93.9 E.04265
; WIPE_START
G1 F2400
M204 S6000
G1 X86.669 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.64 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.64
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
            G0 Z15.64 F4000
            G39.3 S1
            G0 Z15.64 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z15.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 15.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 127/166
; update layer progress
M73 L127
M991 S0 P126 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z15.64 I-1.216 J.041 P1  F42000
G1 X88.616 Y93.501 Z15.64
G1 Z15.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04183
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.676 Y93.501 E.03992
M204 S250
G1 X88.616 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04421
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.676 Y93.9 E.04252
; WIPE_START
G1 F2400
M204 S6000
G1 X86.676 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.76 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.76
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
            G0 Z15.76 F4000
            G39.3 S1
            G0 Z15.76 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z15.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
M73 P82 R4
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 15.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 128/166
; update layer progress
M73 L128
M991 S0 P127 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z15.76 I-1.216 J.042 P1  F42000
G1 X88.622 Y93.501 Z15.76
G1 Z15.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04196
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.682 Y93.501 E.0398
M204 S250
G1 X88.622 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04432
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.682 Y93.9 E.04241
; WIPE_START
G1 F2400
M204 S6000
G1 X86.682 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.88
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
            G0 Z15.88 F4000
            G39.3 S1
            G0 Z15.88 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z15.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 129/166
; update layer progress
M73 L129
M991 S0 P128 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z15.88 I-1.216 J.043 P1  F42000
G1 X88.628 Y93.501 Z15.88
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04207
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.688 Y93.501 E.03968
M204 S250
G1 X88.628 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04442
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.688 Y93.9 E.04231
; WIPE_START
G1 F2400
M204 S6000
G1 X86.688 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16
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
            G0 Z16 F4000
            G39.3 S1
            G0 Z16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z15.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 15.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 130/166
; update layer progress
M73 L130
M991 S0 P129 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z16 I-1.216 J.044 P1  F42000
G1 X88.632 Y93.501 Z16
G1 Z15.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04217
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.692 Y93.501 E.03958
M204 S250
G1 X88.632 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04451
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.692 Y93.9 E.04222
; WIPE_START
G1 F2400
M204 S6000
G1 X86.692 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P83 R4
G3 Z16.12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.12
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
            G0 Z16.12 F4000
            G39.3 S1
            G0 Z16.12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z15.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 15.84
; LAYER_HEIGHT: 0.12
; WIPE_START
M73 P83 R3
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 131/166
; update layer progress
M73 L131
M991 S0 P130 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z16.12 I-1.216 J.045 P1  F42000
G1 X88.637 Y93.501 Z16.12
G1 Z15.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04226
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.697 Y93.501 E.0395
M204 S250
G1 X88.637 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04459
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.697 Y93.9 E.04215
; WIPE_START
G1 F2400
M204 S6000
G1 X86.697 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.24 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.24
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
            G0 Z16.24 F4000
            G39.3 S1
            G0 Z16.24 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z15.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 15.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 132/166
; update layer progress
M73 L132
M991 S0 P131 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z16.24 I-1.216 J.046 P1  F42000
G1 X88.64 Y93.501 Z16.24
G1 Z15.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04234
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.7 Y93.501 E.03942
M204 S250
G1 X88.64 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04465
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.7 Y93.9 E.04208
; WIPE_START
G1 F2400
M204 S6000
G1 X86.7 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.36 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.36
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
            G0 Z16.36 F4000
            G39.3 S1
            G0 Z16.36 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z15.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 16.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 133/166
; update layer progress
M73 L133
M991 S0 P132 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z16.36 I-1.216 J.046 P1  F42000
G1 X88.643 Y93.501 Z16.36
G1 Z16.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.0424
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.703 Y93.501 E.03936
M204 S250
M73 P84 R3
G1 X88.643 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04471
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.703 Y93.9 E.04202
; WIPE_START
G1 F2400
M204 S6000
G1 X86.703 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.48 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.48
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
            G0 Z16.48 F4000
            G39.3 S1
            G0 Z16.48 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z16.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 134/166
; update layer progress
M73 L134
M991 S0 P133 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z16.48 I-1.216 J.047 P1  F42000
G1 X88.646 Y93.501 Z16.48
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04245
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.706 Y93.501 E.03931
M204 S250
G1 X88.646 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04475
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.706 Y93.9 E.04198
; WIPE_START
G1 F2400
M204 S6000
G1 X86.706 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.6
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
            G0 Z16.6 F4000
            G39.3 S1
            G0 Z16.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z16.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 16.32
; LAYER_HEIGHT: 0.119999
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 135/166
; update layer progress
M73 L135
M991 S0 P134 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z16.6 I-1.216 J.047 P1  F42000
G1 X88.648 Y93.501 Z16.6
G1 Z16.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04249
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.708 Y93.501 E.03927
M204 S250
G1 X88.648 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04479
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.708 Y93.9 E.04194
; WIPE_START
G1 F2400
M204 S6000
G1 X86.708 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.72
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
            G0 Z16.72 F4000
            G39.3 S1
            G0 Z16.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z16.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 16.44
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
M73 P85 R3
G1 E-.04 F1800
; layer num/total_layer_count: 136/166
; update layer progress
M73 L136
M991 S0 P135 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z16.72 I-1.216 J.047 P1  F42000
G1 X88.649 Y93.501 Z16.72
G1 Z16.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04252
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.709 Y93.501 E.03924
M204 S250
G1 X88.649 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04481
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.709 Y93.9 E.04192
; WIPE_START
G1 F2400
M204 S6000
G1 X86.709 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.84
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
            G0 Z16.84 F4000
            G39.3 S1
            G0 Z16.84 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z16.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 16.56
; LAYER_HEIGHT: 0.119999
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 137/166
; update layer progress
M73 L137
M991 S0 P136 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z16.84 I-1.216 J.047 P1  F42000
G1 X88.65 Y93.501 Z16.84
G1 Z16.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04254
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.71 Y93.501 E.03922
M204 S250
G1 X88.65 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04483
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.71 Y93.9 E.0419
; WIPE_START
G1 F2400
M204 S6000
G1 X86.71 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.96 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.96
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
            G0 Z16.96 F4000
            G39.3 S1
            G0 Z16.96 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z16.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 16.68
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 138/166
; update layer progress
M73 L138
M991 S0 P137 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z16.96 I-1.216 J.047 P1  F42000
G1 X88.65 Y93.501 Z16.96
G1 Z16.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04255
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.71 Y93.501 E.03921
M204 S250
G1 X88.65 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04484
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.71 Y93.9 E.04189
; WIPE_START
G1 F2400
M204 S6000
G1 X86.71 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.08
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
            G0 Z17.08 F4000
            G39.3 S1
            G0 Z17.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z16.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
M73 P86 R3
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.119999
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 139/166
; update layer progress
M73 L139
M991 S0 P138 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z17.08 I-1.216 J.047 P1  F42000
G1 X88.65 Y93.501 Z17.08
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04255
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.71 Y93.501 E.03921
M204 S250
G1 X88.65 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04484
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.71 Y93.9 E.0419
; WIPE_START
G1 F2400
M204 S6000
G1 X86.71 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.2
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
            G0 Z17.2 F4000
            G39.3 S1
            G0 Z17.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z16.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 16.92
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 140/166
; update layer progress
M73 L140
M991 S0 P139 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z17.2 I-1.216 J.047 P1  F42000
G1 X88.65 Y93.501 Z17.2
G1 Z16.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04254
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.71 Y93.501 E.03922
M204 S250
G1 X88.65 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04483
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.71 Y93.9 E.0419
; WIPE_START
G1 F2400
M204 S6000
G1 X86.71 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.32 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.32
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
            G0 Z17.32 F4000
            G39.3 S1
            G0 Z17.32 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z16.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 17.04
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 141/166
; update layer progress
M73 L141
M991 S0 P140 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z17.32 I-1.216 J.047 P1  F42000
G1 X88.649 Y93.501 Z17.32
G1 Z17.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04252
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.709 Y93.501 E.03924
M204 S250
G1 X88.649 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04481
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.709 Y93.9 E.04192
; WIPE_START
G1 F2400
M204 S6000
G1 X86.709 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.44 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.44
M73 P87 R3
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
            G0 Z17.44 F4000
            G39.3 S1
            G0 Z17.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z17.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 17.16
; LAYER_HEIGHT: 0.119999
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 142/166
; update layer progress
M73 L142
M991 S0 P141 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z17.44 I-1.216 J.047 P1  F42000
G1 X88.648 Y93.501 Z17.44
G1 Z17.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04249
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.708 Y93.501 E.03927
M204 S250
G1 X88.648 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04479
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.708 Y93.9 E.04194
; WIPE_START
G1 F2400
M204 S6000
G1 X86.708 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.56 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.56
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
            G0 Z17.56 F4000
            G39.3 S1
            G0 Z17.56 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z17.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
M73 P87 R2
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 17.28
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 143/166
; update layer progress
M73 L143
M991 S0 P142 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z17.56 I-1.216 J.047 P1  F42000
G1 X88.646 Y93.501 Z17.56
G1 Z17.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04246
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.706 Y93.501 E.0393
M204 S250
G1 X88.646 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04476
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.706 Y93.9 E.04197
; WIPE_START
G1 F2400
M204 S6000
G1 X86.706 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.68 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.68
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
            G0 Z17.68 F4000
            G39.3 S1
            G0 Z17.68 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z17.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.119999
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 144/166
; update layer progress
M73 L144
M991 S0 P143 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z17.68 I-1.216 J.046 P1  F42000
G1 X88.644 Y93.501 Z17.68
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04242
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
M73 P88 R2
G1 X88.704 Y93.501 E.03934
M204 S250
G1 X88.644 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04472
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.704 Y93.9 E.04201
; WIPE_START
G1 F2400
M204 S6000
G1 X86.704 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.8
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
            G0 Z17.8 F4000
            G39.3 S1
            G0 Z17.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z17.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 17.52
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 145/166
; update layer progress
M73 L145
M991 S0 P144 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z17.8 I-1.216 J.046 P1  F42000
G1 X88.642 Y93.501 Z17.8
G1 Z17.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04237
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.702 Y93.501 E.03939
M204 S250
G1 X88.642 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04468
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.702 Y93.9 E.04205
; WIPE_START
G1 F2400
M204 S6000
G1 X86.702 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.92 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.92
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
            G0 Z17.92 F4000
            G39.3 S1
            G0 Z17.92 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z17.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 17.64
; LAYER_HEIGHT: 0.119999
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 146/166
; update layer progress
M73 L146
M991 S0 P145 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z17.92 I-1.216 J.045 P1  F42000
G1 X88.639 Y93.501 Z17.92
G1 Z17.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04232
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.699 Y93.501 E.03944
M204 S250
G1 X88.639 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04463
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.699 Y93.9 E.0421
; WIPE_START
G1 F2400
M204 S6000
G1 X86.699 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.04 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.04
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
            G0 Z18.04 F4000
            G39.3 S1
            G0 Z18.04 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z17.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 17.76
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 147/166
; update layer progress
M73 L147
M991 S0 P146 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z18.04 I-1.216 J.045 P1  F42000
G1 X88.636 Y93.501 Z18.04
G1 Z17.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04226
G1 X86.599 Y86.499 E.14523
M73 P89 R2
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.696 Y93.501 E.0395
M204 S250
G1 X88.636 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04458
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.696 Y93.9 E.04215
; WIPE_START
G1 F2400
M204 S6000
G1 X86.696 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.16
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
            G0 Z18.16 F4000
            G39.3 S1
            G0 Z18.16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z17.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 17.88
; LAYER_HEIGHT: 0.119999
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 148/166
; update layer progress
M73 L148
M991 S0 P147 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z18.16 I-1.216 J.044 P1  F42000
G1 X88.633 Y93.501 Z18.16
G1 Z17.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04219
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.693 Y93.501 E.03957
M204 S250
G1 X88.633 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04452
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.693 Y93.9 E.04221
; WIPE_START
G1 F2400
M204 S6000
G1 X86.693 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.28 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.28
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
            G0 Z18.28 F4000
            G39.3 S1
            G0 Z18.28 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z17.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 149/166
; update layer progress
M73 L149
M991 S0 P148 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z18.28 I-1.216 J.044 P1  F42000
G1 X88.63 Y93.501 Z18.28
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04212
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.69 Y93.501 E.03963
M204 S250
G1 X88.63 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04446
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.69 Y93.9 E.04227
; WIPE_START
G1 F2400
M204 S6000
G1 X86.69 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.4
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
            G0 Z18.4 F4000
            G39.3 S1
            G0 Z18.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.998 Y93.165 F42000
G1 Z18
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255406
G1 F1200
M204 S6000
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.998 Y93.165 F42000
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
M73 P90 R2
G1 X86.952 Y93.148 E.00063
; LINE_WIDTH: 0.302962
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 18.12
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 150/166
; update layer progress
M73 L150
M991 S0 P149 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z18.4 I-1.216 J.043 P1  F42000
G1 X88.626 Y93.501 Z18.4
G1 Z18.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04205
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.686 Y93.501 E.03971
M204 S250
G1 X88.626 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.0444
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.686 Y93.9 E.04233
; WIPE_START
G1 F2400
M204 S6000
G1 X86.686 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.52 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.52
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
            G0 Z18.52 F4000
            G39.3 S1
            G0 Z18.52 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z18.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 18.24
; LAYER_HEIGHT: 0.119999
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 151/166
; update layer progress
M73 L151
M991 S0 P150 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z18.52 I-1.216 J.042 P1  F42000
G1 X88.623 Y93.501 Z18.52
G1 Z18.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04197
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.683 Y93.501 E.03979
M204 S250
G1 X88.623 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04433
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.683 Y93.9 E.0424
; WIPE_START
G1 F2400
M204 S6000
G1 X86.683 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.64 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.64
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
            G0 Z18.64 F4000
            G39.3 S1
            G0 Z18.64 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z18.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 18.36
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 152/166
; update layer progress
M73 L152
M991 S0 P151 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z18.64 I-1.216 J.042 P1  F42000
G1 X88.619 Y93.501 Z18.64
G1 Z18.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04189
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.679 Y93.501 E.03987
M204 S250
G1 X88.619 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04426
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.679 Y93.9 E.04247
; WIPE_START
G1 F2400
M204 S6000
G1 X86.679 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.76 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
M73 P91 R2
G1 Z18.76
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
            G0 Z18.76 F4000
            G39.3 S1
            G0 Z18.76 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z18.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 18.48
; LAYER_HEIGHT: 0.119999
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 153/166
; update layer progress
M73 L153
M991 S0 P152 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z18.76 I-1.216 J.041 P1  F42000
G1 X88.615 Y93.501 Z18.76
G1 Z18.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04181
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.675 Y93.501 E.03995
M204 S250
G1 X88.615 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04418
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.675 Y93.9 E.04255
; WIPE_START
G1 F2400
M204 S6000
G1 X86.675 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.88
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
            G0 Z18.88 F4000
            G39.3 S1
            G0 Z18.88 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z18.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 154/166
; update layer progress
M73 L154
M991 S0 P153 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z18.88 I-1.216 J.04 P1  F42000
G1 X88.611 Y93.501 Z18.88
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04172
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.671 Y93.501 E.04004
M204 S250
G1 X88.611 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04411
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
M73 P91 R1
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.671 Y93.9 E.04262
; WIPE_START
G1 F2400
M204 S6000
G1 X86.671 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19
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
            G0 Z19 F4000
            G39.3 S1
            G0 Z19 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z18.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 18.72
; LAYER_HEIGHT: 0.119999
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 155/166
; update layer progress
M73 L155
M991 S0 P154 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z19 I-1.216 J.039 P1  F42000
G1 X88.606 Y93.501 Z19
G1 Z18.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04163
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.666 Y93.501 E.04013
M204 S250
G1 X88.606 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04403
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
M73 P92 R1
G1 X91 Y93.9 E.02562
G1 X88.666 Y93.9 E.0427
; WIPE_START
G1 F2400
M204 S6000
G1 X86.666 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.12
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
            G0 Z19.12 F4000
            G39.3 S1
            G0 Z19.12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z18.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 18.84
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 156/166
; update layer progress
M73 L156
M991 S0 P155 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z19.12 I-1.216 J.039 P1  F42000
G1 X88.602 Y93.501 Z19.12
G1 Z18.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04154
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.662 Y93.501 E.04022
M204 S250
G1 X88.602 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04395
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.662 Y93.9 E.04278
; WIPE_START
G1 F2400
M204 S6000
G1 X86.662 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.24 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.24
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
            G0 Z19.24 F4000
            G39.3 S1
            G0 Z19.24 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z18.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 18.96
; LAYER_HEIGHT: 0.119999
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 157/166
; update layer progress
M73 L157
M991 S0 P156 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z19.24 I-1.216 J.038 P1  F42000
G1 X88.597 Y93.501 Z19.24
G1 Z18.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04145
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.657 Y93.501 E.04031
M204 S250
G1 X88.597 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04387
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.657 Y93.9 E.04286
; WIPE_START
G1 F2400
M204 S6000
G1 X86.657 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.36 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.36
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
            G0 Z19.36 F4000
            G39.3 S1
            G0 Z19.36 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z18.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 19.08
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 158/166
; update layer progress
M73 L158
M991 S0 P157 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z19.36 I-1.216 J.037 P1  F42000
G1 X88.593 Y93.501 Z19.36
G1 Z19.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04136
G1 X86.599 Y86.499 E.14523
M73 P93 R1
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.653 Y93.501 E.0404
M204 S250
G1 X88.593 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04379
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.653 Y93.9 E.04295
; WIPE_START
G1 F2400
M204 S6000
G1 X86.653 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.48 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.48
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
            G0 Z19.48 F4000
            G39.3 S1
            G0 Z19.48 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z19.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 159/166
; update layer progress
M73 L159
M991 S0 P158 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z19.48 I-1.216 J.036 P1  F42000
G1 X88.589 Y93.501 Z19.48
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04126
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.649 Y93.501 E.04049
M204 S250
G1 X88.589 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04371
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.649 Y93.9 E.04303
; WIPE_START
G1 F2400
M204 S6000
G1 X86.649 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.6
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
            G0 Z19.6 F4000
            G39.3 S1
            G0 Z19.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z19.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 19.32
; LAYER_HEIGHT: 0.119999
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 160/166
; update layer progress
M73 L160
M991 S0 P159 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z19.6 I-1.216 J.035 P1  F42000
G1 X88.584 Y93.501 Z19.6
G1 Z19.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04117
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.644 Y93.501 E.04059
M204 S250
G1 X88.584 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04362
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.644 Y93.9 E.04311
; WIPE_START
G1 F2400
M204 S6000
G1 X86.644 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.72
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
            G0 Z19.72 F4000
            G39.3 S1
            G0 Z19.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z19.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
M73 P94 R1
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 19.44
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 161/166
; update layer progress
M73 L161
M991 S0 P160 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z19.72 I-1.216 J.035 P1  F42000
G1 X88.58 Y93.501 Z19.72
G1 Z19.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04108
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.64 Y93.501 E.04068
M204 S250
G1 X88.58 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04354
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.64 Y93.9 E.04319
; WIPE_START
G1 F2400
M204 S6000
G1 X86.64 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.84
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
            G0 Z19.84 F4000
            G39.3 S1
            G0 Z19.84 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z19.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 19.56
; LAYER_HEIGHT: 0.119999
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 162/166
; update layer progress
M73 L162
M991 S0 P161 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z19.84 I-1.216 J.034 P1  F42000
G1 X88.575 Y93.501 Z19.84
G1 Z19.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04099
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.635 Y93.501 E.04077
M204 S250
G1 X88.575 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04346
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.635 Y93.9 E.04327
; WIPE_START
G1 F2400
M204 S6000
G1 X86.635 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.96 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.96
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
            G0 Z19.96 F4000
            G39.3 S1
            G0 Z19.96 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z19.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 19.68
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 163/166
; update layer progress
M73 L163
M991 S0 P162 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z19.96 I-1.217 J.033 P1  F42000
G1 X88.571 Y93.501 Z19.96
G1 Z19.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.0409
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.631 Y93.501 E.04086
M204 S250
G1 X88.571 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04338
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.631 Y93.9 E.04335
; WIPE_START
G1 F2400
M204 S6000
G1 X86.631 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z20.08
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
            G0 Z20.08 F4000
            G39.3 S1
            G0 Z20.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z19.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
M73 P95 R1
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.119999
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 164/166
; update layer progress
M73 L164
M991 S0 P163 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z20.08 I-1.217 J.032 P1  F42000
G1 X88.567 Y93.501 Z20.08
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04081
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.627 Y93.501 E.04094
M204 S250
G1 X88.567 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04331
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.627 Y93.9 E.04342
; WIPE_START
G1 F2400
M204 S6000
G1 X86.627 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z20.2
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
            G0 Z20.2 F4000
            G39.3 S1
            G0 Z20.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z19.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 19.92
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 165/166
; update layer progress
M73 L165
M991 S0 P164 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z20.2 I-1.217 J.032 P1  F42000
G1 X88.563 Y93.501 Z20.2
G1 Z19.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X86.599 Y93.501 E.04073
G1 X86.599 Y86.499 E.14523
G1 X90.601 Y86.499 E.083
G1 X90.601 Y87.101 E.01248
G1 X87.301 Y87.101 E.06845
G1 X87.301 Y92.899 E.12027
G1 X90.601 Y92.899 E.06845
G1 X90.601 Y93.501 E.01248
G1 X88.623 Y93.501 E.04103
M204 S250
G1 X88.563 Y93.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04323
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.623 Y93.9 E.0435
; WIPE_START
G1 F2400
M204 S6000
G1 X86.623 Y93.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.32 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z20.32
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
            G0 Z20.32 F4000
            G39.3 S1
            G0 Z20.32 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.952 Y93.148 F42000
G1 Z19.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290323
G1 F1200
M204 S6000
G1 X86.998 Y93.165 E.00063
; LINE_WIDTH: 0.255406
G1 X87.043 Y93.183 E.00055
; LINE_WIDTH: 0.203286
G1 X87.089 Y93.2 E.00042
G1 X90.389 Y93.2 E.02864
M204 S10000
G1 X86.952 Y93.148 F42000
; LINE_WIDTH: 0.302962
G1 F1200
M204 S6000
G1 X86.95 Y86.889 E.08483
G1 X86.952 Y86.852 E.00049
G1 X86.998 Y86.835 E.00066
; LINE_WIDTH: 0.255402
G1 X87.043 Y86.817 E.00055
; LINE_WIDTH: 0.220489
G1 X87.089 Y86.8 E.00046
; LINE_WIDTH: 0.203032
G1 X90.389 Y86.8 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 20.04
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15000
M73 P95 R0
G1 X88.389 Y86.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 166/166
; update layer progress
M73 L166
M991 S0 P165 ;notify layer change
; OBJECT_ID: 12
M204 S10000
G17
G3 Z20.32 I-1.217 J.029 P1  F42000
G1 X88.559 Y93.9 Z20.32
G1 Z20.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.4
G1 F1200
M204 S1000
G1 X86.2 Y93.9 E.04316
G1 X86.2 Y86.1 E.14272
G1 X91 Y86.1 E.08783
G1 X91 Y87.5 E.02562
G1 X87.7 Y87.5 E.06038
G1 X87.7 Y92.5 E.09149
G1 X91 Y92.5 E.06038
G1 X91 Y93.9 E.02562
G1 X88.619 Y93.9 E.04357
; WIPE_START
G1 F2400
M204 S6000
G1 X86.619 Y93.9 E-.76
; WIPE_END
M73 P96 R0
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.44 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z20.44
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
            G0 Z20.44 F4000
            G39.3 S1
            G0 Z20.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X90.852 Y92.965 F42000
G1 Z20.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.414082
G1 F1200
M204 S800
G1 X90.234 Y93.583 E.01659
G1 X89.685 Y93.583 E.01043
G1 X90.451 Y92.817 E.02059
G1 X89.902 Y92.817 E.01043
G1 X89.135 Y93.583 E.02059
G1 X88.586 Y93.583 E.01043
G1 X89.353 Y92.817 E.02059
G1 X88.804 Y92.817 E.01043
G1 X88.037 Y93.583 E.02059
G1 X87.488 Y93.583 E.01043
G1 X88.255 Y92.817 E.02059
G1 X87.705 Y92.817 E.01043
G1 X86.939 Y93.583 E.02059
G1 X86.517 Y93.583 E.00801
G1 X86.517 Y93.456 E.00241
G1 X87.383 Y92.59 E.02327
G1 X87.383 Y92.04 E.01043
G1 X86.517 Y92.907 E.02327
G1 X86.517 Y92.358 E.01043
G1 X87.383 Y91.491 E.02327
G1 X87.383 Y90.942 E.01043
G1 X86.517 Y91.809 E.02327
G1 X86.517 Y91.26 E.01043
G1 X87.383 Y90.393 E.02327
G1 X87.383 Y89.844 E.01043
G1 X86.517 Y90.71 E.02327
G1 X86.517 Y90.161 E.01043
G1 X87.383 Y89.294 E.02327
G1 X87.383 Y88.745 E.01043
G1 X86.517 Y89.612 E.02327
G1 X86.517 Y89.063 E.01043
G1 X87.552 Y88.028 E.0278
; WIPE_START
G1 F2100
M204 S6000
G1 X86.517 Y89.063 E-.55631
G1 X86.517 Y89.599 E-.20369
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.424 Y87.352 Z20.44 F42000
G1 Z20.04
G1 E.8 F1800
G1 F1200
M204 S800
G1 X90.683 Y87.093 E.00695
G1 X90.683 Y86.544 E.01043
G1 X90.044 Y87.183 E.01718
G1 X89.494 Y87.183 E.01043
G1 X90.261 Y86.417 E.02059
G1 X89.712 Y86.417 E.01043
G1 X88.945 Y87.183 E.02059
G1 X88.396 Y87.183 E.01043
G1 X89.163 Y86.417 E.02059
G1 X88.614 Y86.417 E.01043
G1 X87.847 Y87.183 E.02059
G1 X87.383 Y87.183 E.0088
G1 X87.383 Y87.647 E.0088
G1 X86.517 Y88.514 E.02327
G1 X86.517 Y87.965 E.01043
G1 X88.065 Y86.417 E.04156
G1 X87.515 Y86.417 E.01043
G1 X86.517 Y87.415 E.02682
G1 X86.517 Y86.866 E.01043
G1 X87.135 Y86.248 E.01659
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F2100
M204 S6000
G1 X86.517 Y86.866 E-.33208
G1 X86.517 Y87.415 E-.20869
G1 X86.925 Y87.007 E-.21923
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.44 I1.217 J0 P1  F42000
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
G1 Z20.44 F900 ; lower z a little
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

    G1 Z120.04 F600
    G1 Z118.04

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

