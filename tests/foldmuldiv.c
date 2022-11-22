/*
Need to manually ensure easy and ok1 are optimized, but uhoh1 and 2 are
tested for safety.
*/

int
easy(int x)
{
	int a = x * 10 * 5;
	int b = x / 10 / 5;
	int c = 10 / x * 5;
	return a + b + c;
}

int
ok1(int x)
{
	return 10 * x / 2;
}

int
uhoh1(int x)
{
	return 10 * x / 3;
}

int
uhoh2(int x)
{
	return x * 3 / 10;
}

int
main()
{
	if (uhoh1(3) != 10)
		return 1;
	if (uhoh2(4) != 1)
		return 1;
	return 0;
}
