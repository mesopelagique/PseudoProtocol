# PseudoProtocol

[![language][code-shield]][code-url]
[![language-top][code-top]][code-url]
![code-size][code-size]
[![build](https://github.com/mesopelagique/PseudoProtocol/actions/workflows/build.yml/badge.svg)](https://github.com/mesopelagique/PseudoProtocol/actions/workflows/build.yml)
[![discord][discord-shield]][discord-url]

The aim of this project is to simulate [Protocol](https://en.wikipedia.org/wiki/Protocol_(object-oriented_programming)) with runtime check.

## Create a protocol

First we have the `Protocol` class. All others protocols classes must extends it.

```4d
Class extends Protocol
```

Then each protocol define the function and property

```4d
Class constructor
    Super()
    This.addProperty("name"; Is text)
    This.addFunction("getRepository")
```

## Setup the protocol store

A variable `ps` represent the protocol store.
You must instanciate it one time and fill it with all protocols.

To do so just instantiate one times them.

```4d
ps:=New object()
cs.ServiceProtocol.new() // auto register into ps
cs.MySecondProtocol.new()
```

then you can access protocol with `ps`: `ps.ServiceProtocol`

## Check if instance implement the protocol

You have an instance and want to know if all properties and functions match a protocol.

```4d
$instance:=cs.Github.new()
```

You could ask protocol for that:

```4d
If(ps.ServiceProtocol.isInstance($instance))
    // do something
End if
```

You could also assert if you code need to be called by a correct instance type

```4d
If (ps.ServiceProtocol.assertedInstance($instance))
    // do something
End if 
```

## How it work?

Just by using `JSON Validate` with schema validation. The protocol is the schema.

---

[<img src="https://mesopelagique.github.io/quatred.png" alt="mesopelagique"/>](https://mesopelagique.github.io/)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[code-shield]: https://img.shields.io/static/v1?label=language&message=4d&color=blue
[code-top]: https://img.shields.io/github/languages/top/mesopelagique/PseudoProtocol.svg
[code-size]: https://img.shields.io/github/languages/code-size/mesopelagique/PseudoProtocol.svg
[code-url]: https://developer.4d.com/
[discord-shield]: https://img.shields.io/badge/chat-discord-7289DA?logo=discord&style=flat
[discord-url]: https://discord.gg/dVTqZHr
