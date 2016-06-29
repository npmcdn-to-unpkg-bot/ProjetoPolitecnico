angular.module("form").controller("formConsumoCtrl", function ($scope, MaterialConsumoAPI){
		$scope.items = [];

		$scope.meses = [
			'Jan','Fev','Mar',
			'Abr','Mai','Jun',
			'Jul','Ago','Set',
			'Out','Nov','Dez'
	    ];
		
		$scope.unidadesMedida = [
		    {nome: 'Quilômetro/km', categoria: 'Unidade de Medida de Comprimento'},
		    {nome: 'Metro/m', categoria: 'Unidade de Medida de Comprimento'},
		    {nome: 'Centímetro/cm', categoria: 'Unidade de Medida de Comprimento'},
		    {nome: 'Milímetro/mm', categoria: 'Unidade de Medida de Comprimento'},
		    
		    {nome: 'Quilômetro Quadrado/km²', categoria: 'Unidade de Medida de Superficie'},
		    {nome: 'Metro Quadrado/m²', categoria: 'Unidade de Medida de Superficie'},
		    {nome: 'Centímetro Quadrado/cm²', categoria: 'Unidade de Medida de Superficie'},
		    {nome: 'Milímetro Quadrado/mm²', categoria: 'Unidade de Medida de Superficie'},
		    
		    {nome: 'Quilômetro Cúbico/km³', categoria: 'Unidade de Medida de Volume'},
		    {nome: 'Metro Cúbico/m³', categoria: 'Unidade de Medida de Volume'},
		    {nome: 'Centímetro Cúbico/cm³', categoria: 'Unidade de Medida de Volume'},
		    {nome: 'Milímetro Cúbico/mm³', categoria: 'Unidade de Medida de Volume'},
		    
		    {nome: 'Tonelada/T', categoria: 'Unidade de Medida de Peso'},
		    {nome: 'Quilograma/kg', categoria: 'Unidade de Medida de Peso'},
		    {nome: 'Grama/gr', categoria: 'Unidade de Medida de Peso'},
		    {nome: 'Miligrama/mg', categoria: 'Unidade de Medida de Peso'},
		    
		    {nome: 'Quilolitro/kL', categoria: 'Unidade de Medida de Litro'},
		    {nome: 'Litros/L', categoria: 'Unidade de Medida de Litro'},
		    {nome: 'mililitro/mL', categoria: 'Unidade de Medida de Litro'},
		    
		    {nome: 'Unidade/unid.', categoria: 'Outros'},
		    {nome: 'Par', categoria: 'Outros'}
		];
		
		$scope.user = {
			meses: ['Jan']
		}
		
		 $scope.todos = function() {
		    $scope.user.meses = angular.copy($scope.meses);
		 };
		 $scope.limpar = function() {
		    $scope.user.meses = [];
		 };
		
		$scope.materiaisConsumo = MaterialConsumoAPI.getMaterialConsumo();
		
		$scope.adicionar = function (item){
			$scope.items.push(angular.copy(item));				
			delete $scope.item;
		};
			
		$scope.apagar = function (items){
			$scope.items = items.filter(function (item) {
				if(!item.selecionado) return item;
			});
		};
			
		$scope.itemSelecionado = function (items){
			return items.some(function (item) {
				return item.selecionado;
			});
		};
});