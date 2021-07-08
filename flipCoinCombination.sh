#funtion for flip
function Flip()
{
	#if flip =0 then it is Heads else Tails
	flip=$((RANDOM%2))
}

headCount=0
tailCount=0

#Dictionary for Singlet flip
declare -A singletFlip

read -p "Enter the Number of Coin Flip: " numberOfCoinFlip

#Store herd count and Tail count singletFlip Dictionary
for(( count=0; count<$numberOfCoinFlip; count++ ))
do
	Flip

#if flip is 0 then it is heads else it is tails
if [ $flip -eq 0 ]
then
	headCount=$((headCount+1))
	singletFlip[HEAD]=$headCount
else
	tailCount=$((tailCount+1))
	singletFlip[TAIL]=$tailCount
fi
done

singletHeadPercentage=$((($headCount*100)/$numberOfCoinFlip))
singletTailPercentage=$((($tailCount*100)/$numberOfCoinFlip))

#Showing Percentage and Count
echo "Singlet Head percentage: " $singletHeadPercentage
echo "Head Count: "$headCount
echo "Singlet Tail percentage: " $singletTailPercentage
echo "Tail Count: "$tailCount

#For Doublet creating Dictionary
declare -A doubletFlip

#fuction for adding to dictionary
function doublet()
{
	for(( count=0; count<$numberOfCoinFlip; count++ ))
	do
		for(( countCoin=0; countCoin<2; countCoin++ ))
		do
        		Flip
        		if [ $flip -eq 0 ]
        		then
        			HOrt+=H
        		else
        			HOrT+=T
        		fi
		done
		doubletFlip[$HOrT]=$((doubletFlip[$HOrT]+1))
		HOrT=""
	done

#function for calculating Doublet percentage
function doubletPercentage()
{
	for i in "${!doubletFlip[@]}"
   	do
   		doubletFlip[$i]=$(((${doubletFlip[$i]}*100)/$numberOfCoinFlip))
   	done

}

doublet
for i in "${!doubletFlip[@]}"
do
	echo "Counts:-"
	echo "$i: " ${doubletFlip[$i]}
done

doubletPercentage
for i in "${!doubletFlip[@]}"
do
	echo "Percentage:-"
        echo "$i: " ${doubletFlip[$i]}
done
