_do_log_level_debug 'hook'

function _do_before_proj_drone_start() {
  echo "HERE"
}

function _do_after_proj_drone_start() {
  _do_log_debug 'app' 'Drone started, add drone project'
  _do_gitlab_util_create_project_if_missing 'proj' 'oh-my-ops-demo'
}


_do_hook 'do-before-proj-drone-start' '_do_before_proj_drone_start'
_do_hook  'do-after-proj-drone-start' '_do_after_proj_drone_start'


