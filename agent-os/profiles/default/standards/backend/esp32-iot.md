# ESP32/IoT Development Standards

ESP32/Espressif development standards for ESP32-S3 hardware. Covers ESP-IDF framework, hardware-specific patterns, FreeRTOS, peripherals, power management, and ESP32-S3 specific features.

> **Note**: Assumes core rules (command execution, file operations, quality gates, error handling, naming, TDD methodology, code structure) are already loaded. For general C patterns, see backend/cpp.md.

## ESP32-S3 Hardware Overview

### Key Hardware Features

- **Dual-core Xtensa LX7 processor** (up to 240 MHz)
- **WiFi 802.11 b/g/n** and **Bluetooth 5.0 (LE)**
- **USB OTG** support (native USB)
- **Single USB port** with mode switching (USB-JTAG or USB-OTG, not both simultaneously)
- **Rich peripherals**: GPIO, I2C, SPI, UART, ADC, DAC, PWM, RMT, I2S, Camera, LCD
- **Low power modes**: Light sleep, Deep sleep, Hibernation
- **PSRAM** support (external or integrated)
- **Flash** storage (typically 4MB+)

### ESP32-S3 Specific Considerations

- Native USB support (no USB-to-Serial chip needed)
- **Single USB port** that can be switched between USB-JTAG and USB-OTG modes
- **Mode switching**: In OTG mode, JTAG is disabled (cannot use UART debugging)
- Enhanced security features
- Better power management than ESP32

## ESP-IDF Framework

### Framework Structure

- **ESP-IDF**: Official Espressif IoT Development Framework
- **FreeRTOS**: Real-time operating system (included)
- **Component-based architecture**: Modular, reusable components
- **CMake build system**: Modern build configuration
- **Partition tables**: Flash memory layout management

### Project Structure

```text
project/
├── main/                    # Main application code
│   ├── CMakeLists.txt      # Main component CMake
│   ├── main.c              # Application entry point
│   └── components/         # Custom components (atoms/molecules/organisms)
├── components/             # Shared components
│   ├── atoms/              # Basic building blocks
│   ├── molecules/          # Composed components
│   └── organisms/          # Complex modules
├── CMakeLists.txt          # Root CMake
├── sdkconfig              # Build configuration
├── sdkconfig.defaults      # Default configuration
└── partitions.csv         # Flash partition table
```

## Code Structure (Atomic Design)

ESP32-specific atomic design patterns (see global/code-structure.md for complete hierarchy):

### Atoms (Basic Building Blocks)

- **Single-purpose drivers/peripherals**: One peripheral driver, one utility function per file
- **Size**: <100 lines (ideally <50 lines)
- **Location**: `components/atoms/` or `main/components/atoms/`

### Molecules (Composed Components)

- **Compose atoms**: Import and use 2-5 atom drivers/utilities
- **Size**: <200 lines (ideally <150 lines)
- **Location**: `components/molecules/`

### Organisms (Complex Modules)

- **Compose molecules/atoms**: Multiple molecule components
- **Size**: <500 lines (ideally <300 lines)
- **Location**: `components/organisms/`

## Build System

- Use CMake as primary build system
- Use ESP-IDF's `idf.py` for building
- Configure via `sdkconfig` (use `idf.py menuconfig`)
- Use component dependencies in `CMakeLists.txt`

## FreeRTOS & Tasks

- Use FreeRTOS tasks for concurrent operations
- Each task should have a single responsibility
- Use appropriate task priorities (0=lowest, 31=highest)
- Implement proper task synchronization (mutexes, queues, semaphores)

## Peripheral Management

- Use ESP-IDF drivers for all peripherals
- Implement proper error handling
- Release resources in error cases
- Use atomic operations for shared state

## Power Management

- Implement low power modes when appropriate
- Use light sleep for short idle periods
- Use deep sleep for extended idle periods
- Document power consumption characteristics

## Security

- Never commit WiFi credentials or API keys
- Use NVS (Non-Volatile Storage) encryption
- Use OTA updates for firmware security
- Implement proper certificate validation for TLS
- Use secure boot and flash encryption

## Testing (TDD)

- Use `TEST_CASE()` macro for unit tests
- Use `TEST_ASSERT()` for assertions
- Mock external dependencies
- Test error cases and edge conditions
- Implement integration tests on actual hardware

## Performance

- Use DMA for I/O operations when possible
- Optimize critical paths
- Use appropriate peripheral clock speeds
- Monitor heap usage
- Profile with ESP-IDF tools

## Debugging

- Use JTAG or USB debugging interfaces
- Implement proper logging with ESP-IDF's logging system
- Use `esp-idf-monitor` for serial monitoring
- Implement crash dump analysis

## Dependencies

- Use ESP-IDF components
- Pin component versions in `idf_component.yml`
- Keep dependencies minimal
- Regular security updates for ESP-IDF
