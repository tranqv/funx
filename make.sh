#!/bin/bash 

#
#  Exported lib for shared  
#
   rpath="${HOME}/apps/mylib/gfortran/my_funx"
   mpath="${rpath}/mod"
   opath="${rpath}/obj"
   funxa="${rpath}/libmy_funx.a"

#
#  Compiler and flags:
#
#  With 
#     fopti="-O3"
#     fdeps="-fstack-arrays -finit-local-zero"
#  Fortran code with array of character S as S(...) runs 
#  faster than S as character(len=...)
#
#
#**If we want to remove the underscore character (for binding) 
#  such that, e.g., 
#     c_realpath_    --> c_realpath
#     c_access_      --> c_access
#  we set the proper flag for compilers. For instance,
#  +  gcc:
#     -fno-underscoring 
#  +  icc:
#     -assume nounderscore
####
#
#
#

fopti="-O3"

ccomp="gcc"
cflag="$fopti -Wall -I ./"

fcomp="gfortran"
fdeps="-fstack-arrays -finit-local-zero"
#fdeps="-finit-local-zero"
fflag="$fopti -Wall $fdeps -I ./ -I ./inc "




#
#  Path of some "Shell" command line (for testing):

bin=${HOME}/apps/shared/bin
#bin=./bin

#
#  Path of the lib (for testing):

#lib=${HOME}/apps/shared/lib
lib=./lib

inc=./inc

mkdir -p $lib $inc 

#
#  path of saved versions in advance 

ver=./ver


#######################################################################
#
#  subroutines:
#
#######################################################################
#
#
#

_print_usage ()
{
cat << XXX
      COMMAND  ARGUMENT       ROUTINE 
      $0       clean          _make_clean 
      $0       distclean      _make_distclean 
      $0       test           _make_test  
      $0       runtest        _make_runtest  
      $0       pack           _make_pack 
      $0       dual           _make_dual 
      $0       f              _make_f 
      $0       c              _make_c 
      $0       mod            _make_mod 
      $0       install        _make_install 
      $0       all            _make_mod  && _make_c && _make_f && _make_lib && 
                                     _make_install && _make_util && _make_test 

XXX
}




