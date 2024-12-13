Class Sample.Supplier Extends (%Persistent, %Populate, %XML.Adaptor)
{

Property Name As %String(POPSPEC = "##Class(Sample.PopulateUtils).String()");

Property Address As Sample.Address1;

Storage Default
{
<Data name="SupplierDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Address</Value>
</Value>
</Data>
<DataLocation>^Sample.SupplierD</DataLocation>
<DefaultData>SupplierDefaultData</DefaultData>
<IdLocation>^Sample.SupplierD</IdLocation>
<IndexLocation>^Sample.SupplierI</IndexLocation>
<StreamLocation>^Sample.SupplierS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
