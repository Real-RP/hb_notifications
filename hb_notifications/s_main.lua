
AddEventHandler("onResourceStart", function(resource)
	if resource == GetCurrentResourceName() then
	
		if resource ~= 'hb_notifications' then
			--this is needed! It warns you if you rename the resource. Other resources that take access to this resource might not be able to send the messages, and that might cause problems.
			
			print("^8------------------------------------------------------------------------------------")
			print("^8------------------------------------------------------------------------------------")
			print("^8ERROR: Please rename "..GetCurrentResourceName().." to hb_notifications, otherwise it might not work properly...")
			print("^8------------------------------------------------------------------------------------")
			print("^8------------------------------------------------------------------------------------^0")
		end
	end
end)