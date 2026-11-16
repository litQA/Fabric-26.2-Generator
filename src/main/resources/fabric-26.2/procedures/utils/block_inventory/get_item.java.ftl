private static ItemStack itemFromBlockInventory(LevelAccessor world, BlockPos pos, int slot) {
	BlockEntity blockEntity = world.getBlockEntity(pos);
	if (blockEntity instanceof Container container && slot >= 0 && slot < container.getContainerSize())
		return container.getItem(slot);
	return ItemStack.EMPTY;
}
