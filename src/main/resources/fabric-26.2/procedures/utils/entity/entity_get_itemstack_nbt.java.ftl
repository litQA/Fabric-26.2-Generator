private static ItemStack getItemStackNbtFromEntity(Entity entity, String tagName) {
	CustomData data = entity.get(DataComponents.CUSTOM_DATA);
	return ItemStack.OPTIONAL_CODEC
			.parse(entity.level().registryAccess().createSerializationContext(NbtOps.INSTANCE),
					data == null ? new CompoundTag() : data.copyTag().getCompoundOrEmpty(tagName))
			.result().orElse(ItemStack.EMPTY);
}
