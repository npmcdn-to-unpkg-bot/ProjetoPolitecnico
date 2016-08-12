<div class="form-group">
	<span class="text-danger fa fa-close" ng-if="item.ajuda && !item.quantidade || item.quantidade == 0"></span>			
	<span class="text-success fa fa-check-circle" ng-if="item.ajuda && item.quantidade > 0" ></span>
								
	<label for="quantidade">{{quantidade}}</label>
	<input type="text" class="form-control" maxlength="7" name="quantidade" placeholder="Quantidade" ng-model="item.quantidade" ui-number required>
	
	<small class="text-danger" ng-if="item.ajuda && !item.quantidade" style="margin-left: 3%;">
		*campo obrigatório, apenas caracteres numéricos.
	</small>
	<small class="text-danger" ng-if="item.ajuda && item.quantidade == 0" style="margin-left: 3%;">
		*campo obrigatório, quantidade inválida.
	</small>
</div>