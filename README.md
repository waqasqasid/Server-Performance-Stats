# Server Performance Stats

A simple Bash script that analyzes basic Linux server performance statistics. It provides an overview of CPU, memory, disk usage, and the top resource-consuming processes.

## Features

* Displays total CPU usage
* Displays total memory usage (Used, Free, and Percentage)
* Displays total disk usage (Used, Free, and Percentage)
* Lists the top 5 processes by CPU usage
* Lists the top 5 processes by memory usage

### Stretch Goals

The script also includes additional system information:

* Operating System version
* System uptime
* Load average
* Logged-in users
* Failed login attempts (if `lastb` is available)

## Prerequisites

* Linux operating system
* Bash shell
* Standard Linux utilities:

  * `top`
  * `free`
  * `df`
  * `ps`
  * `uptime`
  * `who`
  * `lastb` (optional)

## Installation

Clone the repository:

```bash
git clone https://github.com/<your-username>/server-performance-stats.git
```

Move into the project directory:

```bash
cd server-performance-stats
```

Make the script executable:

```bash
chmod +x server-stats.sh
```

## Usage

Run the script:

```bash
./server-stats.sh
```

Or:

```bash
bash server-stats.sh
```

## Example Output

```text
=========================================
       Linux Server Performance Stats
=========================================
Hostname        : ubuntu-server
Date            : Tue Jul 01 10:25:10 UTC 2026

========== CPU Usage ==========
Total CPU Usage : 18.42%

========== Memory Usage ==========
Total Memory : 7985 MB
Used Memory  : 3420 MB
Free Memory  : 4565 MB
Usage        : 42.83%

========== Disk Usage ==========
Total Disk : 50G
Used Disk  : 18G
Free Disk  : 30G
Usage      : 38%

========== Top 5 Processes by CPU ==========
PID USER COMMAND %CPU
...

========== Top 5 Processes by Memory ==========
PID USER COMMAND %MEM
...
```

## Project Structure

```
.
├── server-stats.sh
└── README.md
```

## Future Improvements

* Network usage statistics
* CPU temperature monitoring
* Docker container statistics
* Running services status
* Disk I/O monitoring
* Colored terminal output
* Export results to a log file

Project: https://roadmap.sh/projects/server-stats

## License

This project is open source and available under the MIT License.

---

This project was created as part of the **Server Performance Stats** challenge from roadmap.sh.

