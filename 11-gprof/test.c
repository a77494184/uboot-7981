#include <stdio.h>

void callme(void)
{


}

int main(void)
{	
	int c = 65535;

	while (c)
	{
		callme();
		c--;
	}

	printf("end\n");
}
