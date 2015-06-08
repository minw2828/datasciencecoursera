# Metacharacters:
# ^: start of a line 
# $: the end of a line
# []: a set of characters to be accepted at a given point in the match
# [0-9][a-zA-z]: specify a range of letters [a-zA-Z]; notice that the order doesn't matter
# [^?.]$: looks for any line that does not end with a question mark or a full stop
# .: refer to any character
# |: means "or"
# (): contain the whole expression
# ?: the indicated expression is optional. e.g. [Gg]eorge( [Ww]\.)? [Bb]ush looks for [Gg]eorge[Bb]ush and potentially there is a ( [Ww]\.)? in the middle
# Note: the above \. means consider the literal . instead of a metacharacter
# *: 0 to infinity repeatition. It always matches the longest possible string that satisfies the regular expression. 
# Note: to make it less greedy, use (?)
# +: 1 to infinity repeatition
# {}: interval quatifiers. It is used to specified the minimum and maximum number of matches of an expression
# Note: {m,n} is inclusive; {m} means exactly m matches; {m,} means at least m matches
# \1, \2: refer to the matched text. e.g.  +([a-zA-Z]+) +\1 +, here \1 looks for a repetition of [a-zA-Z]+
