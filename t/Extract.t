use Test::More tests => 1;
BEGIN { use_ok('Net::IP::Extract') };

my @text = "
<h3>Install second Ethernet card in the OpenBSD box</h3>

Use any supported ethernet card for the second NIC in the OpenBSD
machine. One card will be given a public IP address (assigned by
your ISP or obtained dynamically, e.g., with DHCP) and the other
will be given an IP address in a non-routable network. Your choices
for private network addresses must come from one of these ranges
(see RFC 1918):

<pre>
10.0.0.1 - 10.255.255.254      netmask 255.0.0.0
172.16.0.1 - 172.31.255.254    netmask 255.240.0.0
192.168.0.1 - 192.168.255.254  netmask 255.255.0.0
</pre>

Assume the first card is ep, create /etc/hostname.ep0 with the
following x.x.x.x netmask x.x.x.x where x.x.x.x is what you choose
above.

<pre>
# First NIC - private
192.168.1.1 netmask 255.255.255.0 media 10baseT
</pre>

And if you have a static IP address for the second NIC, you
naturally need to have it configured as /etc/hostname.ep1 as well.

<pre>
# Second NIC with public IP address
123.221.8.1 netmask 255.190.280.0 media 10baseT
</pre>

Be sure to indicate a correct IP address and netmask for both
interfaces. Once you have chosen a private network address range
for your inside machines, stay with that same range.


<p>Whatever address you choose for the first interface in the
OpenBSD gateway becomes the default gateway IP address for all
machines on the inside private network.</p>
"; 

my @ip = Net::IP::Extract::extract(@text);

foreach (@ip){
        print "$_\n";
}

exit(0);
