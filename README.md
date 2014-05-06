# Hackathonist 2014

## Create owners and layers

Use CMS to create users for each Hackathonist team:

http://cmscitysdk.ibb.gov.tr/owners

Use CMS to create layers - teams can also do this themselves:

http://cmscitysdk.ibb.gov.tr/

Sometimes, the multiple API instances spawned by nginx do not sync correctly with the latest layer list. If all else fails, execute one of the following commands on the server, using SSH:

    sudo service nginx restart

Or:

    echo 'flush_all' | nc localhost 11211