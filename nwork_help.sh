#! /bin/bash
echo 
echo -e "\e[32m "--------------------" \e[0m"
echo -e "\e[32m "NETWORKING ASSISTANT" \e[0m"
echo -e "\e[32m "--------------------" \e[0m"
echo "https://github.com/the-universal-linux-society"
echo 
sleep 2
#----function to calculate subnet mask----#
calculate_subnet_mask(){
	first_octet=$(echo $1 | cut -d'.' -f1)

	if [ $first_octet -lt 128 ]; then
		echo "Class A: 255.0.0.0"
	elif [ $first_octet -lt 192 ]; then
		echo "Class B: 255.255.0.0"
	elif [ $first_octet -lt 224 ]; then
		echo "Class C: 255.255.255.0"
	else
		echo "Unknown class"
	fi
}
#----function to calculate subnet mask----#
find_mac_address(){
	random_mac=$(printf '02:502X:%02X:%02X:%02X:%02X\n' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)))
	echo -e "\e[32m "MAC address for new IP: $random_mac" \e[0m"
	echo 
}
#----main----#
if [ $# -ne 1 ]; then
	echo "Usage: $0 <IP address>"
	exit 1
fi

ip_address=$1
subnet_mask=$(calculate_subnet_mask $ip_address)
echo -e "\e[32m"Subnet mask for $ip_address is: $subnet_mask" \e[0m"
echo 
read -p "Do you want to find MAC address for the new IP? (y/n): " choice
echo 
if [ $choice == "y" ]; then
	find_mac_address
fi



