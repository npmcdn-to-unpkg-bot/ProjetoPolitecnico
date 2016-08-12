<div class="form-group">
	<span class="text-danger fa fa-close" ng-if="item.ajuda && !item.valorUnit || item.valorUnit > 999999999 || item.valorUnit <= 0"></span>
	<span class="text-success fa fa-check-circle" ng-if="item.ajuda && item.valorUnit > 0 && item.valorUnit <= 999999999"></span>	
								
	<label for="valorUnit">{{valorUnitario}} <strong>R$</strong></label>
	<input type="text" class="form-control" name="valorUnit" ng-model="item.valorUnit" ng-currency placeholder="Valor Unitário" required>
	<input type="hidden" name="valorUnitario" value="{{item.valorUnit}}" ng-model="item.valorUnitario" ui-number>
	
	<small class="text-danger" ng-if="item.ajuda && !item.valorUnit" style="margin-left: 3%;">
		*campo obrigatório, apenas caracteres numéricos.
	</small>
	<small class="text-danger" ng-if="item.valorUnit > 999999999" style="margin-left: 3%">
		*valor muito alto (máximo R$ 999.999.999,00).
	</small>
	<small class="text-danger" ng-if="item.valorUnit <= 0" style="margin-left: 3%">
		*valor inválido.
	</small>						
</div>