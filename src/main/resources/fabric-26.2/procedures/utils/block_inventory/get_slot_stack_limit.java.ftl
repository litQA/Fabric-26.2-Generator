private static int getBlockInventorySlotStackLimit(LevelAccessor world, BlockPos pos, int slot) {
	BlockEntity blockEntity = world.getBlockEntity(pos);
	if (blockEntity instanceof Container container && slot >= 0 && slot < container.getContainerSize())
		return Math.min(container.getMaxStackSize(), container.getItem(slot).getMaxStackSize());
	return 0;
}
