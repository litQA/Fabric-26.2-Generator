<#include "procedures.java.ftl">
public ${name}Procedure() {
	BlockEvents.USE_ITEM_ON.register((itemstack, blockstate, world, pos, entity, hand, hit) -> {
		if (entity == null || itemstack.getCount() <= 1 || !(itemstack.getItem() instanceof net.minecraft.world.item.BlockItem blockItem))
			return net.minecraft.world.InteractionResult.PASS;
		net.minecraft.core.BlockPos position = pos.relative(hit.getDirection());
		net.minecraft.world.level.block.state.BlockState placed = blockItem.getBlock().defaultBlockState();
		<#assign dependenciesCode>
			<@procedureDependenciesCode dependencies, {
				"x": "position.getX()",
				"y": "position.getY()",
				"z": "position.getZ()",
				"px": "entity.getX()",
				"py": "entity.getY()",
				"pz": "entity.getZ()",
				"world": "entity.level()",
				"entity": "entity",
				"blockstate": "placed",
				"placedagainst": "blockstate"
			}/>
		</#assign>
		execute(${dependenciesCode});
		boolean result = eventResult;
		eventResult = true;
		return result ? net.minecraft.world.InteractionResult.PASS : net.minecraft.world.InteractionResult.FAIL;
	});
}
