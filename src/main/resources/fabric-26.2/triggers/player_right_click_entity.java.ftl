<#include "procedures.java.ftl">
public ${name}Procedure() {
	UseEntityCallback.EVENT.register((player, level, hand, entity, hitResult) -> {
		// UseEntityCallback also runs on the client. Let the server run the procedure so its
		// side effects and cancellation are authoritative.
		if (level.isClientSide())
			return InteractionResult.PASS;
		<#assign dependenciesCode>
			<@procedureDependenciesCode dependencies, {
			"x": "entity.getX()",
			"y": "entity.getY()",
			"z": "entity.getZ()",
			"world": "level",
			"entity": "entity",
			"sourceentity": "player"
			}/>
		</#assign>
		if (hand == player.getUsedItemHand())
		    execute(${dependenciesCode});
		boolean result = eventResult;
		eventResult = true;
		return result ? InteractionResult.PASS : InteractionResult.FAIL;
	});
}
