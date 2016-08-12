<div class="row">
	<div class="col-md-9">
		<span ng-if="user.meses.length <= 0" class="text-danger fa fa-close"></span>
		<span ng-if="item.ajuda && user.meses.length > 0" class="text-success fa fa-check-circle"></span>
		
		<label for="periodo">Periodo</label><br>
		<label class="checkbox-inline" ng-repeat="mes in meses">
			<input type="checkbox" name="periodo" checklist-model="user.meses" checklist-value="mes" value="{{mes}}"> {{mes}}
		</label>
							
		<div ng-if="user.meses.length <= 0">
			<small class="text-danger" style="margin-left: 1%;">
				*campo obrigatório.
			</small>
		</div>
	</div>
		<div class="col-md-1">
			<br><button class="btn btn-default" type="button" ng-click="todos()">Todos</button>
		</div>
		<div class="col-md-2">
			<br><button class="btn btn-default" type="button" ng-click="limpar()">Limpar</button>
		</div>
</div>