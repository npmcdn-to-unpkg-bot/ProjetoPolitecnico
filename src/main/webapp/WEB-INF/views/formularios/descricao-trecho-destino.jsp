<div class="form-group">
	<span ng-if="item.ajuda && !item.descricao" class="text-danger fa fa-close"></span>
	<span ng-if="item.ajuda && item.descricao" class="text-success fa fa-check-circle"></span>
	
	<label for="descricao">{{descricao}}</label>
	<textarea class="form-control" rows="2" minlength="5" name="descricao" ng-model="item.descricao" required></textarea>
	<small class="text-danger" ng-if="item.ajuda && !item.descricao" style="margin-left: 1%;">
		*campo obrigatorio, mínimo de 5 caracteres.
	</small>
</div>	