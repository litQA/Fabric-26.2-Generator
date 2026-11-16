<#include "procedures.java.ftl">
public ${name}Procedure() {
	UseItemCallback.EVENT.register((player, level, hand) -> {
		// UseItemCallback also runs on the client. Let the server run the procedure so its
		// side effects and cancellation are authoritative.
		if (level.isClientSide())
			return InteractionResult.PASS;
		<#assign dependenciesCode>
			<@procedureDependenciesCode dependencies, {
			"x": "player.getX()",
			"y": "player.getY()",
			"z": "player.getZ()",
			"world": "level",
			"entity": "player"
			}/>
		</#assign>
		if (hand == player.getUsedItemHand())
			execute(${dependenciesCode});
		boolean result = eventResult;
		eventResult = true;
		return result ? InteractionResult.PASS : InteractionResult.FAIL;
	});
}
