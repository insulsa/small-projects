BEGIN 	{
	n=512*61
	for (i=0;i<n;i+=512)
	{
		printf("write --offset=%d (0xff) ",i)
		for (j=1;j<=512;j+=4)
		{
			printf("\\0\\0\\0\\0")
		}
		printf("\n")
	}
}
