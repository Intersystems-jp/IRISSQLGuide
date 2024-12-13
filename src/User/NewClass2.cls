Class User.NewClass2 Extends (%Persistent, %Populate) [ SqlTableName = tblNewClass2 ]
{

Property Prop1 As %String [ SqlFieldName = Name ];

Property Prop2 As %Date [ SqlFieldName = Dt ];

Property Prop3 As %Integer [ SqlFieldName = Number ];

Storage Default
{
<Data name="NewClass2DefaultData">
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
<DataLocation>^User.NewClass2D</DataLocation>
<DefaultData>NewClass2DefaultData</DefaultData>
<ExtentSize>10000</ExtentSize>
<IdLocation>^User.NewClass2D</IdLocation>
<IndexLocation>^User.NewClass2I</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3.97</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(1,667,1334,2001,2668,3335,4002,4669,5336,6003,6670,7336,8002,8668,9334,10000),$lb(0,0,0,1,0,0,1,0,0,1,0,0,1,0,0),"")</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="Prop1">
<AverageFieldSize>6.89</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" A1006"," B7947"," D5342"," F3903"," H1056"," I8058"," K5837"," M3851"," N9815"," P7952"," R5333"," T289"," U9350"," W6324"," Y3181"," Z9993"),$lb(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),$lb(541143344,1093742640,1110915380,1110915380,1144337204,1144337204,1177762096,1177762096,1211183157,1211183157,1228419125,1228419125,1261778995,1261778995,1295202357,1295202357,1312372785,1312372785,1345796405,1345796405,1379218227,1379218227,1412577337,1412577337,1429812021,1429812021,1463169842,1463169842,1496527160,1496527160,1513699641,542783801))</Histogram>
<Selectivity>0.0102%</Selectivity>
</Property>
<Property name="Prop2">
<AverageFieldSize>4.04</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(30004,32426,34809,37357,39898,42526,45000,47332,49793,52320,54806,57134,59615,62142,64629,67186),$lb(1,1,1,1,0,1,1,1,0,1,1,1,0,1,1),"")</Histogram>
<Selectivity>0.0115%</Selectivity>
</Property>
<Property name="Prop3">
<AverageFieldSize>5.98</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(32561,64650667,132396193,203563362,269612125,334773911,402092254,471482476,537085984,600213946,665995775,737380344,804229059,867704047,933806699,999817963),$lb(0,0,0,1,0,0,1,0,0,1,0,0,1,0,1),"")</Histogram>
<Selectivity>0.0100%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-132</BlockCount>
</SQLMap>
<StreamLocation>^User.NewClass2S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
