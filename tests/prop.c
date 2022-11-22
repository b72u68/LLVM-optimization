int main() {
	int x = 5;
	int y = x;
	int z = y;
	int a = y + z;
	int b = a + a;
	if (b != a) {
		return 0;
	} else { 
		return 1;
	}
}
