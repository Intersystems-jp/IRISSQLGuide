Class Sample.Jewel Extends Sample.Accesary
{

Property Material As %String(POPSPEC = "##class(Sample.PopulateUtils).Material()") [ SqlFieldName = 素材 ];

Storage Default
{
<Data name="JewelDefaultData">
<Subscript>"Jewel"</Subscript>
<Value name="1">
<Value>Material</Value>
</Value>
</Data>
<DefaultData>JewelDefaultData</DefaultData>
<ExtentSize>13</ExtentSize>
<Property name="%%CLASSNAME">
<AverageFieldSize>16</AverageFieldSize>
<OutlierSelectivity>.999999:"~Sample.Jewel~"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Madeof">
<AverageFieldSize>14.77</AverageFieldSize>
<Selectivity>12.5000%</Selectivity>
</Property>
<Property name="Material">
<AverageFieldSize>10.77</AverageFieldSize>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>11.85</AverageFieldSize>
<Selectivity>16.6667%</Selectivity>
</Property>
<Property name="Price">
<AverageFieldSize>4.85</AverageFieldSize>
<Selectivity>7.6923%</Selectivity>
</Property>
<Type>%Storage.Persistent</Type>
}

}
