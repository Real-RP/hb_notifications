
if Config.TestMSG == true then
	RegisterCommand("sendtestmsg", function(source, args, rawCommand)
		TriggerEvent("hb_notifications:display", "top-right", "test this shit I'm out mm mmm mmmm", "rgb(255, 14, 88)", 14000)
	end)
end

RegisterNetEvent("hb_notifications:display")
AddEventHandler("hb_notifications:display", function(pos, msg, hue, time)
	
	ShowNotify(pos, msg, hue, time)
end)

function ShowNotify(pos, msg, hue, time)
	if msg ~= nil and msg ~= "" then
		if time == nil then
			time = Config.DefaultFadeOut
		end
		
		TriggerEvent('message:show', pos, msg, hue)
		Wait(time)
		TriggerEvent('message:hide')
	else
		print("ERROR: A code of the server owner tried to draw a text with unknown values")
	end
end	
	



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
