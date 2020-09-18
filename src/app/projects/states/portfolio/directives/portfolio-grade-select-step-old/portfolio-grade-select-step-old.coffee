angular.module('doubtfire.projects.states.portfolio.directives.portfolio-grade-select-step-old', [])

#
# Allows students to select the target grade they are hoping
# to achieve with their portfolio
#
.directive('portfolioGradeSelectStepOld', ->
  restrict: 'E'
  replace: true
  templateUrl: 'projects/states/portfolio/directives/portfolio-grade-select-step-old/portfolio-grade-select-step-old.tpl.html'
  controller: ($scope, Project, projectService, gradeService) ->
    $scope.grades = gradeService.grades
    $scope.agreedToAssessmentCriteria = $scope.projectHasLearningSummaryReport()
    $scope.chooseGrade = (idx) ->
      Project.update { id: $scope.project.project_id, submitted_grade: idx }, (project) ->
        $scope.project.submitted_grade = project.submitted_grade
        $scope.project.burndown_chart_data = project.burndown_chart_data
)
