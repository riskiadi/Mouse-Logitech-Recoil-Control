-- (Modified By Alkalynx)
-- (NUMLOCK = ON/OFF)

-- Global Variable
speedVal= 30

function OnEvent(event, arg)

    OutputLogMessage("event = %s, arg = %d\n", event, arg)
    
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true)
    elseif event == "PROFILE_DEACTIVATED" then
        ReleaseMouseButton(2) -- to prevent it from being stuck on
        ReleaseMouseButton(1) -- to prevent it from being stuck on
    end
    
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then
        repeat
         Sleep(100)
         speedVal=speedVal+1
         OutputLogMessage(speedVal)
        until not IsMouseButtonPressed(4)
    end
    
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 5) then
        repeat
            Sleep(100)
            if(speedVal<=0)then
                speedVal = 0
            else
                speedVal=speedVal-1
            end
            OutputLogMessage(speedVal)
        until not IsMouseButtonPressed(5)
    end
    
    if IsKeyLockOn("numlock" )then
        if (event == "MOUSE_BUTTON_PRESSED" and arg == 1) then
            repeat
            Sleep(speedVal)
            MoveMouseRelative(0, 1)
            until not IsMouseButtonPressed(1)
        end
    end
end