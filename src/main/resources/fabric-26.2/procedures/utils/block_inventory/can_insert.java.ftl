private static boolean canInsertInBlockInventory(LevelAccessor world, BlockPos pos, int slot, int amount, ItemStack itemstack) {
	BlockEntity blockEntity = world.getBlockEntity(pos);
	if (blockEntity instanceof Container container && slot >= 0 && slot < container.getContainerSize()) {
		ItemStack existing = container.getItem(slot);
		if (existing.isEmpty())
			return amount <= Math.min(container.getMaxStackSize(), itemstack.getMaxStackSize()) && container.canPlaceItem(slot, itemstack);
		return existing.getItem() == itemstack.getItem()
				&& ItemStack.isSameItemSameComponents(existing, itemstack)
				&& existing.getCount() + amount <= Math.min(container.getMaxStackSize(), existing.getMaxStackSize());
	}
	return false;
}
