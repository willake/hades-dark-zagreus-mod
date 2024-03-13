function DarkZagreusAI( enemy, currentRun )
	local followDistance = 300
	local bufferDistance = 50
	while IsAIActive( enemy, currentRun ) do

		-- Move to player
		Move({ Id = enemy.ObjectId, DestinationId = currentRun.Hero.ObjectId, Mode = "Precise" })

		-- Wait until within attack range
		enemy.AINotifyName = "WithinDistance"..enemy.ObjectId
		NotifyWithinDistance({ Id = enemy.ObjectId, DestinationId = currentRun.Hero.ObjectId, Distance = followDistance, Notify = enemy.AINotifyName, Timeout = 5.0 })
		waitUntil( enemy.AINotifyName )

		Stop({ Id = enemy.ObjectId })

		enemy.AINotifyName = "OutsideDistance"..enemy.ObjectId
		NotifyOutsideDistance({ Id = enemy.ObjectId, DestinationId = currentRun.Hero.ObjectId, Distance = followDistance + bufferDistance, Notify = enemy.AINotifyName })
		waitUntil( enemy.AINotifyName )

	end
end