function _do_after_proj_gitlabrunner_start() {
  _do_log_debug 'app' 'Gitlab runner started, add gitlabrunner project'

  _do_log_debug 'app' 'Create gitlab default project'
  _do_gitlab_util_create_project_if_missing 'proj' 'oh-my-ops-demo' > /dev/null || {
    _do_print_error "Fail to create gitlab project"
    return 1
  }

  # This will be nicer
  _do_log_debug 'app' 'Create gitlab remote'
  local url
  url=$(_do_gitlab_util_root_user_git_repo_url 'proj' 'oh-my-ops-demo') || {
    _do_print_error "Fail to get gitlab project url"
    return 1
 }

  _do_git_util_create_remote_if_missing '.' 'gitlab' "${url}" > /dev/null || {
    _do_print_error "Fail to create gitlab remote"
    return 1
  }

  _do_log_debug 'app' 'push code'
  do-proj-git-push 'gitlab'
}

_do_hook 'do-after-proj-gitlabrunner-start' '_do_after_proj_gitlabrunner_start'
