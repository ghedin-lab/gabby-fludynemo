http://www.gettinggeneticsdone.com/2012/04/awk-command-to-count-total-unique-and.html

#counts reads
#calculates overrepresented sequences


for read in `ls *.fastq`; do echo -n "$read "; awk '((NR-2)%4==0){read=$1;total++;count[read]++}END{for(read in count){if(!max||count[read]>max) {max=count[read];maxRead=read};if(count[read]==1){unique++}};print total,unique,unique*100/total,maxRead,count[maxRead],count[maxRead]*100/total}' $read; done > SUMMARY-STATS
