<#include "mcelements.ftl">
<#include "mcitems.ftl">
<@addTemplate file="utils/block_nbt/get_tag.java.ftl"/>
{
	BlockPos _pos${cbi} = ${toBlockPos(input$x, input$y, input$z)};
	CompoundTag _tag${cbi} = getBlockNbt(world, _pos${cbi});
	_tag${cbi}.put(${input$tagName}, ItemStack.OPTIONAL_CODEC.encode(${mappedMCItemToItemStackCode(input$tagValue, 1)},
			getBlockNbtRegistryAccess(world).createSerializationContext(NbtOps.INSTANCE), new CompoundTag()).result().orElseGet(CompoundTag::new));
	setBlockNbt(world, _pos${cbi}, _tag${cbi});
}
