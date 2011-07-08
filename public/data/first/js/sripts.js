$(document).ready(function(){
    $(".rounded").each(function(){
		$(this).corner("round");
	});
	$(".sm-block").each(function(){
		$(this).corner("round");
	});
  });



/*
  И вызываем функцию corner():
$("div.rounded").corner("effect corners width");

    * effect — название эффекта, например round или bevel. По умолчанию — round.
    * corners — углы, к которым применяется эффект. Может принимать значения top (верхние правый и левый), bottom (нижние правый и левый), tr (верхний правый), tl (верхний левый), br (нижний правый) или bl (нижний левый). По умолчанию эффект применяется ко всем углам.
    *
    * width — радиус скругления (ширина эффекта) в пикселях. По умолчанию — 10px.

Поскольку для effect, corners и width предусмотрены значения по умолчанию, допускается вызвать функцию corner() так:
$("div.rounded").corner();
*/

