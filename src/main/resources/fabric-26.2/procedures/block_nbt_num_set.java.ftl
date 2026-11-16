<#include "mcelements.ftl">
<@addTemplate file="utils/block_nbt/get_tag.java.ftl"/>
{
	BlockPos _pos${cbi} = ${toBlockPos(input$x, input$y, input$z)};
	CompoundTag _tag${cbi} = getBlockNbt(world, _pos${cbi});
	_tag${cbi}.putDouble(${input$tagName}, ${input$tagValue});
	setBlockNbt(world, _pos${cbi}, _tag${cbi});
}
