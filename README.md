Netgate RCC-DFF-2220
====================
The RCC-DFF 2220 is a small, open Intel Rangely platform.

This repository has lots of configuration bits/notes as to how you can
configure it as a very low-power, high-performance, open router.

I personally use SaltStack and libvirt to isolate core services (DNS, DHCP,
NTP) and nice-to-haves (a git daemon) into multiple security domains. I've
included as much configuration as possible without leaking too much info
about my particular setup.

Additional Hardware
===================
I bought an Intel 7260 802.11ac Dual-Band WiFI mini-PCIe card. It has some
limitations (2.4GHz band only in AP mode, etc.) that might bother some people,
but it works fine for me. I needed a half-to-full size mini-PCIe bracket to
properly mount the card.

Unfortunately, the firmware packaged with Debian (firmware-iwlwifi) is buggy.
Version 17.352738.0 of the wireless firmware has a bug that will cause the
radio to drop periodically without notice. Use version 17.459231.0.

I also added a 128GB Samsung CM871a M.2 SSD for additional storage. It is not
a perfect fix and required me to saw off a fraction of the PCB, but it works
fine...

Netgate Customer Support
========================
I contacted Netgate customer support on one instance and got a prompt, very
technical and expert response from one of their backline engineers. I cannot
recommend them enough.

I did not receive an evaluation unit and this is my own, personal opinion.


