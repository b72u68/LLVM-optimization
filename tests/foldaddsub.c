int
demo(int x)
{
	/* Common subexpression: x + 5 */
	int a = (x - 4 + 9) * 15;
	int b = (x + 15 - 10) * 10;
	int c = (x + 3 + 2) * 5;
	/* Common subexpression: 5 - x */
	int d = (10 - x - 5) / 3;
	int e = (3 - x + 1 + 1) / 2;
	return a + b + c + d + e;
}

int
main()
{
	return demo(1);
}
