<#include "mcitems.ftl">
Entity _entity${cbi} = ${input$entity};
CustomData _data${cbi} = _entity${cbi}.get(DataComponents.CUSTOM_DATA);
CompoundTag _tag${cbi} = _data${cbi} == null ? new CompoundTag() : _data${cbi}.copyTag();
_tag${cbi}.put(${input$tagName}, ItemStack.OPTIONAL_CODEC.encode(${mappedMCItemToItemStackCode(input$tagValue, 1)},
		_entity${cbi}.level().registryAccess().createSerializationContext(NbtOps.INSTANCE), new CompoundTag()).result().orElseGet(CompoundTag::new));
_entity${cbi}.setComponent(DataComponents.CUSTOM_DATA, CustomData.of(_tag${cbi}));
