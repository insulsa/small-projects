#!/usr/bin/awk -f
BEGIN	{
    console="/dev/stderr";cl="\r\x1B[K"
    i=0;flag=1;a=0;gapmax=0
}
{
	if ( i % 204800 == 0 )
	{
	    printf("seeking@ %d00 Mib ...\r", a/204800) > console
	}
	b = $1
	t = b - a - 1
        if ( t > gapmax )
        {
	    printf(cl) > console
	    printf("offset:%dMiB,start:%d,end:%d,size:%dMiB.\n" , a/2048 , a+1 , b-1 , t/2048)
	    gapmax = t
	}
	a=b;i++
}
END	{
    printf(cl "done .\n") > console
}
