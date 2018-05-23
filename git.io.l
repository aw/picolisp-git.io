#!/usr/bin/env pil
#
# Shorten a URL using git.io
#
# The MIT License (MIT)
# Copyright (c) 2018 Alexander Williams, Unscramble <license@unscramble.jp>
#
# v0.1
#
# Usage: git.io.l <url> <code>

# exit and print an error message to STDERR
[de gitio-error (Msg Code)
  (default Code 1)
  (msg "git.io.l:" " " Msg)
  (bye Code) ]

# perform 'curl' call and return the value (list) from the 'Location:' header
[de gitio-curl @
  (if (clip (in (append (list 'curl "-s" "-i") (rest)) (while (from "Location:") (line))))
      @
      (gitio-error "No response, ensure URL is a valid GitHub.com or git.io URL") ]

# convert a full URL to a git.io URL
# free variables: Url, Code
[de gitio-shorten ()
  (unless Url (gitio-error "You must specify a URL to shorten"))
  (gitio-curl "https://git.io" "-F" (pack "url=" Url) (when Code (list "-F" (pack "code=" Code) ]

# convert a git.io URL to its original full URL
# free variables: Url
[de gitio-lengthen ()
  (unless Url (gitio-error "You must specify a URL to lengthen"))
  (gitio-curl Url) ]

# process the command-line arguments
[de gitio-process ()
  (use Url Code
    (argv Url Code)
    (prinl
      (if (pre? "https://git.io" (lowc Url))
          (gitio-lengthen)
          (gitio-shorten) ]

(gitio-process)
(bye)
