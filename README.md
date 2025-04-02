My repo is under branch named as YaRohit-patch-1


# Windows IPC Job Dispatcher

## Overview

This project demonstrates a system programming solution that utilizes inter-process communication (IPC) and process management via Windows API. The goal is to implement a dispatcher that distributes incoming jobs to a pool of specialized worker processes. Each worker simulates job processing by sleeping for a given duration and then signals the dispatcher upon completion.

## Problem Statement

**Objective:**  
Implement a program to assess skills in systems programming and operating system concepts, with a focus on IPC. The main (dispatcher) process should distribute jobs to a pool of worker processes based on job type. Each worker processes its jobs concurrently (by "sleeping" for the given duration) and uses IPC via pipes to communicate its status back to the dispatcher.

**Details:**

- **Worker Configuration:**  
  The program accepts a configuration specifying the number of worker processes for each of 5 job types (e.g., 1 3 1 1 1).

- **Job Input:**  
  Each job consists of a job type (1–5) and a job duration (in seconds) that simulates the amount of work.

- **IPC Approach:**  
  Instead of using POSIX-specific functions like `fork()`, `pipe()`, and `select()`, this Windows-specific solution uses:
  - `CreatePipe` to establish communication channels
  - `CreateProcessA` to spawn worker processes
  - `PeekNamedPipe` and `ReadFile`/`WriteFile` for non-blocking I/O and job signaling

- **Worker Behavior:**
  Each worker process waits for jobs via its inherited pipe; when it receives a job (duration), it sleeps for that many seconds and writes the duration back to the dispatcher as a completion signal. A duration of 0 is used to indicate termination.

## Features

- **Dynamic Worker Creation:** Workers are created based on a predefined configuration.
- **IPC using Anonymous Pipes:** Two-way communication is set up via pipes (one for sending jobs, one for receiving signals).
- **Non-Blocking Job Monitoring:** The dispatcher polls worker output with `PeekNamedPipe` so it can efficiently manage multiple workers at once.
- **Graceful Termination:** After processing all jobs, the dispatcher sends a termination signal (0) to all workers.
