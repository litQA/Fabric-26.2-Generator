<#include "procedures.java.ftl">
public ${name}Procedure() {
	ItemEvents.USE_ON.register(context -> {
		if (context.getPlayer() == null || !(context.getItemInHand().getItem() instanceof net.minecraft.world.item.BoneMealItem))
			return null;
		net.minecraft.world.entity.player.Player entity = context.getPlayer();
		net.minecraft.core.BlockPos position = context.getClickedPos();
		net.minecraft.world.level.block.state.BlockState blockstate = context.getLevel().getBlockState(position);
		<#assign dependenciesCode>
			<@procedureDependenciesCode dependencies, {
				"x": "position.getX()",
				"y": "position.getY()",
				"z": "position.getZ()",
				"world": "entity.level()",
				"itemstack": "context.getItemInHand()",
				"entity": "entity",
				"blockstate": "blockstate"
			}/>
		</#assign>
		execute(${dependenciesCode});
		boolean result = eventResult;
		eventResult = true;
		return result ? net.minecraft.world.InteractionResult.PASS : net.minecraft.world.InteractionResult.FAIL;
	});
}
