These probably dont work. If anything isnt my own, thats due to me looking for working code while learning. Sorry :/

menu.bat is the main file, but others should still work on their own

File Breakdown:
- menu.bat - Displays a UI to call each function
- netscan.bat - Network Scan Menu
    - slnetscan.bat - Slow Netscan, Pings each port one at a time
    - fanetscan.bat - Fast Netscan, Pings 256 Ports at a time, More Resource Intensive
    - netsub.bat - Slave Batch for fanetscan.bat, pings 256 ports one a time each
- portscan.bat - Uses the cache from netscan.bat to test via ftp if any ports are open on active devices
- portsub.bat - Slave file for portscan.bat, starts minimised by default
- pwget.bat - Fetches password for networks on the user's WLAN profile where possible
- update.bat - Clones the current repository and replaces local files
- replace.bat - Generated by update.bat, used so that update.bat may be updated itself
- cleanup.bat - Deletes all .txt files (used for cache) from working directory

Dont Worry about the commit History, was trying to understand how all this works :>

Other:

- test.bat - Testing, most likely serves no purpose