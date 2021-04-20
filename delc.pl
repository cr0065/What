#!/usr/bin/perl -w  

if (@ARGV)
{
	@file_list = @ARGV;
}
else
{
	print "ERROR: noargs\n";
	exit 1;
}
foreach $file (@file_list)
{
	 if (-f $file) { 
		print "delete? [y,q] file : $file\n"; 
		$input = <STDIN>;
		chomp $input;  
		if($input eq "y" || $input eq "Y") { 
			push(@new,$file);
			next; 
		}
		if($input eq "q" || $input eq "Q")  
		{
			last; 
		} 
	}

	if (-d $file) { 
		print  "delete? [y,q] dir : $file\n";
		$input = <STDIN>;
		chomp $input;
		if($input eq "y" || $input eq "Y") {
                        push(@new,$file);
                }
                if($input eq "q" || $input eq "Q") 
                {
                        last;
                }
	} 
}
print "complete all deletions? [y]: ";
$input = <STDIN>; 
chomp $input; 
if($input eq "Y" || $input eq "y"){  
	foreach $newt (@new){  	
  
		if(scalar @new eq 0){
                        print "Nothing has been deleted\n";
                }

		if(-f $newt){ 
		unlink @new;
		}
	
		if(-d $newt){ 
			`rm -rf $newt`; 
		} 
	}
	} 
	else{
		print "INVALID CHOICE EXITING PROGRAM...\n"; 
		exit 0;
	}


