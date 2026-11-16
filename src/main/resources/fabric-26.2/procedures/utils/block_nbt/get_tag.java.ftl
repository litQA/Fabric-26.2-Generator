private static CompoundTag getBlockNbt(LevelAccessor world, BlockPos pos) {
	BlockEntity blockEntity = world.getBlockEntity(pos);
	if (blockEntity == null)
		return new CompoundTag();
	return ((net.fabricmc.fabric.api.attachment.v1.AttachmentTarget) blockEntity).getAttachedOrCreate(${JavaModName}.BLOCK_NBT);
}

private static void setBlockNbt(LevelAccessor world, BlockPos pos, CompoundTag tag) {
	BlockEntity blockEntity = world.getBlockEntity(pos);
	if (blockEntity != null) {
		((net.fabricmc.fabric.api.attachment.v1.AttachmentTarget) blockEntity).setAttached(${JavaModName}.BLOCK_NBT, tag);
		blockEntity.setChanged();
		if (world instanceof Level level) {
			BlockState blockState = world.getBlockState(pos);
			level.sendBlockUpdated(pos, blockState, blockState, 3);
		}
	}
}

private static net.minecraft.core.RegistryAccess getBlockNbtRegistryAccess(LevelAccessor world) {
	return world instanceof Level level ? level.registryAccess() : net.minecraft.core.RegistryAccess.EMPTY;
}
