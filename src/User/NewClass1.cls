Class User.NewClass1 Extends (%Persistent, %Populate) [ SqlTableName = tblNewClass1 ]
{

Property Prop1 As %String [ SqlFieldName = Name ];

Property Prop2 As %Date [ SqlFieldName = Dt ];

Property Prop3 As %Integer [ SqlFieldName = Number ];

Property Prop4 As array Of NewClass2 [ SqlFieldName = tblNewClass2 ];

Storage Default
{
<Data name="NewClass1DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Prop1</Value>
</Value>
<Value name="3">
<Value>Prop2</Value>
</Value>
<Value name="4">
<Value>Prop3</Value>
</Value>
</Data>
<Data name="Prop4">
<Attribute>Prop4</Attribute>
<Structure>subnode</Structure>
<Subscript>"Prop4"</Subscript>
</Data>
<DataLocation>^User.NewClass1D</DataLocation>
<DefaultData>NewClass1DefaultData</DefaultData>
<ExtentSize>100</ExtentSize>
<IdLocation>^User.NewClass1D</IdLocation>
<IndexLocation>^User.NewClass1I</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(1,7,14,21,28,35,42,49,56,63,70,76,82,88,94,100),$lb(0,0,0,1,0,0,1,0,0,0,1,0,1,0,0),"")</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="Prop1">
<AverageFieldSize>6.88</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" A1093"," B5852"," C3954"," E4957"," H239"," I468"," J3418"," K4742"," M5748"," Q191"," S2517"," T5618"," V2328"," V9274"," Y3077"," Z8233"),$lb(1,1,1,1,1,1,1,1,1,1,1,1,2,1,1),$lb(541143344,1093742649,1110784053,1110784053,1127430453,1127430453,1161050421,1161050421,1211249465,1211249465,1228158520,1228158520,1244869681,1244869681,1261713204,1261713204,1295333172,1295333172,1362180401,1362180401,1395799345,1395799345,1412773425,1412773425,1446130482,842215992,959592244,1446588983,1496526903,1496526903,1513632307,542783538))</Histogram>
<Selectivity>1.0000%</Selectivity>
</Property>
<Property name="Prop2">
<AverageFieldSize>4.06</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(30170,32105,34201,36655,37860,40866,45849,48749,51808,53405,57273,58153,60585,63086,65498,66678),$lb(1,1,1,1,0,1,1,0,1,1,1,0,1,1,1),"")</Histogram>
<Selectivity>1.0000%</Selectivity>
</Property>
<Property name="Prop3">
<AverageFieldSize>5.98</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(163969,87480504,185961356,240663876,273440382,365725752,461277840,550829122,596643776,671264735,742852565,765717997,818497849,860035550,898058018,984257655),$lb(0,0,0,1,0,0,0,1,0,0,1,0,1,1,0),"")</Histogram>
<Selectivity>1.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^User.NewClass1S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
