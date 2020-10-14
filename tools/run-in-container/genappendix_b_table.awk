#!/bin/gawk -f
BEGIN {
   # Set output field separator
   OFS=" | ";
   # Initialize mapping associative array
   while ((getline < "docs/_appendixdata/appendix_b.map") > 0) {
      if ($1 ~ /^[[:digit:]]+$/ && $2 ~ /^[[:digit:]]+$/) {
         old_id_array[$2]=$1;
      }
   }
}
{
   # Input is a stream of the first 4 lines of every .md file in section 4-language-usage
   if ($1 == "#" && $2 ~ /^G-[[:digit:]]+/ ) {
      # From the first of the 4 lines we grab the G- new id
      new_id=substr($2,3,length($2)-3);
      # Get old id from mapping array
      old_id=old_id_array[new_id];
      # Default to n/a
      if (old_id == "") {old_id="n/a"}
      # The text of the rule is most of the first line
      text=$0;
      # We just remove the # G-<id>: from the beginning of the text
      dummy=sub(/^# G-[[:digit:]]+: /,"",text);
      
      # Get the second of the 4 lines and ignore it, it's empty
      getline;
      
      # Get the third of the 4 lines
      getline;
      # Retrieve the severity field from the third line
      severity=substr($3,2,length($3)-2);
      
      # Get the fourth and last of the 4 lines
      getline;
      # If the char array was filled from the last iteration, we need to empty it here
      char[1]="";
      char[2]="";
      char[3]="";
      char[4]="";
      char[5]="";
      char[6]="";
      char[7]="";
      char[8]="";
      
      # The fourth line is a comma-separated list of characteristics - split them into an array
      no_of_characteristics=split($0,characteristics,",");
      for (i in characteristics) {
         # If the characteristics array value is one of 8 values, we put a mark in the corresponding value of char array
         if (characteristics[i] ~ /Changeability/   ) {char[1]="&#10008;"}
         if (characteristics[i] ~ /Efficiency/      ) {char[2]="&#10008;"}
         if (characteristics[i] ~ /Maintainability/ ) {char[3]="&#10008;"}
         if (characteristics[i] ~ /Portability/     ) {char[4]="&#10008;"}
         if (characteristics[i] ~ /Reliability/     ) {char[5]="&#10008;"}
         if (characteristics[i] ~ /Reusability/     ) {char[6]="&#10008;"}
         if (characteristics[i] ~ /Security/        ) {char[7]="&#10008;"}
         if (characteristics[i] ~ /Testability/     ) {char[8]="&#10008;"}
         
         # If the characteristics value is something other than these 8 values, we output an error in the text so it'll be noticed
         if (!(characteristics[i] ~ /Changeability/   || \
               characteristics[i] ~ /Efficiency/      || \
               characteristics[i] ~ /Maintainability/ || \
               characteristics[i] ~ /Portability/     || \
               characteristics[i] ~ /Reliability/     || \
               characteristics[i] ~ /Reusability/     || \
               characteristics[i] ~ /Security/        || \
               characteristics[i] ~ /Testability/     )) {text="!!!CHARACTERISTIC ERROR!!!"}
      }
      
      # Output the fields of the markdown table in appendix B
      print old_id, new_id, text, severity, char[1], char[2], char[3], char[4], char[5], char[6], char[7], char[8];
      
      # Special handling - between rule G-5040 and G-5050 we output the old rule 54 that is not mapped to any new rule
      if (new_id == "5040") {
         print "54 | n/a | Avoid use of EXCEPTION_INIT pragma for a  20nnn error. | Major |  |  |  |  | &#10008; |  |  | ";
      }
      
      # Done handling the 4 lines of one .md file. Next 4 lines will be from another .md file and be handled in the next iteration.
   }
}

