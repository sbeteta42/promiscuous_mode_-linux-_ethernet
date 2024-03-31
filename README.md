# promiscuous_mode_-linux-_ethernet
Un script bash pour activer/désactiver le mode promiscuité sous GNU/LINUX

# Description
- Contrairement à VirtualBox, Vmware Worksation ne gère pas nativement le mode "promiscuous"
- Le mode promiscuous est un type de mode opérationnel de réseau informatique dans lequel tous les paquets de données du réseau peuvent être consultés et visualisés par tous les adaptateurs réseau fonctionnant dans ce mode.
- Il s’agit d’une technique de sécurité, de surveillance et d’administration de réseau qui permet à toute carte réseau configurée sur un système hôte d’accéder à l’ensemble des paquets de données du réseau.
-Généralement, le mode promiscuous est utilisé et mis en œuvre par un programme snoop (packet sniffer) qui capture tout le trafic réseau visible sur toutes les cartes réseau configurées d’un système.
- En raison de sa capacité à accéder à tout le trafic réseau sur un segment, le mode promiscuous est également considéré comme dangereux.
- Comme un système avec plusieurs machines virtuelles, chaque hôte a la possibilité de voir les paquets réseau destinés aux autres VM sur ce système.

- Ce script bash peret simplement de connaitre l'état de votre interface (status) d'activer le mode promiscuous (start) ou de le désactiver (stop)
  

