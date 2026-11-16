<#include "mcelements.ftl">
<@addTemplate file="utils/block_nbt/get_tag.java.ftl"/>
/*@ItemStack*/(ItemStack.OPTIONAL_CODEC
		.parse(getBlockNbtRegistryAccess(world).createSerializationContext(NbtOps.INSTANCE),
				getBlockNbt(world, ${toBlockPos(input$x, input$y, input$z)}).getCompoundOrEmpty(${input$tagName}))
		.result().orElse(ItemStack.EMPTY))
