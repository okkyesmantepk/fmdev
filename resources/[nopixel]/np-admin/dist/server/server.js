!(function () {
    'use strict'
    RPC.register('np:admin:getCommandUI', async (pSource) => {
      let [pAdminNotGetCommandUI, pAdminGetCommandUI] = exports['np-admin'].isAdministrator(pSource), pObjectModuleTable = []
      return (
        Object.entries([
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Bennys',
                cat: 'Player',
                child: void 0,
                action: 'np:admin:enterBennys',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Become Model',
                cat: 'Player',
                child: { inputs: ['Model'] },
                action: 'np:admin:becomeModel',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Wheelfitment',
                cat: 'Player',
                child: void 0,
                action: 'np-fitment:devaleks',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Revive in Radius',
                cat: 'Player',
                child: void 0,
                action: 'np:admin:ReviveInDistance',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Teleport',
                cat: 'Player',
                child: { inputs: ['Target'] },
                action: 'np:admin:teleportPlayer',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Teleport Coords',
                cat: 'Player',
                child: { inputs: ['Coords'] },
                action: 'np:admin:teleportCoords',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Fix Vehicle',
                cat: 'Player',
                child: void 0,
                action: 'np:admin:fixVehicle',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner'],
            adminMenu: {
              command: {
                title: 'God',
                cat: 'Player',
                child: false,
                action: 'np:admin:toggleGodmode',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Spawn Selector',
                cat: 'Utility',
                child: false,
                action: 'np-admin/client/select-spawn',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Debug',
                cat: 'Utility',
                child: false,
                action: 'np:admin:enableDebug',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Dev Spawn',
                cat: 'Utility',
                child: void 0,
                action: 'np:admin:devSpawn',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Noclip',
                cat: 'Player',
                child: false,
                action: 'np:admin:noClipToggle',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Cloak',
                cat: 'Player',
                child: false,
                action: 'np:admin:toggleCloak',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Barber',
                cat: 'User',
                child: { inputs: ['Target'] },
                action: 'np:admin:requestBarber',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Clothing',
                cat: 'User',
                child: { inputs: ['Target'] },
                action: 'nopixel:clothing:admin',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Bring',
                cat: 'User',
                child: { inputs: ['Target'] },
                action: 'np:admin:bringPlayer',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Revive',
                cat: 'Player',
                child: { inputs: ['TargetNot'] },
                action: 'np:admin:revive',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'cSay',
                cat: 'Utility',
                child: { inputs: ['Text'] },
                action: 'np:admin:cSay',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Spawn Synced Object',
                cat: 'Utility',
                child: {
                  inputs: ['Model Name'],
                },
                action: 'np-admin:syncedObject',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Give License',
                cat: 'Player',
                child: {
                  inputs: ['Target', 'License'],
                },
                action: 'np:admin:giveLicense',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Fling Player',
                cat: 'Player',
                child: {
                  inputs: ['Target'],
                },
                action: 'np-admin:cl:fling-player',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Fart Noise',
                cat: 'Player',
                child: {
                  inputs: ['Target'],
                },
                action: 'np-admin:cl:fart-noise',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner'],
            adminMenu: {
              command: {
                title: 'Give Cash',
                cat: 'Player',
                child: {
                  inputs: ['Target', 'Amount'],
                },
                action: 'np:admin:giveCash',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Kick',
                cat: 'Utility',
                child: {
                  inputs: ['Target', 'Reason'],
                },
                action: 'np:admin:kickPlayer',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Request Job',
                cat: 'Player',
                child: {
                  inputs: ['Target', 'Job'],
                },
                action: 'np:admin:requestJob',
              },
              options: { bindKey: void 0 },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Teleport Marker',
                cat: 'Player',
                child: void 0,
                action: 'np:admin:teleportMarker',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Give Item',
                cat: 'Utility',
                child: {
                  inputs: ['TargetNot', 'Item', 'Amount'],
                },
                action: 'np:admin:giveItem',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner'],
            adminMenu: {
              command: {
                title: 'Give Job Whitelist',
                cat: 'Utility',
                child: {
                  inputs: ['Target', 'Job', 'Rank'],
                },
                action: 'np:admin:giveJobWhitelist',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Spawn Vehicle',
                cat: 'Utility',
                child: {
                  // inputs: ['TargetNot', 'Vehicle', 'Vehicle Overwrite'],
                  inputs: ['Vehicle', 'Vehicle Overwrite'],
                  checkBox: ['Mods'],
                },
                action: 'np:admin:spawnVehicle',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev'],
            adminMenu: {
              command: {
                title: 'Max Stats',
                cat: 'Player',
                child: { inputs: ['TargetNot'] },
                action: 'np:admin:maxMyStats',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Remove Stress',
                cat: 'Player',
                child: {
                  inputs: ['TargetNot', 'Amount'],
                },
                action: 'np:admin:removeStress',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev', 'admin', 'mod'],
            adminMenu: {
              command: {
                title: 'Update Garage',
                cat: 'Utility',
                child: {
                  inputs: ['Plate', 'Garage'],
                },
                action: 'np:admin:updateGarage',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner'],
            adminMenu: {
              command: {
                title: 'Create Business',
                cat: 'Utility',
                child: {
                  inputs: ['ID', 'Name', 'Owner'],
                },
                action: 'np:admin:createBusiness',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Search Player Inventory',
                cat: 'Player',
                child: { inputs: ['Target'] },
                action: 'np:admin:searchPlayerInventory',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Ban Player',
                cat: 'Player',
                child: {
                  inputs: ['Target', 'Length', 'Reason'],
                },
                action: 'np:admin:banPlayerJS',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Player Names',
                cat: 'Player',
                child: void 0,
                action: 'np-admin:ToggleNames',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Player Blips',
                cat: 'Player',
                child: void 0,
                action: 'np-admin:ToggleBlips',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'Change Weather',
                cat: 'Utility',
                child: {
                  inputs: ['Weather'],
                },
                action: 'np:weather:change',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
          {
            rank: ['owner', 'dev', 'admin'],
            adminMenu: {
              command: {
                title: 'UnBan Player',
                cat: 'Player',
                child: {
                  inputs: ['SteamID'],
                },
                action: 'np:admin:unbanPlayerJS',
              },
              options: {
                bindKey: {
                  value: void 0,
                  options: {},
                },
              },
            },
          },
        ]).forEach(([pAdminCode, pAdminModules]) => {
          pAdminModules.rank.forEach((pAdminCodeLaidOut) => {
            pAdminCodeLaidOut === pAdminGetCommandUI && pObjectModuleTable.push(pAdminModules)
          })
        }),
        pObjectModuleTable
      )
    })

    onNet('np:admin:sendAnnoucement', (pText) => {
      let pAdmin = GetPlayerName(source.toString())
      exports['np-admin'].sendLog(
        'https://discord.com/api/webhooks/ENTER_HERE', // changed
        '255',
        '[np-admin] cSay Log',
        'cSay message: ' + pText + '\nAdmin: ' + pAdmin,
        '',
        ''
      )
      emitNet('chatMessage', -1, 'Admin', 1, pText)
    })

    onNet('np:admin:sendTsay', (pText) => {
      emitNet('pNotify:SendNotification', -1, {
        text:
          '<center><span style="font-size:28px;color:red;">' +
          pText +
          '<br /><hr style="border-color: rgba(255, 0, 0, 0.5);">' +
          pText +
          '</span></center>',
        layout: 'top',
        timeout: 15000,
        type: 'error',
        animation: {
          open: 'gta_effects_fade_in',
          close: 'gta_effects_fade_out',
        },
        queue: 'announcement',
        progressBar: false,
      })
    })

    let disconnectedTable = [];
    onNet('playerDropped', async () => {
      let pSource = source
      let [cid, fullname] = exports['np-admin'].getEverything(pSource)
     // const fullname = char.first_name + ' ' + char.last_name || 'No Character Name'
      disconnectedTable.push({
        name: GetPlayerName(pSource),
        serverID: pSource,
        SteamID: 'none',
        charID: cid,
        charName: fullname,
        queueType: 'Regular',
      })
    })
  
    RPC.register('np:admin:getRecentDisconnects', (pSource) => {
      return disconnectedTable
    })
    // decrypted from nopixel ui
    RPC.register('np:admin:getPlayerData', (pSource) => {
      return (
        exports['np-admin'].getEverything()
      )
    })
    RPC.register('np:admin:getBanHistory', (pSource) => {
      let banHistoryPacked = exports['np-admin'].getBanList()
      return (banHistoryPacked)
    })
    const addPlayerLog = async (type,steamid,log,cid,data) => {
      const newAdminDate = new Date()
      await SQL.execute('INSERT INTO player_logs (type, steamid, log, date, cid, data) VALUES (@type, @steamid, @log, @date, @cid, @data)',
        {
          type: type,
          steamid: steamid,
          log: log,
          date: newAdminDate.toLocaleString(),
          cid: cid,
          data: data,
        }
      )
    }

    exports('addPlayerLog', addPlayerLog)

    RPC.register('np:admin:getPlayerLogs', async (pSource, pLogs) =>
      '' !== pLogs.steamid || (void 0 !== pLogs.steamid && '' === pLogs.type && '' === pLogs.cid)
        ? await SQL.execute('SELECT * FROM player_logs WHERE steamid = @steamid ORDER BY id DESC LIMIT @limit',
            {
              steamid: pLogs.steamid,
              limit: pLogs.limit,
            }
          )
        : '' !== pLogs.cid ||
          (void 0 !== pLogs.cid &&
            '' === pLogs.type &&
            '' === pLogs.steamid)
        ? await SQL.execute('SELECT * FROM player_logs WHERE cid = @cid ORDER BY id DESC LIMIT @limit',
            {
              cid: pLogs.cid,
              limit: pLogs.limit,
            }
          )
        : '' !== pLogs.type ||
          (void 0 !== pLogs.type &&
            '' === pLogs.cid &&
            '' === pLogs.steamid)
        ? await SQL.execute('SELECT * FROM player_logs WHERE type = @type ORDER BY id DESC LIMIT @limit',
            {
              type: pLogs.type,
              limit: pLogs.limit,
            }
          )
        : []
    )

    RPC.register('np:admin:isAdmin', async (pSource) => {
      let [isAdmin, isValid] = exports['np-admin'].isAdministrator(pSource)
      return !!isAdmin
    })

    onNet('np:admin:teleportPlayer', (pSource, pTheTarget) => {
      let pTarget = pTheTarget
      if (0 !== pTarget) {
        let pSourcePed = GetPlayerPed(pSource),
          pTargetPed = GetPlayerPed(pTarget)
        if (DoesEntityExist(pTargetPed)) {
          let pTargetCoords = GetEntityCoords(pTargetPed)
          SetEntityCoords(
            pSourcePed,
            pTargetCoords[0],
            pTargetCoords[1],
            pTargetCoords[2],
            true,
            false,
            false,
            false
          )
        }
      }
    })

    onNet('np:admin:bringPlayer', (pSource, pTarget) => {
      let pTargetData = pTarget
      if (0 !== pTargetData) {
        let pSourcePed = GetPlayerPed(pSource),
          pTargetPed = GetPlayerPed(pTargetData)
        if (DoesEntityExist(pTargetPed)) {
          let pSourceCoords = GetEntityCoords(pSourcePed)
          SetEntityCoords(
            pTargetPed,
            pSourceCoords[0],
            pSourceCoords[1],
            pSourceCoords[2],
            true,
            false,
            false,
            false
          )
        }
      }
    })

    onNet('np:admin:maxMyStats', (pTarget) => {
      let pUser =
        ('' !== pTarget && void 0 !== pTarget && pTarget) || source
      let pAdmin = GetPlayerName(source.toString()),
        pTargetData = GetPlayerName(pUser.toString())
      exports['np-admin'].sendLog(
        'https://discord.com/api/webhooks/ENTER_HERE', // changed
        '255',
        '[np-admin] Max Stats Log',
        'Admin: ' + pAdmin + '\nTarget: ' + pTargetData,
        ''
      )
      emitNet('np:admin:maxstats', pUser)
    })

    onNet('np:admin:removeStress', (pTarget, pAmount) => {
      let pUser = ('' !== pTarget && pTarget) || source
      emitNet('np:admin:clearStress', pUser, pAmount)
    })

    onNet('np:admin:requestJob', (pTarget, pJob) => {
      let pUser = ('' !== pTarget && pTarget) || source
      emitNet('np:admin:requestedJob', pUser, pJob)
    })

    onNet('np:admin:requestBarber', (pTarget) => {
      let pUser = ('' !== pTarget && pTarget) || source
      emitNet('np:admin:openBarber', pUser)
    })

    onNet('np:admin:requestClothing', (pTarget) => {
      let pUser = ('' !== pTarget && pTarget) || source
      emitNet('np:admin:openClothing', pUser)
    })

    onNet('np:admin:requestBennys', (pTarget) => {
      let pUser = ('' !== pTarget && pTarget) || source
      emitNet('np:admin:bennys', pUser)
    })

    onNet('np:admin:updateGarage', async (vehicleLicensePlate, givenGarageData) => {
      let src = source,
        selectedGarage = ('' !== givenGarageData && givenGarageData) || 'garage_alta'
      await SQL.execute(
        'UPDATE characters_cars SET current_garage = @current_garage, vehicle_state = @vehicle_state WHERE license_plate = @license_plate',
        {
          current_garage: selectedGarage,
          vehicle_state: 'In',
          license_plate: vehicleLicensePlate,
        }
      )
      emitNet('DoLongHudText', src, 'Successfully updated garage state', 1)
    })

    onNet('np:admin:giveLicense', async (pTarget, pType) => {
      if ('' === pTarget || void 0 === pTarget) {
        return emitNet('DoLongHudText', source, 'You must select a target', 2)
      }
      let pAdmin = GetPlayerName(source.toString()),
        pTargetData = GetPlayerName(pTarget.toString())
      return (
        exports['np-admin'].sendLog(
          'https://discord.com/api/webhooks/ENTER_HERE', // changed
          '255',
          '[np-admin] Give License Log',
          'License Given: ' +
            pType +
            ' License\nAdmin: ' +
            pAdmin +
            '\nTarget: ' +
            pTargetData,
          ''
        ),
        exports['np-admin'].giveLicense(Number(pTarget), pType)
          ? emitNet('DoLongHudText', source, 'Successfully gave license!', 1)
          : emitNet(
              'DoLongHudText',
              source,
              'Error while trying to give license.',
              2
            )
      )
    })

    onNet('np:admin:giveJobWhitelist',async (pTarget, pJob, pRank) => {
        if ('' === pTarget || void 0 === pTarget) {
          return emitNet('DoLongHudText', source, 'You must select a target', 2)
        }
        let pAdmin = GetPlayerName(source.toString()),
          pTargetData = GetPlayerName(pTarget.toString())
        return (
          exports['np-admin'].sendLog(
            'https://discord.com/api/webhooks/ENTER_HERE', // changed
            '255',
            '[np-admin] Job Whitelist Log',
            'Whitelisted Job Given: ' +
              pJob +
              '\nRank: ' +
              pRank +
              '\nAdmin: ' +
              pAdmin +
              '\nTarget: ' +
              pTargetData,
            ''
          ),
          exports['np-admin'].giveJobWhitelist(
            Number(pTarget),
            pJob,
            pRank
          )
            ? emitNet(
                'DoLongHudText',
                source,
                'Successfully gave job whitelist!',
                1
              )
            : emitNet(
                'DoLongHudText',
                source,
                'Error while trying to give job whitelist.',
                2
              )
        )
      }
    )

    onNet('np:admin:giveCash', async (pTarget, pAmount) => {
      let src = source
      if ('' === pTarget || void 0 === pTarget) {
        return emitNet('DoLongHudText', src, 'You must select a target', 2)
      }
      let pAdmin = GetPlayerName(source.toString()), pTargetData = GetPlayerName(pTarget.toString())
      return (
        exports['np-admin'].sendLog(
          'https://discord.com/api/webhooks/ENTER_HERE', // changed
          '255',
          '[np-admin] Give Cash Log',
          'Cash Given: $' +
            pAmount.toLocaleString() +
            '\nAdmin: ' +
            pAdmin +
            '\nTarget: ' +
            pTargetData,
          ''
        ),
        emitNet('DoLongHudText', src, 'Successfully gave cash!', 1),
        exports['np-admin'].giveCash(Number(pTarget), pAmount))
    })

    onNet('np:admin:kickPlayer', async (pTarget, pReason) => {
      if ('' === pTarget || void 0 === pTarget) {
        return emitNet('DoLongHudText', source, 'You must select a target', 2)
      }
      DropPlayer(pTarget, pReason)
      // let pAdmin = GetPlayerName(source.toString()),
      //   pTargetData = GetPlayerName(pTarget.toString())
      // exports['np-admin'].sendLog(
      //   'https://discord.com/api/webhooks/ENTER_HERE', // changed
      //   '255',
      //   '[np-admin] Kick Player Log',
      //   'Reason: ' +
      //     pReason +
      //     '\nAdmin: ' +
      //     pAdmin +
      //     '\nTarget: ' +
      //     pTargetData,
      //   ''
      // )
    })


    onNet('np:admin:createBusiness', async (pBID, pBusinessName, pBusinessOwner) => {
      let _0x1fb2d5 = GetPlayerName(source.toString())
      exports['np-admin'].sendLog(
        'https://discord.com/api/webhooks/ENTER_HERE', // changed
        '255',
        '[np-admin] Business Creation Log',
        'Business ID: ' +
          pBID +
          '\nBusiness Name: ' +
          pBusinessName +
          '\nBusiness Owner: ' +
          pBusinessOwner +
          '\nAdmin: ' +
          _0x1fb2d5,
        ''
      )
      let pBusinessOptions = []
      pBusinessOptions.push(
        {
          name: 'Owner',
          charge_access: true,
          bank_access: true,
          role_manage: true,
          role_create: true,
          key_access: true,
          stash_access: true,
          craft_access: true,
          can_hire: true,
          can_fire: true,
        },
        {
          name: 'Employee',
          charge_access: false,
          bank_access: false,
          role_manage: false,
          role_create: false,
          key_access: true,
          stash_access: true,
          craft_access: true,
          can_hire: false,
          can_fire: false,
        }
      )
      let pBusinessEmployees = []
      pBusinessEmployees.push({
        cid: pBusinessOwner,
        role: 'Owner',
        rank: 5,
      })
      let pBusinessBankID =
        Math.floor(10 * Math.random()).toString() +
        Math.floor(10 * Math.random()).toString() +
        Math.floor(10 * Math.random()).toString() +
        Math.floor(10 * Math.random()).toString() +
        Math.floor(10 * Math.random()).toString() +
        Math.floor(10 * Math.random()).toString() +
        Math.floor(10 * Math.random()).toString() +
        Math.floor(10 * Math.random()).toString()
      return (await SQL.execute(
        'INSERT INTO businesses (business_id, business_name, employees, roles, bank_id) VALUES (@business_id, @business_name, @employees, @roles, @bank_id)',
        {
          business_id: pBID,
          business_name: pBusinessName,
          employees: JSON.stringify(pBusinessEmployees),
          roles: JSON.stringify(pBusinessOptions),
          bank_id: pBusinessBankID,
        }
      ))
        ? emitNet('DoLongHudText', source, 'Successfully created business!', 1) : emitNet('DoLongHudText',source,'Error while trying to create business.',2)
    })

    RegisterCommand('testidentifiers',(pSource, pArgs) => {
        const pIdentifier = GetPlayerIdentifier(pSource, Number(pArgs[0]))
      },
      false
    )

    onNet('np:admin:giveItem', async (pTarget, pItem, pAmount) => {
      let pUser = ('' !== pTarget && pTarget) || source,
        pAmountOfitem = ('' !== pAmount && pAmount) || 1
      isNaN(pItem) || (pItem = Number(pItem))
      const pSource = source
      emitNet('player:receiveItem', pUser, pItem.toString(), pAmountOfitem)
      let pWebhook = 'https://discord.com/api/webhooks/ENTER_HERE', pAdminName = GetPlayerName(source.toString())
      if ('' !== pTarget || null !== pTarget) {
        let pUserName = GetPlayerName(pUser.toString())
        exports['np-admin'].sendLog(
          pWebhook,
          '255',
          '[np-admin] Spawn Item Log',
          'Item Spawned: ' +
            pItem +
            '\nItem Amount: 1\nAdmin: ' +
            pAdminName +
            '\nTarget: ' +
            pUserName,
          ''
        )
      } else {
        exports['np-admin'].sendLog(
          pWebhook,
          '255',
          '[np-admin] Spawn Item Log',
          'Item Spawned: ' + pItem + '\nItem Amount: 1\nAdmin: ' + pAdminName,
          'Item Name: ' + pItem + ' | Item Amount: 1',
          ''
        )
        const pPlayerSourceMetadata = '{"amount":"' + pAmountOfitem + '","item":"' + pItem + '"}', pPlayerSourceIdentifiers = GetPlayerIdentifier(pSource, 0)
        addPlayerLog(
          'Admin',
          null !== pPlayerSourceIdentifiers ? pPlayerSourceIdentifiers : 'None',
          'Spawned item',
          pPlayerSourceChar.id,
          pPlayerSourceMetadata
        )
      }
    })

    onNet('np:admin:flingPlayer', async (pTarget) => {
      emitNet('np-admin/client/fling-player', pTarget)
    })

    onNet('np:admin:sendLog', async (logReasons, bool, pAdmin) => {
      let pAdminName = GetPlayerName(source.toString())
      switch (logReasons) {
        case 'godmode':
          let pWebhook2 =
            'https://discord.com/api/webhooks/ENTER_HERE' // changed
          exports['np-admin'].sendLog(
            pWebhook2,
            '255',
            '[np-admin] Godmode Log',
            'Godmode Toggled: ' + bool + '\nAdmin: ' + pAdminName,
            '',
            ''
          )
          break
        case 'reviveDistance':
          let pWebhook3 =
            'https://discord.com/api/webhooks/ENTER_HERE' // changed
          exports['np-admin'].sendLog(
            pWebhook3,
            '255',
            '[np-admin] Revive Distance Log',
            'Revived in Distance\nAdmin: ' + pAdminName,
            '',
            ''
          )
          break
        case 'reviveTarget':
          let pWebhook = 'https://discord.com/api/webhooks/ENTER_HERE'
          exports['np-admin'].sendLog(
            pWebhook,'255','[np-admin] Revive Target Log','Revived a Target\nAdmin: '+pAdminName+'\nTarget: '+GetPlayerName(pAdmin) +' (' +GetPlayerIdentifier(pAdmin, 0) +')','',''
          )
      }
    })

  })()
  