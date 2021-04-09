---
layout: post 
author: Alessandro Lorenzi 
title: Service package 
tags: golang
---

I love split my code in a lot of micro-pagakes fully indipendent.

To maximize the isolation each package should be testable and all dependencies injectable and all dependencies should be
interfaces.

Let's analyze this simple package. The function inside the package will use an external library (`xyz`) to do something.

```go
package mypackage

import "github.com/xyz/xyz"

func GetInfoFromXyz() (string, error) {
	xyzSvc := xyz.New(
		os.Getenv("XYZ_KEY_ID"),
		os.Getenv("XYZ_SECRET_KEY"),
	)
	data, err := xyzSvc.GetInfo(42)
	if err != nil {
		return "", err
	}
	return data.InfoINeed, nil
}
```

This package is quite impossible to test easily.

- I have to set valid key and secret in environment variables
- I have to connect to a service (and maybe there isn't a test environment)
- The same xyz service can be used in multiple packages and I could share the connection
- Is not always reproducible

We have one dependency: `xyz`. Let's create an interface that expose what we need:

```go
type Xyz interface{
GetInfo(int) (*xyz.GetInfoOutput, error)
}
```

This inteface is mockable, this means that we don't need to connect to an external service to test this package.

Now let's create our service.

```go
type Service struct {
xyzSvc Xyz
}

func New(xyzSvc *xyz.XYZ) *Service{
return &Service
}
```

> Hint: in GoLand you can open _Context Action_ (`Alt+Return`) ad automatically _Generate Constructor_.

Now you can modify the `GetInfoFromXyz` as Service reciver.

```go
func (s *Service) GetInfoFromXyz() (string, error) {
data, err := s.xyzSvc.GetInfo(42)
if err != nil {
return "", err
}
return data.InfoINeed, nil
}
```

In main we can inject xyz connection as dependency. In this example we will share xyz connection between two packages.

```go
package main

func main() {
	xyzSvc := xyz.New(
		os.Getenv("XYZ_KEY_ID"),
		os.Getenv("XYZ_SECRET_KEY"),
	)

	myPackageSvc := mypackage.New(xyzSvc)
	anotherSvc := anotherpackage.New(xyzSvc)

	theValue, _ := myPackageSvc.GetInfoFromXyz()

	anotherSvc.DoStuff(theValue)
}
```

In part two we will mock `xyz` and test `mypackage`
