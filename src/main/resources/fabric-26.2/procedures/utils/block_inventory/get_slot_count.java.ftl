private static int getBlockInventorySlotCount(LevelAccessor world, BlockPos pos) {
	BlockEntity blockEntity = world.getBlockEntity(pos);
	if (blockEntity instanceof Container container)
		return container.getContainerSize();
	return 0;
}
