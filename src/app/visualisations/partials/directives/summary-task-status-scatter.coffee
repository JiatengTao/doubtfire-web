angular.module('doubtfire.visualisations.summary-task-status-scatter', [])
.directive 'summaryTaskStatusScatter', ->
  replace: true
  restrict: 'E'
  templateUrl: 'visualisations/partials/templates/visualisation.tpl.html'
  scope:
    data: '='
    unit: '='
  controller: ($scope, taskService, Visualisation) ->
    yAxisTickFormatFunction = (value) ->
      if $scope.unit.task_definitions[value]
        $scope.unit.task_definitions[value].abbreviation
      else
        ''

    xAxisTickFormatFunction = (value) ->
      idx = Math.floor(value)
      taskService.statusAcronym[taskService.statusKeys[idx]]

    $scope.options = Visualisation 'scatterChart', {
      xAxis:
        axisLabel: 'Statuses'
        tickFormat: xAxisTickFormatFunction
      yAxis:
        axisLabel: 'Task'
        tickFormat: yAxisTickFormatFunction
      showDistX: yes
      showDistY: yes
    }