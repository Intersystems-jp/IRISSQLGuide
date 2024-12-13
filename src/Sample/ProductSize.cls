Class Sample.ProductSize Extends (%Persistent, %Populate, %XML.Adaptor)
{

Property Price As %Integer;

Relationship ProductStocks As Sample.ProductStock [ Cardinality = children, Inverse = TheProductSize ];

Property SSize As %String(POPSPEC = "ValueList("",S,M,LL,LLL,XL""):2", VALUELIST = ",S,M,L,LL,LLL,XL");

Property PID As %Integer [ Calculated, SqlComputeCode = { Set {PID}=##class(Sample.ProductSize).GetPID({ID})}, SqlComputed ];

Relationship TheProduct As Sample.Product [ Cardinality = parent, Inverse = ProductSizes ];

Index SizeIndex1 On SSize;

ClassMethod GetPID(ID As %String) As %Integer
{
 	set statement=##class(%SQL.Statement).%New()
 	set st=statement.%Prepare("SELECT TheProduct FROM Sample.ProductSize WHERE ID = ?")
	set rset=statement.%Execute(ID)
	While (rset.%Next()) {
 		Set pid=rset.TheProduct
	}
	Quit pid
}

Storage Default
{
<Data name="ProductSizeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SSize</Value>
</Value>
<Value name="3">
<Value>Price</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("ProductSizes")</DataLocation>
<DefaultData>ProductSizeDefaultData</DefaultData>
<IdLocation>^Sample.ProductC("ProductSizes")</IdLocation>
<IndexLocation>^Sample.ProductSizeI</IndexLocation>
<StreamLocation>^Sample.ProductSizeS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
