var _0x534d0d = {};
const DPX = globalThis["DPX"];

const Sprays = {
    ballas: { model: "np_sprays_ballas", image: "https://i.imgur.com/kZBWTxt.png" },
    gsf: { model: "np_sprays_gsf", image: "https://i.imgur.com/1ntr5Qf.png" },
    vagos: { model: "np_sprays_vagos", image: "https://i.imgur.com/efGwiE9.png" },
    lostmc: { model: "np_sprays_lost", image: "https://i.imgur.com/Z8aFf9Q.png" },
    // dragons: { model: "durp_sprays_dragons", image: "https://i.imgur.com/JwrYheP.png" },
    // almighty: { model: "durp_sprays_almighty", image: "https://i.imgur.com/JwrYheP.png" },
    // dilligaf: { model: "durp_sprays_dilligaf", image: "https://i.imgur.com/JwrYheP.png" },
    // warlords: { model: "durp_sprays_warlords", image: "https://i.imgur.com/JwrYheP.png" },
    // pythons: { model: "durp_sprays_pythons", image: "https://i.imgur.com/JwrYheP.png" },
    // pd: { model: "durp_sprays_pd", image: "https://i.imgur.com/JwrYheP.png" },

    kingz: { model: "np_sprays_kingz", image: "https://i.imgur.com/tDKhSib.png" },
    mandem: { model: "np_sprays_mandem", image: "https://i.imgur.com/puUouqd.png" },
    bbmc: { model: "np_sprays_bbmc", image: "https://i.imgur.com/dfPPcOX.png" },
    bsk: { model: "np_sprays_bsk", image: "https://i.imgur.com/SFerhzb.png" },
    hoa: { model: "np_sprays_hoa", image: "https://i.imgur.com/7yQjQgr.png" },
    nbc: { model: "np_sprays_nbc", image: "https://i.imgur.com/AcCdobk.png" },
    seaside: { model: "np_sprays_seaside", image: "https://i.imgur.com/pXu5TAO.png" },
    angels: { model: "np_sprays_angels", image: "https://i.imgur.com/4YHjoOR.png" },
    hydra: { model: "np_sprays_hydra", image: "https://i.imgur.com/Gfrrw1B.png" },
    st: { model: "np_sprays_st", image: "https://i.imgur.com/UUidVhi.png" },
    guild: { model: "np_sprays_guild", image: "https://i.imgur.com/AGqR9z6.png" },
    ron: { model: "np_sprays_ron", image: "https://i.imgur.com/m4lDqsh.png" },
    ramee: { model: "np_sprays_ramee", image: "https://i.imgur.com/AWvjmbs.png" },
    cg: { model: "np_sprays_cg", image: "https://i.imgur.com/bng68KR.png" },
};


const pSprayHashKeys = Object.values(Sprays).map(pSpray => GetHashKey(pSpray["model"]));

let pDoorLocations = [];

const _0x56b045 = _0x109701 => pDoorLocations.some(pItem => pItem.reduce((p1, p2, p3) => p1 += (p2 - _0x109701[p3]) ** 2, 0) <= 16);

const calculateCoords = (pEntity, pCoords) => {
    const entCoords = GetEntityCoords(pEntity, false);
    const entHeading = GetEntityHeading(pEntity);
    const _0x58d0da = Math.atan2(pCoords[1] - entCoords[1], pCoords[0] - entCoords[0]) * 180 / Math['PI'] - 90;
    const _0x232bf6 = Math.abs((entHeading - _0x58d0da + 180) % 360 - 180);
    return _0x232bf6 * 12;
}


async function loadAnim(animation) {
    while (!HasAnimDictLoaded(animation)) {
      RequestAnimDict(animation)
      await new Promise(resolve => setTimeout(resolve, 1000));
    }
}

