function Flip()
{
	#if flip =0 then it is Heads else Tails
	flip=$((RANDOM%2))
	if [ $flip -eq 0 ]
	then
		echo "Heads"
	else
		echo "Tails"
}
