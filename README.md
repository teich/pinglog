# Ping Logger

This is a trivial script that grabs some network information and send it up to a web logger.

I'm hoping that by collecting minute by minute ping times some patterns will emerge on network performance

## INSTALLATION

    $ sudo ln -s pingit.sh /usr/local/bin/pingit.sh
    $ sudo chmod 755 /usr/local/bin/pingit.sh
    $ ln -s com.oren.pinglog.plist ~/Library/LaunchAgents
    $ launchctl load ~/Library/LaunchAgents/com.oren.pinglog.plist
