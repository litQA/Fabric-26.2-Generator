<#--
 # This file is part of Fabric-Generator-MCreator.
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2026, Pylo, opensource contributors
 # Copyright (C) 2020-2026, Goldorion, opensource contributors
 #
 # Fabric-Generator-MCreator is free software: you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 #
 # Fabric-Generator-MCreator is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
 # along with Fabric-Generator-MCreator. If not, see <https://www.gnu.org/licenses/>.
-->

<#-- @formatter:off -->

<#include "../mcitems.ftl">

package ${package}.world.features.treedecorators;

public class ${name}FruitDecorator extends CocoaDecorator {

	public static MapCodec<${name}FruitDecorator> CODEC = MapCodec.unit(${name}FruitDecorator::new);

	public static TreeDecoratorType<?> DECORATOR_TYPE = new TreeDecoratorType<>(CODEC);

	private final float probability = 0.2f;

	public ${name}FruitDecorator() {
		super(0.2f);
	}

	@Override protected TreeDecoratorType<?> type() {
		return DECORATOR_TYPE;
	}

	@Override
	public void place(TreeDecorator.Context context) {
		RandomSource random = context.random();
		if (random.nextFloat() >= this.probability) {
			return;
		}

		var logs = context.logs();
		if (logs.isEmpty()) {
			return;
		}

		int y = logs.getFirst().getY();
		logs.stream().filter(pos -> pos.getY() - y <= 2).forEach(pos -> {
			for (Direction direction : Direction.Plane.HORIZONTAL) {
				if (random.nextFloat() <= 0.25F) {
					Direction opposite = direction.getOpposite();
					BlockPos fruitPos = pos.offset(opposite.getStepX(), 0, opposite.getStepZ());
					if (context.isAir(fruitPos)) {
						context.setBlock(fruitPos, oriented(${mappedBlockToBlockStateCode(data.treeFruits)}, opposite));
					}
				}
			}
		});
	}

	@SuppressWarnings("deprecation") private static BlockState oriented(BlockState blockstate, Direction direction) {
		return switch (direction) {
			case SOUTH -> blockstate.rotate(Rotation.CLOCKWISE_180);
			case EAST -> blockstate.rotate(Rotation.CLOCKWISE_90);
			case WEST -> blockstate.rotate(Rotation.COUNTERCLOCKWISE_90);
			default -> blockstate;
		};
	}

}
<#-- @formatter:on -->
