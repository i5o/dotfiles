#!/bin/sh

git-ls-files | while read file; do
   if [ ! -f $HOME/$file ]; then
#      echo "------- $HOME/$file -- does not exist"
   ls -lrt >/dev/null;
   else
   #   cmp $HOME/$file $file
   ls -lrt >/dev/null;
   fi
done


function mydiff()
{
   if [ -x /usr/bin/colordiff ]; then
      COLORDIFF="colordiff"
   else
      COLORDIFF="while read line; do echo $line; done"
   fi 
      
   echo "/usr/bin/diff --suppress-common-lines --side-by-side $@ $COLORDIFF"
   /usr/bin/diff --suppress-common-lines --side-by-side $@ | $COLORDIFF
}

#function prettydiff ()
#{
#   /usr/bin/diff --suppress-common-lines --side-by-side $@ | colordiff
#}
#
#test -x /usr/bin/diff      && mydiff=normaldiff
#test -x /usr/bin/colordiff && mydiff=prettydiff
#
#
#
git-ls-files | while read file; do
   if [ -f $HOME/$file ]; then
      cmp $HOME/$file $file >/dev/null
      if [ $? -ne 0 ]; then
         ls -l "$HOME/$file" "$file"
         #echo "colordiff --suppress-common-lines --side-by-side $HOME/$file $file"
         #/usr/bin/colordiff --suppress-common-lines --side-by-side $HOME/$file $file

         
         mydiff "$HOME/$file" "$file"
         #/usr/bin/diff --suppress-common-lines --side-by-side "$HOME/$file" "$file"  | colordiff
         echo "---------------------------------------------------------------------------------"

      fi
   fi
done


#diff --suppress-common-lines --side-by-side



#SAFE=~/.dotfile.`date +%F` 
#
#mkdir $SAFE || exit 1
#
#cp -a ~/.vim ~/.bash ~/.vimrc ~/.bashrc $SAFE
#
#mv ~/.vim $SAFE
#mv ~/.bash $SAFE
#mv ~/.vimrc $SAFE
#mv ~/.bashrc $SAFE
#
#HOME=~
#echo $HOME
#
#
#find ./ -mindepth 1 -type d -not -path "*.git*" > dirs.txt
#find ./ -mindepth 1 -type f -not -path "*.git*" > files.txt
#
#
#cat dirs.txt | while read line; do
#   mkdir "$DEST/$line"
#done
#
#cat files.txt | while read line; do
#   cp -a "$line" "$DEST/$line"
#done