_ischanged()
{
   res=0

   if [ $# -ge 1 ]
   then 

      file=$1
      fingerprintfile=/tmp/${1}.md5savefile

      if [ ! -f $file ]
      then
#        echo "ERROR: $file does not exist - aborting"

         res=0

      else 

         filemd5=`md5sum $file | cut -d " " -f1`
#
#        check the md5 and
#        show an error when we check an empty file
#
         if [ -z $filemd5 ]
         then
#           echo "The file $file is empty - aborting"
            res=0
            echo $res 
            return 
         fi

         if [ -f $fingerprintfile ]
         then
            # yup - get the saved md5
            savedmd5=`cat $fingerprintfile`

            # check again if its empty
            if [ -z $savedmd5 ]
            then
#              echo "The file is empty - aborting"
               res=0
               echo $res 
               return 
            fi

#           compare the saved md5 with the one we have now
            if [ "$savedmd5" = "$filemd5" ]
            then
               res=0
            else
#              echo "File $file has been changed"
               res=1 
            fi

         else #if [ ! -f $fingerprintfile ];  then

            res=1

         fi
         echo $filemd5 > $fingerprintfile
      fi 
   fi 
#
   echo $res 
   return 
}



#
#
#
_make_test ()
{
   echo "########################################################################"
   echo "Making tests ..."

   for f in t_*.f90 
   do
      if [[ $( _ischanged $f ) -eq 1 ]]
      then 
         g=`basename $f .f90`
         echo "${fcomp}  ${fflag}  ${f}  ${lib}/funxlib.a  -o ${g}.exe" 
         time  ${fcomp}  ${fflag}  ${f}  ${lib}/funxlib.a  -o ${g}.exe
      else 
         echo "${f} is not changed. Skipped."         
      fi 
   done
#
#  tests for PCREPOSIX 
#
#  for f in t_*pcreposix*.f90 
#  do 
#     g=`basename $f .f90`
#     echo "${fcomp}  ${fflag}  ${f}  ${lib}/funxlib.a -lpcreposix -o ${g}.exe" 
#     time  ${fcomp}  ${fflag}  ${f}  ${lib}/funxlib.a -lpcreposix -o ${g}.exe
#  done
#  
   unset f g  
#
#   
   mkdir -p $bin 
   
   for f in \
      t_chmod_03.exe \
      t_mkpath_03.exe \
      t_modedec.exe \
      t_modeoct.exe \
      t_modeper.exe \
      t_rmpath_01.exe \
      t_stat_03.exe \
      t_getenv_01.exe \
      t_getcwd_03.exe \
      t_abspath_01.exe \
      t_symlink_01.exe \
      t_dec2fup.exe \
      t_oct2fup.exe \
      t_fup2dec.exe \
      t_fup2oct.exe \
      t_readlink_01.exe \
      t_fread_03.exe \
      t_fcopy02.exe \
      t_fcopy03.exe \
      t_fcopy04.exe \
      t_fcopy05.exe \
      t_fcopy06.exe \
      t_popen_03.exe \
      t_fcat02.exe \
      t_fcat05.exe \
      t_fcat06.exe \
      t_relpath_01.exe 
   do 

      if [[ $( _ischanged $f ) -eq 1 ]]
      then 
   
         g=$( echo $f | sed 's/^t_//g' | sed 's/_.*$//g' | sed 's/.exe$//g' ) 
         h="${bin}/my.${g}"
   
         echo "copying  ${f}  --->  ${h}" 
         cp ${f} ${h} 

      else 
         echo "${f} is not changed. Skipped."        
      fi    

   done 
   
   unset g h  

   echo "Finish making test."
   echo "########################################################################"
}
#
#
#
_make_runtest ()
{
   for f in t_*.f90 
   do 
      echo "-----------------------------------------------------------"
      g=`basename $f .f90`
      echo "./${g}.exe"
      time ./${g}.exe
   done

   unset f g 
}
#
#
#
_make_mod ()
{
   echo "########################################################################"
   echo "Making modules ..."
#
#   generating included parameter files (*.inc)
#
   for f in e_*.c 
   do 
      if [[ $( _ischanged $f ) -eq 1 ]]
      then 
         g=`basename $f .c`

         g=`echo $f | sed s/\.c$/.exe/` 
         h=`echo $f | sed s/^e_/i_/ | sed s/\.c$/.inc/` 

         echo "${ccomp}  ${cflag} $f -o ${g}" 
         time  ${ccomp}  ${cflag} $f -o ${g}  

         echo "./${g} > $h" 
         ./${g} > $h 
      else 
         echo "${f} is not changed. Skipped."        
      fi 
   done

#  then, generating m_param.f90 (mod_funx_param.mod) ...

   modfn="m_param.f90"
   modfs="m_faces.f90"
   modfx="m_funx.f90"
   param=e_param.exe
   error=e_errno.exe

   if [[ -e "$param" ]]
   then
      echo "Making $modfn ..."

      echo "!                              "   >  $modfn
      echo "!     We will stop using       "   >> $modfn
      echo "!        include 'i_param.inc' "   >> $modfn
      echo "!     in our codes.            "   >> $modfn
      echo "!                              "   >> $modfn
      echo "      module   mod_funx_param      "   >> $modfn
      echo "!                              "   >> $modfn
      echo "      implicit none            "   >> $modfn
#
#     Parameters:

      echo "./${param} >> $modfn" 
      ./${param}                          >> $modfn

#
#     Constant for error controling 

      echo "./${error} >> $modfn" 
      ./${error}                          >> $modfn

#
      echo "!                              "   >> $modfn
      echo "!                              "   >> $modfn
      echo "      end module mod_funx_param    "   >> $modfn
      echo "Done $modfn. Compiling $modfn ... "

      echo "${fcomp}  ${fflag}  -c  $modfn" 
      time  ${fcomp}  ${fflag}  -c  $modfn

      mv m*.mod ./inc
   else
      echo "FATAL ERROR: e_param.exe not exists. Abort."
      exit 1 ; 
   fi 
#
#
   echo "Compiling $modfs ... "

   echo "${fcomp}  ${fflag}  -c  $modfs" 
   time  ${fcomp}  ${fflag}  -c  $modfs

   mv m*.mod ./inc
#
#
   echo "Compiling $modfx ... "

   echo "${fcomp}  ${fflag}  -c  $modfx" 
   time  ${fcomp}  ${fflag}  -c  $modfx

   mv m*.mod ./inc


   unset f g param error modfn modfs modfx 

   echo "Finish making modules."
   echo "########################################################################"
}
#
#
#
_make_clean ()
{
   echo "rm -f *.o *.mod *.exe *.a *.out"
   rm -f *.o *.mod *.exe *.a *.out
}
# 
#
# 
_make_distclean () 
{
   echo "rm -f *.o *.exe *.a *.out  ${lib}/* ${inc}/* "
   rm -f *.o *.exe *.a *.out ${lib}/* ${inc}/* 
}
#
#
#
_make_pack ()
{
   echo "########################################################################"
   echo "Packing up everything ..."

   mkdir -p ${ver} 

   /bin/bash  $0  clean

   v=`/bin/bash my_date` 
   p="funx_${v}.zip"

   echo "Making $p ..."
   7z a $p *.* 

   echo "cp  $p  ${ver}"
   ( cp  $p ${ver} ) && ( echo "Check in ${ver}/$p" ) && ( du -ch ${ver}/$p )

   rm $p

   unset p v  

   echo "Finish packing."
   echo "########################################################################"
}
#
#
#
_make_dual ()
{
   for f in c_*.c ; 
   do 
      g=`echo $f | sed 's/^c_//' | sed 's/.c$//' ` 
      h="f_${g}.f90"

      echo "-----------------------------------------------------------"
      echo ">>> $f --> $h ?" 
      ls    $h 
   done
}
#
#
#
_make_c ()
{
   echo "########################################################################"
   echo "Compiling *.c ..."

   for f in c_*.c 
   do 
      if [[ $( _ischanged $f ) -eq 1 ]]
      then 
         echo "${ccomp}  ${cflag}  -c  $f" 
         time  ${ccomp}  ${cflag} -c $f  
      else 
         echo "${f} is not changed. Skipped."        
      fi 
   done

   unset f 

   echo "Finish compiling *.c."
   echo "########################################################################"
}
#
#
#
_make_f () 
{
   echo "########################################################################"
   echo "Compiling *.f90 ..."
#
#  Compiling Fortran codes
#
   for f in f_*.f90 
   do 
      if [[ $( _ischanged $f ) -eq 1 ]]
      then 
         echo "${fcomp}  ${fflag}  -c  $f" 
         time  ${fcomp} ${fflag} -c $f  
      else 
         echo "${f} is not changed. Skipped."        
      fi 
   done

   unset f 

   echo "Finihs compiling *.f90."
   echo "########################################################################"
}
#
#
#
_make_inc () 
{
   echo "########################################################################"
   echo "Making *.inc ..."
#
#  generating included parameter files (*.inc)
#
   for f in e_*.c 
   do 
      if [[ $( _ischanged $f ) -eq 1 ]]
      then 
         g=`basename $f .c`
         g=`echo $f | sed s/\.c$/.exe/` 
         h=`echo $f | sed s/^e_/i_/ | sed s/\.c$/.inc/` 
         echo "${ccomp}  ${cflag} $f -o ${g}" 
         time  ${ccomp}  ${cflag} $f -o ${g}  
         echo "./${g} > $h" 
         ./${g} > $h 
      else 
         echo "${f} is not changed. Skipped."        
      fi 
   done
#
   echo "Finish making *.inc."
   echo "########################################################################"
}
#
#
#
_make_lib ()
{
   echo "########################################################################"
   echo "Making lib *.a ..."
#
#  Packing compiled objects
#
   echo "ar  r  ${lib}/funxlib.a  c_*.o  f_*.o  m_*.o"
   ar  r  ${lib}/funxlib.a  c_*.o  f_*.o  m_*.o 
#
   echo "Got *.a."
   echo "########################################################################"
}
#
#
#
_make_install ()
{
   echo "########################################################################"
   echo "Installing my_funx ..."
#
   if [ -d $rpath ] 
   then
      echo "rpath=$rpath exists. remove it." 
      rm -rf $rpath
   fi
   echo "mkdir -p $rpath" 
   mkdir -p $rpath
   echo "mkdir -p $mpath" 
   mkdir -p $mpath
   echo "mkdir -p $opath" 
   mkdir -p $opath
#
   fdict="${rpath}/dict.pl"
   echo "Creating $fdict ..."
#
   echo "%dict = (                             "  >  $fdict
   echo "default     => '$fopti -wall $fdeps ',"  >> $fdict
   echo "dependences => '$fopti -wall $fdeps ',"  >> $fdict
   echo "externallib => '',                    "  >> $fdict
   echo ")                                     "  >> $fdict
#
   echo "   ar r ${rpath}/libmy_funx.a  c_*.o f_*.o m_*.o"
   ar r ${funxa}  c_*.o f_*.o m_*.o 
#
   cp ./inc/m*.mod $mpath/
#
   echo "Finish installing my_funx."
   echo "########################################################################"
#
}
#
#
#
_make_util () 
{
   echo "########################################################################"
   echo "Installing utilities ..."
#
#  generating utilities 
#
   for f in u_*.c 
   do 
      if [[ $( _ischanged $f ) -eq 1 ]]
      then 
         g=`basename $f .c`
         g=`echo $f | sed s/\.c$/.exe/` 
         echo "${ccomp}  ${cflag} $f ${lib}/funxlib.a -o ${g}" 
         time  ${ccomp}  ${cflag} $f ${lib}/funxlib.a -o ${g}  
      else 
         echo "${f} is not changed. Skipped."        
      fi 
   done
   unset f g  
   echo "########################################################################"
}

#
#
#
#######################################################################
#
#  main:
#
#######################################################################

if [ $# -gt 0 ] 
then 
   opt=$1
   if    [ "$opt" = "clean" ]
   then
      _make_clean 
   elif  [ "$opt" = "distclean" ]
   then
      _make_distclean 
   elif  [ "$opt" = "test" ]
   then
      _make_test  
   elif  [ "$opt" = "runtest" ]
   then 
      _make_runtest  
   elif  [ "$opt" = "pack" ]
   then 
      _make_pack 
   elif  [ "$opt" = "dual" ]
   then 
      _make_dual 
   elif  [ "$opt" = "f" ]
   then 
      _make_f 
   elif  [ "$opt" = "c" ]
   then 
      _make_c 
   elif  [ "$opt" = "mod" ] 
   then 
      _make_mod 
   elif  [ "$opt" = "install" ] 
   then 
      _make_install 
   elif  [ "$opt" = "all" ] 
   then 
      _make_mod 
      _make_c 
      _make_f 
      _make_lib
      _make_install 
      _make_util 
      _make_test 
   else
      _print_usage 
      exit 1 ; 
   fi 
else
   _print_usage 
   exit 1 ; 
fi 




