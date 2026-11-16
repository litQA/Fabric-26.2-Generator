private static ItemStack extractFromBlockInventory(LevelAccessor world, BlockPos pos, int slot, int amount, boolean simulate) {
	BlockEntity blockEntity = world.getBlockEntity(pos);
	if (blockEntity instanceof Container container && slot >= 0 && slot < container.getContainerSize()) {
		ItemStack existing = container.getItem(slot);
		if (existing.isEmpty() || amount <= 0)
			return ItemStack.EMPTY;
		int extracted = Math.min(amount, existing.getCount());
		ItemStack result = existing.copy();
		result.setCount(extracted);
		if (!simulate) {
			existing.shrink(extracted);
			if (existing.isEmpty())
				container.setItem(slot, ItemStack.EMPTY);
			container.setChanged();
		}
		return result;
	}
	return ItemStack.EMPTY;
}
