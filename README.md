times 
==========

[![GoDoc](https://godoc.org/github.com/oneclickvirt/times?status.svg)](https://godoc.org/github.com/oneclickvirt/times)
[![Release](https://img.shields.io/github/release/oneclickvirt/times.svg)](https://github.com/oneclickvirt/times/releases/latest)
[![Software License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE.txt)
[![go test](https://github.com/oneclickvirt/times/actions/workflows/go-test.yml/badge.svg)](https://github.com/oneclickvirt/times/actions/workflows/go-test.yml)
[![Coverage Status](https://coveralls.io/repos/oneclickvirt/times/badge.svg?branch=master)](https://coveralls.io/r/oneclickvirt/times?branch=master)
[![Go Report Card](https://goreportcard.com/badge/github.com/oneclickvirt/times)](https://goreportcard.com/report/github.com/oneclickvirt/times)
[![Sourcegraph](https://sourcegraph.com/github.com/oneclickvirt/times/-/badge.svg)](https://sourcegraph.com/github.com/oneclickvirt/times?badge)

Usage
------------
File Times for #golang

Go has a hidden time functions for most platforms, this repo makes them accessible.

```go
package main

import (
  "log"

  "github.com/oneclickvirt/times"
)

func main() {
  t, err := times.Stat("myfile")
  if err != nil {
    log.Fatal(err.Error())
  }

  log.Println(t.AccessTime())
  log.Println(t.ModTime())

  if t.HasChangeTime() {
    log.Println(t.ChangeTime())
  }

  if t.HasBirthTime() {
    log.Println(t.BirthTime())
  }
}
```

Supported Times
------------
|  | windows | linux | solaris | dragonfly | nacl | freebsd | darwin | netbsd | openbsd | plan9 | js | aix |
|:-----:|:-------:|:-----:|:-------:|:---------:|:------:|:-------:|:----:|:------:|:-------:|:-----:|:-----:|:-----:|
| atime | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| mtime | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| ctime | ✓* | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |  | ✓ | ✓ |
| btime | ✓ | ✓* |  |  |  | ✓ |  ✓| ✓ |  |  |

* Linux btime requires kernel 4.11 and filesystem support, so HasBirthTime = false.
Use Timespec.HasBirthTime() to check if file has birth time.
Get(FileInfo) never returns btime.
* Windows XP does not have ChangeTime so HasChangeTime = false, 
however Vista onward does have ChangeTime so Timespec.HasChangeTime() will 
only return false on those platforms when the syscall used to obtain them fails.
* Also note, Get(FileInfo) will now only return values available in FileInfo.Sys(), this means Stat() is required to get ChangeTime on Windows

Installation
------------
```sh
go get -u github.com/oneclickvirt/times
```
