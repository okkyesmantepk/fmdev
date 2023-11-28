-- Johnson–Trotter permutations generator
_JT={}
function JT(dim)
  local n={ values={}, positions={}, directions={}, sign=1 }
  setmetatable(n,{__index=_JT})
  for i=1,dim do
    n.values[i]=i
    n.positions[i]=i
    n.directions[i]=-1
  end
  return n
end
 
function _JT:largestMobile()
  for i=#self.values,1,-1 do
    local loc=self.positions[i]+self.directions[i]
    if loc >= 1 and loc <= #self.values and self.values[loc] < i then
      return i
    end
  end
  return 0
end
 
function _JT:next()
  local r=self:largestMobile()
  if r==0 then return false end
  local rloc=self.positions[r]
  local lloc=rloc+self.directions[r]
  local l=self.values[lloc]
  self.values[lloc],self.values[rloc] = self.values[rloc],self.values[lloc]
  self.positions[l],self.positions[r] = self.positions[r],self.positions[l]
  self.sign=-self.sign
  for i=r+1,#self.directions do self.directions[i]=-self.directions[i] end
  return true
end  
 
-- matrix class
 
_MTX={}
function MTX(matrix)
  setmetatable(matrix,{__index=_MTX})
  matrix.rows=#matrix
  matrix.cols=#matrix[1]
  return matrix
end
 
function _MTX:dump()
  for _,r in ipairs(self) do
    print(unpack(r))
  end
end
 
function _MTX:perm() return self:det(1) end
function _MTX:det(perm)
  local det=0
  local jt=JT(self.cols)
  repeat
    local pi=perm or jt.sign
    for i,v in ipairs(jt.values) do
      pi=pi*self[i][v]
    end
    det=det+pi
  until not jt:next()
  return det
end
 
function IsOnPlane(a,b,c,d,e,f)
  local det1 = MTX{
      {a.x, b.x, c.x, d.x},
      {a.y, b.y, c.y, d.y},
      {a.z, b.z, c.z, d.z},
      {1  , 1  , 1  , 1  , 1  },
  }
  
  local det2 = MTX{
      {a.x, c.x, e.x, f.x},
      {a.y, c.y, e.y, f.y},
      {a.z, c.z, e.z, f.z},
      {1  , 1  , 1  , 1  , 1  },
  }
  

  return math.abs(det1:det()) < 0.1 and math.abs(det2:det()) < 0.1
end


Hour = 12

function GetTimeColorName()
    if Hour <= 5 or Hour >= 21 then
        return 'colorDarkest'
    end

    if Hour <= 7 or Hour >= 19 then
        return 'colorDarker'
    end

    return 'color'
end

function SetSprayTimeCorrectColor()
    for _, spray in pairs(SPRAYS) do
        Wait(0)

        local cIndex = 'color'

        if not spray.interior then
            cIndex = GetTimeColorName()
        end

        spray.color = COLORS[spray.originalColor][cIndex].hex
    end
end

Citizen.CreateThread(function()
    while true do
        Hour = GetClockHours()
        SetSprayTimeCorrectColor()
        Wait(10000)
    end
end)


-- Load fonts

Citizen.CreateThread(function()
    Wait(100)

    for _, fontData in pairs(FONTS) do
        RegisterFontFile(fontData.font)
        RegisterFontId(fontData.font)
    end
end)


local DBL_EPSILON = 2.2204460492503131E-16

function DrawPositionMatrix(start, normal)
    local stdStart = start - GetEntityForwardVector(PlayerPedId())
    DrawLine(
        stdStart.x, stdStart.y, stdStart.z,
        stdStart.x + 1.0, stdStart.y, stdStart.z,
        255, 0, 0, 255
    )
    
    DrawLine(
        stdStart.x, stdStart.y, stdStart.z,
        stdStart.x, stdStart.y + 1.0, stdStart.z,
        0, 0, 255, 255
    )
    
    DrawLine(
        stdStart.x, stdStart.y, stdStart.z,
        stdStart.x, stdStart.y, stdStart.z+1.0,
        0, 255, 0, 255
    )

    local newZ = normalize(vCross(normal, vector3(0, 0, 1)))
    local newX = normalize(vCross(normal, newZ))

    DrawLine(
        start.x, start.y, start.z,
        start.x + normal.x, start.y + normal.y, start.z + normal.z,
        255, 0, 0, 255
    )

    DrawLine(
        start.x, start.y, start.z,
        start.x + newZ.x, start.y + newZ.y, start.z + newZ.z,
        0, 255, 0, 255
    )

    DrawLine(
        start.x, start.y, start.z,
        start.x + newX.x, start.y + newX.y, start.z + newX.z,
        0, 0, 255, 255
    )

end

function vCross(v,u)
    local a, b, c = v.x, v.y, v.z
    local xOut = b * u.z - c * u.y
    local yOut = c * u.x - a * u.z
    local zOut = a * u.y - b * u.x
    return vector3(xOut, yOut, zOut)
end

function normalize(v)
    local len = #v
    return len == 0 and v or scale(v, 1/len)
end

function scale(v, s)
    return vector3(
        v.x * s,
        v.y * s,
        v.z * s
    )
end

-- 

