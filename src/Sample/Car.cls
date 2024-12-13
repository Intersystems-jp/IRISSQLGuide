Class Sample.Car Extends (%Persistent, %Populate, %XML.Adaptor)
{

Property Maker As Supplier;

Property Name As %String(POPSPEC = "##Class(Sample.PopulateUtils).String()");

Storage Default
{
<Data name="CarDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Maker</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
</Data>
<DataLocation>^Sample.CarD</DataLocation>
<DefaultData>CarDefaultData</DefaultData>
<ExtentSize>10</ExtentSize>
<IdLocation>^Sample.CarD</IdLocation>
<IndexLocation>^Sample.CarI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Maker">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>14.2857%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>15.4</AverageFieldSize>
<Selectivity>14.2857%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Sample.CarS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
