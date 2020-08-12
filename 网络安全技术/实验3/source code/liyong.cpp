#include <stdio.h>
#include <stdlib.h>

void why_here(void)
{
	printf("why u here !n\n");
	printf("you are traped here\n");
	system("pause");
	_exit(0);
}

int main(int argc, char * argv[])
{
	int buff[1];
	buff[2] = (int)why_here;
	system("pause");
	return 0;
}
