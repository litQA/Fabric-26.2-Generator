private static int insertInBlockInventory(LevelAccessor world, BlockPos pos, int slot, int amount, ItemStack itemstack, boolean simulate) {
	BlockEntity blockEntity = world.getBlockEntity(pos);
	if (blockEntity instanceof Container container && slot >= 0 && slot < container.getContainerSize()) {
		ItemStack existing = container.getItem(slot);
		int limit = Math.min(container.getMaxStackSize(), itemstack.getMaxStackSize());
		if (existing.isEmpty()) {
			if (!container.canPlaceItem(slot, itemstack))
				return amount;
			int inserted = Math.min(amount, limit);
			if (inserted > 0 && !simulate) {
				ItemStack stack = itemstack.copy();
				stack.setCount(inserted);
				container.setItem(slot, stack);
				container.setChanged();
			}
			return amount - Math.max(0, inserted);
		}
		if (existing.getItem() == itemstack.getItem() && ItemStack.isSameItemSameComponents(existing, itemstack)
				&& container.canPlaceItem(slot, itemstack)) {
			int inserted = Math.min(amount, limit - existing.getCount());
			if (inserted > 0 && !simulate) {
				existing.grow(inserted);
				container.setChanged();
			}
			return amount - Math.max(0, inserted);
		}
	}
	return amount;
}