const useSpraycan = async (pModel, pSprayCan) => {
    const [pResult, pObj] = await exports["np-objects"].PlaceObject(GetHashKey(pModel), {
        'collision': false,
        'groundSnap': false,
        'adjustZ': false,
        'distance': 3,
        'alignToSurface': true,
        'surfaceOffset': 0.025,
        'afterRender': (pObject, pHit, pUseCollision) => {
            const entFwdVector = GetEntityForwardVector(pObject);
            const [x, y, z] = GetEntityCoords(pObject, false);
            pHit && DrawMarker(23, x - entFwdVector[0] * 0.03, y - entFwdVector[1] * 0.03, z - entFwdVector[2] * 0.03, ...entFwdVector, 90, 0, 0, 1, 1, 1, pUseCollision ? 0 : 255, pUseCollision ? 255 : 0, 0, 50, false, false, 2, false, null, null, false), SetEntityAlpha(pObject, pHit ? 200 : 0, false);
        }
    }, (pCoords, pMaterial, pEntity, pHit) => {
        if (GetEntityType(pHit) !== 0) return false;        
        const entModel = GetEntityModel(pEntity);
        const [ [_0x3354c1, , _0x41c3ca], [_0x1ed973, _0x3912dd, _0x22cfed] ] = GetModelDimensions(entModel);
        const entFwdVector = GetEntityForwardVector(pEntity).map(pItem => pItem * 0.2);
        
        return [GetOffsetFromEntityInWorldCoords(pEntity, _0x3354c1 * 0.8, _0x3912dd, _0x41c3ca * 0.8), GetOffsetFromEntityInWorldCoords(pEntity, _0x1ed973 * 0.8, _0x3912dd, _0x41c3ca * 0.8), GetOffsetFromEntityInWorldCoords(pEntity, _0x3354c1 * 0.8, _0x3912dd, _0x22cfed * 0.8), GetOffsetFromEntityInWorldCoords(pEntity, _0x1ed973 * 0.8, _0x3912dd, _0x22cfed * 0.8)].every(pCoord => {
            const pHandle = StartShapeTestCapsule(...pCoord, pCoord[0] + entFwdVector[0], pCoord[1] + entFwdVector[1], pCoord[2] + entFwdVector[2], 0.02, -1, pEntity, 7);
            const [, hit, , , entityHit] = GetShapeTestResult(pHandle);
            const pEntType = GetEntityType(entityHit);
            return hit && pEntType === 0;
        }) && !_0x56b045([pCoords['x'], pCoords['y'], pCoords['z']]);
    });
    
    if (pResult) {
        const { coords: pCoords, rotation: pRotation } = pObj;
        const pPlayerPed = PlayerPedId();
        let isSpraying = false;
        const pObject = CreateObjectNoOffset(GetHashKey(pModel), pCoords['x'], pCoords['y'], pCoords['z'], false, false, false);

        SetEntityRotation(pObject, pRotation['x'], pRotation['y'], pRotation['z'], 2, true);
        SetEntityAlpha(pObject, 0, false);
        
        const curTime = Date.now();
        
        let pInterval = setInterval(() => {
            SetEntityAlpha(pObject, Math.min(240, Math.round((Date.now() - curTime) / 40000 * 240)), false);
        }, 1000);
        
        const [, pFinished] = await Promise.all([((async () => {
            const pCalcedCoords = calculateCoords(pPlayerPed, [pCoords['x'], pCoords['y']]);
            
            TaskTurnPedToFaceCoord(pPlayerPed, pCoords['x'], pCoords['y'], pCoords['z'], pCalcedCoords);
            
            await new Promise(resolve => setTimeout(resolve, pCalcedCoords));
            
            FreezeEntityPosition(pPlayerPed, true);
            
            const pAnim = "switch@franklin@lamar_tagging_wall";
            loadAnim(pAnim);
            
            emit("attachItem", "spraycan");
            emit("dispatch:graffiti");
            
            const [x, y, z] = GetEntityCoords(PlayerPedId(), false);
            
            setTimeout(() => {
                if (!isSpraying) {
                    const pCoordData = {};
                    pCoordData['x'] = x;
                    pCoordData['y'] = y;
                    pCoordData['z'] = z;
                }
            }, 6000);
            
            const pSeqTask = OpenSequenceTask();
            
            TaskPlayAnim(0, pAnim, "lamar_tagging_wall_loop_lamar", 8, -8, -1, 8192, 0, false, false, false);
            TaskPlayAnim(0, pAnim, "lamar_tagging_exit_loop_lamar", 8, -2, -1, 8193, 0, false, false, false);
            CloseSequenceTask(pSeqTask);
            TaskPerformSequence(pPlayerPed, pSeqTask);
            ClearSequenceTask();
        })()), new Promise(resolve => exports["np-taskbar"].taskBar(40000, "Spraying...", false, true, null, false, resolve))]);
        
        isSpraying = true;
        clearInterval(pInterval);
        emit("destroyProp");
        
        ClearPedTasksImmediately(pPlayerPed);
        ClearPedSecondaryTask(pPlayerPed);
        FreezeEntityPosition(pPlayerPed, false);
                
        const sprayCanInfo = exports["np-inventory"].GetItemInfo(pSprayCan);
        const pCid = exports["isPed"].isPed("cid");
                
        if (pFinished === 100 && sprayCanInfo["item_id"] === "spraycan") {
            emit('np-objects:updateObjects', pObject)
            emitNet('np-gang-sprays:updateObjectssv')
            emitNet("inventory:degItem", sprayCanInfo['id'], 50, sprayCanInfo["item_id"], pCid);
            RPC.execute("np-graffiti:spray", pModel, pCoords['x'], pCoords['y'], pCoords['z'], pRotation['x'], pRotation['y'], pRotation['z'], Math.floor(Math.random() * 100000));
        }
    }
};

