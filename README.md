# rb-mecdical (Merged Medical + Ambulance)

A single, merged **ESX** resource that combines a medical (injury/bleed/laststand/death) system with ambulance/hospital features, using **ox_lib** for UI/menus and **qs-inventory** for inventory integration.

## Features

### Medical
- Injury tracking (body parts + severity) using statebags
- Bleeding levels & effects
- Last stand / death flow
- Partial and full healing
- Admin commands: `/revive`, `/aheal`, `/kill` (ACE-based)

### Ambulance / Hospital
- Hospital beds with occupancy tracking
- Self check-in when EMS is below threshold
- EMS alerts (911e) and patient status lookup
- Vehicle spawning via callback
- ox_lib EMS menu (`/ems`)

### Pricing (In-game money sink)
Configured in `config/shared.lua`:

```lua
Config.Pricing = {
  hospitalCheckIn = 2000,
  revive          = 1500,
  treat           = 300,
  fullHeal        = 4000
}
```

- Check-in charges the player (bank)
- EMS revive/treat charges the target (bank)

## Dependencies

Required:
- `es_extended`
- `ox_lib`
- `qs-inventory`

Optional:
- `esx_addonaccount` (only if you want automatic society deposits; otherwise use your banking in `config/server.lua`)

## Installation

1. Download and place the folder:
   - `resources/[medical]/rb-mecdical`

2. Add to `server.cfg` (order matters):
   ```cfg
   ensure es_extended
   ensure ox_lib
   ensure qs-inventory
   ensure rb-mecdical
   ```

3. Restart the server.

## Configuration

### `config/shared.lua`
- Hospital locations, beds, interaction points
- `checkInCost` is still present, but pricing uses `Config.Pricing.hospitalCheckIn`
- `minForCheckIn` controls when self check-in is allowed (based on EMS online count)

### `config/server.lua`
Contains:
- `doctorCallCooldown` (minutes)
- `wipeInvOnRespawn` (true/false)
- `depositSociety(society, amount)` (optional)
  - If you have Renewed-Banking or another banking, wire it here

### Inventory integration (qs-inventory)
This resource uses `shared/inventory.lua` wrapper:
- `Inventory.HasItem(item)`
- `Inventory.OpenStash(stashName, opts)`
- `Inventory.OpenShop(shopName)`

If your qs-inventory uses different event names, update them in `shared/inventory.lua`.

## Commands

### Player
- `/ems` - Opens EMS menu (EMS job only)
- `/911e [message]` - Sends EMS alert to online EMS

### Admin (ACE permissions)
- `/revive [id]`
- `/aheal [id]`
- `/kill [id]`

ACE examples:
```cfg
add_ace group.admin command.revive allow
add_ace group.admin command.aheal allow
add_ace group.admin command.kill allow
```

## Job Name

Default EMS job name is `ambulance`.

If your job name differs, set it in `config/shared.lua` by adding:
```lua
emsJobName = 'ambulance'
```

## Troubleshooting

- **Menu doesn’t open**: make sure `ox_lib` is started and `/ems` is registered.
- **Stash/shop not opening**: your qs-inventory may use different events. Update `shared/inventory.lua`.
- **Check-in always blocked**: `minForCheckIn` may be too low/high, or your EMS job name mismatch.
- **Money not removed**: confirm you’re using ESX bank accounts and players have a `bank` account.

## File Layout

```
rb-mecdical/
  fxmanifest.lua
  config/
  client/
    medical/
    ambulance/
    oxlib_menu.lua
  server/
  shared/
  locales/
```

## License / Credits

Original logic derived from Qbox-project resources (`qbx_medical` and `qbx_ambulancejob`), adapted to ESX and merged, with additional compatibility layers.
