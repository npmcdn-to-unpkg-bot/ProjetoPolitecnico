<div class="form-group">
	<span class="text-danger fa fa-close" ng-if="item.ajuda &&!item.justificativa"></span>
	<span class="text-success fa fa-check-circle" ng-if="item.ajuda && item.justificativa"></span>

	<label for="justificativa">Justificativa</label>
	<textarea class="form-control" minlength="5" name="justificativa" rows="3" ng-model="item.justificativa" required></textarea>
	
	<small class="text-danger" ng-if="item.ajuda && !item.justificativa" style="margin-left: 1%;">
		*campo obrigatorio, mínimo de 5 caracteres.
	</small>
</div>