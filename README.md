# Durango Development Kit Image

This is a Image with all the tools needed for Develop for the Durango Project:

[https://www.durangoretro.com/](https://www.durangoretro.com/)

This image include the following tools:

* xa65 assembler for 6502
* cc65 C Compiler

You can Find this Image in [Docker Hub](https://hub.docker.com/r/zerasul/durangodevkit).

This Image is made with the colaboration of [La jaquería](https://lajaqueria.org)

By default the make command is called.

```bash
docker run -v $PWD:/src/durango zerasul/durangodevkit
```
