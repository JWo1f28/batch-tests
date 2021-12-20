These probably dont work. If anything isnt my own, thats due to me looking for working code while learning. Sorry :/

menu.bat is the main file, but others should still work on their own

File Breakdown:
- menu.bat - Displays a UI to call each function
- netscan.bat - Scans all IPv4 Addresses within a domain (Default 192.168)
- portscan.bat - Uses the cache from netscan.bat to test via ftp if any ports are open on active devices
- scansub.bat - Slave file for portscan.bat, starts minimised by default
- pwget.bat - Fetches password for networks on the user's WLAN profile where possible
- cleanup.bat - Deletes all .txt files (used for cache) from working directory
- log.txt - Created by menu.bat, only file exempt from cleanup.bat (kinda)

Dont Worry about the commit History, was trying to understand how all this works
:>