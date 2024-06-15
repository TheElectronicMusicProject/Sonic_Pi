# 10.3 Pattern Matching

# The event waited can have more path segments

# e.g. sync "/*/*/*" will match:
# > cue "/foo/bar/baz"
# > cue "/foo/baz/quux"
# > cue "/eggs/beans/toast"
# > cue "/moog/synths/rule"

# e.g. sync "/foo/b*/baz" will match:
# > cue "/foo/bar/baz"
# > cue "/foo/baz/baz"
# > cue "/foo/beans/baz"

# e.g. sync "/foo/**/baz" will match:
# > cue "/foo/bar/baz"
# > cue "/foo/bar/beans/baz"
# > cue "/foo/baz"
# > cue "/foo/a/b/c/d/e/f/baz"

# e.g. sync "/?oo/bar/baz" will match:
# > cue "/foo/bar/baz"
# > cue "/goo/bar/baz"
# > cue "/too/bar/baz"
# > cue "/woo/bar/baz"

# e.g. sync "/foo/{bar,beans,eggs}/quux" will match:
# > cue "/foo/bar/quux"
# > cue "/goo/beans/quux"
# > cue "/too/eggs/quux"

# e.g. sync "/foo/[abc]ux/baz" will match:
# > cue "/foo/aux/baz"
# > cue "/foo/bux/baz"
# > cue "/foo/cux/baz"

# e.g. sync "/foo/[a-e]ux/baz" will match:
# > cue "/foo/aux/baz"
# > cue "/foo/bux/baz"
# > cue "/foo/eux/baz"

in_thread do
  sync "/?oo/[a-z]*/**/ba*/{quux,quaax}/"
  sample :loop_amen
end

sleep 1

cue "/foo/beans/a/b/c/d/e/bark/quux/"