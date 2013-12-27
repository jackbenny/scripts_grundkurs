# Misc notes on sed & awk #
```bash
sed -n '/^[MmLl]ånga/p' file.txt                # Match Många/många/Långa/långa.
sed 's/^/Spock -- /g' file.txt                  # Put "Spock -- " in front of 
                                                # every row.
awk '{ print $1 $2 $3 }' names.txt              # Print field 1, 2 and 3.
awk '{ print $1" "$2" --> "$3 }' names.txt      # Print field 1, 2 and 3, with
                                                # spaces between 1 and 2 and
                                                # --> between 2 and 3.

```
