#!/bin/bash
# par sbeteta@beteta.org
# Under licence GPLv3 http://www.gnu.org/licenses/gpl.txt

red='\e[0;31m'
NC='\e[0m'

if [ `whoami` != root ]
then
echo -e "$red Erreur:$NC Vous devez être root pour exécuter ce script !"
exit 1
fi

case "$1" in
  start)
        if [ "$#" != 2 ]
        then
        echo -e "$red Erreur:$NC Vous devez sélectionner une interface"
        elif /sbin/ifconfig $2 | grep "PROMISC" > /dev/null 2>&1
        then
        echo "Le mode Promiscuous est déjà en cours d'exécution"
        else
        /sbin/ifconfig $2 promisc 2> /var/log/promisc_Erreur.log
          if [ $? == 0 ]
          then
          echo "Le mode Promiscuous est désormais activé"
          else
          echo -e "$red fail:$NC Voir erreur dans /var/log/promisc_Erreur.log"
          fi
        fi
        ;;
  stop)
        if [ "$#" != 2 ]
        then
        echo -e "$red Erreur:$NC Vous devez sélectionner une interface"
        elif /sbin/ifconfig $2 | grep "PROMISC" > /dev/null 2>&1
        then
        /sbin/ifconfig $2 -promisc 2> /var/log/promisc_Erreur.log
          if [ $? == 0 ]
          then
          echo "Le mode Promiscuous est désormais désactivé"
          else
          echo -e "$red fail:$NC Voir Erreur dans /var/log/promisc_Erreur.log"
          fi
        else
        echo "Le mode Promiscuous ne fonctionne pas"
        fi
        ;;

  restart)
        if [ "$#" != 2 ]
        then
        echo -e "$red Erreur:$NC Vous devez sélectionner une interface"
        elif /sbin/ifconfig $2 | grep "PROMISC" > /dev/null 2>&1
        then
        /sbin/ifconfig $2 -promisc && echo "Le mode Promiscuous est désormais désactivé" && /sbin/ifconfig $2 promisc && echo "Le mode Promiscuous est désormais activé" 2> /var/log/promisc_Erreur.log
          if [ $? == 0 ]
          then
          echo Restart OK
          else
          echo -e "$red fail:$NC Voir Erreur dans /var/log/promisc_Erreur.log"
          fi
        else
        echo "Le mode Promiscuous ne fonctionne pas"
        echo "Taper $0 start <interface> pour activer le mode Promiscuous"
        fi
        ;;
  status)
        if [ "$#" != 2 ]
        then
        echo -e "$red Erreur:$NC Vous devez sélectionner une interface"
        elif /sbin/ifconfig $2 | grep "PROMISC" > /dev/null 2>&1
        then
        echo "Le mode Promiscuous est activé"
        else
        echo "Le mode Promiscuous n'est pas activé"
        exit 1
        fi
        ;;
  *|-h|--help)
        echo -e "Usage: $0 {start|stop|restart|status} <interface>
       Utilisez -h ou --help pour afficher cette aide"
        exit 1
        ;;
esac

exit 0
