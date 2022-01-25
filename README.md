# WARNING: DEPRECATED

GitHub is [deprecating git.io](https://github.blog/changelog/git-io-no-longer-accepts-new-urls/) so this source code will not work anymore.

# Git.io in PicoLisp

Command-line client for GitHub's URL shortener [git.io](https://git.io).

# Requirements

  * `curl` with https support
  * `PicoLisp`

# Usage

### shorten a github.com URL

```
pil git.io.l "https://github.com/aw/picolisp-git.io"
https://git.io/vhUj0

```

### shorten a github.com URL with custom code

```
pil git.io.l "https://github.com/aw/picolisp-json" piljson
https://git.io/piljson
```

### lengthen a shortened git.io URL

```
chmod +x git.io.l
./git.io.l "https://git.io/piljson"
https://github.com/aw/picolisp-json
```

# Alternatives

* [git.io (Ruby)](https://github.com/jgorset/git.io)

# License

[MIT License](LICENSE)

Copyright (c) 2018 Alexander Williams, Unscramble <license@unscramble.jp>
