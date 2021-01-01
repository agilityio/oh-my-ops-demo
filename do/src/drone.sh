function _do_after_proj_drone_start() {
  _do_log_debug 'app' 'Drone started, add drone project'
}


_do_hook_after 'do-proj-drone-start' '_do_after_proj_drone_start'