on("np-objects:objectCreated", (pObject, pEntity) => {
    pObject['ns'] === "graffiti" && SetEntityAlpha(pEntity, 240, false);
});

on("np-graffiti:scrub", async (p1, pEntity) => {
    const pObjectData = exports["np-objects"].GetObjectByEntity(pEntity);

    if (!pObjectData) {
        return;
    }
    
    if (exports['np-inventory'].hasEnoughOfItem('scrubbingcloth', 1)) {
        const pPlayerPed = PlayerPedId();
        
        const [, pFinished] = await Promise.all([((async () => {
            const pCalcedCoords = calculateCoords(pPlayerPed, [pObjectData['x'], pObjectData['y']]);
            
            TaskTurnPedToFaceCoord(pPlayerPed, pObjectData['x'], pObjectData['y'], pObjectData['z'], pCalcedCoords);
            
            await new Promise(resolve => setTimeout(resolve, pCalcedCoords));
            
            FreezeEntityPosition(pPlayerPed, true);
            TaskStartScenarioInPlace(pPlayerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true);
        })()), new Promise(resolve => exports["np-taskbar"].taskBar(40000, "Cleaning...", false, true, null, false, resolve))]);
        
        ClearPedTasksImmediately(pPlayerPed);
        ClearPedSecondaryTask(pPlayerPed);
        FreezeEntityPosition(pPlayerPed, false);
        
        pFinished === 100 && exports["np-objects"].DelObject(pObjectData['id']);
        emit('np-objects:updateObjects')
    } else {
        emit('DoLongHudText', 'You need scrubbing cloth.', 2)
    }
});

setImmediate(() => {
    RPC.execute("np-datagrid:subscribe", "graffiti");

    exports["np-interact"].AddPeekEntryByModel(pSprayHashKeys, [{
        id: "scrub_graffiti",
        event: "np-graffiti:scrub",
        icon: "soap",
        label: "Scrub",
        parameters: {},
    }], {
        distance: { radius: 2 },
        isEnabled: () => true
    });
});

on("np-gang-sprays:startPlacing", (sprayModel, slot) => {
    useSpraycan(sprayModel, slot);
});

