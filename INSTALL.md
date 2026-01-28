# Install Guide (Quick)

## 1) Requirements
- es_extended
- ox_lib
- qs-inventory

## 2) Add resource
Put `rb-mecdical` into your resources folder.

## 3) Ensure order (server.cfg)
```cfg
ensure es_extended
ensure ox_lib
ensure qs-inventory
ensure rb-mecdical
```

## 4) Configure pricing
Edit `config/shared.lua`:
```lua
Config.Pricing.hospitalCheckIn = 2000
Config.Pricing.revive          = 1500
Config.Pricing.treat           = 300
Config.Pricing.fullHeal        = 4000
```

## 5) Configure job name (if needed)
In `config/shared.lua`:
```lua
emsJobName = 'ambulance'
```

## 6) Restart
Restart the server or `restart rb-mecdical`.
