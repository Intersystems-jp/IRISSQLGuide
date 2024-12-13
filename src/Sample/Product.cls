Class Sample.Product Extends (%Persistent, %Populate, %XML.Adaptor)
{

Relationship ProductSizes As Sample.ProductSize [ Cardinality = children, Inverse = TheProduct ];

Index NameIndex1 On Name;

Projection JavaProjection1 As %Projection.Java;

Property Name As %String;

Property Supplier As Sample.Supplier;

Storage Default
{
<Data name="ProductDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Supplier</Value>
</Value>
</Data>
<DataLocation>^Sample.ProductD</DataLocation>
<DefaultData>ProductDefaultData</DefaultData>
<IdLocation>^Sample.ProductD</IdLocation>
<IndexLocation>^Sample.ProductI</IndexLocation>
<StreamLocation>^Sample.ProductS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
