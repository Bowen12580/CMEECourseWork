echo "This script was called with $# parameters"
echo "The script's name is $0"
echo "The first argument is $1"
echo "The second argument is $2"
MY_VAR='some string'
echo 'the current value of the variable is :' $MY_VAR
echo
echo 'Please enter a new string'
read MY_VAR
echo
echo 'the current value of the variable is :' $MY_VAR
echo

echo 'Enter two numbers separated by space(s)'
read a b
echo
echo 'you entered' $a 'and' $b '; Their sum is:'
MY_SUM=$(expr $a + $b)
echo $MY_SUM
