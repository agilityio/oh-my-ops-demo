function _do_after_proj_drone_start() {
  _do_log_debug 'app' 'Drone started, add drone project'
  _do_gitlab_util_create_project_if_missing 'proj' 'oh-my-ops-demo' > /dev/null || _do_assert_fail
  _do_drone_util_wait_user_login 'proj'

  _do_drone_util_create_project_if_missing 'proj' 'oh-my-ops-demo' > /dev/null || _do_assert_fail
  _do_drone_util_create_secret_if_missing 'proj' 'oh-my-ops-demo' 'hello' 'world' 'true' > /dev/null || _do_assert_fail
}

_do_hook 'do-after-proj-drone-start' '_do_after_proj_drone_start'
