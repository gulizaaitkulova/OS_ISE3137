#### Explanation of the code - 1. Function to check running processes

The 1st function of the Enhanced Server Health Checkup Script checks for running processes on a system. It prints out information about CPU-consuming processes, as well as lists running processes for specific programs such as 'java', 'http', and 'mysql'. Finally, it displays the total number of running processes.

Here are steps of the function:

**1. Processes consuming more than 10% CPU:**

This part of the code uses the `ps` command to list all processes running on the system and sorts them based on their CPU usage (`%cpu`). The `--sort=%cpu` option instructs `ps` to sort the processes in descending order of CPU usage. The `awk 'NR<=5 {print $0}'` command prints the first 5 lines of the output, which corresponds to the top 5 CPU-consuming processes.

**2. List all running 'java' processes:**

This section of the code uses the `ps` command to list all running processes on the system and then pipes the output to the `grep` command. The `grep 'java'` command filters the output to only show processes that have 'java' in their name.

**3. List all running 'http' processes:**

Similar to the previous section, this part of the code lists all running processes on the system and filters the output using `grep` to only display processes containing 'http' in their name.

**4. List all running 'mysql' processes:**

Again, this section lists all running processes and uses `grep` to filter and display only the processes that have 'mysql' in their name.

**5. Total number of running processes:**

In this part of the code, the `ps` command is used to list all running processes on the system, and the output is piped to the `w` command with the `-l` option. The `w -l` command counts the number of lines in the output, which corresponds to the total number of running processes.

Overall, this function provides a convenient way to check for running processes on a system and obtain information about CPU-consuming processes and specific program processes. It can be useful for monitoring system performance and troubleshooting issues related to specific programs.



#### Explanation of the Code - 2. Function to check CPU utilization

The 2nd function checks the CPU utilization of a system. It includes several commands to gather information about CPU usage, average CPU load, CPU information, CPU-consuming users, and the CPU core count.

Here are steps of the function:

**1. CPU utilization of critical processes:**

This section of the code uses the `ps` command to list all running processes on the system and display their CPU utilization (`%cpu`) along with the command name. The output is then piped to `egrep` with a regular expression pattern that matches processes with names containing 'java', 'http', or 'mysql'. Finally, the `awk '$1 > 10 {print $0}'` command filters the output to show only processes with CPU utilization greater than 10%.

**2. Average CPU load in the last minute:**

This part of the code uses the `uptime` command to retrieve system uptime and load average information. The output is then piped to `awk '{print $10}'` to extract the average CPU load in the last minute.

**3. CPU info:**

In this section, the `lscpu` command is used to display detailed information about the CPU. It provides information such as the number of CPU cores, CPU model, architecture, cache size, and other relevant details.

**4. Top 5 CPU-consuming users:**

This part of the code uses the `top` command with the `-b` option to run it in batch mode and the `-n 1` option to specify that only one iteration of the command should be executed. The output is then piped to `grep '^%Cpu'` to filter and display lines that start with '%Cpu'. Finally, the `tail -n 5` command is used to show the last 5 lines, which correspond to the top 5 CPU-consuming users.

**5. CPU core count:**

In this section, the `nproc` command is used to display the number of CPU cores on the system.

Overall, this function provides various metrics and information related to CPU utilization and performance. It can be useful for monitoring system health, identifying CPU-intensive processes, and gaining insights into the CPU architecture and core count.




#### Explanation of the Code - 3. Function to check memory utilization

The 3rd function checks the memory utilization of a system. It includes several commands to gather information about memory usage, freeing up cache, swap usage, top memory-consuming processes, and available memory.

Here are steps of the function:

**1. Freeing up cache:**

This section of the code uses the `sync` command to synchronize data on disk with memory. The `echo 3 > /proc/sys/vm/drop_caches` command writes the value 3 to the `/proc/sys/vm/drop_caches` file, which clears the file system caches and frees up memory. This can be useful for improving system performance by freeing up memory used by cache.

**2. Display free memory:**

In this part of the code, the `free` command with the `-h` option is used to display the amount of free, used, and total memory in a human-readable format. The output shows information about total, used, and free memory in kilobytes.

**3. Display swap usage:**

This section uses the `swapon` command with the `--show` option to display information about swap space usage. Swap space is a portion of the hard disk that is used as virtual memory when the system's physical memory is full. The `--show` option displays the size, type, and filename of the currently active swap devices.

**4. Top 5 memory-consuming processes:**

In this part of the code, the `ps` command with the `aux` option is used to list all running processes and display their memory usage (`%mem`). The output is then piped to `awk 'NR<=5 {print $0}'` to filter and display only the first 5 lines, which correspond to the top 5 memory-consuming processes.

**5. Available memory in megabytes:**

In this section, the `free` command with the `-m` option is used to display the amount of free, used, and total memory in megabytes. The `awk 'NR==2 {print $7}'` command is used to extract and display the available memory in megabytes from the second line of the `free` command's output.

Overall, this function provides various metrics and information related to memory utilization and performance. It can be useful for monitoring system memory usage, identifying memory-consuming processes, and gaining insights into available memory and swap space usage.



#### Explanation of the Code - 4. Function to check for zombie processes

The 4th function checks for zombie processes in a system. It includes several commands to identify and handle zombie processes.

