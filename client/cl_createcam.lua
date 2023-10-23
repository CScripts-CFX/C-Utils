local cam;

exports('CreateCam', function(data)
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA")
    SetCamCoord(cam, data.coords)
    SetCamRot(cam, 0.0, 0.0, data.rotation)
    SetCamActive(cam, true)
    if data.pointcam then
        PointCamAtCoord(cam, data.pointcam)
    end
    RenderScriptCams(true, false, 1000, true, true)

    return cam
end)

exports('DestroyCam', function()

    DestroyCam(cam, true)
    RenderScriptCams(false, false, 1000, true, true)
    SetCamActive(cam, false)
    cam = nil
 
end)