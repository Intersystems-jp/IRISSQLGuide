Class Sample.OrderItem Extends %Persistent [ SqlTableName = 注文明細 ]
{

Relationship TheProductStock As Sample.ProductStock [ Cardinality = one, Inverse = OrderItems ];

Index TheProductStockIndex On TheProductStock;

Property Quantity As %Integer;

Relationship TheOrder As Sample.Order [ Cardinality = parent, Inverse = Items ];

Storage Default
{
<Data name="OrderItemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>NoOfUnit</Value>
</Value>
<Value name="3">
<Value>ProductId</Value>
</Value>
<Value name="4">
<Value>Color</Value>
</Value>
<Value name="5">
<Value>PSize</Value>
</Value>
<Value name="6">
<Value>Quantity</Value>
</Value>
<Value name="7">
<Value>TheProductStock</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Items")</DataLocation>
<DefaultData>OrderItemDefaultData</DefaultData>
<IdLocation>^Sample.OrderC("Items")</IdLocation>
<IndexLocation>^Sample.OrderItemI</IndexLocation>
<StreamLocation>^Sample.OrderItemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
