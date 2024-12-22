# Define variables
VERILOG_COMPILER = iverilog        # Verilog compiler (iverilog)
SIMULATOR = vvp                   # Simulator (vvp for execution)
SOURCE_FILES = home_automation_sys.v home_automation_reverse.v smart_lights.v motion_sensing.v smart_thermostat.v air_quality_monitoring.v window_blinds.v smart_cameras.v door_locks.v sensors.v security_alerts.v smart_speakers.v smart_appliances.v robot_vacuums.v automated_pet_feeders.v
TESTBENCH = testbench.v           # Your testbench file
OUTPUT_DIR = build                # Directory for simulation output
TARGET = simulation_result        # Output file name

# Default target: compile and run the simulation
all: $(OUTPUT_DIR)/$(TARGET)
	@echo "Simulation compiled successfully."

# Rule to compile Verilog files
$(OUTPUT_DIR)/$(TARGET): $(SOURCE_FILES) $(TESTBENCH)
	@mkdir -p $(OUTPUT_DIR)  # Create output directory if it doesn't exist
	$(VERILOG_COMPILER) -o $(OUTPUT_DIR)/$(TARGET) $(SOURCE_FILES) $(TESTBENCH)

# Rule to run the simulation
run: $(OUTPUT_DIR)/$(TARGET)
	$(SIMULATOR) $(OUTPUT_DIR)/$(TARGET)

# Clean up the generated files (e.g., simulation output and object files)
clean:
	rm -rf $(OUTPUT_DIR)

# Help message for the user
help:
	@echo "Makefile for Smart Home Sequential Circuit Blocks"
	@echo "Usage:"
	@echo "  make        - Compiles and runs the simulation"
	@echo "  make run    - Runs the simulation after compilation"
	@echo "  make clean  - Removes generated simulation files"
	@echo "  make help   - Displays this help message"