Here are steps of the function:

**1. Killing zombie processes:**

This section of the code uses the `ps` command with the `aux` option to list all running processes. The output is then piped to `awk '$8=="Z" {print "kill -9 $2}'` to filter and print the process IDs (`$2`) of zombie processes (`$8=="Z"`). The resulting command is then executed using `sh`, which kills the identified zombie processes by sending them a SIGKILL signal (`-9`).

**2. List all zombie processes:**

In this part of the code, the `ps` command with the `aux` option is used again to list all running processes. The output is then piped to `awk '$8=="Z"'` to filter and display only the lines that correspond to zombie processes (`$8=="Z"`). This provides a list of all the zombie processes currently present in the system.

**3. Count of zombie processes:**

This section also uses the `ps` command with the `aux` option to list all running processes. The output is then piped to `awk '$8=="Z"'` to filter and keep only the lines corresponding to zombie processes (`$8=="Z"`). The `wc -l` command is then used to count the number of lines, which gives the count of zombie processes.

**4. Parent processes of zombies:**

In this part of the code, the `ps` command with the `aux` option is used once again to list all running processes. The output is then piped to `awk '$8=="Z" {print $3}'` to filter and print the parent process IDs (`$3`) of the zombie processes (`$8=="Z"`). This provides the parent process IDs of the zombie processes.

**5. User owning zombie processes:**

In this section, the `ps` command with the `aux` option is used to list all running processes. The output is then piped to `awk '$8=="Z" {print $1}'` to filter and print the usernames (`$1`) of the processes that are zombie processes (`$8=="Z"`). This provides the usernames of the owners of the zombie processes.

Overall, this function provides various metrics and information related to zombie processes. It can be useful for identifying and handling zombie processes in a system. Zombie processes are processes that have completed their execution but still have an entry in the process table. They do not consume system resources, but their presence can indicate a problem in the system, and it is important to identify and handle them appropriately.




#### Explanation of the Code - 5. Function to check load average

The 5th function that checks the load average of a system. It includes several commands to retrieve and display the load average and related information.

Here are steps of the function:

**1. Current load average:**

This section of the code uses the `uptime` command to display the current load average of the system. The `uptime` command provides information about the system's uptime and load average. By default, it displays the load average for the past 1, 5, and 15 minutes.

**2. Load average of the last 5 minutes:**

In this part of the code, the `uptime` command is used again, and the output is piped to `awk '{print $11}'` to extract and print the load average value for the last 5 minutes. The load average value is the 11th field in the output of the `uptime` command.

**3. Load average of the last 15 minutes:**

Similar to the previous section, the `uptime` command is piped to `awk '{print $12}'` to extract and print the load average value for the last 15 minutes. The load average value is the 12th field in the output of the `uptime` command.

**4. Number of currently running processes:**

In this section, the `uptime` command is used again, and the output is piped to `awk '{print $6}'` to extract and print the number of currently running processes. The number of running processes is the 6th field in the output of the `uptime` command.

**5. Number of users currently logged in:**

In this part of the code, the `uptime` command is once again piped to `awk '{print $4}'` to extract and print the number of users currently logged in to the system. The number of logged-in users is the 4th field in the output of the `uptime` command.

Overall, this function provides various metrics related to the system's load average, including the current load average, load average values for the last 5 and 15 minutes, the number of currently running processes, and the number of users currently logged in. These metrics can be useful for monitoring the system's performance and identifying potential resource bottlenecks.




#### Explanation of the Code - 6. Function to check Disk/SAN/NAS utilization

The last function that checks the utilization of Disk/SAN/NAS (Storage Area Network/Network Attached Storage) in a system. It includes several commands to retrieve and display disk-related information.

Here are steps of the function:

**1. Disk I/O statistics:**

This section of the code uses the `iostat` command to display disk I/O statistics. The `iostat` command provides information about the input/output (I/O) operations and utilization of disks. It shows details such as the number of reads/writes, the number of sectors read/written, and the average time for I/O operations.

**2. Disk usage:**

In this part of the code, the `df -h` command is used to display the disk usage. The `df` command is used to report file system disk space usage. The `-h` option displays the disk usage in human-readable format (e.g., in megabytes or gigabytes) to make it easier to understand.

**3. Inode usage:**

This section uses the `df -i` command to display the inode usage. Inodes are data structures in a file system that store metadata about files, such as permissions and ownership. The `df -i` command displays information about the inodes usage, including the number of used and available inodes.

**4. List mounted filesystems:**

In this part of the code, the `mount | column -t` command is used to list the mounted filesystems. The `mount` command displays the currently mounted filesystems, and the `column -t` command formats the output in a tabular format for better readability.

**5. Display disk partitions and sizes:**

In this section, the `fdisk -l` command is used to display the disk partitions and their sizes. The `fdisk` command is a disk partitioning utility that allows users to create, delete, and manage disk partitions on a system. The `-l` option lists the partitions and their sizes.

Overall, this function provides various metrics and information related to the utilization of Disk/SAN/NAS resources, including disk I/O statistics, disk usage, inode usage, mounted filesystems, and disk partitions with their sizes. These metrics can be useful for monitoring the storage resources and identifying any potential issues or bottlenecks related to disk utilization.