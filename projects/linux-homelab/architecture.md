# Homelab Architecture

```text
                    LAN / Internet
                           |
                           |
                Lenovo ThinkCentre M920q
                Linux Mint 22.3
                           |
              +------------+------------+
              |            |            |
              v            v            v
           Docker       Bitcoin      systemd
          Platform        Knots       Services
              |
      +-------+-------+
      |       |       |
      v       v       v
   SearXNG  Open    Flame
            WebUI
      |
      v
   cAdvisor
      |
      v
   Container
   Monitoring

              eno1
                |
                v
           Docker macvlan
                |
                v
          Pi-hole
       192.168.1.250
