for file in $*; do
   sed --in-place '1i -- Jeff McGovern\n-- jmcgover@calpoly.edu\n' $file
done
