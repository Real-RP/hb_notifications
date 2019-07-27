
if Config.TestMSG == true then
	RegisterCommand("sendtestmsg", function(source, args, rawCommand)
		TriggerEvent("hb_notifications:display", "top-right", color('#2fe80e', underlined("author:")).." "..big("Peter ").."likes his "..bold("chocolate Ice")..",".._break.."<hr>but if he "..strikethrough("drinks ").."thinks to "..italic("long").." about it, it will "..small("melt"), "blue", 14000, true) --position, text, color, time(milliseconds), notifications sound
	end)
end

RegisterNetEvent("hb_notifications:display")
AddEventHandler("hb_notifications:display", function(pos, msg, hue, time, sound)
	
	ShowNotify(pos, msg, hue, time, sound)
end)

function ShowNotify(pos, msg, hue, time, sound)
	if msg ~= nil and msg ~= "" then
		if time == nil then
			time = Config.DefaultFadeOut
		end
		
		
		TriggerEvent('message:show', pos, msg, hue)
		if sound == true then
			SendNUIMessage({message = 'play', sound = 'notification.ogg', volume = 0.3})
		end
		Wait(time)
		TriggerEvent('message:hide')
	else
		print("ERROR: A code of the server owner tried to draw a text with unknown values")
	end
end	
	

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if IsControlPressed(0, 177) then --if pressing backspace, the message will dissapear
			TriggerEvent('message:hide')
		end
	end
end)


			-- UI Events --

RegisterNetEvent('message:show')
AddEventHandler('message:show', function(pos, msg, hue)
	SendNUIMessage({
      type = "message",
	  position = pos,
      display = true,
	  message = msg,
	  color = hue
    })
end)

RegisterNetEvent('message:hide')
AddEventHandler('message:hide', function()
	SendNUIMessage({
      type = "message",
	  position = nil,
      display = false,
	  message = nil,
	  color = nil
    })
 end)
  
AddEventHandler("onResourceStart", function(resource) --keeps the message hidden as long as it is not called.
	if resource == GetCurrentResourceName() then
		TriggerEvent("message:hide", true)
	end
end)

AddEventHandler("onClientResourceStart", function(resource) --hides the boxes if someone connects
	if (resource == GetCurrentResourceName()) then
		TriggerEvent("message:hide", true)
	else
		return
	end
end)
