# t.country: country
```lua
local t = require "t"
local country = t.country
```

Object format:
```lua
local us = {id='us', code='usa', name='United States'}
```

To get object:
```lua
print(country.us)
print(country.US)
print(country['usa'])
print(country.USA)
print(country['United States'])
print(country['UNITED STATES'])
```

To get geoip:
```lua
print(country('8.8.8.8'))
```

## caveats
- added alias `country.gb == country.uk`
- virtual europe `country.eu` exists

## system depends
Debian Linux:
```bash
sudo apt-get install libmaxminddb-dev libluajit2-5.1-dev liblua5.1-0-dev liblua5.3-dev
```
Alpine Linux:
```bash
RUN apk add gcc musl-dev ...
```

## luarocks depends
- `lua-maxminddb`

## luarocks install example
```bash
sudo luarocks install lua-maxminddb LIBMAXMINDDB_INCDIR=/usr/include/x86_64-linux-gnu
```

## build tools
- `pkg-config`
- `meson`
- `cmake`

## want libs
- `libdl.so`
