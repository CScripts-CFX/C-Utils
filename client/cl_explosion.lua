local Explosions = {3, 5, 6, 4, 11, 13, 17, 21, 22, 23, 25, 26, 27, 28, 29, 31}

function Explode()
    return Explosions[math.random(#Explosions)]
end

function Shake()
    return (math.random() + math.random(1, 99))
end

function Explosion(x, y, z, amountofexplosions)
    for i = 1, amountofexplosions do
        AddExplosion(x,y,z, Explode(), (Shake() / 100), true, false, 0.3)
        Wait(math.random(10, 500))
    end

    return true
end

exports('AddExplosion', Explosion) -- exports.c-utils:AddExplosion(x, y, z, amountofexplosions)
