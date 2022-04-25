# Nitrox-server

Simple Docker image for the Subnautica Nitrox Server

## Usage

The Nitrox server needs two things to run:

* A volume mount for the server's save data, mounted at `/world`
* A volume mount for the Subnautica game's files, mounted at `/opt/Subnautica`

A complete `docker run` command:
```bash
docker run nicholasmnovak/nitrox-server -v <nitrox-save-dir>:/world -v <Subnautica game files>:/opt/Subnautica
```

The server is now running on `UDP` port `11000`
