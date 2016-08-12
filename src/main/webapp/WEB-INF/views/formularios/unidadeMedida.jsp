<div class="form-group">
	<span ng-if="item.ajuda && !unidadeMedida" class="text-danger fa fa-close"></span>
	<span ng-if="item.ajuda && unidadeMedida" class="text-success fa fa-check-circle"></span>
	
	<label for="unid-medida">Unidade de Medida</label>
	<input type="hidden" name="unidadeMedida" value="{{unidadeMedida.nome}}" />
	<select class="form-control" ng-model="unidadeMedida" ng-options="unidadeMedida.nome group by unidadeMedida.categoria for unidadeMedida in unidadesMedida" required>
		<option value=""> --- Selecione Unidade de Medida --- </option>
	</select>

	<small class="text-danger" ng-if="item.ajuda && !unidadeMedida" style="margin-left: 3%;">
		*campo obrigatório.
	</small>
</div>