angular.module('loomioApp').directive 'truncateComment', ->
  scope: {comment: '='}
  restrict: 'E'
  replace: true
  templateUrl: 'generated/components/truncate_comment/truncate_comment.html'
  controller: ($scope, $timeout) ->
    LONG_COMMENT_HEIGHT = 175

    $scope.toggleComment = ->
      angular.element($scope.commentElement()).toggleClass('new-comment__truncated')
      $scope.commentCollapsed = !$scope.commentCollapsed

    $scope.commentIsLong = ->
      $scope.commentElement().clientHeight > LONG_COMMENT_HEIGHT

    $scope.commentElement = ->
      document.querySelector("#comment-#{$scope.comment.id} .new-comment__body")

    $timeout ->
      $scope.toggleComment() if $scope.commentIsLong()
      console.log($scope.commentCollapsed, $scope.comment.id)

    return
