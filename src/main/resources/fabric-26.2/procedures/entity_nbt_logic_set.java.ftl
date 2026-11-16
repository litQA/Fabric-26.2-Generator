{
	net.minecraft.world.entity.Entity _entity = ${input$entity};
	net.minecraft.nbt.CompoundTag _tag = _entity.get(net.minecraft.core.component.DataComponents.CUSTOM_DATA) != null ? _entity.get(net.minecraft.core.component.DataComponents.CUSTOM_DATA).copyTag() : new net.minecraft.nbt.CompoundTag();
	_tag.putBoolean(${input$tagName}, ${input$tagValue});
	_entity.setComponent(net.minecraft.core.component.DataComponents.CUSTOM_DATA, net.minecraft.world.item.component.CustomData.of(_tag));
}
