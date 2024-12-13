Class Sample.Accesary Extends (%Persistent, %Populate, %XML.Adaptor)
{

Property Name As %String(POPSPEC = "##Class(Sample.PopulateUtils).String()") [ Required, SqlFieldName = 名前 ];

Property Price As %Integer(MAXVAL = 1000000, MINVAL = 0) [ SqlFieldName = 価格 ];

Property Madeof As %String(POPSPEC = "##Class(Sample.PopulateUtils).String()") [ SqlFieldName = 製造元 ];

/// Sample.Accesary、Sample.Jewel、Sample.Watch　の自動生成
ClassMethod CreateAll(n As %String = 10)
{
	for i=1:1:n*2 {
		set flg=$random(2)
		if flg=0 {
			Do ##class(Sample.Jewel).Populate(1)
		}
		else {
			do ##class(Sample.Watch).Populate(1)
		}
	}
}

/// Sample.Accesary、Sample.Jewel、Sample.Watch　の一括削除
ClassMethod DestroyAll()
{
	do ##class(Sample.Accesary).%KillExtent()
}

Method OnPopulate() As %Status [ ServerOnly = 1 ]
{
	if ..%ClassName(1)="Sample.Jewel" {
		set ..Name=##class(Sample.PopulateUtils).AccesaryName(0)
	}
	else {
		set ..Name=##class(Sample.PopulateUtils).AccesaryName(1)
	}
	quit $$$OK
}

Storage Default
{
<Data name="AccesaryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Price</Value>
</Value>
<Value name="4">
<Value>Madeof</Value>
</Value>
</Data>
<DataLocation>^Sample.AccesaryD</DataLocation>
<DefaultData>AccesaryDefaultData</DefaultData>
<IdLocation>^Sample.AccesaryD</IdLocation>
<IndexLocation>^Sample.AccesaryI</IndexLocation>
<StreamLocation>^Sample.AccesaryS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
