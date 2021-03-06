﻿angular.module("form").controller("formPermanenteCtrl", function ($scope, MaterialPermanenteAPI){
		$scope.items = [];
			
		$scope.meses = [
			'Jan','Fev','Mar',
			'Abr','Mai','Jun',
			'Jul','Ago','Set',
			'Out','Nov','Dez'
	    ];
		
		$scope.descricao = 'Descrição';
		$scope.valorUnitario = 'Valor Unitário';
		$scope.quantidade = 'Quantidade';
		
		$scope.user = {
			meses: ['Jan']
		}
		
		$scope.descricao = 'Descrição';
		$scope.valorUnitario = 'Valor Unitário';
		$scope.quantidade = 'Quantidade';
		
		$scope.todos = function() {
		    $scope.user.meses = angular.copy($scope.meses);
		};
		 $scope.limpar = function() {
		    $scope.user.meses = [];
		};
		
		$scope.unidadesMedida = [
		    {nome: 'Unidade/unid.', categoria: 'Unidade de Medida Relativa'},
		    {nome: 'Par', categoria: 'Unidade de Medida Relativa'},
		    {nome: 'Dúzia', categoria: 'Unidade de Medida Relativa'},
		    {nome: 'Dezena', categoria: 'Unidade de Medida Relativa'},
		    {nome: 'Centena', categoria: 'Unidade de Medida Relativa'},
		    {nome: 'Milhar', categoria: 'Unidade de Medida Relativa'},
		                         
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
		
		$scope.materiaisPermanente = MaterialPermanenteAPI.getMaterialPermanente();
		
		$scope.procuraUnidade = function (nome){
			for(var i=0; i<$scope.unidadesMedida.length; i++){
				if($scope.unidadesMedida[i].nome == nome)
					return i;
			}
		};
		
});