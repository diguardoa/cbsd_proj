sudo trace-cmd record -e 'sched_wakeup*' -e sched_switch -e 'sched_migrate*' 
