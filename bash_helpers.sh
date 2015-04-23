#!/usr/bin/env bash

edit-all() {
  if [[ "$#" -eq 0 ]]; then
    echo """
    Desc:  Given a wildcard, will load queue for vim editing
    Usage: edit-all <file-pattern>
    Examples...

        edit-all '*.coffee'

    """
  else
    find . -name "$1" -exec vim {} \;
  fi
}

sr() {
  if [[ "$#" -eq 0 ]]; then
    echo """
    Desc:  Search and replace with sed
    Usage: sr <file-pattern> <sed-replacement>
    Examples...

        sr '*.coffee' 's/promiseSave/save/g'

    """
  else
    gfind -name "$1" -exec gsed -i "$2" {} \;
  fi
}


token() {
  if [[ "$#" -eq 0 ]]; then

    echo """
    Desc:  Extracts token from given line
    Usage: token <index> <delimiter?>
    Examples...

        token 2  # whitespace default
        token 1 "\t"  # tab delimited

    """

  else

    index=$1; : ${index:="1"}
    delimiter=$2; : ${delimiter:=$'\t'}

    cut -d"$delimiter" -f"$index"

  fi
}

line() {
  if [[ "$#" -eq 0 ]]; then

    echo """
    Desc:  Select lines from output
    Usage: line <index-from> <how-many-lines>
    Examples...

        echo -e \"1\\n2\\n3\\n4\\n5\" | line 2 3  # > 2\\n3\\n4

    """

  else

    index=$1; : ${index:="1"}
    count=$2; : ${count:="1"}

    head -n `expr $index + $count - 1` | tail -$count

  fi
}

github() {
  git_remote=$(git remote -v | head -1 | perl -wnl -e '/github.com.([^ ]*)/ and print $1')
  echo Opening $git_remote...
  open "https://github.com/$git_remote"
}

