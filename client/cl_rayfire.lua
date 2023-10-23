function GetMapObject(x, y, z, radius, objectname)
    local destruct = {}
    destruct.rawobject = GetRayfireMapObject(x, y, z, radius, objectname)

    function destruct:DoesExist()
        return DoesRayfireMapObjectExist(self.rawobject)
    end
    
    function destruct:SetState(state)
        SetStateOfRayfireMapObject(self.rawobject, state or 6)
    end

    function destruct:GetState()
        return GetStateOfRayfireMapObject(self.rawobject)
    end
    
    function destruct:resetState()
        SetStateOfRayfireMapObject(self.rawobject, 4)
    end

    return destruct
end

exports('GetMapObject', GetMapObject)