on("np-gang-sprays:openPurchaseMenu", () => {
    let sprays = [
        {
            title : 'Ballas Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_ballas',
            }
        },
        {
            title : 'GSF Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_gsf',
            }
        },
        {
            title : 'Vagos Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: { sprayModel : 'np_sprays_vagos' }
        },
        {
            title : 'Lost MC Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_lost',
            }
        },

         {
            title : 'Chang Gang Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_cg',
            }
        },
        {
            title : 'Kingz Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_kingz',
            }
        },
        {
            title : 'Mandem Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_mandem',
            }
        },
        {
            title : 'BBMC Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_bbmc',
            }
        },
        {
            title : 'BSK Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_bsk',
            }
        },
        {
            title : 'HOA Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_hoa',
            }
        },
        {
            title : 'NBC Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_nbc',
            }
        },
        {
            title : 'Seaside Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_seaside',
            }
        },
        {
            title : 'Angels Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_angels',
            }
        },
        {
            title : 'Hydra Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_hydra',
            }
        },
        {
            title : 'Street Team Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_st',
            }
        },
        {
            title : 'Guild Spray',
            icon : 'spray-can',
            action : 'np-gang-sprays:confirmPurchaseSpray',
            key: {
                sprayModel: 'np_sprays_guild',
            }
        },
        // {
        //     title : 'Ron Spray',
        //     icon : 'spray-can',
        //     action : 'np-gang-sprays:confirmPurchaseSpray',
        //     key: {
        //         sprayModel: 'np_sprays_ron',
        //     }
        // },
        // {
        //     title : 'Ramee Spray',
        //     icon : 'spray-can',
        //     action : 'np-gang-sprays:confirmPurchaseSpray',
        //     key: {
        //         sprayModel: 'np_sprays_ramee',
        //     }
        // },
                // {
        //     title : 'Dragons Dojo Spray',
        //     icon : 'spray-can',
        //     action : 'np-gang-sprays:confirmPurchaseSpray',
        //     key: {
        //         sprayModel: 'durp_sprays_dragons',
        //     }
        // },
        // {
        //     title : 'Almighty Mafia Spray',
        //     icon : 'spray-can',
        //     action : 'np-gang-sprays:confirmPurchaseSpray',
        //     key: {
        //         sprayModel: 'durp_sprays_almighty',
        //     }
        // },
        // {
        //     title : 'Dilligaf MC Spray',
        //     icon : 'spray-can',
        //     action : 'np-gang-sprays:confirmPurchaseSpray',
        //     key: {
        //         sprayModel: 'durp_sprays_dilligaf',
        //     }
        // },
        // {
        //     title : '18th Warlords Spray',
        //     icon : 'spray-can',
        //     action : 'np-gang-sprays:confirmPurchaseSpray',
        //     key: {
        //         sprayModel: 'durp_sprays_warlords',
        //     }
        // },
        // {
        //     title : 'Pythons Spray',
        //     icon : 'spray-can',
        //     action : 'np-gang-sprays:confirmPurchaseSpray',
        //     key: {
        //         sprayModel: 'durp_sprays_pythons',
        //     }
        // },
        // {
        //     title : 'PD Spray',
        //     icon : 'spray-can',
        //     action : 'np-gang-sprays:confirmPurchaseSpray',
        //     key: {
        //         sprayModel: 'durp_sprays_pd',
        //     }
        // },
    ]
    exports['np-interface'].showContextMenu(sprays)
});

RegisterInterfaceCallback('np-gang-sprays:confirmPurchaseSpray', (data, cb) => {
    cb({data: {}, meta: { ok: true, message: '',},})
    let spray = data.key.sprayModel
    TriggerServerEvent('np-gang-sprays:purchaseGangSpray',spray)
    RPC.execute('np-gang-sprays:purchaseGangSpray', spray)
})

on("np-gang-sprays:buyScrubbingCloth", () => {
    RPC.execute('np-gang-sprays:purchaseScrubbingCloth')
})