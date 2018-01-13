#!/bin/sh
#
# environmental variable EDITOR should be set
######################### Settings #############################################
PATH_JL="/tmp/journal"
FORMAT="%a %d %b %Y %H:%M"
################################################################################
convUnixTime ()   {
    if date --version >/dev/null 2>/dev/null; then
        date -d @$@ +"${FORMAT}"    # Linux
    else
        date -r $@ "+${FORMAT}"     # OS X/BSD
    fi
}

# Check if filter / number or new text
# Either no argument or -13 or 1-34
if [ -z "$*" -o -n "`echo $* | sed  -n '/^-[[:digit:]]\{1,9\}/ p'`" -o  -n "`echo $* | sed  -n '/^[[:digit:]]\{1,9\}-[[:digit:]]\{1,9\}/p'`" ]; then

    FILES_LIST=`find "${PATH_JL}" -name '*.txt'`

    # truncate list by number arg "-12"
    if [ -n "`echo $* | sed  -n '/^-[[:digit:]]\{1,9\}/ p'`" ]; then
        FILES_LIST=`echo "${FILES_LIST}"  | tail -n "$*"`
    fi

    # truncate list by number arg  "5-34"
    if [ -n "`echo $* | sed  -n '/^[[:digit:]]\{1,9\}-[[:digit:]]\{1,9\}/p'`" ]; then
        START_NUM=`echo $* | awk -F \- '{print $1}'`
        END_NUM=`echo $* | awk -F \- '{print $2}'`
        COUNT_RECORDS=`echo ${FILES_LIST} | wc -w`
        TAIL=`expr ${COUNT_RECORDS} - $START_NUM + 1`
        FILES_LIST=`echo "${FILES_LIST}" | tail -n "${TAIL}"`
        HEAD=`expr "$END_NUM" - "$START_NUM" + 1`
        FILES_LIST=`echo "${FILES_LIST}" | head -n "${HEAD}"`
    fi

    # Listing constrained by number + HEAD
    COUNT=1
    for FILE_NAME in ${FILES_LIST}; do
      COMMENT=`cat "${FILE_NAME}" | head -n 1`
      UNIXTIME=`echo "${FILE_NAME}" | awk -F \/ '{print $NF}' | awk -F \. '{print $1}'`
      #echo \[${COUNT}] `echo "$UNIXTIME" | gawk '{print strftime("%c", $0)}'`	"${COMMENT}"
      echo \[${COUNT}] `convUnixTime "$UNIXTIME"`	"${COMMENT}"
      COUNT=`expr ${COUNT} + 1`
    done

    echo "Enter number of  or 0 to exit"
    read FILE_NUMBER
    
    #  Delete with parameter -d
    if [ -n "`echo ${FILE_NUMBER} | sed  -n '/^d / p'`" ]; then
        NUM_FILE=`echo "${FILE_NUMBER}" | awk '{print $2}'`
        COUNT=1
        for FILE_NAME in ${FILES_LIST}; do
            if  [ "${COUNT}" = "${NUM_FILE}" ]; then
                rm "${FILE_NAME}"
                echo Record number "${NUM_FILE}" is deleted.
            fi
            COUNT=`expr ${COUNT} + 1`
        done
    fi

    #  Edit with parameter -e
    if [ -n "`echo ${FILE_NUMBER} | sed  -n '/^e / p'`" ]; then

        NUM_FILE=`echo "${FILE_NUMBER}" | awk '{print $2}'`

        COUNT=1
        for FILE_NAME in ${FILES_LIST}; do
            if  [ "${COUNT}" = "${NUM_FILE}" ]; then
                 $EDITOR "${FILE_NAME}"
                 echo Record "${NUM_FILE}" is edited.
            fi
            COUNT=`expr ${COUNT} + 1`
        done
    fi

    #  Cat without parameters
    COUNT=1
    for FILE_NAME in ${FILES_LIST}; do
	if  [ "${COUNT}" = "${FILE_NUMBER}" ]; then
            echo '_______________________________________'
            cat "${FILE_NAME}"
	fi
	COUNT=`expr ${COUNT} + 1`
    done


  else #########################################################################
    # Form new record
    DIR_NAME=`date "+%Y/%m/%d"`
    FILE_NAME=`date "+%s.txt"`
    mkdir -p "${PATH_JL}"/"${DIR_NAME}"
    # Получаем тэги
    COUNT_TAGS=0
    for SEP_WORD in $*; do
      if [ -z "`echo $SEP_WORD | sed  -n '/^+/ p'`" ]; then
        #echo $SEP_WORD is not a tag. # debug
        break
      else
        #echo $SEP_WORD is a tag.  # debug
        TAGS=`echo $TAGS $SEP_WORD`
        COUNT_TAGS=`expr ${COUNT_TAGS} + 1`
      fi
    done

    #echo Tags: $TAGS    # debug
    #echo Amount of tags: ${COUNT_TAGS}  # debug

    # get string after tags
    COUNT_WORDS=0
    for SEP_WORD in $*; do
      if [ "$COUNT_WORDS" -lt  "${COUNT_TAGS}" ]; then
        #echo $SEP_WORD -  # debug
        printf '' # just nothing to do
      else
        #echo $SEP_WORD +  # debug
        STRING=`echo $STRING $SEP_WORD`
      fi
        COUNT_WORDS=`expr ${COUNT_WORDS} + 1`
    done

    TITLE=`echo "${STRING}" | awk -F \. '{print $1}'`
    BODY=`echo "${STRING}" | awk -F'.' '{sub(/^[^.]+\./,"")}1'`

    touch "${PATH_JL}"/"${DIR_NAME}"/"${FILE_NAME}"
    echo $TITLE >> "${PATH_JL}"/"${DIR_NAME}"/"${FILE_NAME}"
    echo \"$TITLE\" is just created.
  if [ -n "${BODY}" ]; then
    echo "" >> "${PATH_JL}"/"${DIR_NAME}"/"${FILE_NAME}"
    echo $BODY >> "${PATH_JL}"/"${DIR_NAME}"/"${FILE_NAME}"
  fi
  if [ -n "${TAGS}" ]; then
    echo "" >> "${PATH_JL}"/"${DIR_NAME}"/"${FILE_NAME}"
    echo "${TAGS}" >> "${PATH_JL}"/"${DIR_NAME}"/"${FILE_NAME}"
  fi
fi
