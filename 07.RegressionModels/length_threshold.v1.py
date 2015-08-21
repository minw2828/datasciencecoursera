# /usr/bin/env python

## Description:
## The script takes a file as input and outputs a file. The input file contains 
## unformatted text. The output file contains formatted text as follow:
## 1. Each line starts with "## ".
## 2. Each line is no more than 80 characters, including the header "## ".
## 3. The rest of the file contains information such as "Author", "Date Created"
##    "Date modified and reason" and "Execution".
##
## Note:
## 1. header "## " takes 3 spaces, so make sure ideal_threshold-3
## 2. default year is 2015. No need to input in date
## 3. date shall be quoted such as "21 August" when typed into command line
## 
## Author:
## Min Wang (min.wang@ecodev.vic.gov.au)
##
## Date Created:
## 21 August 2015
## 
## Date modified and reason: 
##
## Execution: 
## python <module_name> <inputfile> <language> <date> <threshold> <logfile> <outputfile>


import sys
import time
import resource
import os


inputfile  = sys.argv[1]
language   = sys.argv[2]
date       = sys.argv[3]
threshold  = sys.argv[4]
logfile    = sys.argv[5]
outputfile = sys.argv[6]


def read_file(filename):
    f = open(filename)
    fc = [line.strip() for line in f.readlines()]
    return fc

def boolean_whitespace(char):
    if char == ' ':
        return True
    else:
        return False

def trim_line_threshold(line, n):
    result = []
    i = 0
    while i <= len(line):
       if boolean_whitespace(line[i]) is True:
           i += 1
       if i+n > len(line):
           result.append(line[i:len(line)])
           break
       if boolean_whitespace(line[i+n-1]) is True:
           result.append(line[i:i+n])
           i = i+n
       else:
           for j in range(i+n, i, -1):
               if boolean_whitespace(line[j]) is True:
                   result.append(line[i:j])
                   i = j
                   break
    return result

def organize_trimmed_fc(fc, m):
    result = []
    for line in fc:
        if len(line) == 0:
            result.append(line+'\n')
        elif len(line.split(' ')) == 1:
            result.append('\n## '+line+'\n')
        else:
            trimmed_lines = trim_line_threshold(line, m)
            for trimmed_line in trimmed_lines:
                result.append("## "+trimmed_line+'\n')
    result.append('\n\n')
    return result

def organize_content2write(language, date):
    result = []
    if language.upper() == "R":
        result.append('# /usr/bin/rscript\n\n')
    if language.lower() == "python":
        result.append('# /usr/bin/env python"\n\n')
    result.append('## Description:\n')
    result.append('## The script performs the follwing tasks:\n')
    result.append('##\n')
    result.append('## Input: \n## \n')
    result.append('## Output: \n## \n')
    result.append('## Note: \n## \n')
    result.append('## Author: \n## Min Wang (min.wang@ecodev.vic.gov.au)\n## \n')
    result.append('## Date Created: \n## '+date+' 2015 \n## \n')
    result.append('## Date modified and reason:\n## \n')
    result.append('## Execution:\n')
    if language.upper() == "R":
        result.append('## Rscript <module_name> <inputfile> <logfile> <outputfile>\n\n\n')
    if language.lower() == "python":
        result.append('## python <module_name> <inputfile> <logfile> <outputfile>\n\n\n')
    return result   

def write_file(filename, language, date, fc, m):
    fw = open(filename,'w')
    content1 = ''.join(organize_content2write(language, date))
    content2 = ''.join(organize_trimmed_fc(fc, m))
    fw.write(content1)
    fw.write(content2)
    fw.close()
    return None


def result():
    fc = read_file(inputfile)
    write_file(outputfile, language, date, fc, int(threshold))
    log_automation()
    return None


def log_automation():
    fw = open(logfile,'a')
    fw.write('------ %s ------'%time.strftime('%H:%M:%S %A %d/%m/%Y')+'\n')
    fw.write('python '+' '.join(sys.argv)+'\n')
    fw.write('[Memory Peak Usage: '+str(resource.getrusage(resource.RUSAGE_SELF).ru_maxrss)+' kilobytes]\n')
    fw.write('[Time Usage in user mode: '+str(resource.getrusage(resource.RUSAGE_SELF).ru_utime)+' microseconds]\n\n')
    fw.close()


if __name__ == '__main__':

    module, inputfile, language, date, threshold, logfile, outputfile = sys.argv
    print threshold
    result()


