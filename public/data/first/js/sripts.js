$(document).ready(function(){
    $(".rounded").each(function(){
		$(this).corner("round");
	});
	$(".sm-block").each(function(){
		$(this).corner("round");
	});
  });



/*
  � �������� ������� corner():
$("div.rounded").corner("effect corners width");

    * effect � �������� �������, �������� round ��� bevel. �� ��������� � round.
    * corners � ����, � ������� ����������� ������. ����� ��������� �������� top (������� ������ � �����), bottom (������ ������ � �����), tr (������� ������), tl (������� �����), br (������ ������) ��� bl (������ �����). �� ��������� ������ ����������� �� ���� �����.
    *
    * width � ������ ���������� (������ �������) � ��������. �� ��������� � 10px.

��������� ��� effect, corners � width ������������� �������� �� ���������, ����������� ������� ������� corner() ���:
$("div.rounded").corner();
*/

