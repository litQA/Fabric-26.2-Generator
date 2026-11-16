<#include "mcelements.ftl">
<@addTemplate file="utils/block_nbt/get_tag.java.ftl"/>
(getBlockNbt(world, ${toBlockPos(input$x, input$y, input$z)}).getStringOr(${input$tagName}, ""))
