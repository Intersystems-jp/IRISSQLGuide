Class Sample.Watch Extends Sample.Accesary
{

Property Waterproof As %Boolean [ SqlFieldName = 防水 ];

Storage Default
{
<Data name="WatchDefaultData">
<Subscript>"Watch"</Subscript>
<Value name="1">
<Value>Waterproof</Value>
</Value>
</Data>
<DefaultData>WatchDefaultData</DefaultData>
<ExtentSize>7</ExtentSize>
<Property name="%%CLASSNAME">
<AverageFieldSize>16</AverageFieldSize>
<OutlierSelectivity>.999999:"~Sample.Watch~"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Madeof">
<AverageFieldSize>13.43</AverageFieldSize>
<Selectivity>16.6667%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>18.57</AverageFieldSize>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="Price">
<AverageFieldSize>4.86</AverageFieldSize>
<Selectivity>14.2857%</Selectivity>
</Property>
<Property name="Waterproof">
<AverageFieldSize>2.43</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Type>%Storage.Persistent</Type>
}

}
