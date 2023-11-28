local registered = {}

function RegisterInterfaceCallback(name, cb)
  local function interceptCb(data, innerCb)
    cb(data, function(result)
      if result.meta.ok then
        result.meta.message = "done"
      end
      innerCb(result)
    end)
  end
  AddEventHandler(('_apx_uiReq:%s'):format(name), interceptCb)

  if (GetResourceState("np-interface") == "started") then 
    exports["np-interface"]:RegisterInterfaceEvent(name) 
  end

  registered[#registered + 1] = name
end

function SendInterfaceMessage(data)
  exports["np-interface"]:SendInterfaceMessage(data)
end

function SetInterfaceFocus(hasFocus, hasCursor)
  exports["np-interface"]:SetInterfaceFocus(hasFocus, hasCursor)
end

function GetInterfaceFocus()
  return exports["np-interface"]:GetInterfaceFocus()
end

AddEventHandler("_npx_uiReady", function()
  for _, eventName in ipairs(registered) do
    exports["np-interface"]:RegisterInterfaceEvent(eventName)
  end
end)