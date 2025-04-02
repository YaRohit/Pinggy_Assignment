# Makefile for the Windows IPC Job Dispatcher

# Set the compiler to g++ (the GNU C++ compiler)
CC = g++

# Compiler flags:
# -Wall: Enable most warnings
# -Wextra: Enable extra warnings
# -std=c++17: Use the C++17 standard.
CFLAGS = -Wall -Wextra -std=c++17

# The name of the final executable
TARGET = system_IPC.exe

# The source file that needs to be compiled
SOURCES = system_IPC.cpp

# Build target that depends on the executable
build: $(TARGET)

# Rule to build the executable from the source file
$(TARGET): $(SOURCES)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCES)

# Clean target to remove the executable
clean:
	del $(TARGET)