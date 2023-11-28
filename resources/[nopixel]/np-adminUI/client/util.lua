function getJsonDataFromAdminBans()
    local imDoneNow = RPC.execute("np-adminUI:getRecentBans")
    return imDoneNow
  end
  
  exports('getJsonDataFromAdminBans',getJsonDataFromAdminBans)
  