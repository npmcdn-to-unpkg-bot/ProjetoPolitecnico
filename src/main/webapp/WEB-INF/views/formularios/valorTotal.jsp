<div ng-if="item.quantidade > 0 && item.valorUnit > 0">
	<div class="form-group">
		<span ng-if="item.ajuda" class="text-success fa fa-check-circle"></span>
		
		<label for="total">Valor Total <strong>R$</strong></label>
		<input type="text" class="form-control" name="total" placeholder="Valor Total" value="{{item.quantidade * item.valorUnit | currency}}" disabled>
	</div>
</div>