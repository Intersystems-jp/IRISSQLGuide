Class Sample.Customer Extends (%Persistent, %Populate, %XML.Adaptor)
{

Index NameIndex On Name;

Index TelnoIndex On Telno;

Projection JavaProjection1 As %Projection.Java;

Query ByName(Name As %String) As %SQLQuery(CONTAINID = 1)
{
SELECT %ID,Name,Telno FROM Customer
 WHERE (Name %STARTSWITH :Name)
}

Query ByTelno(Telno As %String) As %SQLQuery(CONTAINID = 1)
{
SELECT %ID,Name,Telno FROM Customer
 WHERE (Telno %STARTSWITH :Telno)
}

Property Address1 As Address2;

Property Name As %String(POPSPEC = "##Class(Sample.PopulateUtils).Company()");

Property Telno As %String(POPSPEC = "##Class(Sample.PopulateUtils).JPNPhone()");

Storage Default
{
<Data name="CustomerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Address1</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
<Value name="4">
<Value>Telno</Value>
</Value>
</Data>
<DataLocation>^Sample.CustomerD</DataLocation>
<DefaultData>CustomerDefaultData</DefaultData>
<IdLocation>^Sample.CustomerD</IdLocation>
<IndexLocation>^Sample.CustomerI</IndexLocation>
<StreamLocation>^Sample.CustomerS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
